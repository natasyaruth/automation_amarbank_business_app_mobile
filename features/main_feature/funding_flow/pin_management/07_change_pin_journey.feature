@regressionTest
Feature: AUTOMATED User change PIN from other menu
    In order to transfer
    As a customer
    I want to be able to change transcation pin from menu other

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | annae951 |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | annae951 |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric 
        Then I will direct to dashboard

    
    Scenario: AUTOMATED User Success to change pin from menu other
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        Then I go to page other
        And I click change transaction pin
        And I will directly to Change PIN page
        And I input old PIN with "111111"
        And I input new PIN with "111111"
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input OTP
        Then I should See Success Change PIN

    
    Scenario: AUTOMATED User input incorrect confirmation PIN for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        Then I go to page other
        And I click change transaction pin
        And I will directly to Change PIN page
        And I input old PIN with "111111"
        And I input new PIN with "111111"
        And I input incorrect old pin
        Then I will see message error "PIN yang dimasukkan tidak sesuai" in the below of field confirmation pin

    
    Scenario: AUTOMATED User input expired OTP for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I go to page other
        And I click change transaction pin
        And I will directly to Change PIN page
        And I input old PIN with "111111"
        And I input new PIN with "111111"
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input expired OTP
        Then I will see message error "Kode verifikasi yang dimasukkan sudah kedaluwarsa" in the below of field otp code

    
    Scenario: AUTOMATED User input incorrect old pin once for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I go to page other
        And I click change transaction pin
        And I will directly to Change PIN page
        And I input incorrect old pin
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can click try again

    
    Scenario: AUTOMATED User input incorrect old pin twice for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I go to page other
        And I click change transaction pin
        And I will directly to Change PIN page
        And I submit my old pin twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    
    Scenario: AUTOMATED User input incorrect old pin three times for change pin
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I go to page other
        And I click change transaction pin
        Then I will directly to Change PIN page
        And I submit my old pin three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I can directly go to page login