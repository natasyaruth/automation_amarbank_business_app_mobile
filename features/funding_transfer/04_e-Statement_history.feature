@eStatementTransaction
Feature: User open e-Statement History
    In order to e-Statement History
    As a customer
    I want to see e-Statement History

    @C131977
    Scenario: User open transaction history
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        Then I direct to history page
        And I will see the button e-Statement

    @C131978
    Scenario: Download e-Statement by the latest month
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I input valid password on field password
        And I click button "Next"
        Then The e-Statement downloaded
        And Receive notification email

    @C131979
    Scenario: Download e-Statement when e-Statement not exist
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        Then Notification e-Statement not exist will appear

    @C131980
    Scenario: Show alert bar when success download e-Statement
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I input valid password on field password
        And I click button "Next"
        Then Alert bar success will appear

    @C131981
    Scenario: Show alert bar when failed download e-Statement
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I input valid password on field password
        And I click button "Next"
        Then Alert bar failed will appear

    @C141433
    Scenario: Download e-statement with wrong password once
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I input invalid password on field password
        And I click button "Next"
        Then I should see pop up 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun' with button 'buttonTryeStatement'
        
    @C141434
    Scenario: Download e-statement with wrong password twice
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I input invalid password on field password
        And I click button "Next"
        Then I should see pop up 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun' with button 'buttonTryeStatement'
        And I click button "try again"
        And I input invalid password on field password
        And I click button "Next"
        Then I should see pop up 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun' with button 'buttonTryeStatement'
    
    @C141435
    Scenario: Download e-statement with wrong password third
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I input invalid password on field password
        And I click button "Next"
        Then I should see pop up 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun' with button 'tryAgain'
        And I click button "try again"
        And I input invalid password on field password
        And I click button "Next"
        Then I should see pop up 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun' with button 'tryAgain'
        And I click button "try again"
        And I input invalid password on field password
        And I click button "Next"
        Then I should see pop up 'Anda akan langsung diarahkan ke halaman Masuk Akun' with button 'understandButton'
        And I direct to login page

    @C141436
    Scenario: Download e-statement with empty password
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I click button "Next"
        Then I should see notification 'Password wajib diisi' in the below of field 'password'
        
    @C141437
    Scenario: User want to see password when download e-statement
        Given I am a registered customer with following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza7373 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        And I will direct to input password page
        And I input valid password on field password
        And I click eye icon on field password
        Then I should see password inputted 