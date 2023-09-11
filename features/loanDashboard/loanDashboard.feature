@LoanDash
Feature: Loan DashboardIn order to test Loan Dashboard page
        As a customer
        I am able to approve limit offers

        Background:
                Given I am registered customer with following details:
                        | userID   | ruthad74 |
                        | password | Test1234 |
                When I am filling in my account information with the following details:
                        | userID   | ruthad74 |
                        | password | Test1234 |
                And login with registered account
                Then I successed go to dashbord

@C32312312 @LoanDash
        Scenario: Validate design of loan dashboard offer
                Given I got a loan limit offer from system
                When I access loan business in main dashboard
                Then I should see approve loan offer card
                And I should see the button to apply for new limit loan

        Scenario: Access Loan limit Approval Page
                Given I have been on loan dashboard page and show a loan limit offer card
                When I am accessing loan limit approval page
                And I approve loan limit
                Then system should display this feature under development

        Scenario: Access Loan limit Approval Page When Offering Time is Expired
                Given I have been on loan dashboard page and show expired loan limit offer card
                When I access loan limit approval page with card got expired time
                Then system should display loan limit offer has been expired page

        Scenario: Close page Loan limit Approval Page
                Given I have been access loan limit approval page
                When I close page
                Then loan limit approval page is closed
                And I back to the loan dashboard page

        Scenario: Apply for new limit loan
                Given I have been access loan dashboard
                When I am adding apply for new limit loan
                Then New limit loan page will show

        Scenario: Access History Limit Dashboard
                Given I have been access loan dashboard to see history loan
                When I am accessing history
                Then History loan page will be showed

        Scenario: Back to The Main Dashboard
                Given I am on the loan Dashboard
                When I back to the previous page
                Then I should see main dashboard

