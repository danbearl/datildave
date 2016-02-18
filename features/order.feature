Feature: Orders
	Background:
		Given the following product:
			| name          | sausage |
			| price         | 3       |
      | quantity      | 3       |
      | minimum_order | 1       |
		And that product is in the cart

	Scenario: user creates new order
		Given I am on the products index page
		When I follow "sausage"
		And I fill in the following:
			| quantity | 2 |
		And I press "Add To Cart"
		Then I should see "Added to cart."

	Scenario: user can't order more than is in stock
		Given I am on the products index page
		When I follow "sausage"
		And I fill in the following:
			| quantity | 4 |
		And I press "Add To Cart"
		Then I should see "Insufficient quantity"
