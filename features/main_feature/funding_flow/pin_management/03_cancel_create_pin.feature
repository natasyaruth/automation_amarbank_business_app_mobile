# @regressionTest
Feature: User create PIN Journey Transfer
    In order to transfer
    As a customer
    I want to be able to create transaction pin

    # ATTENTION
    # please use user id with PIN still not created yet
    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric 
        Then I will direct to dashboard

    @C109115
    Scenario: Back to main dashbord in pop up create PIN Transaction
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Back ke Dashboard
        Then I should direct to Dashboard

    @C109116
    Scenario: Close page Pin Transaction in page fill password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I click button Close
        And I should see close confirmation pop up
        And I click button cancel create PIN
        Then I see pop up Create PIN

    @C109117
    Scenario: Cancel close page Pin Transaction in page fill password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I click button Close
        And I should see close confirmation pop up
        And I click button back to fill password
        Then I should stay on page fill password

    @C109118
    Scenario: Close page Pin Transaction in page fill PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I click button Close
        And I should see close confirmation pop up
        And I click button cancel create PIN
        Then I see pop up Create PIN

    @C109119
    Scenario: Cancel close page Pin Transaction in page fill PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I click button Close
        And I should see close confirmation pop up
        And I click button Cancel
        Then I should stay on page fill PIN

    @C109120
    Scenario: Back to page input PIN from confirmation PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new PIN with '111111'
        And I input confirmation new PIN '111111'
        And I click button Close
        And I should see close confirmation pop up
        And I click button Cancel
        Then I should stay on page fill PIN
        
    @C109121
    Scenario: User Successfully Get Email for OTP and create PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new PIN with '111111'
        And I input confirmation new PIN '111111'
        And I will receive email contain with OTP
        And I input OTP
        Then My PIN successfully created