# @regressionTest
Feature: User create PIN from other menu Incorrect Password
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

    @C164115
    Scenario: User wants to see create pin in menu other
        Given I am a customer who wants to create PIN from menu other
        And I don't have a PIN
        When I choose other
        Then I go to page other
        And I can see change password and create transaction pin

    @C164116
    Scenario: User wants to create pin from menu other
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        Then I will directly to Create New PIN page

    @C164117
    Scenario: User input incorrect password once
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        Then I will directly to Create New PIN page
        And I input incorrect password
        And I submit my password
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C164118
    Scenario: User input incorrect password twice
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        Then I will directly to Create New PIN page
        And I submit incorrect password twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C164119
    Scenario: User input incorrect password three times
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        Then I will directly to Create New PIN page
        And I submit incorrect password three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can directly go to page login