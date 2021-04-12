# frozen_string_literal: true

Before('@auth_feature') do
  @base_page = BasePage.new
  @user = User.new
end

After do |scenario|
  if scenario.failed?
    screen_path = "temp/#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.png"
    page.save_screenshot(screen_path)
    @logger.info "Screenshot is saved to #{screen_path}"
  end
  Capybara.reset_session!
end
