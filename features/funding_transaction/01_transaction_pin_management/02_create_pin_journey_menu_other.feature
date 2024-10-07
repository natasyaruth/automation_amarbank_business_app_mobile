@create_pin_journey_menu_other
Feature: User create PIN from other menu
    In order to transfer
    As a customer
    I want to be able to create transcation pin from menu other

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | kitad3fa |
            | passwordStg | 1234Test |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | kitad3fa |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        Then I will see card account 'active'

    @C109122
    Scenario: User wants to see create pin in menu other
        Given I am a customer who wants to create PIN from menu other
        And I don't have a PIN
        When I choose other
        Then I go to page other
        And I can see change password and create transaction pin

    @C109123
    Scenario: User wants to create pin from menu other
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        Then I will directly to Create New PIN page

    @C109124
    Scenario: User input incorrect password once
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I Input incorrect password
        And I submit my password
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C109125
    Scenario: User input incorrect password twice
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I Input incorrect password
        And I submit my password twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C109126
    Scenario: User input incorrect password three times
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I Input incorrect password
        And I submit my password three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I directly go to page login

    @C109127
    Scenario: User want to see their password
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I input password
        And I click icon eye
        Then I will see my password

    @C109128
    Scenario: User don't want to see their password
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transcation pin
        And I input password
        And I click icon eye twice
        Then I will not see my password

    @C109129
    Scenario: User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I input password
        And I submit my password
        And I create PIN with "123456"
        And I input incorrect confirmation new PIN
        Then I will see message error "PIN yang dimasukkan tidak sesuai"

    @C109130
    Scenario: User input incorrect OTP
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I input password
        And I submit my password
        And I create PIN with "123456"
        And I confirm create PIN
        And I input incorrect OTP
        Then I will see message error "Kode OTP yang Anda masukkan salah"

    @C109131
    Scenario: User Successfully Create New PIN
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I input password
        And I submit my password
        And I create PIN with '111111'
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input OTP
        Then My PIN successfully created