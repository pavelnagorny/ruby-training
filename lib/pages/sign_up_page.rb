# frozen_string_literal: true

class SignUpPage < SitePrism::Page
  element :login_field, '#user_login'
  element :password_field, '#user_password'
  element :confirm_password_field, '#user_password_confirmation'
  element :first_name_field, '#user_firstname'
  element :user_lastname_field, '#user_lastname'
  element :email_field, '#user_mail'
  element :create_user_button, '#new_user > input[type=submit]:nth-child(4)'
end
