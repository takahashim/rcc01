class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def repo
    log.warn params.inspect
    @repo = Repo.create(
                     provider: "github",
                     ref: params[:ref],
                     commit_id: params[:commit][:id],
                     commit_timestamp: params[:commit][:timestamp],
                     message: params[:commit][:message]
                     repository_name: params[:repository][:name],
                     repository_url: params[:repository][:url],
                     rawjson: params[:api].to_json,
                     )

  end
end
