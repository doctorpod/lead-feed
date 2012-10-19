@ok
Feature: Lead List
  In order to value
  As a role
  I want feature

  Scenario: View Lead List
    Given I am an existing user
    When I log in
    And I create a lead "Varnish Kangaroo", with a status of "INTEREST"
    And I create a lead "Paint Billiard Ball", with a status of "WON"
    And I create a lead "Sweep Football Pitch", with a status of "DEAD"
    And I follow "Your Leads"
    And I wait 1 second
    Then I should see 3 leads listed
    When I check "Hide WON"
    And I wait 1 second
    Then 1 row should be hidden
    When I check "Hide DEAD"
    And I wait 1 second
    Then 2 rows should be hidden
    When I follow "Home"
    And I follow "Your Leads"
    And I wait 1 second
    Then 2 rows should be hidden

