@transfer_all_method
Feature: User transfer with all transfer method
    In order to transfer
    As a customer
    I want to make transfer all methode

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | ruth8ca4 |
            | password    | 1234Test |
            | userIDstg   | stag3338 |
            | passwordStg | 1234Test |
        When I filling in form login with the following details:
            | userID      | ruth8ca4 |
            | password    | 1234Test |
            | userIDstg   | stag3338 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        And I am on receiver list page

    @C133894
    Scenario: User confirmation transfer with RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '15000000'
        And I choose category "Pembayaran"
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        Then I can see BIFAST, RTOL and SKN
        And I choose transfer service RTOL
        And I click transfer
        And I am on page transfer confirmation 

    @C96930
    Scenario: User transfer with RTOL and input wrong PIN
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '5000000'
        And I choose category "Pembayaran"
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I will directly go to page confirmation transfer
        And I input wrong PIN
        Then I will be able to see message error "Input yang dimasukkan salah, silahkan coba lagi"

    @C96931
    Scenario: User Success Transfer RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I can see BIFAST, RTOL and SKN
        And I choose transfer service RTOL
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I successfully transferred

    @C133897
    Scenario: User Success Transfer BiFast and check daily limit
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '100000'
        And I choose category 'Tagihan'
        And I input notes with 'Test BiFast'
        And I click choose bank transfer service
        And I can see BIFAST, RTOL and SKN
        And I choose transfer service BIFAST
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I see limit transaction is updated
        And I input amount '200000000'
        Then I see error message daily transaction "Nominal melebihi sisa limit transaksi harian" 

    @C133898
    Scenario: User Success Transfer SKN
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '55000000'
        And I choose category 'Tagihan'
        And I input notes with 'Test SKN'
        And I click choose bank transfer service
        And I can see BIFAST, RTOL and SKN
        And I choose transfer service SKN
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        Then I successfully transferred

    @C96934    
    Scenario: User Success Transfer RTGS
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '100000020'
        And I choose category 'Tagihan'
        And I input notes with 'Test RTGS'
        And I click choose bank transfer service
        And I can see BIFAST, RTOL, SKN and RTGS
        And I choose transfer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        Then I successfully transferred