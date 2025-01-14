Feature: Manual Transfer
    In error mapping on transfer feature
    As a customer
    I want to make sure show error when rekening is inactive or not exist

    @C157063
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

    @C157064
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

    @C157065
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

    @C157066
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

    @C167474
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

    @C167475               
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
        
    @C167476
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

    @C167477
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

    @C167478
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

    @C167479
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

    @C167480
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
        
    @C167481
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

    @C167482
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

    @C172436
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

    @C172437
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

    @C172438
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

    @C172439
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

    @C135525
    Scenario: Transfer with amount more than admin fee RTGS
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount more than active amount
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I can see BIFAST, SKN and RTGS
        And I choose transfer service SKN
        Then I shouldn't see message error total amount more than active amount
        And I choose transfer service BIFAST
        Then I shouldn't see message error total amount more than active amount
        And I choose transfer service RTGS
        Then I see message error total amount shouldn't more than active amount

    @C173118
    Scenario: Check push notification limit RTOL
        Given I am in dashboard
        When push notification adjust RTOL
        Then I receive notification about information adjust RTOL
        And I see information that limit RTOL is adjusted to Rp200.000.000

    @C173119
    Scenario: Check notification email limit RTOL
        Given I am in dashboard
        When push notification adjust RTOL
        Then I receive notification email about information adjust RTOL
        And I see information that limit RTOL is adjusted to Rp200.000.000

    @C173151
    Scenario: Check Push Notification Transaction Out Single Transfer Sesama Amar Bank
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'ICHA KUN' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test Overbooking'
        And I click button next
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        Then I see page "Transfer Berhasil"
        Then I got push notification from that transaction

    @@C173152
    Scenario: Check Push Notification Transaction Transaction Out Single Transfer BIFAST
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
        Then I got push notification from that transaction

    @C173153
    Scenario: Check Push Notification Transaction Out Single Transfer RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
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
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        Then I see page "Transfer Berhasil"
        Then I got push notification from that transaction

    @C173154
    Scenario: Check Push Notification Transaction Out Single Transfer SKN
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test SKN'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service SKN
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        Then I see page "Transfer Berhasil"
        Then I got push notification from that transaction

    @C173155
    Scenario: Check Push Notification Transaction Out Single Transfer RTGS
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '100000001'
        And I choose category 'Pembayaran'
        And I input notes with 'Test RTGS'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL, SKN and RTGS
        When I choose transfer service RTGS
        And I click transfer
        And I am on page transfer confirmation
        And I click transfer now
        And I input PIN '111111'
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        When I wait for a second
        Then I see page "Transfer Berhasil"
        Then I got push notification from that transaction

    @C173156
    Scenario: Check Push Notification Transaction Transaction Out Maker Approval Sesama Amar Bank.
        Given I am a customer who wants to Transfer and has friend list
        And I hit api mocking to make transaction failed
        And I am a maker and have approver in other side
        When I input name 'ICHA KUN' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test Overbooking'
        And I click button next
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
        And I got snackbar success
        Then I got push notification from that transaction

    @C173157
    Scenario: Check Push Notification Transaction Transaction Out Maker Approval BI-FAST
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
        And I see page waiting for approval
        When Approver login to approve the transaction
        And Approver open request transaction that need approval
        And Approver accept the transaction
        And Approver input PIN '111111'
        And I got snackbar success
        Then I got push notification from that transaction

    @C173158
    Scenario: Check Push Notification Transaction Transaction Out Maker Approval RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
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
        Then I see loading proccess after input PIN
        And I was directed to Page "Transaksi sedang diproses"
        And I see loading page and button "x" on page "Transaksi sedang diproses"
        And I see page waiting for approval
        When Approver login to approve the transaction
        And Approver open request transaction that need approval
        And Approver accept the transaction
        And Approver input PIN '111111'
        And I got snackbar success
        Then I got push notification from that transaction

    @C173159
    Scenario: Check Push Notification Transaction Transaction Out Maker Approval SKN
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '15000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test SKN'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL and SKN
        When I choose transfer service SKN
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
        And I got snackbar success
        Then I got push notification from that transaction

    @C173160
    Scenario: Check Push Notification Transaction ransaction Out Maker Approval RTGS
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I validate page transfer
        And I input amount '100000001'
        And I choose category 'Pembayaran'
        And I input notes with 'Test RTGS'
        And I click choose bank transfer service
        And I am on Transfer methode list page
        Then I can see BIFAST, RTOL, SKN and RTGS
        When I choose transfer service RTGS
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
        And I got snackbar success
        Then I got push notification from that transaction
    
    @C173161
    Scenario: Redirection From Heads-Up Notification Transaction Out To Detail Transaction.
        Given I got push notification from transaction out
        When I open the notification from Heads-Up Notification
        Then I will directed to page detail transaction out

    @C173162
    Scenario: Redirection From Device Screen Notification Transaction Out To Detail Transaction.
        Given I am in device screen who has transaction out notification
        When I open the notification from device screen
        Then I will directed to page detail transaction out