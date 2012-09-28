@ok
Feature: Signing in
  In order to get new users
  As a app farmer
  I want to get lots of new users to try my app
  
  Scenario: Existing user with leads signs in
    Given I am an existing user
    And I have an existing lead
    When I go to the home page
    And I follow "Log in"
    And I fill in "Email" with "andy@andywhite.org"
    And I fill in "Password" with "secret"
    And I press "Sign in"
    Then I should see "Your leads"

  Scenario: Existing user with no leads signs in
    Given I am an existing user
    When I log in
    Then I should see "Create your first lead"
