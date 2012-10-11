@wip
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
    Then I should see 3 leads listed
    And I should see "Hide WON"
    And I should see "Hide DEAD"
    When I check "Hide WON"
    Then I should see 2 leads listed
    When I check "Hide DEAD"
    Then I should see 1 lead listed
