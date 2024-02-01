Feature: User create PIN
    In order to transfer
    As a customer
    I want to be able to create transaction pin

    # ATTENTION
    # please use user id with PIN still not created yet
    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | mukl8e4d |
            | password | 1234Test |
        When I filling in form login with the following details:
            | userID   | mukl8e4d |
            | password | 1234Test |
        And I click login        
        Then I will direct to dashboard

    @createpin01 
    Scenario: User wants to Transfer but doesn't have PIN
        Given I am a customer who wants to create PIN
        And I don't have a PIN
        When I choose menu Transfer from main dashboard
        When pop up Buat PIN will appear
        When I click button Buat PIN 
        Then I will directly to Create New PIN page

    @createpin02
    Scenario: User input incorrect password once
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN 
        And I input incorrect password
        And I submit my password
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @createpin03
    Scenario: User input incorrect password twice
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN
        And I submit incorrect password twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    @createpin04
    Scenario: User input incorrect password three times
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN
        And I submit incorrect password three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I directly go to page login

    @createpin05
    Scenario: User want to see their password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN
        And I input password
        And I click icon eye
        Then I will see my password

    @createpin06
    Scenario: User don't want to see their password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN
        And I input password
        And I click icon eye twice
        Then I will not see my password

    @createpin07
    Scenario: User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN
        And I input password
        And I submit my password
        And I input new PIN with '1'
        And I input new PIN with '2'
        And I input new PIN with '3'
        And I input new PIN with '4'
        And I input new PIN with '5'
        And I input new PIN with '6'
        And I input incorrect confirmation new PIN '1';
        And I input incorrect confirmation new PIN '2';
        And I input incorrect confirmation new PIN '1';
        And I input incorrect confirmation new PIN '2';
        And I input incorrect confirmation new PIN '1';
        And I input incorrect confirmation new PIN '2';

        Then I will see message error "PIN yang dimasukkan tidak sesuai" in the below of field confirmation pin

    @scenario08
        Scenario: User Successfully Get Email for OTP and create PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN
        And I input password
        And I submit my password
        And I input new pin
        And I input confirmation new pin
        And User will receive email for otp
        And I input OTP
        Then My PIN successfully created
        
    @scenario09
        Scenario: User Successfully Get Email for OTP and input incorrect OTP
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And pop up Buat PIN will appear
        And I click button Buat PIN
        And I input password
        And I submit my password
        And I input new pin
        And I input confirmation new pin
        And User will receive email for otp
        And I input incorrect OTP
        Then I will see message error "Kode OTP yang Anda masukkan salah" in the below of field otp code
        