@auth_feature
Feature: Testing of Redmine user authorization and authentication functionality

  Background:
    Given I visit redmine homepage

  Scenario: Visitor can sign in
     When I click the login link
      And I submit log in form
     Then I become a logged in user

  Scenario: Visitor can sign in
     When I click the register link
      And I submit registration form
     Then I become a registered user
