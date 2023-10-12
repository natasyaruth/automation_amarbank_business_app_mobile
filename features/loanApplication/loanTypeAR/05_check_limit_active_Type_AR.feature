@loanActiveTypeAR
Feature:Checking Loan Type AR with Status Active
    In order to checking limit active for loan type AR
    As a customer
    I am able to verify limit active loan type AR in history page

    Background: Login with registered account
        Given I am a registered customer with following details:
            | userID   | bots2912   |
            | password | TestSmb123 |
        When I filling in form login with the following details:
            | userID   | bots2912   |
            | password | TestSmb123 |
        And I click login
        Then I will direct to dashboard

    Scenario: Validate Card Limit For Type Loan AR Direct Loan
        Given I have been on Loan Dashboard to see the loan type of Loan AR Direct Loan
        When I validate the card of "Loan AR direct loan"
        Then I should see the wording dan card design of "Loan AR Direct Loan"