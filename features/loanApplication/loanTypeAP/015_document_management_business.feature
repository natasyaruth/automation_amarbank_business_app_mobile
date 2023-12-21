@LoanApp
Feature: Submit Loan Type AP Status is Approved
    As a customer lead
    I want to submit loan and Approved by VP of bussiness

    Background:
        Given I am a registered customer with foll
            | userID   | botseb19   |
            | password | TestSmb123 |
        When I filling in form login with the foll
            | userID   | botseb19   |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        Then I successed go to dashboard

    @LoanApp
    Scenario: Document Management to Type Business For Type Loan AP
        Given I have been on the Business Loan Dashboard to see the loan types from AP Loan
        And user click menu tab profil 
        And user on profil page
        When user select dokumen bisnis
        Then user click button dokumen pinjaman
        And user on pilih no pinjaman page
        And user select pinjaman
        And user click button download
