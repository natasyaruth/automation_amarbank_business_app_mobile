@change_pin
Feature: User change PIN from other menu
    In order to transfer
    As a customer
    I want to be able to change transcation pin from menu other

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | nata6bde |
            | passwordStg | 1234Test |
        And never entered wrong password
        And I reset attempt otp after login
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | nata6bde |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'

    @C109132
    Scenario: User wants to change transcation PIN
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        And I input old PIN with "111111"
        And I create PIN with "123456"
        And I confirm create PIN
        And I input OTP
        And I should See Success Change PIN
        Then I will go back to other page
        And I reset my PIN

    @C109133
    Scenario: User wants to changes pin from menu other
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        Then I will directly to Change PIN page

    @C109134
    Scenario: User input incorrect confirmation PIN for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        And I input old PIN with "111111"
        And I create PIN with "123456"
        And I input incorrect confirmation new PIN
        Then I will see message error "PIN yang dimasukkan tidak sesuai" in the below of field confirmation pin

    @C109135
    Scenario: User input expired OTP for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        And I input old PIN with "111111"
        And I create PIN with "123456"
        And I confirm create PIN
        And I input expired OTP
        Then I will see message error "Kode verifikasi yang dimasukkan sudah kedaluwarsa" in the below of field otp code

    @C109136
    Scenario: User input incorrect old pin once for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        And I input incorrect old pin
        And I submit my old pin
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C109137
    Scenario: User input incorrect old pin twice for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        And I submit incorrect old pin twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C109138
    Scenario: User input incorrect old pin three times for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        And I submit incorrect old pin three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can directly go to page login