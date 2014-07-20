Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_APP_ID'], ENV['GITHUB_APP_SECRET'], scope: ENV['GITHUB_SCOPE']
  provider :dropbox_oauth2, ENV['DROPBOX_KEY'], ENV['DROPBOX_SECRET'], callback_url: ENV['DROPBOX_CALLBACK_URL']
end
