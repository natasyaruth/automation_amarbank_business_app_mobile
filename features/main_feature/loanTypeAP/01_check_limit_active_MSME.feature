
Feature: Checking Loan Type AP and Direct AP with Status Active
        In order to checking limit active for loan type AP and Direct AP
        As a customer
        I am able to verify limit active loan type AP and direct AP in history page

        Background: Login with registered account
                Given I am a registered customer with following details:
                        | userID   | wahy8ea8 |
                        | password | Test4321 |
                When I filling in form login with the following details:
                        | userID   | wahy8ea8 |
                        | password | Test4321 |
                And I click login
                Then I will direct to dashboard
                And I click menu tab testing
        
        @debt85
        Scenario: Validate Card Limit For Type Loan AP     
                Given I have been access history loan limit to see status "Dalam Proses"
                When I access menu bar limit with status "Dalam Proses"
                And I select first list card loan approved
                And I validate status is approved
                And I validate content limit approved page

