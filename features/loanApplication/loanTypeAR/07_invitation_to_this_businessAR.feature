Feature: Submit Loan Type AR Status is Approved
    As a customer lead
    I want to submit loan and Approved by VP of bussiness

    Background:
        Given I am a registered customer with foll
            | userID   | botseb19  |
            | password | TestSmb123 |
        When I filling in form login with the foll
            | userID   | botseb19  |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        Then I successed go to dashbord

    Scenario: Validate Invitation to This Business For Type Loan AR
                Given I have been on the Business Loan Dashboard to see the loan types from AR Loans
                When user should see text view title card "Selamat!" on field card "titleInvitationBusiness01"
                And user should see text view title card "Anda diundang untuk pengajuan pinjaman bisnis melalui Amar Bank Bisnis" on field card "titleInvitationBusiness02"
                Then user should see element text view card "AR"
                And user click button scheme loan
                And user validate wording loan type "AR"
                And user click back to invitation page
                And user click button accept offer

    Scenario: User successfully fills in data confirmation AR
                Given I have been on the Business Loan Dashboard to see the loan types from AR Loans
                And user click button accept offer
                Given user on confirmation page
                And user fill a field "PICNameField" with "Budi"
                And user fill a field "PICNumberField" with "08123456789"
                And user click checkbox tnc
                And user validate wording tnc
                And user click button next on invitation business page
