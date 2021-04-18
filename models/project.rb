# frozen_string_literal: true

require 'ffaker'

# Generates project data
class Project
  attr_reader :name, :identifier, :description

  def initialize
    @name = FFaker::Company.name
    @identifier = FFaker::Internet.password.downcase
    @description = FFaker::Lorem.paragraph
  end
end
