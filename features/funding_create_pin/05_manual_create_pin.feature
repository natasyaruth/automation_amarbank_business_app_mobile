Feature: Create PIN manual test case
    In order to create PIN when doing transaction
    I want to create different pin from others business owner

    Scenario: Create PIN that different with other business owner
        Given User can create PIN that different with other business owner
        When User account have more than 1 business owner
        And User account was accepted from crm
        And User want to make transaction
        And User create PIN for doing transaction
        And User success to create PIN
        And User success to make transaction with that PIN
        And The other business owner want to create PIN or doing transaction for the first time
        Then The other business owner can create different PIN with the others
        And The other business owner can doing transaction with that pin

    Scenario: Validate template email code verification journey from create PIN
        Given I am a customer who want to create PIN
        When I click create PIN from menu transfer or other
        And I input password
        And I input new PIN
        And I confirm new PIN
        Then I will receive email contain with code verification
        And template same with figma

    Scenario: Validate template email code verification journey from change PIN
        Given I am a customer who want to change PIN
        When I click change PIN in menu other
        And I input password
        And I input new PIN
        And I confirm new PIN
        Then I will receive email contain with code verification
        And template same with figma

    Scenario: Validate template email code verification journey from change PIN
        Given I am a customer who forgot PIN
        When I click link forgot password in menu input PIN transfer
        And I input password
        And I input new PIN
        And I confirm new PIN
        Then I will receive email contain with code verification
        And template same with figma