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