@coaches
Feature: Coaches
  In order to have coaches on my website
  As an administrator
  I want to manage coaches

  Background:
    Given I am a logged in refinery user
    And I have no coaches

  @coaches-list @list
  Scenario: Coaches List
   Given I have coaches titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of coaches
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @coaches-valid @valid
  Scenario: Create Valid Coach
    When I go to the list of coaches
    And I follow "Add New Coach"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 coach

  @coaches-invalid @invalid
  Scenario: Create Invalid Coach (without name)
    When I go to the list of coaches
    And I follow "Add New Coach"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 coaches

  @coaches-edit @edit
  Scenario: Edit Existing Coach
    Given I have coaches titled "A name"
    When I go to the list of coaches
    And I follow "Edit this coach" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of coaches
    And I should not see "A name"

  @coaches-duplicate @duplicate
  Scenario: Create Duplicate Coach
    Given I only have coaches titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of coaches
    And I follow "Add New Coach"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 coaches

  @coaches-delete @delete
  Scenario: Delete Coach
    Given I only have coaches titled UniqueTitleOne
    When I go to the list of coaches
    And I follow "Remove this coach forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 coaches
 