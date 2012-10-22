@ok
Feature: Home Page
  In order to get new users
  As a app farmer
  I want to get lots of new users to try my app
  
  Scenario: Visit Home Page as new visitor
    Given I am a new visitor
    When I go to the home page
    Then I should see "Keep track of your leads"
    And I should see "Get Started Now! It's FREE"
    And I should see "Sign up"
    And I should see "Log in"
