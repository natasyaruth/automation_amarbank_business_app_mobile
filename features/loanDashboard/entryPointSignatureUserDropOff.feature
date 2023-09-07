Feature: Signature User Drop Off for Approval Limit Loan
    In order to test entry point for signature user drop off Loan Dashboard page
    As a customer
    I am able to approve limit offers
    Background: Login with registered account
        Given I am registered customer with following details:
            | userID   | ruthad74 |
            | password | Test1234 |
        When I am filling in my account information with the following details:
            | userID   | ruthad74 |
            | password | Test1234 |
        And login with registered account
        Then I successed go to dashbord

    Scenario: Validate design of entry point signature user drop off for approval limit loan
        Given I got a card for signature loan limit offer from system
        When I access loan business in main dashboard for checking the signature entry point
        Then I should see signature approval card for the loan offer

    Scenario: Back to The Main Dashboard
        Given I am on the loan Dashboard
        When I back to the previous page
        Then I should see main dashboard

    Scenario: Access Signature Loan limit Approval Page
        Given I have been on signature approval card for the loan offer
        When I am accessing loan limit approval page
        Then I am directing to signature approval page

    Scenario: Access Signature Loan Limit Page When Offering Time is Expired
        Given I have been on loan dashboard page and show expired loan limit offer card
        When I access loan limit approval page with card got expired time
        Then system should display loan limit offer has been expired page



