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
  page.all("tr.lead").count.should == item_count.to_i
end

When /^I wait (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

Then /^(\d+) rows? should be hidden$/ do |count|
  page.all(:xpath, "//tr[@style='display: none;']").count.should == count.to_i
end
