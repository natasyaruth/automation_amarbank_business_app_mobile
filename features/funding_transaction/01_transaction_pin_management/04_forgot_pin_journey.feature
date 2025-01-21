@forgot_pin
Feature: User forgot PIN and want to create new
    In order to transfer
    As a customer
    I want to be able to create transcation pin from forgot pin

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
        Then I will see card account 'active'

    @C109139
    Scenario: User wants to create pin from forgot PIN
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click change transaction pin
        And I click link forgot pin
        And I input password
        And I submit my password
        And I input new PIN with "111111"
        And I confirm create PIN
        And I input OTP
        Then I will direct to page PIN has been successfully changes
        And I click understand
        And I will go back to other page

    @C109140
    Scenario: User input incorrect password once from forgot PIN
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click create transaction pin
        And I click link forgot pin
        And I input incorrect password
        And I submit my password
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C109141
    Scenario: User input incorrect password twice
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click create transaction pin
        And I click link forgot pin
        And I submit incorrect password twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @C109142
    Scenario: User input incorrect password three times
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click create transaction pin
        And I click link forgot pin
        And I submit incorrect password three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can directly go to page login

    @C109143
    Scenario: User want to see their password
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click create transaction pin
        And I click link forgot pin
        And I input password
        And I click icon eye
        Then I will see my password

    @C109144
    Scenario: User don't want to see their password
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click create transaction pin
        And I click link forgot pin
        And I input password
        And I click icon eye twice
        Then I will not see my password

    @C109145
    Scenario: User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click create transaction pin
        And I click link forgot pin
        And I input password
        And I submit my password
        And I create PIN with "123456"
        And I input incorrect confirmation new PIN
        Then I will see message error "PIN yang dimasukkan tidak sesuai" in the below of field confirmation pin

    @C109146
    Scenario: User input incorrect OTP
        Given I am a customer who wants to create PIN from menu forgot PIN
        When I choose other
        And I click create transaction pin
        And I click link forgot pin
        And I input password
        And I submit my password
        And I create PIN with "123456"
        And I confirm create PIN
        And I input incorrect OTP
        Then I will see message error "Kode verifikasi yang Anda masukkan salah" in the below of field otp code