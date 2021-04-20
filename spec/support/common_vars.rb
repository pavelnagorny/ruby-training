# frozen_string_literal: true

module CommonVars
  API_KEY = ENV['API_KEY']
  API_HEADERS = { 'x-redmine-api-key': API_KEY }.freeze
  API_XML_HEADERS = { 'Content-Type': 'application/xml', 'x-redmine-api-key': API_KEY }.freeze
  BASE_URL = 'https://testautomate.me/redmine/'
  USERS_URL = "#{BASE_URL}/users.xml"
  PROJ_URL = "#{BASE_URL}/projects.xml"
end
