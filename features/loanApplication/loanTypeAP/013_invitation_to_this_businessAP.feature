Feature: Submit Loan Type AP Status is Approved
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

    Scenario: Validate Invitation to This Business For Type Loan AP
                Given I have been on the Business Loan Dashboard to see the loan types from AP Loans
                When user should see text view title card "Selamat!" on field card "titleInvitationBusiness01"
                And user should see text view title card "Anda diundang untuk pengajuan pinjaman bisnis melalui Amar Bank Bisnis" on field card "titleInvitationBusiness02"
                Then user should see element text view card "AP"
                And user click button scheme loan
                And user validate wording loan type "AP"
                And user click back to invitation page
                And user click button accept offer

    Scenario: User successfully fills in data confirmation AP to this
                Given I have been on the Business Loan Dashboard to see the loan types from AP Loans
                And user click button accept offer
                Given user on confirmation page
                And user fill a field "PICNameField" with "Budi"
                And user fill a field "PICNumberField" with "08123456789"
                And user click checkbox tnc
                And user validate wording tnc
                And user click button next on invitation business page
                And user click back to invitation page

    Scenario: User validate error field on data confirmation AP to this
                Given I have been on the Business Loan Dashboard to see the loan types from AP Loans
                Then user click button next 
                And user should see error field "Nama perwakilan wajib diisi" in the below of field "textErrorBusinessPic"
                And user should see error field "Nomor perwakilan wajib diisi" in the below of field "textErrorBusinessPicNumber"