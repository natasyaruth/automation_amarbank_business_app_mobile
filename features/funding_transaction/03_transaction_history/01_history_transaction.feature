@HistoryTrx
Feature: Home - History Transaction
    In home
    As a customer
    I need to see detail history transaction

    @C96150
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

    @C96151
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

    @C124821
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

    @C124824
    Scenario: Validate item bucketlist transfer in
        Given I am a registered customer with following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I see tab filter all transaction, inbound transaction and outbound transaction
        When I want to click list transfer "in"
        Then I will direct to list transfer in
        And I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction
        And I click detail card history transaction

    @C124825
    Scenario: Validate item bucketlist transfer out
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I see tab filter all transaction, inbound transaction and outbound transaction
        When I want to click list transfer "out"
        Then I will direct to list transfer out
        And I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction
        And admin fee information from transaction transfer
        And I click detail card history transaction

    @C124826
    Scenario: Validate detail transfer out RTGS
        Given I am a registered customer with following details:
            | userID      | deved35f |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deved35f |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "RTGS" without approval
        Then I will see detail transaction transfer out "RTGS" without approval
        And I close page detail history transaction

    @C124827
    Scenario: Validate detail transfer out RTGS with approval transaction
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
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "RTGS" with approval
        Then I will see detail transaction transfer out "RTGS" with approval
        And I close page detail history transaction

    @C124828
    Scenario: Validate detail transfer out SKN
        Given I am a registered customer with following details:
            | userID      | deveb316 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveb316 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "SKN" without approval
        Then I will see detail transaction transfer out "SKN" without approval
        And I close page detail history transaction

    @C124829
    Scenario: Validate detail transfer out SKN with approval transaction
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "SKN" with approval
        Then I will see detail transaction transfer out "SKN" with approval
        And I close page detail history transaction

    @C124830
    Scenario: Validate detail transfer out BIFAST
        Given I am a registered customer with following details:
            | userID      | deve9372 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve9372 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "BIFAST" without approval
        Then I will see detail transaction transfer out "BIFAST" without approval
        And I close page detail history transaction

    @C124831
    Scenario: Validate detail transfer out BIFAST with approval transaction
        Given I am a registered customer with following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "BIFAST" with approval
        Then I will see detail transaction transfer out "BIFAST" with approval
        And I close page detail history transaction

    @C124832
    Scenario: Validate detail transfer out RTOL
        Given I am a registered customer with following details:
            | userID      | devecfb5 |
            | password    | 1234Test |
            | userIDstg   | stag4400 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | devecfb5 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "RTOL" without approval
        Then I will see detail transaction transfer out "RTOL" without approval
        And I close page detail history transaction

    @C124833
    Scenario: Validate detail transfer out RTOL with approval transaction
        Given I am a registered customer with following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | stag4400 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "RTOL" with approval
        Then I will see detail transaction transfer out "RTOL" with approval
        And I close page detail history transaction

    @C124834
    Scenario: Validate detail transfer out Overbooking
        Given I am a registered customer with following details:
            | userID      | deve7b18 |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve7b18 |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "Overbooking" without approval
        Then I will see detail transaction transfer out "Overbooking" without approval
        And I close page detail history transaction

    @C124835
    Scenario: Validate detail transfer out Overbooking with approval transaction to other bank
        Given I am a registered customer with following details:
            | userID      | deve1a6f |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve1a6f |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "out"
        And I click detail card transaction transfer out "Overbooking" with approval
        Then I will see detail transaction transfer out "Overbooking" with approval
        And I close page detail history transaction

    @C124836
    Scenario: Validate detail transfer in RTOL
        Given I am a registered customer with following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | stag4400 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | stag4400 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "in"
        And I click detail card transaction transfer in "RTOL"
        Then I will see detail transaction transfer in "RTOL"
        And I close page detail history transaction

    @C124837
    Scenario: Validate detail transfer in BI-FAST
        Given I am a registered customer with following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "in"
        And I click detail card transaction transfer in "BIFAST"
        Then I will see detail transaction transfer in "BIFAST"
        And I close page detail history transaction

    @C124840
    Scenario: Validate detail transfer in overbooking
        Given I am a registered customer with following details:
            | userID      | deve1a6f |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve1a6f |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer "in"
        And I click detail card transaction transfer in "Overbooking"
        Then I will see detail transaction transfer in "Overbooking"
        And I close page detail history transaction

    @C124841
    Scenario: Validate detail transfer out with notes
        Given I am a registered customer with following details:
            | userID      | deve5e3a |
            | password    | 1234Test |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve5e3a |
            | password    | 1234Test |
            | userIDstg   | stag2add |
            | passwordStg | Test1234 |
        And I click login
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '1000000'
        And I choose category 'Pembayaran'
        And I input notes with 'Testing History Transaction'
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
        And I click detail latest card history transaction
        Then I will see notes in detail history transaction

    @C124843
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

    @C124844
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

    @C124845
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

    @C124846
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

    @C124847
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