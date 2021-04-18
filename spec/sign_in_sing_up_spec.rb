# frozen_string_literal: true

feature 'Sign in user', js: true do
  include FeatureHelper
  include FileHelper
  include APIWrapper

  before(:each) do
    @base_page = BasePage.new
    @base_page.load
    @user = User.new('admin')
    expect(@base_page.page_header.text).to include('Redmine@testautomate.me')
  end

  scenario 'User can sign up' do
    @base_page.menu.sign_up_link.click

    sign_up_user(@user)
    expect(@base_page).to have_content('Your account has been activated. You can now log in.')
  end

  scenario 'User can log in' do
    @base_page.menu.sign_in_link.click

    sign_in_user(@user)
    expect(@base_page.menu.active_user.text).to include @user.login.to_s
  end
end
