Feature: User transfer RTGS
    In order to transfer
    As a customer
    I want to make transfer RTGS


    Background: User has registered and login to dashboard
        Given I am a registered  customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        And I click later
        And I will direct to dashboard
        
    
    Scenario: User transfer detail with RTGS
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '1.000.000.000'
        And I choose category "Pembayaran"       
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        Then I can see SKN and RTGS
        And I choose transfer service RTGS

    Scenario: User transfer with RTGS with empty notes
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '2.000.000.000'
        And I choose category "Pembayaran"        
        And I click choose bank transfer service
        And I choose transer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '112233'
        Then I successfully transferred without notes 

    Scenario: User transfer with RTGS and input notes with emoji & symbol
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '2.000.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran #Oktober :D'
        And I click choose bank transfer service
        Then I see error message "Catatan tidak menggunakan emoji & symbol"

    Scenario: User Transfer RTGS and input notes more than 50 char
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '155.000.000'
        And I choose category "Pembayaran"       
        And I input notes with 'Pembayaran Cicilan bulan pertama yaitu di bulan Oktober'
        And I click choose bank transfer service
        Then i see error message "Catatan tidak bisa input lebih dari 50 char"

     Scenario: User Transfer with amount < Rp.10.000
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '9.000'
        Then I see error message "Nilai Transfer minimal Rp.10.000"

    Scenario: User Transfer RTGS with amount = Rp.2.000.000.000
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '1.000.000.000'
        And I choose category "Pembayaran"       
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And i choose transer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '112233'
        Then I successfully transferred

    Scenario: User confirmation transfer with RTGS
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '2.000.000.000'
        And I choose category "Pembayaran"
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And I choose transer service RTGS
        And I click transfer
        Then I will directly go to page confirmation transfer   

    Scenario: User successfully transfer between Amar Bank
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Aleena Andrian' in friendlist
        And I choose the friendlist
        And I input amount '2.000.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And I will directly go to page confirmation transfer between Amar Bank
        And I click transfer now
        And I input PIN '112233'
        Then I successfully transferred between Amar Bank    

    Scenario: User successfully transfer
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input amount '55.000.000'
        And I choose category "Pembayaran"       
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And i choose transer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '112233'
        Then I successfully transferred
        And I receive an email

    Scenario: User input incorrect PIN once
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Sheena Andrian' in friendlist
        And I choose the friendlist
        And I input amount '2.000.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And i choose transer service RTGS
        And I click transfer
        And I click transfer now
        And I input wrong PIN
        Then I see Pin message error "Pin yang dimasukkan salah, silahkan coba lagi"

    Scenario: User input incorrect PIN twice
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Sheena Andrian' in friendlist
        And I choose the friendlist
        And I input amount '155.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And i choose transer service RTGS
        And I click transfer
        And I click transfer now
        And I input wrong PIN
        Then I see Pin message error for click twice "Pin yang dimasukkan salah, silahkan coba lagi"
       
    Scenario: User input incorrect PIN third
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Sheena Andrian' in friendlist
        And I choose the friendlist
        And I input amount '155.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And i choose transer service RTGS
        And I click transfer
        And I click transfer now
        And I input wrong PIN 
        Then My PIN transaction will be temporary blocked for 30 minutes

    
    



    

       

