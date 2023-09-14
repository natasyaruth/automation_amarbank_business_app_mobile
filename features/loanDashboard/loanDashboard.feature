@LoanDash
Feature: Loan Dashboard
In order to test Loan Dashboard page
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

@C1334 @LoanDash
        Scenario: Validate design of loan dashboard offer
                Given I got a loan limit offer from system
                When I access loan business in main dashboard
                Then I should see approve loan offer card
                And I should see the button to apply for new limit loan
@C2334 @LoanDash
        Scenario: Access Loan limit Approval Page
                Given I have been on loan dashboard page and show a loan limit offer card
                When I am accessing loan limit approval page
                And I approve loan limit
                Then system should display this feature under development
@C3334 @LoanDash
        Scenario: Access Loan limit Approval Page When Offering Time is Expired
                Given I have been on loan dashboard page and show expired loan limit offer card
                When I access loan limit approval page with card got expired time
                Then system should display loan limit offer has been expired page
@C4334 @LoanDash
        Scenario: Close page Loan limit Approval Page
                Given I have been access loan limit approval page
                When I close page
                Then loan limit approval page is closed
                And I back to the loan dashboard page
@C5334 @LoanDash
        Scenario: Apply for new limit loan
                Given I have been access loan dashboard
                When I am adding apply for new limit loan
                Then New limit loan page will show
@C6334 @LoanDash
        Scenario: Access History Limit Dashboard
                Given I have been access loan dashboard to see history loan
                When I am accessing history
                Then History loan page will be showed
@C7334 @LoanDash
        Scenario: Back to The Main Dashboard
                Given I am on the loan Dashboard
                When I back to the previous page
                Then I should see main dashboard

        @C8334 @LoanDash
        Scenario: Validate Card Limit For Type Loan AP
                Given I have been on Loan Dashboard to see the loan type of Loan AP
                When I validate the card of "Loan AP"
                Then I should see the wording dan card design of "Loan AP"

        @C9334 @LoanDash
        Scenario: Validate Card Limit For Type Loan AP Direct Loan
                Given I have been on Loan Dashboard to see the loan type of Loan AP Direct Loan
                When I validate the card of "Loan AP direct loan"
                Then I should see the wording dan card design of "Loan AP Direct Loan"

        @C10334 @LoanDash
        Scenario: Validate Card Limit For Type Loan PO
                Given I have been on Loan Dashboard to see the loan type of Loan PO
                When I validate the card of "Loan PO"
                Then I should see the wording dan card design of "Loan PO"

        @C11334 @LoanDash
        Scenario: Validate Card Limit For Type Loan AR Direct Loan
                Given I have been on Loan Dashboard to see the loan type of Loan AR Direct Loan
                When I validate the card of "Loan AR direct loan"
                Then I should see the wording dan card design of "Loan AR Direct Loan"

