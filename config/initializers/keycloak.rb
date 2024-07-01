Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid, ENV['kc_client_id'], ENV['kc_secret'], {
    client_options: {
      site: ENV['KEYCLOAK_SITE'],
      realm: ENV['KEYCLOAK_REALM'],
      ssl_verify: false
    }
  }
end
