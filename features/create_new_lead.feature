@ok
Feature: Create new lead
  In order to get new users
  As a app farmer
  I want to get lots of new users to try my app
  
  Scenario: Existing user creates a lead
    Given I am an existing user
    When I log in
    Then I should see "Create your first lead"
    When I fill in "Title" with "Grow bananas"
    And I fill in "Description" with "He wants us to set up a banana plantation"
    And I fill in "Contact" with "Joe Smith"
    And I fill in "Email" with "joe@smith.com"
    And I fill in "Organisation" with "Smith Enterprises"
    And I press "Create Lead"
    Then I should see "Lead was successfully created"
    And I should see "Grow bananas"
