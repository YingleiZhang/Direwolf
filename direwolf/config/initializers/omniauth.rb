OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '269123582486-kgk51jp5bvuu911nuac3tq5dk3oc5vad.apps.googleusercontent.com', '0CaMDmAGl859ldYuJKDVaRHj', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
