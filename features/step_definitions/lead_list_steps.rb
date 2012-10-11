When /^I create a lead "([^"]*)", with a status of "([^"]*)"$/ do |lead_title, status|
  steps %{
    When I go to the new lead page
    And I fill in "Title" with "#{lead_title}"
    And I fill in "Description" with "A test description"
    And I fill in "Contact" with "Joe Blogs"
    And I fill in "Email" with "joe@blogs.com"
    And I fill in "Organisation" with "Blogs Enterprises"
    And I select "#{status}" from "Status"
    And I press "Create Lead"
  }
end

Then /^I should see (\d+) leads? listed$/ do |item_count|
  find("tr.lead", :count => item_count.to_i)
end
