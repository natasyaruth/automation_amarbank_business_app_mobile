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