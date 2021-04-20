# frozen_string_literal: true

module CommonVars
  # Common
  API_KEY = ENV['API_KEY']
  API_HEADERS = { 'x-redmine-api-key': API_KEY }.freeze
  API_XML_HEADERS = { 'Content-Type': 'application/xml', 'x-redmine-api-key': API_KEY }.freeze
  BASE_URL = 'https://testautomate.me/redmine'
  USERS_URL = "#{BASE_URL}/users"
  PROJ_URL = "#{BASE_URL}/projects"
  ISSUES_URL = "#{BASE_URL}/issues"
end
