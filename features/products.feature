Feature: Products
	Background:
		Given the following user:
			| name | user |
		And that user is logged in.

	Scenario: create new product
		Given I am on the products index page.
		When I follow "New Product"
		And I enter the following:
			| product_name        | sausage                  |
			| product_description | Delicious Datil Sausages |
			| product_price       | 1.2                      |
			| product_quantity    | 50                       |
		And I press "Add Product"
		Then I should see "Product successfully added."
		And I should see "sausage"

	Scenario: edit product
		Given the following product:
			| name  | sausage |
			| price | 1.2     |
		And I am on that product's page.
		When I follow "Edit"
		And I fill in the following:
			| price | 2 |
		And I press "Update Product"
		Then I should see "Product successfully updated."
		And I should see "sausage"
		And I should see "Price: $2.00"

	Scenario: destroy product
		Given 1 product.
		And I am on that product's page.
		When I follow "Delete"
		Then I should see "Product successfully deleted."
		And I should see "Products"

