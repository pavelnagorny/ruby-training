# frozen_string_literal: true

require 'ffaker'

# Generates user data
class User
  attr_reader :login, :password, :email, :first_name, :last_name

  def initialize
    @login = FFaker::Internet.user_name
    @password = FFaker::Internet.password
    @email = FFaker::Internet.email
    @first_name = FFaker::Name.first_name
    @last_name = FFaker::Name.last_name
  end

  def to_hash
    instance_variables.map do |var|
      [var[1..].to_sym, instance_variable_get(var)]
    end.to_h
  end
end
