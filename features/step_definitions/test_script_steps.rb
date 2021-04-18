# frozen_string_literal: true

Given(/^I am not logged in visitor$/) do
  @base_page.load
  page.has_button? 'Sign in'
end

When(/^I register '(.*?)' user via Redmine '(.*?)'$/) do |role, method|
  current_user = role == 'admin' ? @admin = User.new(role) : @dev = User.new(role)
  case method
  when 'UI'
    @base_page.menu.sign_up_link.click
    sign_up_user(current_user)
  when 'API'
    api_create_user(current_user)
  end
end

Then(/^I see the '(.*?)' user is registered$/) do |role|
  current_user = role == 'admin' ? @admin : @dev
  @user_data = api_get_users(payload: { name: current_user.login })
  fail_message = "current user with #{role} role and email: #{current_user.mail} is not registered."
  expect(@response.body).to include(current_user.mail), fail_message
end

And(/^I become logged in as '(.*?)' user$/) do |role|
  current_user = role == 'admin' ? @admin : @dev
  expect(@base_page.menu.active_user.text).to include current_user.login.to_s
end

When(/^I create a project$/) do
  @base_page.menu.projects_link.click
  @projects_page = ProjectsPage.new
  create_project
end

Then(/^I see that project is created on '(.*?)' level$/) do |method|
  case method
  when 'UI'
    @base_page.menu.projects_link.click
    @projects_page = ProjectsPage.new
    expect(@projects_page.projects_list.text).to include @project.name
  when 'API'
    api_get_projects(params: { params: { limit: 100 } })
    expect(@response.body).to include @project.name
  end
end

When(/^I add '(.*?)' user as a member of the project$/) do |role|
  current_user = role == 'developer' ? @dev : @admin
  user_data = api_get_users(payload: { name: current_user.login })
  user_id = xml_to_hash(user_data)['users'][0]['id']
  project_identifier = @project.identifier
  api_post_project_member(project_identifier: project_identifier, user_id: user_id, project_role: current_user.id)
end

Then(/^I can can see '(.*?)' user in the project member list$/) do |role|
  api_get_project_members(@project.identifier)
  current_user = role == 'developer' ? @dev : @admin
  expect(@response.body).to include current_user.firstname
end

When(/^I create an issue and assign '(.*?)' user to created issue$/) do |role|
  user = role == 'developer' ? @dev : @admin
  user_data = api_get_users(payload: { name: user.login })
  payload = { "project": { "tracker_ids": [1, 2, 3] } }
  api_update_project(project_id: @project.identifier, payload: payload)
  user_id = xml_to_hash(user_data)['users'][0]['id']
  api_post_create_issue(project_identifier: @project.identifier, user_id: user_id)
end

Then(/^I see the issue is created$/) do
  api_get_issues
  expect(@response.body).to include @issue['id']
end

And(/^I see '(.*?)' user is assigned to the issue$/) do |role|
  user = role == 'developer' ? @dev : @admin
  api_get_issue(@issue['id'])
  expect(@response.body).to include user.firstname
end

When(/^I logout$/) do
  @base_page.menu.sign_out_btn.click
end

When(/^I login as '(.*?)' user$/) do |role|
  current_user = role == 'admin' ? @admin : @dev
  @base_page.menu.sign_in_link.click
  sign_in_user(current_user)
end

When(/^I track time for the assigned issue$/) do
  track_time_to_project(project_name: @project.name, issue_id: @issue['id'])
end

Then(/^I see the time is tracked properly$/) do
  api_get_issue(@issue['id'])
  issue = xml_to_hash(@response.body)
  expect(issue['total_estimated_hours']).to eql issue['spent_hours']
end

When(/^I close the issue$/) do
  close_issue
end

Then(/^I see the issue was closed$/) do
  api_get_issue(@issue['id'])
  expect(@response.body).to include 'Closed'
end

When(/^I close the project$/) do
  close_project(@project.name)
end

Then(/^I see it was successfully closed$/) do
  sleep 1
  api_get_project(@project.identifier)
  expect(@project_data['status']).to eql('5')
end
