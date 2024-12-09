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


Scenario: Verify page "Transaksi sedang diproses" when user doing transaction with BIFAST
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        

Scenario: User will be redirected to Main Dashboard after click button "x" on page "Transaksi sedang diproses"
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I click button "x" on page "Transaksi sedang diproses"
        Then I will be redirected to Main Dashboard


Scenario: User create another transaction after click button "x" on page "Transaksi sedang diproses"
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I click button "x" on page "Transaksi sedang diproses"
        Then I will be redirected to Main Dashboard
        When I go to menu transfer
        And I do another transaction
        Then I can do another transaction until I successfully transferred


Scenario: Check page when transaction is failed
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction failed
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        Then I see page "Transfer Gagal"
        When I cek my balance
        Then I see my balance was not deducted


Scenario: Check page when transaction is success
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        Then I see page "Transfer Berhasil"
        When I cek my balance
        Then I see my balance was deducted
        When I go to menu transaction history
        And I check on tab "Keluar"
        Then I see transaction history and transaction fee Bifast
        When I click that transaction history
        Then I see detail transaction history


Scenario: Check success screen if waiting until get result after doing transaction (max waiting time 300s)
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction suspend and got waiting page until 300s
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        And I wait on page "Transaksi sedang diproses" for 300 second
        Then I see page "Transaction Success"
        

Scenario: Check transaction history when got suspend and then fund revearsal (pengembalian dana)
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction suspend, got waiting page until 300s and fund revearsal
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        And I wait on page "Transaksi sedang diproses" for 300 second
        Then I see page "Transaction Success"
        When I go to transaction history
        Then I see section "Pengembalian Dana Transaksi" and outbound transaction
        When I open the detail of section "Pengembalian Dana Transaksi"
        Then I see detail transaction with notes "Pengembalian Dana BIFAST"
        And I see my balance is not deducted


Scenario: Check transaction history when got suspend and then fund sent (dana diteruskan)
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction suspend, got waiting page until 300s and fund sent
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        And I wait on page "Transaksi sedang diproses" for 300 second
        Then I see page "Transaction Success"
        When I go to transaction history
        Then I see section outbound transaction
        When I open the detail of section
        Then I see detail transaction
        And I see my balance was deducted

--------------

Scenario: Verify page "Transaksi sedang diproses" when maker doing transaction with BIFAST (Pending Task)
        Given I am a customer who wants to Transfer and has friend list
        And I am a maker and have approver in other side
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I see page waiting for approval
        When Approver login to approve the transaction
        And Approver open request transaction that need approval
        And Approver accept the transaction
        And Approver input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I see page transaksi berhasil



Scenario: Check page when transaction is failed (pending task)
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction failed
        And I am a maker and have approver in other side
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I see page waiting for approval
        When Approver login to approve the transaction
        And Approver open request transaction that need approval
        And Approver accept the transaction
        And Approver input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I back to page "Masukkan PIN"
        When I check on transaction history
        Then I see revearsal fund and transaction out on transaction history
        And Balance is not deducted



Scenario: Check page when transaction is success (pending task)
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction failed
        And I am a maker and have approver in other side
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I see page waiting for approval
        When Approver login to approve the transaction
        And Approver open request transaction that need approval
        And Approver accept the transaction
        And Approver input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I got snackbar success
        When I check on transaction history
        Then I see transaction out on transaction history
        And Balance is deducted


Scenario: Check success screen if waiting until get result after doing transaction (max waiting time 300s) (Pending task)
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction suspend and got waiting page until 300s
        And I am a maker and have approver in other side
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test BIFAST'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service BIFAST
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I see page waiting for approval
        When Approver login to approve the transaction
        And Approver open request transaction that need approval
        And Approver accept the transaction
        And Approver input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I got snackbar success
        When I wait for a second
        And I wait on page "Transaksi sedang diproses" for 300 second
        Then I got snackbar success
        When I check on transaction history
        Then I see transaction out on transaction history
        And Balance is deducted
        