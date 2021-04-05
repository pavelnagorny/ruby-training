# frozen_string_literal: true

# This module provides methods for SignIn/SignUp features
module FeatureHelper
  def fill_in_sign_up_form
    @sign_up_page.login_field.set @user.login
    @sign_up_page.password_field.set @user.password
    @sign_up_page.confirm_password_field.set @user.password
    @sign_up_page.first_name_field.set @user.first_name
    @sign_up_page.user_lastname_field.set @user.last_name
    @sign_up_page.email_field.set @user.email
  end

  def sign_up_user
    @user = User.new
    save_to_file(@user.to_hash)

    @sign_up_page = SignUpPage.new
    fill_in_sign_up_form
    @sign_up_page.create_user_button.click
  end

  def sign_in_user
    @sign_in_page = SignInPage.new
    @sign_in_page.login_field.set read_from_file[:login]
    @sign_in_page.password_field.set read_from_file[:password]
    @sign_in_page.submit_log_in_button.click
  end
end
