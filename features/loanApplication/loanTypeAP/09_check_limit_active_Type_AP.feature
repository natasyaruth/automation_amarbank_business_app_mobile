
Feature: Checking Loan Type AP and Direct AP with Status Active
In order to checking limit active for loan type AP and Direct AP
        As a customer
I am able to verify limit active loan type AP and direct AP in history page

        Background: Login with registered account
                Given I am a registered customer with following details:
                        | userID   | rutha013 |
                        | password | 1234Test |
                When I filling in form login with the following details:
                        | userID   | rutha013 |
                        | password | 1234Test |
                And I click login
                Then I will direct to dashboard

        Scenario: Validate Card Limit For Type Loan AP
                Given I have been on Loan Dashboard to see the loan type of Loan AP
                When I validate the card of "Loan AP"
                Then I should see the wording dan card design of "Loan AP"

        Scenario: Validate Card Limit For Type Loan AP Direct Loan
                Given I have been on Loan Dashboard to see the loan type of Loan AP Direct Loan
                When I validate the card of "Loan AP direct loan"
                Then I should see the wording dan card design of "Loan AP Direct Loan"

