Feature: Dashboard Manual - User Management
    In order user to approve process add new user as staff
    As a Director
    I want to approve the permission adding user in notification center

    Scenario: Open push notification with state app is not launch
        Given I add new user via CRM
        And Amarbank business app is not launch yet
        When I open my device
        And I receive notification to approve adding new user
        And I click the notification
        And I will direct to page Login Amarbank business app
        And I login to app
        Then I will direct to page notification center with notification approval add new user

    Scenario: Open push notification with state app is in main dashboard and don't kill app
        Given I add new user via CRM
        And Amarbank business app state is in dashboard
        And I left the app without kill the app
        When I receive notification to approve adding new user
        And I click the notification
        Then I will direct to page notification center with notification approval add new user

    Scenario: Approve more than one approval add new user with level approval more than one
        Given I am one of the all directors
        And I add new user via CRM more than one
        When I login to Amarbank business app
        And I open notification center
        And I approve first user
        Then the approval will no longer in list pinned notification with status change into waiting approval from other director

    Scenario: Approve the approval while other director already reject the approval
        Given I have company with director more than one
        And I add new user via CRM
        When I login to Amarbank business app
        And I open notification center
        And I approve the approval while other director already reject the approval at the same times
        Then I will direct to page process approval already rejected
        And in notification center the approval status change into rejected
        And each director receive email process approval is rejected

    Scenario: Validate content email after reject add new user each director
        Given I am one of the all directors
        And I add new user via CRM
        When I login to Amarbank business app
        And I open notification center
        And I reject the approval
        And me and all other director will receive email reject with content same as figma

    Scenario: Validate content email to continue register after all director approved
        Given I have company with director more than one
        And I add new user via CRM
        And we approve the approval
        Then new user will receive email to register as new user with business code