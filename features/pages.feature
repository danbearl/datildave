@javascript
Feature: Pages
	Background:
		Given the following user:
			| name                  | dan               |
			| email                 | dan@datildave.com |
			| password              | pass              |
			| password_confirmation | pass              |
		And that user is logged in.

	Scenario: Create New Page
		Given I am on the home page.
		When I follow "New Page"
		And I fill in the following:
			| page_name | about                   |
			| page_body | This is the about page. |
		And I press "Create Page"
		Then I should see "Page successfully created."
		And I should see "about"

	Scenario: Edit Page
		Given the following page:
			| name | about                   |
			| body | This is the about page. |
		And I am on that page.
		When I follow "Edit"
		And I fill in the following:
			| page_body | This is the updated about page. |
		And I press "Update Page"
		Then I should see "Page successfully updated."
		And I should see "This is the updated about page."

	Scenario: Delete Page
		Given the following page:
			| name | about                   |
			| body | This is the about page. |
		And I am on that page.
		When I follow "Delete"
		Then I should see "Page successfully deleted."
