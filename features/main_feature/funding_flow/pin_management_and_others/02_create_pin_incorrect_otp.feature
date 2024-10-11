# @regressionTest
Feature: User create PIN Journey Transfer Incorrect OTP
    In order to transfer
    As a customer
    I want to be able to create transaction pin

    # ATTENTION
    # please use user id with PIN still not created yet
    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
            | userID      | elka74a9 |
            | password    | Test1234 |
        When I filling in form login with the following details:
            | userIDstg   | elka74a9 |
            | passwordStg | Test1234 |
            | userID      | elka74a9 |
            | password    | Test1234 |
        And I click login
        And I click later in pop up biometric 
        Then I will direct to dashboard


    @C109110
    Scenario: User want to see their password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I click icon eye
        Then I will see my password

    @C109111
    Scenario: User don't want to see their password
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I click icon eye twice
        Then I will not see my password

    @C109112
    Scenario: User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new PIN with '111111'
        And I input incorrect old pin
        Then I will see message error "PIN yang dimasukkan tidak sesuai" in the below of field confirmation pin

    @C109113
    Scenario: User Successfully Get Email for OTP and input incorrect OTP
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new PIN with '111111'
        And I confirm my new PIN
        And I will receive email contain with OTP
        And I input incorrect OTP
        Then I will see message error "Kode verifikasi yang Anda masukkan salah" in the below of field otp code

    @C109114
    Scenario: User Successfully Get Email for OTP and input expired OTP
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I see pop up Create PIN
        And I click button Create PIN
        And I input password
        And I submit my password
        And I input new PIN with '111111'
        And I confirm my new PIN
        And I will receive email contain with OTP
        And I input expired OTP
        Then I will see message error "Kode verifikasi yang dimasukkan sudah kedaluwarsa" in the below of field otp code