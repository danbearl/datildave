Feature: Users
	Background: User Exists
		Given the following user:
			| name     | user |
			| password | pass |

	Scenario: User Logs In
		Given I am on the login page.
		When I fill in the following:
			| user_name | user_password |
			| user      | pass          |
		And I press "Log In"
		Then I should see "logged in successfully."

	Scenario: User Logs Out
		Given I am on the home page.
		When I follow "Log Out"
		Then I should see "logged out successfully."
