@createPINfromOther
Feature: User create PIN
    In order to transfer
    As a customer
    I want to be able to create transcation pin from menu other
    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        Then I will direct to Main Dashboard

    Scenario: User wants to see create pin in menu other
        Given I am a customer who wants to create PIN from menu other
        And I don't have a PIN
        When I choose other
        Then I go to page other
        And I can see change password and create transaction pin

    Scenario: User wants to create pin from menu other
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        Then I will directly to Create New PIN page

    Scenario: User input incorrect password once
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I Input incorrect password
        And I submit my password
        Then I should see pop up message "Data yang dimasukkan salah. Jika 3 kali salah akun Anda akan terblokir"
    
    Scenario: User input incorrect password twice
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I Input incorrect password
        And I submit my password twice
        Then I should see pop up message "Data yang dimasukkan salah. Jika 3 kali salah akun Anda akan terblokir"
    
    Scenario: User input incorrect password three times
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I Input incorrect password
        And I submit my password three times
        Then I should see pop up message "Akun Anda Terblokir selama 30 menit"
    
    Scenario: User want to see their password
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transaction pin
        And I input password
        And I click icon eye
        Then I will see my password
    
    Scenario: User don't want to see their password
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transcation pin
        And I input password
        And I click icon eye twice
        Then I will not see my password
    
    Scenario: User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transcation pin
        And I input password
        And I submit my password
        And I input new PIN with "123456"
        And I input incorrect confirmation new PIN
        Then I will see message error "PIN yang dimasukkan tidak sesuai"
    
    Scenario: User input incorrect OTP
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transcation pin
        And I input password
        And I submit my password
        And I input new PIN with "123456"
        And I input confirmation new PIN
        And I input incorrect OTP
        Then I will see message error "Kode OTP yang Anda masukkan salah"
    
    Scenario: User Successfully Create New PIN
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I click create transcation pin
        And I input password
        And I submit my password
        And I input new PIN
        And I input confirmation new PIN
        And I input OTP
        Then My PIN successfully created
        And I will go back to page other
        And I will see toastbar "PIN transaksi berhasil dibuat"
   
    Scenario: User wants to change transcation PIN
        Given I am a customer who wants to change PIN from menu other
        When I choose other
        And I click change transaction pin
        Then I will see bottom sheet call our team
        And I can see change password and change transaction pi