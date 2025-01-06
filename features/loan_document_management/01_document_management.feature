
Feature: Centralize Invoice Disbursement on Brankas
    As a customer,
    I want to check the documents in the brankas
    so that I can check the naming of folders and files and the storage structure of documents

    Scenario: Close page onboarding brankas
        Given I am a registered customer with following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I close activated my biometric via document
        Then I wait for 5 seconds

    
    Scenario: Input password then delete
        Given I am a registered customer with following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I input password document
        And I will see button see document is enabled
        And I clear my password
        Then I will see button see document is disabled 
        Then I wait for 5 seconds

    
    Scenario: can not open brankas when user has not facility active 
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button nanti saja
        When I click tab brankas
        Then I should see notification to apply loan
    
    Scenario: verifying the naming of the facility folder and file document, when user has more than one active facility
        Given I am a registered customer with following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I input password document
        And I will see button see document is enabled
        And I click see my document
        And I will direct to page document brankas
        Then I click document pinjaman
        When I verifying the naming folder loan when has more than one active facility
        And I click folder facility
        Then I should see file document facility
        
    
    Scenario: verifying the naming of the disbursement folder and file document, when user has an active disbursement
        Given I am a registered customer with following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I input password document
        And I will see button see document is enabled
        And I click see my document
        And I will direct to page document brankas
        Then I click document pinjaman
        When I verifying the naming folder loan when has more than one active facility
        And I click folder facility
        Then I should see file document facility 
        When I click folder disbursement
        Then I should see file document disbursement
        
    Scenario: verifying the naming of the facility folder and file document , when user has one active facility
        Given I am a registered customer with following details:
            | userID      | smblae83 |
            | password    | Test1234 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | smblae83 |
            | password    | Test1234 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I input password document
        And I will see button see document is enabled
        And I click see my document
        And I will direct to page document brankas
        Then I click document pinjaman
        When I should see document facility when has one facility

    Scenario: download file facility document
        Given I am a registered customer with following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I input password document
        And I will see button see document is enabled
        And I click see my document
        And I will direct to page document brankas
        Then I click document pinjaman
        When I verifying the naming folder loan when has more than one active facility
        And I click folder facility
        Then I should see file document facility
        When I click document 
        And I click icon donwload 
        
    
    Scenario: download file disbursement document
        Given I am a registered customer with following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I input password document
        And I will see button see document is enabled
        And I click see my document
        And I will direct to page document brankas
        Then I click document pinjaman
        When I verifying the naming folder loan when has more than one active facility
        And I click folder facility
        Then I should see file document facility
        When I click folder disbursement
        Then I should see file document disbursement
        When I click document 
        And I click icon donwload 
        
    @brankas
     Scenario: close bottom sheet download file document
        Given I am a registered customer with following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | cvpe98d6 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click tab brankas
        And I input password document
        And I will see button see document is enabled
        And I click see my document
        And I will direct to page document brankas
        Then I click document pinjaman
        When I verifying the naming folder loan when has more than one active facility
        And I click folder facility
        Then I should see file document facility
        When I click document 
        And I close bottom sheet download document
        Then I wait for 10 seconds



        
        
        
        
        