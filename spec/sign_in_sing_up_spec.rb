# frozen_string_literal: true

feature 'Sign in user', js: true do
  rand = SecureRandom.hex
  login = "tstusr_#{rand}"
  password = 'pass1234'
  email = "tstusr_#{rand}@gmail.com"
  user = {
    login: login,
    password: password,
    email: email
  }
  before(:each) do
    @base_page = BasePage.new
    @base_page.load
    expect(@base_page.page_header.text).to include('Redmine@testautomate.me')
  end

  scenario 'User can sign up' do
    @base_page.menu.sign_up_link.click
    @sign_up_page = SignUpPage.new

    @sign_up_page.login_field.set login
    @sign_up_page.password_field.set password
    @sign_up_page.confirm_password_field.set password
    @sign_up_page.first_name_field.set 'tstusr'
    @sign_up_page.user_lastname_field.set 'tstusr'
    @sign_up_page.email_field.set email
    @sign_up_page.create_user_button.click

    expect(@base_page).to have_content('Your account has been activated. You can now log in.')

    File.open('./test_data/registered_user.yml', 'w') do |f|
      f << user.to_yaml
    end
  end

  scenario 'User can log in' do
    registered_user = YAML.load_file('./test_data/registered_user.yml')

    @base_page.menu.sign_in_link.click
    @sign_in_page = SignInPage.new

    @sign_in_page.login_field.set registered_user[:login]
    @sign_in_page.password_field.set registered_user[:password]
    @sign_in_page.submit_log_in_button.click

    expect(@base_page.menu.active_user.text).to include registered_user[:login].to_s
  end
end
