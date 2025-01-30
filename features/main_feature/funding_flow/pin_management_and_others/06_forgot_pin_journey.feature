# @regressionTest
Feature: AUTOMATED User forgot PIN and want to create new PIN
    In order to transfer
    As a customer
    I want to be able to create transcation pin from forgot pin

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | bugc133f |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | bugc133f |
            | passwordStg | Test1234 |
        And I click login
        # And I click later in pop up biometric
        Then I will direct to dashboard

    @C164128
    Scenario: AUTOMATED User wants to create pin from forgot PIN
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click change transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I input password
        And I submit my password
        And I input new PIN with "111111"
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input OTP
        And I should See Success Change PIN

    @C164129
    Scenario: AUTOMATED User input incorrect password once from forgot PIN
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I input incorrect password
        And I submit my password
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I reset attempt failed login

    @C164130
    Scenario: AUTOMATED User input incorrect password twice
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I submit incorrect password twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I reset attempt failed login

    @C164131
    Scenario: AUTOMATED User input incorrect password three times
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I submit incorrect password three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can directly go to page login
        And I reset attempt failed login

    @C164132
    Scenario: AUTOMATED User want to see their password
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I input password
        And I click icon eye
        Then I will see my password

   @C164133
    Scenario: AUTOMATED User don't want to see their password
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I input password
        And I click icon eye twice
        Then I will not see my password

    @C164134
    Scenario: AUTOMATED User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I input password
        And I submit my password
        And I input new PIN with "111111"
        And I input incorrect old pin
        Then I will see message error "PIN yang dimasukkan tidak sesuai" in the below of field confirmation pin

    @C164135
    Scenario: AUTOMATED User input incorrect OTP
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I click link forgot pin
        And I will directly to Forgot PIN page
        And I input password
        And I submit my password
        And I input new PIN with "111111"
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input incorrect OTP
        Then I will see message error "Kode verifikasi yang Anda masukkan salah" in the below of field otp code