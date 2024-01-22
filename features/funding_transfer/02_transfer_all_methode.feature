Feature: User transfer with all transfer methode
    In order to transfer
    As a customer
    I want to make transfer all methode


    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | pang6f17 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | pang6f17 |
            | password | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        And I am on receiver list page

    Scenario: User confirmation transfer with RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '15000000'
        And I choose category "Pembayaran"
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BI Fast and RTOL
        And I choose transfer service RTOL
        And I click transfer
        And I am on page transfer confirmation
        

    Scenario: User transfer with RTOL and input wrong PIN
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '5000000'
        And I choose category "Pembayaran"
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And i choose transfer service RTOL
        And I click transfer
        And I will directly go to page confirmation transfer
        And I input wrong PIN
        Then I will be able to see message error "Input yang dimasukkan salah, silahkan coba lagi"

    Scenario: User Success Transfer RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '10000000'
        And I choose category "Pembayaran"
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BI Fast and RTOL
        And I choose transfer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred

    Scenario: User Success Transfer BiFast
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '10000000'
        And I choose category "Tagihan"
        And I input notes with 'Test BiFast'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BI Fast and RTOL
        And I choose transfer service BIFAST
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred

    Scenario: User Success Transfer SKN
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '100000000'
        And I choose category "Tagihan"
        And I input notes with 'Test SKN'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BI Fast, SKN and RTGS
        And I choose transfer service SKN
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred

    Scenario: User Success Transfer RTGS
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '1000000000'
        And I choose category "Tagihan"
        And I input notes with 'Test RTGS'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BI Fast, SKN and RTGS
        And I choose transfer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '123456'
        Then I successfully transferred