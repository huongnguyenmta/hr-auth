Rails.application.config.action_mailer.smtp_settings = {
  address:              "smtp.gmail.com",
  port:                 587,
  domain:               "gmail.com",
  user_name:            ENV["SMTP_USER_NAME"],
  password:             ENV["SMTP_PASSWORD"],
  authentication:       :plain,
  enable_starttls_auto: true
}
