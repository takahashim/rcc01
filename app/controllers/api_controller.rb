class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def repo
    log.warn params.inspect
    @repo = Repo.create(
                        provider: "github",
                        ref: params["ref"],
                        after: params["after"],
                        before: params["before"],
                        compare: params["compare"],
                        commit_id: params["head_commit"]["id"],
                        commit_url: params["head_commit"]["url"],
                        commit_timestamp: params["head_commit"]["timestamp"],
                        commit_author_name: params["head_commit"]["author"]["name"],
                        commit_committer_name: params["head_commit"]["committer"]["name"],
                        commit_author_username: params["head_commit"]["author"]["username"],
                        commit_committer_username: params["head_commit"]["committer"]["username"],
                        commit_message: params["head_commit"]["message"],
                        repository_name: params["repository"]["name"],
                        repository_url: params["repository"]["url"],
                        repository_description: params["repository"]["description"],
                        repository_owner_name: params["repository"]["owner"]["name"],
                        repository_private: params["repository"]["private"],
                        repository_master_branch: params["repository"]["master_branch"],
                        rawjson: params["api"].to_json
                        )
  end
end
