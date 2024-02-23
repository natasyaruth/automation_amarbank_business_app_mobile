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

    
    Scenario: User wants to Transfer but doesn't have PIN
        Given I am a customer who wants to create PIN
        And I don't have a PIN
        When I choose menu Transfer from main dashboard
        When I see pop up Create PIN
        When I click button Create PIN 
        Then I will directly to Create New Transaction PIN page

   
    Scenario: User input incorrect password once
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN 
        And I input incorrect password
        And I submit my password
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    
    Scenario: User input incorrect password twice
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I submit incorrect password twice
        Then I should see pop up message "Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun"

    
    Scenario: User input incorrect password three times
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I submit incorrect password three times
        Then I should see pop up message "Anda akan langsung diarahkan ke halaman Masuk Akun"
        And I directly go to page login

   
    Scenario: User want to see their password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I click icon eye
        Then I will see my password

   
    Scenario: User don't want to see their password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I click icon eye twice
        Then I will not see my password

    
    Scenario: User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
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

    
    Scenario: User Successfully Get Email for OTP and create PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new pin
        And I input confirmation new pin
        And User will receive email for otp
        And I input OTP
        Then My PIN successfully created
        
    
    Scenario: User Successfully Get Email for OTP and input incorrect OTP
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new pin
        And I input confirmation new pin
        And User will receive email for otp
        And I input incorrect OTP
        Then I will see message error "Kode OTP yang Anda masukkan salah" in the below of field otp code
        
    Scenario: User Successfully Get Email for OTP and input expired OTP
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new pin
        And I input confirmation new pin
        And User will receive email for otp
        And I input expired OTP
        Then I will see message error "Kode OTP yang Anda masukkan expired" in the below of field otp code
        
    Scenario: Back to main dashbord in pop up create PIN Transaction
        Given I am a customer who wants back to dashboard 
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Back ke Dashboard 
        Then I should direct to Dashboard
    
    Scenario: Close page Pin Transaction in page fill password
        Given I am a customer who wants wants to create PIN 
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I click button Close
        And I should see close confirmation pop up
        And I click button yes, cancel it
        Then I should direct to Dashboard

    Scenario: Cancel close page Pin Transaction in page fill password
        Given I am a customer who wants wants to create PIN 
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I click button Close
        And I should see close confirmation pop up
        And I click button Cancel
        Then I should stay on page fill password
    
    Scenario: Close page Pin Transaction in page fill PIN
        Given I am a customer who wants wants to create PIN 
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I click button Close
        And I should see close confirmation pop up
        And I click button yes, cancel it
        Then I should direct to Dashboard

    Scenario: Cancel close page Pin Transaction in page fill PIN
        Given I am a customer who wants wants to create PIN 
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I click button Close
        And I should see close confirmation pop up
        And I click button Cancel
        Then I should stay on page fill PIN

    Scenario: Back to page input PIN from confirmation PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new pin
        And I click button back
        Then I should back to page fill PIN
        
   