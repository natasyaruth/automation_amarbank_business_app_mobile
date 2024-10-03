Feature: Validate Success Autodebit Interest Fee If The Dute Date Falls On Holiday Date
    In history transaction
    As a customer
    I need to see the mutation detail for the autodebit interest loan fee when the due date falls on holiday date

    Scenario: User

    @C96150
    Scenario: User want click button filter
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click button filter history
        When I should see buttom sheet filter history
        Then I want to click button close