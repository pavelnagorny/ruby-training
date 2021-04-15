# frozen_string_literal: true

# A file helper to save and read files
module FileHelper
  # Save data to .yml file
  # @user [Hash] hash with user credentials
  def save_to_file(user)
    FileUtils.mkdir_p('./temp') unless File.exist?('./temp')
    File.open('./temp/registered_user.yml', 'w') do |file|
      file << user.to_yaml
    end
  end

  def read_from_file(filename: './temp/registered_user.yml')
    YAML.load_file(filename)
  end

  def to_hash
    instance_variables.map do |var|
      [var[1..].to_sym, instance_variable_get(var)]
    end.to_h
  end
end
