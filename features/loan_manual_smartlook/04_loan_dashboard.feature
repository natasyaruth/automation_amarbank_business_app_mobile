Feature: Loan Dashboard for recording in smartlook
    In DSMB
    As a customer
    I need to validate recording from smartlook in loan dashboard

    @Sprint6Lending @C161780
    Scenario: Validate Loan Dashboard
        Given I have been login and start config smartlook
        When I click loan dashboard
        And I click the history button
        And I open all history such as limit or disbursement or repayment
        Then click stop record of smart look

    @Sprint6Lending @C161781
    Scenario: user validate additional detail after got record of smartlook dashboard
        Given user already stop record of smartlook
        When user go to smartlook
        And user play the record
        Then user will see smartlook record when open loan dashboard until history of smart
        And user will see user information details about "UserID", "UserEmail" and "UserName"