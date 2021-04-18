# frozen_string_literal: true

class ProjectsPage < SitePrism::Page
  element :projects_list, '#projects-index'
  element :page_header, '#header > h1'
  element :new_project_btn, '#content > div.contextual > a'
  element :issues_tab, '.tabs .issues'

  # Create project form
  element :project_name_field, '#project_name'
  element :project_description, '#project_description'
  element :project_identifier, '#project_identifier'
  element :project_is_public_chb, '#project_is_public'
  element :project_submit, :xpath, '//*[@name="commit"]'
  # Project modules
  element :module_issue_tracking, '#project_enabled_module_names_issue_tracking'
  element :module_time_tracking, '#project_enabled_module_names_time_tracking'
  element :module_news, '#project_enabled_module_names_news'
  element :module_documents, '#project_enabled_module_names_documents'
  element :module_files, '#project_enabled_module_names_files'
  element :module_wiki, '#project_enabled_module_names_wiki'
  element :module_repository, '#project_enabled_module_names_repository'
  element :module_names, '#project_enabled_module_names_boards'
  element :module_calendar, '#project_enabled_module_names_calendar'
  element :module_gantt, '#project_enabled_module_names_gantt'

  # Project overview tab
  element :time_tracking, '.spent_time.box'
  element :actions, '.icon-only.icon-actions'
  element :close_project_btn, '.icon.icon-lock'
end
