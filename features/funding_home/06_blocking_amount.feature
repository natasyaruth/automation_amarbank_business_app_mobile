
Feature: Blocking amount
    In order to detail amount of customer
    As a customer
    I want to see my amount divided into active amount, blocking amount and total amount
    So that I'm not confused with my information amount

    @C109210
    Scenario: Back to main dashboard from page detail account giro amount
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will see card account 'active'
        And I wait until my account name displayed
        When I click detail amount
        And I click button back in the header page
        Then I will see card account 'active'

    @C109211
    Scenario: Mask/Unmask amount in main dashboard
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        And I will see my active, blocking and total amount
        When I mask my amount
        Then I will not see my active, blocking and total amount

    @C109214
    Scenario: Validate active amount, blocking amount and total amount after transfer using account individual active
        Given I am a registered customer with following details:
            | userID      | auto20bf |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | auto20bf |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        And I will see my active, blocking and total amount
        When I choose menu Transfer from main dashboard
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        Then I will see my active amount decreased
        And my blocking amount still Rp. 500.000
        And my total amount decreased
        And I click detail amount
        And I will see my active amount detail decreased
        And my blocking amount detail still Rp. 500.000
        And my total amount detail decreased

    @C109215
    Scenario: Validate active amount, blocking amount and total amount after transfer using account business active
        Given I am a registered customer with following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        And I will see my active, blocking and total amount
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        Then I will see my active amount decreased
        And my blocking amount still Rp. 1.000.000
        And my total amount decreased
        And I click detail amount
        And I will see my active amount detail decreased
        And my blocking amount detail still Rp. 1.000.000
        And my total amount detail decreased

    @C101664
    Scenario: Validate Wording blocking amount with account has Loan and product type MSME
        Given I am a registered customer with following details:
            | userID      | trys5524 |
            | password    | Eca12345 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | trys5524 |
            | password    | Eca12345 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee
        And I will see information 'Total Biaya Bunga Pinjaman' in the below of field blocking amount

    @C111540
    Scenario: Validate Wording blocking amount with account has Loan and product type CORP
        Given I am a registered customer with following details:
            | userID      | niza2098 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | niza2098 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee and minimum amount
        And I will see information 'Saldo Minimum + Total Biaya Bunga Pinjaman' in the below of field blocking amount

    @C111541
    Scenario: Validate Wording blocking amount with account hasn’t Loan and product type MSME
        Given I am a registered customer with following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        When I see my blocking amount is Rp 0
        And I click detail amount
        Then I will see detail blocking amount coming from loan fee
        And I will not see information 'Total Biaya Bunga Pinjaman' in the below of field blocking amount

    @C111542
    Scenario: Validate Wording blocking amount with account hasn’t Loan and product type CORP
        Given I am a registered customer with following details:
            | userID      | alfibd3e |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | alfibd3e |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        When I see my blocking amount coming from minimum amount
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee and minimum amount
        And I will not see information 'Saldo Minimum + Total Biaya Bunga Pinjaman' in the below of field blocking amount

    Scenario: Validate Wording blocking amount with account hasn’t Loan, but has pending transaction and product type MSME
        Given I am a registered customer with following details:
            | userID      | mike1eb6 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | mike1eb6 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        And I click detail amount
        Then I will see detail blocking amount coming from loan fee
        And I will see information 'Transaksi yang belum disetujui' in the below of field blocking amount

    Scenario: Validate Wording blocking amount with account hasn’t Loan, but has pending transaction and product type CORP
        Given I am a registered customer with following details:
            | userID      | deve2c69 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve2c69 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee and minimum amount
        And I will see information 'Saldo Minimum + Transaksi yang belum disetujui' in the below of field blocking amount

    @blocking_amount
    Scenario: Validate Wording blocking amount with account has loan, has pending transaction and product type MSME
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        And I click detail amount
        Then I will see detail blocking amount coming from loan fee
        And I will see information 'Total Biaya Bunga Pinjaman + Transaksi yang belum disetujui' in the below of field blocking amount

    Scenario: Validate Wording blocking amount with account has loan, has pending transaction and product type CORP
        Given I am a registered customer with following details:
            | userID      | alfibd3e |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | alfibd3e |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I wait until my account name displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee and minimum amount
        And I will see information 'Saldo Minimum + Total Biaya Bunga Pinjaman + Transaksi yang belum disetujui' in the below of field blocking amount    