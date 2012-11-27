@javascript
Feature: Posts
	Background: User is logged in
		Given the following user:
			| name                  | dan               |
			| email                 | dan@datildave.com |
			| password              | pass              |
			| password_confirmation | pass              |
		And that user is logged in.
		And the following post:
			| title | First Post              |
			| body  | This is the first post. |
		And I am on the posts index page.

	Scenario: Create new post
		When I follow "New Post"
		And I fill in the following:
			| post_title | First Post              |
			| post_body  | This it the first post. |
		And I press "Create Post"
		Then I should see "Post successfully created."
		And I should see "First Post"

	Scenario: Update post
		When I follow "Edit Post"
		And I fill in the following:
			| post_body | This is the updated body. |
		Then I should see "Post successfully updated."
		And I should see "This is the updated body."

	Scenario: Destroy post
		When I follow "Delete Post"
		Then I should see "Post successfully deleted."
		And I should not see "First Post"

