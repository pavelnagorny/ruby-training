# frozen_string_literal: true

require 'rest-client'

# This module provide methods for the http requests
module APIWrapper
  def api_create_user(user)
    save_to_file(user.to_hash)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{CommonVars::BASE_URL}users.json",
                                           headers: CommonVars::API_HEADERS,
                                           payload: {
                                             user: {
                                               login: user.login,
                                               password: user.password,
                                               firstname: user.first_name,
                                               lastname: user.last_name,
                                               mail: user.email
                                             }
                                           })
    raise 'User was not created via API' unless response.code == 201
  end
end
