Feature: Categories
  Scenario: Categories populate the main navigation bar
    Given the following category:
      | name | meats |
    And I am on the home page.
    Then I should see "meats"
