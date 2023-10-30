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
        And I want to click button history transaction
        And I will redirect to history transaction page

    Scenario: User want click button filter
        Given I want to click button filter history
        When I should see buttom sheet filter history
        Then I want to click button close

    Scenario: User want filtered successed transaction
        Given I want to click button filter history
        When I should see buttom sheet filter history
        Then I want to click button start date
        And I should see form date displayed
        And I choose the start date "Previous"
        And I want to click button end date
        And I choose the end date
        And I want to click button ok

    Scenario: User want click detail history transfer out
        Given I want to click list transfer "out"
        When I should see text view transfer "out"
        Then I should see reference number value "out"
        And I want to copied reference number value
        And I should see text view value date transfer "out"
        And I should see text view value time transfer "out"
        And I should see text view value note transfer "out"
        And I want to click button share
        And I want to click button close

    Scenario: User want click detail history transfer in
        Given I want to click list transfer "in"
        When I should see text view transfer "in"
        Then I should see reference number value "in"
        And I want to copied reference number value
        And I should see text view value date transfer "in"
        And I should see text view value time transfer "in"
        And I should see text view value note transfer "in"
        And I want to click button share
        And I want to click button close