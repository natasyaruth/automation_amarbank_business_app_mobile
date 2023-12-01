# @LoanApp
Feature: Apply Either Loan and select the loan type
    As a customer lead
    I want to login Aplly loan and select the loan type


    Background:
        Given I am a registered customer with following details:
            | userID   | bots2912  |
            | password | TestSmb123 |
        When I filling in form login with the following details:
            | userID   | bots2912  |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        And I click button loan dashboard

    # @C83802 @LoanApp
    Scenario: validate content on select either apply for loan
        Given user on onboarding loan
        And user should see field title onboarding
        # When user validate benefit "first"
        # And user validate benefit "two"
        # And user validate benefit "three"
        And user validate content loan requirement
        Then user click button ajukan pinjaman
        And user on loan type page

    # @C83804 @LoanApp
    Scenario: user validate and select loan type AR
        Given user on onboarding loan
        And user click button ajukan pinjaman
        And user on loan type page
        And user validate wording loan type "AR"
        When user select loan type "AR"
        Then user click button lihat skema pinjaman
        And user on loan schema "AR"
        And user validate content loan schema "AR"
        And user click back to loan type page

    # @C83804 @LoanApp
    Scenario: user validate and select loan type PO
        Given user on onboarding loan
        And user click button ajukan pinjaman
        And user on loan type page
        And user validate wording loan type "PO"
        When user select loan type "PO"
        Then user click button lihat skema pinjaman
        And user on loan schema "PO"
        And user validate content loan schema "PO"
        And user click back to loan type page

    # @C83804 @LoanApp
    Scenario: user validate and select loan type AP
        Given user on onboarding loan
        And user click button ajukan pinjaman
        Given user on loan type page
        And user validate wording loan type "AP"
        When user select loan type "AP"
        Then user click button lihat skema pinjaman
        And user on loan schema "AP"
        And user validate content loan schema "AP"
        And user click button select the schema