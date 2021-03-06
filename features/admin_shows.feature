@no-txn
Feature: Managing Shows
  In order to edit show details
  As an administrator
  I want to search and change show information
  
  Scenario: Searching for Shows
    Given a show "The Hotel" by "Mark Watson"
    And a show "The Last Stand to Reason" by "Pajama Men"
    And the show indexes are processed
    And I have signed in as an admin with "user@domain.com/password"
    When I go to the admin shows page
    And I fill in "Search" with "Reason"
    And I press "Search"
    Then I should see "The Last Stand to Reason"
    But I should not see "The Hotel"
  
  Scenario: Editing a Show
    Given a show "Inflatable"
    And the show indexes are processed
    And I have signed in as an admin with "user@domain.com/password"
    When I go to the admin show page for "Inflatable"
    And I fill in "Act Name" with "Adam Hills"
    And I press "Save"
    
    Given the show indexes are processed
    And I go to the admin shows page
    And I fill in "Search" with "Inflatable"
    And I press "Search"
    Then I should see "Adam Hills"
  
  Scenario: Adding a Performance
    Given a show "Inflatable" by "Adam Hills"
    And I have signed in as an admin with "user@domain.com/password"
    When I go to the admin show page for "Inflatable"
    And I select "April 1, 2010 21:00" as the date and time
    And I press "Add Performance"
    Then I should see "1 Performance"
  
  Scenario: Marking a Performance as Sold Out
    Given a show "Inflatable" by "Adam Hills"
    And a performance of "Inflatable"
    And I have signed in as an admin with "user@domain.com/password"
    When I go to the admin show page for "Inflatable"
    And I follow "Sold Out"
    And I go to the show page for "Inflatable"
    Then I should see "100% Sold Out"
  
  Scenario: Marking a Performance as Not Sold Out
    Given a show "Inflatable" by "Adam Hills"
    And a sold out performance of "Inflatable"
    And I have signed in as an admin with "user@domain.com/password"
    When I go to the admin show page for "Inflatable"
    And I follow "Not Sold Out"
    And I go to the show page for "Inflatable"
    Then I should see "0% Sold Out"
  
  Scenario: Adding Keywords
    Given a show "Inflatable" by "Adam Hills"
      And I have signed in as an admin with "user@domain.com/password"
    When  I go to the admin show page for "Inflatable"
      And I fill in "Keyword" with "Adam Hills Balloons"
      And I press "Add Keyword"
    Then  I should see "Adam Hills Balloons"
  
  Scenario: Deleting Keywords
    Given a show "Inflatable" by "Adam Hills" with the keyword "Balloons"
    And   I have signed in as an admin with "user@domain.com/password"
    When  I go to the admin show page for "Inflatable"
      And I follow "Delete"
    Then  I should not see "Balloons"
  
