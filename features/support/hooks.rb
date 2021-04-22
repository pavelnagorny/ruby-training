# frozen_string_literal: true

Before do
  @base_page = BasePage.new
end

After do |scenario|
  if scenario.failed?
    screen_path = "temp/screenshots/#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.png"
    page.save_screenshot(screen_path)
  end
  Capybara.reset_session!
end
