Feature: Users
	Background: User Exists
		Given the following user:
			| name                  | user              |
			| email                 | dan@datildave.com |
			| password              | pass              |
			| password_confirmation | pass              |

	Scenario: User Logs In
		Given I am on the log in page.
		When I fill in the following:
			| name     | user |
			| password | pass |

		And I press "Log In"
		Then I should see "Logged in successfully."

	Scenario: User Logs Out
		Given that user is logged in.
		And I am on the home page.
		When I follow "Log Out"
		Then I should see "Logged out successfully."
