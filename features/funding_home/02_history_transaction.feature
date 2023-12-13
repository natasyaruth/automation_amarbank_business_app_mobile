@HistoryTrx
Feature: User Should See Detail Transaction History
    In home
    As a customer
    I need to see detail history transaction

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
        And I want to click button history transaction
        And I will redirect to history transaction page

    @C96150 @HistoryTrx
    Scenario: User want click button filter
        Given I want to click button filter history
        When I should see buttom sheet filter history
        Then I want to click button close

    @C96151 @HistoryTrx
    Scenario: User want filtered history transaction
        Given I want to click button filter history
        When I should see buttom sheet filter history
        Then I want to click button start date
        And I should see form date displayed
        And I choose the start date "Previous" with tap "4"
        And I want to click button end date
        And I choose the end date
        And I want to click button ok

    @C96152 @HistoryTrx
    Scenario: User want click detail history transfer out
        Given I want to click list transfer "out"
        When I should see text view transfer "out"
        And I want to copied reference number value
        And I should see text view value date transfer "out"
        And I should see text view value time transfer "out"
        Then I should see text view value category transfer "out"
        And I should see text view value note transfer "out"
        And I want to click button share
        And I want to click button close

    @C96153 @HistoryTrx
    Scenario: User want click detail history transfer in
        Given I want to click list transfer "in"
        When I should see text view transfer "in"
        And I want to copied reference number value
        And I should see text view value date transfer "in"
        And I should see text view value time transfer "in"
        Then I should see text view value category transfer "in"
        And I should see text view value note transfer "in"
        And I want to click button share
        And I want to click button close