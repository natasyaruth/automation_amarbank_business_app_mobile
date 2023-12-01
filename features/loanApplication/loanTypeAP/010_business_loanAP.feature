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
        Then I successed go to dashbord

    Scenario: Validate Business Loan For Type Loan AP
        Given I have been on the Business Loan Dashboard to see the loan types from AP Loans
        When I validate the card of "Loan AP"
        Then I should see the wording dan card design of "Loan AP"
        And user should see text view "Pinjaman Bisnis" on bottom sheet "titlePinjamanBisnis"
        And user should see text bottom sheet "Sisa Limit Pinjaman" in field "titleSisaLimitPinjaman"
        And user click button Gunakan Limit