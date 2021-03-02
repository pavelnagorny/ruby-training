require 'json'

feature 'Sign in user', js: true do
  rand = Time.now.to_i.to_s
  login = "tstusr_#{rand}"
  password = 'pass1234'
  mail = "tstusr_#{rand}@gmail.com"

  scenario 'User can sign up' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content('Redmine@testautomate.me')

    find('.register').click

    find('#user_login').set login
    find('#user_password').set password
    find('#user_password_confirmation').set password
    find('#user_firstname').set 'tstusr'
    find('#user_lastname').set 'tstusr'
    find('#user_mail').set mail
    find('#new_user > input[type=submit]:nth-child(4)').click
    fail_message = "User is not registered."
    expect(page).to have_content('Your account has been activated. You can now log in.'), fail_message

    File.open("./test_data/registered_user.txt", "w") do |f|
      f << [login, password, mail]
    end
  end

  scenario 'User can log in' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    file = File.read('./test_data/registered_user.txt')
    registered_user = JSON.parse(file)

    find('.login').click

    find('#username').set registered_user[0]
    find('#password').set registered_user[1]

    find('#login-submit').click

    expect(page).to have_content 'Logged in as tstusr'
  end
end
