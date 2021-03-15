# frozen_string_literal: true

class SignInPage < SitePrism::Page
  element :login_field, '#username'
  element :password_field, '#password'
  element :submit_log_in_button, '#login-submit'
end
