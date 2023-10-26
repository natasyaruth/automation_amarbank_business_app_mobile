Feature: User Should See Transaction History
    In home
    As a customer
    I need to see history transaction

    Background: User must login to home dashboard
        Given I am a registered customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        Then I will direct to dashboard

    Scenario: User has no friend list
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        Then I will direct to Friend list Page
        And I can see message "Belum ada Nama Penerima"