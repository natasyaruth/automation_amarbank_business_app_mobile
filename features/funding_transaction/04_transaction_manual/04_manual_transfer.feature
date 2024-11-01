Feature: Manual Transfer
    In error mapping on transfer feature
    As a customer
    I want to make sure show error when rekening is inactive or not exist

    #@C157063 @FunctTestFunding
    Scenario: Checking inactive account number for Business
        Given I am a customer that want to transfer with business account
        When I login to app
        And I click menu transfer
        And I click button tambah ke penerima baru
        And I click button pilih nama bank
        And I choose Bank Amar
        And I input account number that inactive
        And I click button periksa
        Then Show error message Nomor rekening tidak aktif
        And User not available to continue the process

    #@C157064
    Scenario: Checking not exist account number for Business
        Given I am a customer that want to transfer with business account
        When I login to app
        And I click menu transfer
        And I click button tambah ke penerima baru
        And I click button pilih nama bank
        And I choose Bank Amar
        And I input account number that not exist
        And I click button periksa
        Then Show error message Nomor rekening tidak ditemukan
        And User not available to continue the process

    # #@C157065
    Scenario: Checking inactive account number for Individual
        Given I am a customer that want to transfer with individual account
        When I login to app
        And I click menu transfer
        And I click button tambah ke penerima baru
        And I click button pilih nama bank
        And I choose Bank Amar
        And I input account number that inactive
        And I click button periksa
        Then Show error message Nomor rekening tidak aktif
        And User not available to continue the process

    # #@C157066
    Scenario: Checking not exist account number for Individual
        Given I am a customer that want to transfer with individual account
        When I login to app
        And I click menu transfer
        And I click button tambah ke penerima baru
        And I click button pilih nama bank
        And I choose Bank Amar
        And I input account number that not exist
        And I click button periksa
        Then Show error message Nomor rekening tidak ditemukan
        And User not available to continue the process


    Scenario: User Success Transfer and check daily limit transaction next day
        Given I am a customer who wants to Transfer and has friend list and transfer on 10.00 PM
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I am making sure that limit transaction is "200000000"
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service RTOL
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I successfully transferred
        When I close page detail transfer
        And I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        Then I see limit transaction is "199985000"
        When I wait until 01.00 AM
        And I try to transfer anymore
        And I am on page transfer
        Then I see limit transaction was reset to "200000000"
