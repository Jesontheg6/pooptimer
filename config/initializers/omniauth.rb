Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], scope: 'email, user_birthday, user_hometown', info_fields: 'name, email, birthday, gender, hometown'
  end