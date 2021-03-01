feature 'Sign in user', js: true do
  scenario 'User can log in' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.login').click

    find('#username').set 'tstusr'
    find('#password').set 'pass12345'
    find('#login-submit').click

    expect(page).to have_content 'Logged in as tstusr'
  end
end
