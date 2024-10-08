@regressionTest
Feature: User create PIN from other menu
    In order to transfer
    As a customer
    I want to be able to create transcation pin from menu other

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        Then I will direct to dashboard

    # @C109122
    # Scenario: User wants to see create pin in menu other
    #     Given I am a customer who wants to create PIN from menu other
    #     And I don't have a PIN
    #     When I choose other
    #     Then I go to page other
    #     And I can see change password and create transaction pin

    @C109123
    Scenario: User wants to create pin from menu other
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        Then I will directly to Create New PIN page

    # @C109124
    # Scenario: User input incorrect password once
    #     Given I am a customer who wants to create PIN from menu other
    #     When I choose other
    #     And I click create transaction pin
    #     And I Input incorrect password
    #     And I submit my password
    #     Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    # @C109125
    # Scenario: User input incorrect password twice
    #     Given I am a customer who wants to create PIN from menu other
    #     When I choose other
    #     And I click create transaction pin
    #     And I Input incorrect password
    #     And I submit my password twice
    #     Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    # @C109126
    # Scenario: User input incorrect password three times
    #     Given I am a customer who wants to create PIN from menu other
    #     When I choose other
    #     And I click create transaction pin
    #     And I Input incorrect password
    #     And I submit my password three times
    #     Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
    #     And I directly go to page login