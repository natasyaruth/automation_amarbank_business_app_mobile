Feature: User transfer RTOL
    In order to transfer
    As a customer
    I want to make transfer RTOL


    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | pang6f17 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | pang6f17 |
            | password | Test1234 |
        And I click login
        And I click later
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard

    Scenario: User close buttom sheet category transaction
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I choose category 'Pembayaran'
        And I close bottom sheet category
        Then I see bottom sheet category is dissapear

    Scenario: User input amount higher than active balance
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount higher than active balance
        Then I can see message "saldo aktif tidak mencukupi"

    Scenario: User transfer detail with RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '55.000.000'
        And I choose category "Pembayaran"       
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        Then I can see BI Fast and RTOL
        And I choose transfer service RTOL

    Scenario: User confirmation transfer with RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '55.000.000'
        And I choose category "Pembayaran"       
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And I choose transer service RTOL
        And I click transfer
        Then I will directly go to page confirmation transfer

    Scenario: User transfer with RTOL and input wrong PIN
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '55.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And i choose transer service RTOL
        And I click transfer
        And I will directly go to page confirmation transfer
        And I input wrong PIN
        Then I will be able to see message error "Input yang dimasukkan salah, silahkan coba lagi"

      Scenario: User transfer with RTOL with empty notes
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '50.000.000'
        And I choose category "Pembayaran"       
        And I click choose bank transfer service
        And i choose transer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred without notes

    Scenario: User transfer with RTOL and input notes with emoji and symbol
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '50.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran #Oktober :D'
        And I click choose bank transfer service
        Then i see message "Catatan tidak menggunakan emoji & symbol"

    Scenario: User Transfer RTOL with amount = Rp.20.000.000
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '20.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And i choose transer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred

    Scenario: User Transfer RTOL with amount = Rp.50.000.000
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '100.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And i choose transer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred

    Scenario: User successfully transfer between Amar Bank
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '50.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And I will directly go to page confirmation transfer between Amar Bank
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred between Amar Bank 

    Scenario: User successfully transfer
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Nurul Septariani' from the search box
        And I choose the friendlist
        And I input amount '55.000.000'
        And I choose category "Pembayaran"        
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And I choose transer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred
        
        