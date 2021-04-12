# frozen_string_literal: true

require 'dotenv/load'
require 'capybara/cucumber'
require 'require_all'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

require_all 'features/support'
require_all 'lib/sections'
require_all 'lib/pages'
require_all 'models'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

World(FeatureHelper)
World(APIWrapper)
World(FileHelper)
