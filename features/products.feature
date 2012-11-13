Feature: Products
	Background:
		Given the following user:
			| name                  | user               |
		        | email                 | dan@dadtildave.com |
		        | password              | pass               |
			| password_confirmation | pass               |
		And that user is logged in.

	Scenario: create new product
		Given I am on the products index page.
		When I follow "New Product"
		And I fill in the following:
			| product_name        | sausage                  |
			| product_description | Delicious Datil Sausages |
			| product_price       | 1.2                      |
			| product_quantity    | 50                       |
		And I press "Create Product"
		Then I should see "Product successfully added."
		And I should see "sausage"

	Scenario: edit product
		Given the following product:
			| name  | sausage |
			| price | 1.2     |
		And I am on that product's page.
		When I follow "Edit"
		And I fill in the following:
			| product_price | 2 |
		And I press "Update Product"
		Then I should see "Product successfully updated."
		And I should see "sausage"
		And I should see "Price: $2.00"

	Scenario: destroy product
		Given the following product:
			| name  | sausage |
			| price | 1.2     |
		And I am on that product's page.
		When I follow "Delete"
		Then I should see "Product successfully deleted."
		And I should see "Products"

