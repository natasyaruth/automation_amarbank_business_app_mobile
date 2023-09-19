@loanDash
Feature: Loan Dashboard
In order to test Loan Dashboard page
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
@loanDash @C88625
        Scenario: Validate design of loan dashboard offer
                Given I got a loan limit offer from system
                When I access loan business in main dashboard
                Then I should see approve loan offer card
                And I should see the button to apply for new limit loan
@loanDash @C88626
        Scenario: Access Loan limit Approval Page
                Given I have been on loan dashboard page and show a loan limit offer card
                When I am accessing loan limit approval page
                And I approve loan limit
                Then system should display this feature under development
@loanDash @C88627
        Scenario: Access Loan limit Approval Page When Offering Time is Expired
                Given I have been on loan dashboard page and show expired loan limit offer card
                When I access loan limit approval page with card got expired time
                Then system should display loan limit offer has been expired page
@loanDash @C88628
        Scenario: Close page Loan limit Approval Page
                Given I have been access loan limit approval page
                When I close page
                Then loan limit approval page is closed
                And I back to the previous page to verify loan Dashboard
@loanDash @C88629
        Scenario: Apply for new limit loan
                Given I have been access loan dashboard to apply new limit loan
                When I am adding apply for new limit loan
                Then Show Loan Schema
@loanDash @C88630
        Scenario: Access History Limit Dashboard
                Given I have been access loan dashboard to see history loan
                When I am accessing history
                Then History loan page will be showed
@loanDash @C88631
        Scenario: Back to The Main Dashboard
                Given I am on the loan Dashboard
                When I back to the previous page
                Then I should see main dashboard
@loanDash @C88632
        Scenario: Validate Card Limit For Type Loan AP
                Given I have been on Loan Dashboard to see the loan type of Loan AP
                When I validate the card of "Loan AP"
                Then I should see the wording and card design of "Loan AP"
@loanDash @C88633
        Scenario: Validate Card Limit For Type Loan AP Direct Loan
                Given I have been on Loan Dashboard to see the loan type of Loan AP Direct Loan
                When I validate the card of "Loan AP direct loan"
                Then I should see the wording and card design of "Loan AP Direct Loan"
@loanDash @C88634
        Scenario: Validate Card Limit For Type Loan PO
                Given I have been on Loan Dashboard to see the loan type of Loan PO
                When I validate the card of "Loan PO"
                Then I should see the wording and card design of "Loan PO"
@loanDash @C88635
        Scenario: Validate Card Limit For Type Loan AR Direct Loan
                Given I have been on Loan Dashboard to see the loan type of Loan AR Direct Loan
                When I validate the card of "Loan AR direct loan"
                Then I should see the wording and card design of "Loan AR Direct Loan"