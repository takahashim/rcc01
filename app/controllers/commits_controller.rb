class CommitsController < ApplicationController
  before_action :set_commit, only: [:show, :edit, :update, :destroy]

  # GET /commits
  # GET /commits.json
  def index
    @commits = Commit.all
  end

  # GET /commits/1
  # GET /commits/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commit
      @commit = Commit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commit_params
      params.require(:commit).permit(
                                     :ref,
                                     :after,
                                     :before,
                                     :compare,
                                     :commit_id,
                                     :commit_timestamp,
                                     :commit_message,
                                     :repository_name,
                                     :repository_url
                                     )
    end
end
