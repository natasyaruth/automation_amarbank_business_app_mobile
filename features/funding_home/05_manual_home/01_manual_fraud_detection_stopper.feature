Feature: Manual Fraud Detection - Stopper
    In order to avoid fraud from user
    As a customer
    I want to see validation in amarbank business app if user indicated as fraud

Scenario: Validate information when user access app from emulator
    Given I am a customer want to access amarbank business app
    And I access via emulator
    When I open the app
    Then I will see information page user can't access the app because user using from emulator

Scenario: Validate information when user access app with config USB Debugging is enabled
    Given I am a customer want to access amarbank business app
    And I enabled USB debugging on my device
    When I open the app
    Then I will see information page user can't access the app because my USB debugging still enabled