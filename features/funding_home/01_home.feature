@HistoryTrx
Feature: User Should See Transaction History from main dashboard
    In home
    As a customer
    I need to see history transaction

    Background: User must login to home dashboard
        Given I am a registered customer with following details:
            | userID   | pang6f17 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | pang6f17 |
            | password | Test1234 |
        And I click login
        And I click later
        Then I will direct to dashboard

    @C96149 @HistoryTrx
    Scenario: User want see a history transaction from main dashboard
        Given I am on home page
        When I should see button history on saldo card
        Then I want to click button history transaction
        And I will redirect to history transaction page