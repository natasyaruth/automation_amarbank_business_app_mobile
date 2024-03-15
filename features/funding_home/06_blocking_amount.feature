@blocking_amount
Feature: Blocking amount
    In order to detail amount of customer
    As a customer
    I want to see my amount divided into active amount, blocking amount and total amount
    So that I'm not confused with my information amount

    Scenario: Back to main dashboard from page detail account giro amount
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        And I wait until my account name 'NADYA LAROSA' displayed
        When I click detail amount
        And I click button back in the header page
        Then I will see card account 'active'

    Scenario: Mask/Unmask amount in main dashboard
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'NADYA LAROSA' displayed
        And I will see my active, blocking and total amount
        When I mask my amount
        Then I will not see my active, blocking and total amount

    Scenario: Validate active amount, blocking amount and total amount with account individual recently accepted from CRM
        Given I am a registered customer with following details:
            | userID   | auto54a9 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto54a9 |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'NADYA LAROSA' displayed
        Then I will see my active, blocking and total amount are Rp 0
        And I click detail amount
        Then I will see my detail active, blocking and total amount are Rp 0

    Scenario: Validate active amount, blocking amount and total amount with account business recently accepted from CRM
        Given I am a registered customer with following details:
            | userID   | autod015 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autod015 |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'Automation Jangan Dipake' displayed
        Then I will see my active, blocking and total amount are Rp 0
        And I click detail amount
        Then I will see my detail active, blocking and total amount are Rp 0

    Scenario: Validate active amount, blocking amount and total amount after transfer using account individual active
        Given I am a registered customer with following details:
            | userID   | auto20bf |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto20bf |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'NADYA LAROSA' displayed
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
        And my total amount increased
        And I click detail amount
        And I will see my active amount detail decreased
        And my blocking amount detail still Rp. 500.000
        And my total amount detail increased

    Scenario: Validate active amount, blocking amount and total amount after transfer using account business active
        Given I am a registered customer with following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'PT PERORANGAN INTEGRATE DUA PULUH' displayed
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
        And my total amount increased
        And I click detail amount
        And I will see my active amount detail decreased
        And my blocking amount detail still Rp. 1.000.000
        And my total amount detail increased

    Scenario: Validate Wording blocking amount with account has Loan and product type MSME
        Given I am a registered customer with following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'PT PERORANGAN INTEGRATE DUA PULUH' displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee
        And I will see information 'Total Biaya Bunga Pinjaman' in the below of field blocking amount

    Scenario: Validate Wording blocking amount with account has Loan and product type CORP
        Given I am a registered customer with following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'PT PERORANGAN INTEGRATE DUA PULUH' displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee and minimum amount
        And I will see information 'Saldo Minimum + Total Biaya Bunga Pinjaman' in the below of field blocking amount

    Scenario: Validate Wording blocking amount with account hasn’t Loan and product type MSME
        Given I am a registered customer with following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'PT PERORANGAN INTEGRATE DUA PULUH' displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee
        And I will not see information 'Total Biaya Bunga Pinjaman' in the below of field blocking amount

    Scenario: Validate Wording blocking amount with account hasn’t Loan and product type CORP
        Given I am a registered customer with following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ptpe5040 |
            | password | 1234Test |
        And I click login
        And I click later
        And I wait until my account name 'PT PERORANGAN INTEGRATE DUA PULUH' displayed
        When I click detail amount
        Then I will see detail blocking amount coming from loan fee and minimum amount
        And I will not see information 'Saldo Minimum + Total Biaya Bunga Pinjaman' in the below of field blocking amount