@LoanApp
Feature: Apply Either Loan and select the loan type
    As a customer lead
    I want to login Aplly loan and select the loan type


    Background:
        Given I am registered customer with following details:
            | userID   | niza59ce  |
            | password | Feb042017 |
        When I am filling in my account information with the following details:
            | userID   | niza59ce  |
            | password | Feb042017 |
        And login with registered account
        Then I successed go to dashbord
        And I click button loan dashboard

    @C83802 @LoanApp
    Scenario: validate content on select either apply for loan
        Given user on onboarding loan
        And user should see field title onboarding
        When user validate benefit "first"
        And user validate benefit "two"
        And user validate benefit "three"
        And user validate content loan requirement
        Then user click button ajukan pinjaman
        And user on loan type page

    @C83804 @LoanApp
    Scenario: user validate and select loan type AR
        Given user on onboarding loan
        And user click button ajukan pinjaman
        And user on loan type page
        And user validate wording loan type "AR"
        When user select loan type "AR"
        # And user validate button lihat skema pinjaman is enable true
        Then user click button lihat skema pinjaman
        And user on loan schema "AR"
        And user validate content loan schema "AR"
        And user click back to loan type page

    @C83804 @LoanApp
    Scenario: user validate and select loan type PO
        Given user on onboarding loan
        And user click button ajukan pinjaman
        And user on loan type page
        And user validate wording loan type "PO"
        When user select loan type "PO"
        # And user validate button lihat skema pinjaman is enable true
        Then user click button lihat skema pinjaman
        And user on loan schema "PO"
        And user validate content loan schema "PO"
        And user click back to loan type page

    @C83804 @LoanApp
    Scenario: user validate and select loan type AP
        Given user on onboarding loan
        And user click button ajukan pinjaman
        Given user on loan type page
        And user validate wording loan type "AP"
        When user select loan type "AP"
        # Then user validate button lihat skema pinjaman is enable true
        Then user click button lihat skema pinjaman
        And user on loan schema "AP"
        And user validate content loan schema "AP"
        And user click button select the schema