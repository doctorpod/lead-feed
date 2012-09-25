Feature: Home Page
  In order to get new users
  As a app farmer
  I want to get lots of new users to try my app
  
  Scenario: Visit Home Page as new visitor
    Given I am a new visitor
    When I go to the home page
    Then I should see "Welcome to Pipeline"
    And I should see "sign up"
    And I should see "log in"