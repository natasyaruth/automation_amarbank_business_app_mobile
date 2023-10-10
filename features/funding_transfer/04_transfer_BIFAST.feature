Feature: User transfer BIFAST
    In order to transfer
    As a customer
    I want to make transfer BIFAST


    Background: User has registered and login to dashboard
        Given I am a registered  customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        And I will direct to dashboard
        And I choose menu Transfer from main dashboard

    Scenario: User transfer detail with BI FAST
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input nominal 'Rp.55.000.000'
        And I choose category "Pembayaran"
        And I choose sub category "Pinjaman"
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        Then I can see BI Fast and RTOL
        And I choose transfer service 'BI FAST'

    Scenario: User confirmation transfer with BI FAST
        Given I am a customer who wants to Transfer and has friend list
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input nominal 'Rp.55.000.000'
        And I choose category "Pembayaran"
        And I choose sub category "Pinjaman"
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And I choose transer service 'BI FAST'
        And I click transfer
        Then I will directly go to page confirmation transfer

    Scenario: User successfully transfer
        When I search name 'Nurul Septariani' in friendlist
        And I choose the friendlist
        And I input nominal 'Rp.55.000.000'
        And I choose category "Pembayaran"
        And I choose category "Pinjaman"
        And I input notes with 'Pembayaran Pinjamanan bulan oktober'
        And I click choose bank transfer service
        And i choose transer service 'BI FAST'
        And I click transfer
        And I click transfer now
        And I input PIN
        Then I successfully transferred

