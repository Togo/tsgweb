@employees
Feature: Employees
  In order to have employees on my website
  As an administrator
  I want to manage employees

  Background:
    Given I am a logged in refinery user
    And I have no employees

  @employees-list @list
  Scenario: Employees List
   Given I have employees titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of employees
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @employees-valid @valid
  Scenario: Create Valid Employee
    When I go to the list of employees
    And I follow "Add New Employee"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 employee

  @employees-invalid @invalid
  Scenario: Create Invalid Employee (without name)
    When I go to the list of employees
    And I follow "Add New Employee"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 employees

  @employees-edit @edit
  Scenario: Edit Existing Employee
    Given I have employees titled "A name"
    When I go to the list of employees
    And I follow "Edit this employee" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of employees
    And I should not see "A name"

  @employees-duplicate @duplicate
  Scenario: Create Duplicate Employee
    Given I only have employees titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of employees
    And I follow "Add New Employee"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 employees

  @employees-delete @delete
  Scenario: Delete Employee
    Given I only have employees titled UniqueTitleOne
    When I go to the list of employees
    And I follow "Remove this employee forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 employees
 