json.array!(@commits) do |commit|
  json.extract! commit, :id, :repo_id, :provider, :ref, :commit_id, :commit_timestamp, :message, :repository_name, :repository_url, :rawjson
  json.url commit_url(commit, format: :json)
end
