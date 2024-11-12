# @regressionTest
Feature: AUTOMATED User create PIN from other menu Incorrect OTP
    In order to transfer
    As a customer
    I want to be able to create transcation pin from menu other

    Background: AUTOMATED User has Login App
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
        And I click login
        # And I click later in pop up biometric
        Then I will direct to dashboard

    @C164120
    Scenario: AUTOMATED User want to see their password From Other Menu
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I will directly to Create New PIN page
        And I input password
        And I click icon eye
        Then I will see my password

    @C164121
    Scenario: AUTOMATED User don't want to see their password From Other Menu
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I will directly to Create New PIN page
        And I input password
        And I click icon eye twice
        Then I will not see my password

    @C164122
    Scenario: AUTOMATED User input incorrect confirmation PIN From Other Menu
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I will directly to Create New PIN page
        And I input password
        And I submit my password
        And I input new PIN with "111111"
        And I input incorrect old pin
        Then I will see message error "PIN yang dimasukkan tidak sesuai" in the below of field confirmation pin

    # @C164123
    Scenario: AUTOMATED User input incorrect OTP From Other Menu
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I will directly to Create New PIN page
        And I input password
        And I submit my password
        And I input new PIN with "111111"
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input incorrect OTP
        Then I will see message error "Kode verifikasi yang Anda masukkan salah" in the below of field otp code

    @C164124
    Scenario: AUTOMATED User Successfully Get Email for OTP and input expired OTP From Other Menu
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        And I go to page other
        And I click create transaction pin
        And I will directly to Create New PIN page
        And I input password
        And I submit my password
        And I input new PIN with '111111'
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input expired OTP
        Then I will see message error "Kode verifikasi yang dimasukkan sudah kedaluwarsa" in the below of field otp code
    
    @C164125
    Scenario: AUTOMATED User Successfully Create New PIN From Other Menu
        Given I am a customer who wants to create PIN from menu other
        When I choose other
        Then I go to page other
        And I click create transaction pin
        And I will directly to Create New PIN page
        And I input password
        And I submit my password
        And I input new PIN with '111111'
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input OTP
        Then My PIN successfully created