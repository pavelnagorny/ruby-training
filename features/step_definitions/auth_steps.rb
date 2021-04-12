# frozen_string_literal: true

Given(/^I visit redmine homepage$/) do
  @base_page.load
end

When(/^I click the (login|register) link$/) do |link|
  link == 'login' ? @base_page.menu.sign_in_link.click : @base_page.menu.sign_up_link.click
end

And(/^I submit log in form$/) do
  sign_in_user(@user)
end

Then(/^I become a logged in user$/) do
  expect(@base_page.menu.active_user.text).to include @user.login.to_s
end

And(/^I submit registration form$/) do
  sign_up_user(@user)
end

Then(/^I become a registered user$/) do
  expect(@base_page).to have_content('Your account has been activated. You can now log in.')
end
