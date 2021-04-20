# frozen_string_literal: true

require 'rest-client'
require 'ffaker'

# This module provide methods for the http requests
module APIWrapper
  def api_create_user(user)
    save_to_file(user.to_hash)
    @response = RestClient::Request.execute(method: :post,
                                            url: "#{CommonVars::USERS_URL}.xml",
                                            headers: CommonVars::API_HEADERS,
                                            payload: {
                                              user: {
                                                login: user.login,
                                                password: user.password,
                                                mail: user.mail,
                                                firstname: user.firstname,
                                                lastname: user.lastname
                                              }
                                            }) { |response| response }
  end

  def api_get_users(**kwargs)
    @response = RestClient::Request.execute(method: :get,
                                            url: "#{CommonVars::USERS_URL}.xml",
                                            headers: CommonVars::API_HEADERS,
                                            **kwargs)
  end

  def api_create_project
    @response = RestClient::Request.execute(method: :post,
                                            url: "#{CommonVars::PROJ_URL}.xml",
                                            headers: CommonVars::API_XML_HEADERS,
                                            payload: {
                                              project: {
                                                name: FFaker::Company.name,
                                                identifier: FFaker::Internet.slug,
                                                description: FFaker::Lorem.paragraph,
                                                is_public: true,
                                                enabled_module_names: %w[time_tracking issue_tracking]
                                              }
                                            }) { |response| response }
  end

  def api_update_project(project_id:, payload:)
    @response = RestClient::Request.execute(method: :put,
                                            url: "#{CommonVars::PROJ_URL}/#{project_id}.xml",
                                            headers: CommonVars::API_XML_HEADERS,
                                            payload: payload) { |response| response }
  end

  def api_get_projects(params: '')
    @response = RestClient::Request.execute(method: :get,
                                            url: "#{CommonVars::PROJ_URL}.xml",
                                            headers: params)
  end

  def api_get_project(project_id)
    @response = RestClient::Request.execute(method: :get,
                                            url: "#{CommonVars::PROJ_URL}/#{project_id}.xml",
                                            headers: CommonVars::API_XML_HEADERS) { |response| response }
    @project_data = xml_to_hash(@response.body)['project']
    @response
  end

  def api_post_project_member(project_identifier:, user_id:, project_role:)
    @response = RestClient::Request.execute(method: :post,
                                            url: "#{CommonVars::PROJ_URL}/#{project_identifier}/memberships.xml",
                                            headers: CommonVars::API_XML_HEADERS,
                                            payload: {
                                              "membership":
                                                {
                                                  "user_id": user_id,
                                                  "role_ids": [project_role]
                                                }
                                            }) { |response| response }
  end

  def api_get_project_members(project_identifier)
    @response = RestClient::Request.execute(method: :get,
                                            url: "#{CommonVars::PROJ_URL}/#{project_identifier}/memberships.xml",
                                            headers: CommonVars::API_XML_HEADERS)
  end

  def api_post_create_issue(project_identifier:, user_id:)
    @response = RestClient::Request.execute(method: :post,
                                            url: "#{CommonVars::ISSUES_URL}.xml",
                                            headers: CommonVars::API_XML_HEADERS,
                                            payload: {
                                              "issue":
                                                {
                                                  project_id: project_identifier,
                                                  tracker_id: 1,
                                                  subject: 'Test issue',
                                                  priority_id: 4,
                                                  assigned_to_id: user_id,
                                                  estimated_hours: 1
                                                }
                                            }) { |response| response }
    @issue = xml_to_hash(@response.body)['issue']
    @response
  end

  def api_get_issues
    @response = RestClient::Request.execute(method: :get,
                                            url: "#{CommonVars::ISSUES_URL}.xml",
                                            headers: CommonVars::API_XML_HEADERS)
  end

  def api_get_issue(issue_id)
    @response = RestClient::Request.execute(method: :get,
                                            url: "#{CommonVars::ISSUES_URL}/#{issue_id}.xml",
                                            headers: CommonVars::API_XML_HEADERS) { |response| response }
  end
end
