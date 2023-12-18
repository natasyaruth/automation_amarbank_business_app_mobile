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
        And I will see my active, blocking and total amount
        When I mask my amount
        Then I will not see my active, blocking and total amount

    Scenario: Validate active amount, blocking amount and total amount with account individual recently accepted from CRM
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
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
            | userID   | auto7f34 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto7f34 |
            | password | 1234Test |
        And I click login
        And I click later
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