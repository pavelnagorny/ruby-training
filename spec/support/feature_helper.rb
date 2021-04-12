# frozen_string_literal: true

# This module provides methods for SignIn/SignUp features
module FeatureHelper
  def fill_in_sign_up_form(user)
    @sign_up_page.login_field.set user.login
    @sign_up_page.password_field.set user.password
    @sign_up_page.confirm_password_field.set user.password
    @sign_up_page.first_name_field.set user.firstname
    @sign_up_page.user_lastname_field.set user.lastname
    @sign_up_page.email_field.set user.mail
  end

  def sign_up_user(user)
    save_to_file(user.to_hash)

    @sign_up_page = SignUpPage.new
    fill_in_sign_up_form(user)
    @sign_up_page.create_user_button.click
  end

  def sign_in_user(user)
    @sign_in_page = SignInPage.new
    api_create_user(user)
    @sign_in_page.login_field.set user.login
    @sign_in_page.password_field.set user.password
    @sign_in_page.submit_log_in_button.click
  end
end
