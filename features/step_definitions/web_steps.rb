Given /^that user is logged in\.$/ do
  visit "/log_in/"

  fill_in "name", :with => @user.name
  fill_in "password", :with => "pass"

  click_button "Log In"
end

Given /^I am on the products index page\.$/ do
  visit products_path
end

Given /^I am on that product's page\.$/ do
  visit product_path(@product)
end

Given /^I am on the home page\.$/ do
  visit root_path
end

Given /^I am on the log in page\.$/ do
  visit log_in_path
end

When /^I follow "(.*?)"$/ do |link|
  click_link(link)
end

When /^I fill in the following:?/ do |form|
  rows = form.raw

  rows.each do |r|
    fill_in r[0], :with => r[1]
  end
end

When /^I press "(.*?)"$/ do |action|
  click_button action
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end