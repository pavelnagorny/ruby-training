# frozen_string_literal: true

require 'rest-client'

# This module provide methods for the http requests
module APIWrapper
  def api_create_user(user)
    save_to_file(user.to_hash)
    response = RestClient::Request.execute(method: :post,
                                           url: CommonVars::USERS_URL,
                                           headers: CommonVars::API_HEADERS,
                                           payload: { user: read_from_file })
    raise 'User was not created via API' unless response.code == 201
  end

  def api_create_project
    response = RestClient::Request.execute(method: :post,
                                           url: CommonVars::PROJ_URL,
                                           headers: CommonVars::API_XML_HEADERS,
                                           payload: {
                                             project: {
                                               name: FFaker::Company.name,
                                               identifier: FFaker::Internet.slug,
                                               description: FFaker::Lorem.paragraph,
                                               is_public: true,
                                               enabled_module_names: %w[time_tracking issue_tracking]
                                             }
                                           })
    raise 'Project has not been created via API' unless response.code == 201
  end

  def api_get_projects
    @response = RestClient::Request.execute(method: :get,
                                            url: CommonVars::PROJ_URL,
                                            headers: CommonVars::API_XML_HEADERS)
    raise 'Project has not been created via API' unless @response.code == 200
  end
end
