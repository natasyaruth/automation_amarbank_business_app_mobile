Feature: Event Tracker Lending Repayment
    As a customer lead
    I want to see event tracker Repayment



Scenario: Validate event name for Notification Upcoming Due Date
    Given I have repayment upcoming due date
    When I received push notification upcoming due date
    And I go to firebase
    Then I will see event name abb_pn_showUpcomingDue
    And I click push notification
    Then I will see event name abb_pn_upcomingDue_click


Scenario: Validate event name for Notification Due Date
    Given I have repayment due date
    When I received push notification due date
    And I go to firebase
    Then I will see event name abb_pn_showDueDate
    And I click push notification
    Then I will see event name abb_pn_dueDate_click

Scenario: Validate event name for Notification Autodebet Success
    Given I have autodebt success
    When I received push notification success
    And I go to firebase
    Then I will see event name abb_pn_showAutodebetSuccess
    And I click push notification
    Then I will see event name abb_pn_autodebetSuccess_click


Scenario: Validate event name for Notification Autodebet Failed
    Given I have autodebt failed
    When I received push notification failed
    And I go to firebase
    Then I will see event name abb_pn_showAutodebetFailed
    And I click push notification
    Then I will see event name abb_pn_autodebetFailed_click


Scenario: Validate event name for Notification Center (Repayment)
    Given I am on Main Dashboard
    When I click notification Center
    And I go to firebase
    Then I will see event name smb_btn_notificationCenter_click
    And I will see event parameter Notification_Journey 
