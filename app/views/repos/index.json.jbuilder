json.array!(@repos) do |repo|
  json.extract! repo, :id, :provider, :branch, :user_id
  json.url repo_url(repo, format: :json)
end
