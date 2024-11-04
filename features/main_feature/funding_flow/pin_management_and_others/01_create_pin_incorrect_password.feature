# @regressionTest
Feature: User create PIN Journey Transfer
    In order to transfer
    As a customer
    I want to be able to create transaction pin

    # ATTENTION
    # please use user id with PIN still not created yet
    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric 
        Then I will direct to dashboard

    @C163985
    Scenario: User wants to Transfer but doesn't have PIN
        Given I am a customer who wants to create PIN
        And I don't have a PIN
        When I choose menu Transfer from main dashboard
        When I see pop up Create PIN
        When I click button Create PIN
        Then I will directly to Create New Transaction PIN page

    @C163986
    Scenario: User input incorrect password once
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input incorrect password
        And I submit my password
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can click try again
        And I reset attempt failed login

    @C163987
    Scenario: User input incorrect password twice
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I submit incorrect password twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can click try again
        And I reset attempt failed login

    @C163988
    Scenario: User input incorrect password three times
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I submit incorrect password three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can directly go to page login
        And I reset attempt failed login