require 'shellwords'
class BuildReviewWorker
  include Sidekiq::Worker
  sidekiq_options queue: :build_review, retry: false

  DOCKER_ID = "takahashim/review"
  DOCKER_SCRIPT = "/review/scripts/build_review.rb"


  def perform(user_id, repo_id, commit_id)
    logger = Logger.new(Rails.root.join("log/build_review_worker.log"))

    logger.info("start")
    started_at = Time.now
    @build = Build.find_or_create_by(commit_id: commit_id)
    @build.update(started_at: started_at, finished_at: nil, buildlog: nil)

    user = User.find(user_id)
    repo = Repo.find(repo_id)
    commit = Commit.find(commit_id)
    repository_url = repo.repository_url
    dropbox_token = user.dropbox_token

    logger.info("build: user_id:#{user_id}, repository:#{repository_url}")
    args = Shellwords.shelljoin(["docker","run","-d",DOCKER_ID,DOCKER_SCRIPT,repository_url,commit.commit_id,dropbox_token])
    logger.info("docker command:" + args.to_s)
    pid = `#{args} 2>&1`
    rc = `docker wait #{pid}`
    buildlog = `docker logs  #{pid}`

    logger.info("docker log:#{buildlog}")
    finished_at = Time.now

    @build.finished_at = finished_at
    @build.buildlog = buildlog
    @build.save
    logger.info("end")
    logger.close
    return rc
  end

end
