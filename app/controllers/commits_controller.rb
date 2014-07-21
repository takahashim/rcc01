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

  # GET /commits/1/edit
  def edit
  end

  # PATCH/PUT /commits/1
  # PATCH/PUT /commits/1.json
  def update
    respond_to do |format|
      if @commit.update(commit_params)
        format.html { redirect_to @commit, notice: 'Commit was successfully updated.' }
        format.json { render :show, status: :ok, location: @commit }
      else
        format.html { render :edit }
        format.json { render json: @commit.errors, status: :unprocessable_entity }
      end
    end
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
