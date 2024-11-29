@HistoryTrx
Feature: Home - History Transaction
    In home
    As a customer
    I need to see detail history transaction

    @C136560   
    Scenario: User want click button filter
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click button filter history
        When I should see buttom sheet filter history
        Then I want to click button close

    @C136561
    Scenario: User want filtered history transaction
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click button filter history
        When I want to click button start date
        Then I should see form date displayed
        And I choose the start date "Previous" with tap "4"
        And I want to click button end date
        And I choose the end date
        And I want to click button ok

    @C136562
    Scenario: Validate page history transaction state empty
        Given I am a registered customer with following details:
            | userID      | deve8f59 |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | deve8f59 |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I want to click button history transaction
        Then I will redirect to history transaction page
        And I will see no transaction history
        And I will not see all tab to filter type transaction
        And I will not see button download e-statement

    @C136564
    Scenario: Validate item bucketlist transfer out
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag323d |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag323d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I see tab filter all transaction, inbound transaction and outbound transaction
        And I want to click list transfer "out"
        Then I will direct to list transfer out
        And I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction
        And admin fee information from transaction transfer
        And I click detail card history transaction

    @C136565
    Scenario: Validate detail transfer out RTGS
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '100000001'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click list transfer "out"
        And I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction
        And admin fee information from transaction transfer
        And I click detail card history transaction
        Then I will see detail transaction transfer out without approval
        And I close page detail history transaction

    @C136566
    Scenario: Validate detail transfer out RTGS with approval transaction
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And has partner with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '100000001'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I click back in header page
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will direct to page notification center
        And I click close in header page
        And I will see card account 'active'
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I click close in header page
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card history transaction
        Then I will see detail transaction transfer out with approval
        And I close page detail history transaction

    @C136567
    Scenario: Validate detail transfer out SKN
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service SKN
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click list transfer "out"
        And I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction
        And admin fee information from transaction transfer
        And I click detail card history transaction
        Then I will see detail transaction transfer out without approval
        And I close page detail history transaction

    @C136568
    Scenario: Validate detail transfer out SKN with approval transaction
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And has partner with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service SKN
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I click back in header page
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will direct to page notification center
        And I click close in header page
        And I will see card account 'active'
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I click close in header page
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card history transaction
        Then I will see detail transaction transfer out with approval
        And I close page detail history transaction

    @C136569
    Scenario: Validate detail transfer out BIFAST
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service BIFAST
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click list transfer "out"
        And I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction
        And admin fee information from transaction transfer
        And I click detail card history transaction
        Then I will see detail transaction transfer out without approval
        And I close page detail history transaction

    @C136570
    Scenario: Validate detail transfer out BIFAST with approval transaction
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And has partner with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service BIFAST
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I click back in header page
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will direct to page notification center
        And I click close in header page
        And I will see card account 'active'
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I click close in header page
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card history transaction
        Then I will see detail transaction transfer out with approval
        And I close page detail history transaction

    @C136571
    Scenario: Validate detail transfer out RTOL
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '100000001'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click list transfer "out"
        And I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction
        And admin fee information from transaction transfer
        And I click detail card history transaction
        Then I will see detail transaction transfer out without approval
        And I close page detail history transaction

    @C136572
    Scenario: Validate detail transfer out RTOL with approval transaction
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And has partner with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I click back in header page
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will direct to page notification center
        And I click close in header page
        And I will see card account 'active'
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I click close in header page
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card history transaction
        Then I will see detail transaction transfer out with approval
        And I close page detail history transaction
        And I close page detail history transaction

    @C136573
    Scenario: Validate detail transfer out Overbooking
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "Overbooking" without approval
        Then I will see detail transaction transfer out "Overbooking" without approval
        And I close page detail history transaction

    @C136574
    Scenario: Validate detail transfer out Overbooking with approval transaction to Amar bank
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And has partner with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I click back in header page
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will direct to page notification center
        And I click close in header page
        And I will see card account 'active'
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I click close in header page
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card history transaction
        Then I will see detail transaction transfer out with approval
        And I close page detail history transaction

    @C136578
    Scenario: Validate detail transfer out with notes
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I click login
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click list transfer "out"
        And I click detail latest card history transaction
        Then I will see notes in detail history transaction

    @C136579
    Scenario: Filter transaction history within a date where there is no transaction
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click button filter history
        And I fill start date transaction with condition there is no transaction
        And I fill end date transaction with condition there is no transaction
        And I want to click button ok
        Then I will see no transaction history
        And I see tab filter all transaction, inbound transaction and outbound transaction

    @C136580
    Scenario: Filter transaction with date is empty
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click button filter history
        And I fill start date history transaction
        And I fill end date history transaction
        And I click link reset history date
        And I will see field start and end date is empty
        And I want to click button ok
        Then I will redirect to history transaction page

    @C136581
    Scenario: Filter transaction history with end date less than start date
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I want to click button filter history
        When I fill start date more than end date
        Then I will see message error start date should be less than end date

    @C136582
    Scenario: Click button share receipt transaction history
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I click detail latest card history transaction
        And I click share receipt transaction
        Then I will see bottom sheet share history transaction

    @C136583
    Scenario: Back to main dashboard from page history transaction
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I click button back in the header page
        Then I will direct to dashboard