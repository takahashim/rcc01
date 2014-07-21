class BuildReviewWorker
  include Sidekiq::Worker
  sidekiq_options queue: :build_review, retry: false

  DOCKER_DIR = Rails.root.join("docker/build_review")
    DOCKER_ID = "takahashim/review"
    DOCKER_SCRIPT = "/review/build_review.rb"


  def perform(user_id, repo_id)
    logger = Logger.new(Rails.root.join("log/build_review_worker.log"))

    logger.info("start")
    user = User.find(user_id)
    repo = Repo.find(repo_id)
    repository_url = repo.repository_url
    dropbox_token = user.dropbox_token

    Dir.chdir(DOCKER_DIR) do
      logger.info("build: user_id:#{user_id}, repository:#{repository_url}")
      system("docker run --rm -t -i #{DOCKER_ID} #{DOCKER_SCRIPT} #{repository_url} #{dropbox_token}")
    end

    logger.info("end")
    logger.close
  end

end
