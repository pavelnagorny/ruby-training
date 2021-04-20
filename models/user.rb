# frozen_string_literal: true

require 'ffaker'

# Generates user data
class User
  include FileHelper

  attr_reader :login, :password, :mail, :firstname, :lastname, :id

  def initialize(role)
    @login = "#{role}_#{FFaker::Internet.user_name}"
    @password = FFaker::Internet.password
    @mail = FFaker::Internet.email
    @firstname = FFaker::Name.first_name
    @lastname = FFaker::Name.last_name
    @id = role == 'admin' ? 3 : 4
    @name = @id == 3 ? 'Manager' : 'Developer'
  end
end
