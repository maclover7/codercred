Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_OMNIAUTH_KEY'], ENV['GITHUB_OMNIAUTH_SECRET'], scope: 'user:email'
end
