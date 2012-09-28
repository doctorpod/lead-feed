Given /^I am a new visitor$/ do
end

Given /^I am an existing user$/ do
  steps %{
    When I go to the home page
    And I follow "Sign up"
    Then I should see "Sign up"
    When I fill in "Email" with "andy@andywhite.org"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Sign up"
    And I follow "Log out"
  }
end

Given /^I have an existing lead$/ do
  steps %{
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
    When I follow "Log out"
  }
end

When /^I log in$/ do
  steps %{
    When I go to the home page
    And I follow "Log in"
    And I fill in "Email" with "andy@andywhite.org"
    And I fill in "Password" with "secret"
    And I press "Sign in"
  }
end
