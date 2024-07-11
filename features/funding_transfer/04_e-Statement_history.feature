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
        Then Alert bar failed will appear