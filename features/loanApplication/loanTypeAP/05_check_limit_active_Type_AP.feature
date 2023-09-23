@loanActiveTypeAP
Feature: Apply Either Loan and select the loan type
        In order to test entry point for signature user drop off Loan Dashboard page
        As a customer
        I am able to approve limit offers

        Background: Login with registered account
                Given I am a registered customer with following details:
                        | userID   | rutha013 |
                        | password | 1234Test |
                When I filling in form login with the following details:
                        | userID   | rutha013 |
                        | password | 1234Test |
                And I click login
                Then I will direct to dashboard
        @55551
        Scenario: Validate Card Limit For Type Loan AP
                Given I have been on Loan Dashboard to see the loan type of Loan AP
                When I validate the card of "Loan AP"
                Then I should see the wording dan card design of "Loan AP"

        Scenario: Validate Card Limit For Type Loan AP Direct Loan
                Given I have been on Loan Dashboard to see the loan type of Loan AP Direct Loan
                When I validate the card of "Loan AP direct loan"
                Then I should see the wording dan card design of "Loan AP Direct Loan"

