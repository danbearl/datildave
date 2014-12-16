Feature: Categories
  Scenario: Categories populate the main navigation bar
    Given the following category:
      | name | meats |
    And I am on the home page.
    Then I should see "meats"

  Scenario: A validated user creates a new category
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in.
    And I am on the home page.
    When I follow "New Category"
    And I fill in the following:
      | category_name | meats |
    And I press "Create Category"
    Then I should see "meats"

  Scenario: A validated user edits an existing category
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in.
    And the following category:
      | name | meats |
    And I am on that category's page.
    When I follow "Edit Category"
    And I fill in the following:
      | category_name | sausages |
    And I press "Update Category"
    Then I should see "sausages"

  Scenario: A validated user deletes an existing category
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in.
    And the following category:
      | name | meats |
    And I am on that category's page.
    When I follow "Delete Category"
    Then I should not see "meats"
