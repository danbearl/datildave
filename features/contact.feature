Feature: Contact
	Scenario: Send Message
		Given I am on the contact page.
		When I fill in the following:
			| message_name    | Dan                |
			| message_email   | dan@datildave.com  |
			| message_subject | Hello              |
			| message_body    | This is a message. |
		And I press "Send"
		Then I should see "Message successfully sent."
