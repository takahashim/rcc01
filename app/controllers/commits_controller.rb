class CommitsController < ApplicationController
  before_action :authenticate

  # GET /commits
  # GET /commits.json
  def index
    @commits = Commit.joins(:repo).where("repos.user_id" => 1).order("created_at" => :desc)
  end

  # GET /commits/1
  # GET /commits/1.json
  def show
    @commit = Commit.find(params[:id])
    if !@commit || @commit.try(:repo).try(:user) != current_user
      redirect_to commits_path, alert: "commit not found"
    end
  end

  def rebuild
    @commit = Commit.find(params[:id])

    user = @commit.try(:repo).try(:user)
    if !user || user != current_user
      redirect_to commits_path, notice: "Invalid Operation"
    end
    BuildReviewWorker.perform_async(user.id, @commit.repo.id, @commit.id)
    render :show, notice: 'Rebuild started.'
  end

end
