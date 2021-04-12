# frozen_string_literal: true

# A file helper to save and read files
module FileHelper
  # Save data to .yml file
  # @user [Hash] hash with user credentials
  def save_to_file(user)
    File.open('./test_data/registered_user.yml', 'a') do |file|
      file << user.to_yaml
    end
  end

  def read_from_file
    YAML.load_file('./test_data/registered_user.yml')
  end
end
