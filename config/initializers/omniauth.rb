OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dropbox_oauth2, ENV['DROPBOX_API_KEY'], ENV['DROPBOX_API_SECRET']
end