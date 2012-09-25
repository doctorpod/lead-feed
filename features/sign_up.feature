Feature: Home Page
  In order to get new users
  As a app farmer
  I want to get lots of new users to try my app
  
  Scenario: New user sign up
    Given I am a new visitor
    When I go to the home page
    And I follow "sign up"
    Then I should see "sign up"
    When I fill in "Email" with "andy@andywhite.org"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Sign up"
    Then I should see "Congratulations and welcome to pipeline!"
    And I should see "Fill the pipeline!"
