# frozen_string_literal: true

class SpentTimePage < SitePrism::Page
  element :issue_field, '#time_entry_issue_id'
  element :hours_field, '#time_entry_hours'
  element :activity_dropdown, '#time_entry_activity_id'
  element :create_btn, :xpath, '//*[@name="commit"]'
end
