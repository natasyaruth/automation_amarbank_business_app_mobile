Feature: Dashboard Manual - Notification Center
    In order user to get notified
    As a Customer
    I want to see all notification from SMB App in Main dashboard

    @C160837
    Scenario: Checking Detail notification app account opening successfully created
        Given I am a customer with account recently accepted from CRM
        When I login to app
        And I click notification center
        Then I see notification account opening successfully
        And I click bucketlist notification info
        And I will direct to detail account opening successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160838
    Scenario: Checking Detail notification request cheque book
        Given I am a customer and recently request cheque book
        When I click notification center
        Then I see notification request cheque book
        And I click bucketlist notification info
        And I will direct to detail request cheque book
        And I click understand the notification
        And I will direct to page notification center

    @C160839
    Scenario: Checking Detail notification request delete account
        Given I am a customer and recently request delete account
        When I click notification center
        Then I see notification request delete account
        And I click bucketlist notification info
        And I will direct to detail request delete account
        And I click understand the notification
        And I will direct to page notification center

    @C160840
    Scenario: Checking Detail notification Transfer In BIFAST
        Given I am a customer and recently receive transfer in from other bank with method BIFAST
        When I login to app
        And I click notification center
        Then I see notification transfer in successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer in successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160841
    Scenario: Checking Detail notification Transfer In RTOL
        Given I am a customer and recently receive transfer in from other bank with method RTOL
        When I login to app
        And I click notification center
        Then I see notification transfer in successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer in successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160842
    Scenario: Checking Detail notification Transfer Failed
        Given I am a customer and my transaction is failed
        When I login to app
        And I click notification center
        Then I see notification transfer out failed
        And I click bucketlist notification transaction
        And I will direct to detail transfer out failed
        And I click understand the notification
        And I will direct to page notification center