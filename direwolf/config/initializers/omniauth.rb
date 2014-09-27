OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '269123582486-6v003oqpsu4lv1k6079bqoong4rjbaj3.apps.googleusercontent.com', 'YTR6nELkBFRHc2iENMvgVRxF', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
