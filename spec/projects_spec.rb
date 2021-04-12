# frozen_string_literal: true

feature 'Project', js: true do
  include FileHelper
  include APIWrapper

  scenario 'User can create project' do
    api_create_project
  end
end
