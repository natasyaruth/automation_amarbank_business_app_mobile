Feature: Dashboard Manual - Survey and Rating
    In order give feedback after register SMB Business App
    As a Customer
    I want to give rating and feedback

    @C160333
    Scenario: Checking survey account active in speadsheet
        Given I already give survey rating
        And survey is generated to spreadsheet
        When I check in spreadsheet
        Then I will see the survey rating

    @C160334
    Scenario: Checking survey account rejected in speadsheet
        Given I already give survey rating
        And survey is generated to spreadsheet
        When I check in spreadsheet
        Then I will see the survey rating

    @C160335
    Scenario: Checking survey account rejected initiator DHN in speadsheet
        Given I already give survey rating
        And survey is generated to spreadsheet
        When I check in spreadsheet
        Then I will see the survey rating

    @C160336
    Scenario: Checking survey account rejected invitee DHN in speadsheet
        Given I already give survey rating
        And survey is generated to spreadsheet
        When I check in spreadsheet
        Then I will see the survey rating

    @C160297
    Scenario: Give 5 rating account active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see pop up rating survey account opening
        And I give '5' ratings
        And I sent feedback survey
        Then I will see pop up rating in play store
        When I click button "Beri rating" di playstore
        Then I redirect to playstore
        And I give rating on playstore

    @C160298
    Scenario: Give 4 rating account active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see pop up rating survey account opening
        And I give '4' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will see card account 'active'

    @C160299
    Scenario: Give 3 rating account active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see pop up rating survey account opening
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will see card account 'active'

    @C160300
    Scenario: Give 2 rating account active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see pop up rating survey account opening
        And I give '2' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will see card account 'active'

    @C160301
    Scenario: Give 1 rating account active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see pop up rating survey account opening
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will see card account 'active'

    @C160307
    Scenario: Give rating less than 4 and then more than 4 account active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And still not fill survey rating account opening
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I will see pop up rating survey account opening
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I give '5' ratings
        And I will not see field text feedback survey
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I click later in pop up biometric
        And I will see card account 'active'

    @C160308
    Scenario: Give rating more than 4 and then less than 4 account active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And still not fill survey rating account opening
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I will see pop up rating survey account opening
        And I give '5' ratings
        And I will not see field text feedback survey
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I click later in pop up biometric
        And I will see card account 'active'        

    @C160894
    Scenario: Give rating both in iniator and invitee side account active case
        Given I am an initiator
        And I have other partner
        And we both haven't submitted teh CSAT survey
        When I submit my survey CSAT successfully
        And my partner login to app
        And my partner give survey CSAT 
        Then my partner will see message successfully submit feedback