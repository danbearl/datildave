Feature: Orders
	Background:
		Given the following product:
			| name  | sausage |
			| price | 3       |
		And that product is in the cart.

	Scenario: user creates new order
		Given I am on the products index page.
		When I follow "sausage"
		And I fill in the following:
			| quantity | 2 |
		And I press "Add To Cart"
		Then I should see "Added to cart."

	Scenario: user checks out
		Given I am on the cart page.
		When I press "Check Out"
		And I fill in the following:
			| first_name | "Dan" |
			| last_name | "Bearl" |
			| email | "dan@datildave.com" |
			| street_1 | "1234 Some Street" |
			| city | "Jacksonville" |
			| state | "FL" |
			| zip | "12345 |
		And I press "Submit"
		Then I should see "Order Complete!"
