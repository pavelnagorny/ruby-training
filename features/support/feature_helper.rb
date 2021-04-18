# frozen_string_literal: true

# This module provides methods for SignIn/SignUp features
module FeatureHelper
  def fill_in_sign_up_form(user)
    @sign_up_page.login_field.set user.login
    @sign_up_page.password_field.set user.password
    @sign_up_page.confirm_password_field.set user.password
    @sign_up_page.first_name_field.set user.firstname
    @sign_up_page.user_lastname_field.set user.lastname
    @sign_up_page.email_field.set user.mail
  end

  def sign_up_user(user)
    save_to_file(user.to_hash)

    @sign_up_page = SignUpPage.new
    fill_in_sign_up_form(user)
    @sign_up_page.create_user_button.click
  end

  def sign_in_user(user)
    @sign_in_page = SignInPage.new
    @sign_in_page.login_field.set user.login
    @sign_in_page.password_field.set user.password
    @sign_in_page.submit_log_in_button.click
  end

  def create_project
    @project = Project.new
    @projects_page.new_project_btn.click

    @projects_page.project_name_field.set @project.name
    @projects_page.project_identifier.set @project.identifier
    @projects_page.project_description.set @project.description
    @projects_page.project_is_public_chb.check
    @projects_page.project_submit.click

    @projects_page.module_issue_tracking.check
    @projects_page.module_time_tracking.check
    @projects_page.module_news.uncheck
    @projects_page.module_documents.check
    @projects_page.module_files.uncheck
    @projects_page.module_wiki.uncheck
    @projects_page.module_repository.uncheck
    @projects_page.module_names.uncheck
    @projects_page.module_calendar.uncheck
    @projects_page.module_gantt.uncheck
  end

  def track_time_to_project(project_name:, issue_id:)
    @spent_time_page = SpentTimePage.new
    @base_page.menu.projects_link.click
    @projects_page.projects_list.click_link project_name
    @projects_page.time_tracking.click_link 'Log time'

    @spent_time_page.activity_dropdown.select 'Development'
    @spent_time_page.issue_field.set issue_id
    @spent_time_page.hours_field.set 1
    @spent_time_page.create_btn.click
  end

  def close_issue
    @issues = IssuesPage.new
    @projects_page.issues_tab.click
    @issues.actions.click
    @issues.status_option.click
    @issues.status_closed.click
  end

  def close_project(project_name)
    @base_page.menu.projects_link.click
    @projects_page.projects_list.click_link project_name
    @projects_page.actions.click
    @projects_page.close_project_btn.click
    page.driver.browser.switch_to.alert.accept
  end
end
