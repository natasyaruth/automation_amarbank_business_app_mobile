Feature: Invitation To One Business LoanType AR
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

    Scenario: Validate Invitation to one This Business For Type Loan AR
                Given I have been on the Business Loan Dashboard to see the loan types from AR Loans
                When user should see text view title card "Selamat!" on field card "titleInvitationBusiness01"
                And user should see text view title card "Anda diundang untuk pengajuan pinjaman bisnis melalui Amar Bank Bisnis" on field card "titleInvitationBusiness02"
                Then user should see element text view card "AR"
                And user click button scheme loan
                And user validate wording loan type "AR"
                And user click back to invitation page
                And user click button accept offer

    Scenario: User successfully fills in data confirmation AR to 1
                Given I have been on the Business Loan Dashboard to see the loan types from AR Loans
                And user click button accept offer
                Given user on confirmation page
                And user fill a field "BusinessName" with "PT Avil Group Indonesia"
                When user select business type
                And user fill a field "RepresentativeName" with "Albert"
                And user fill a field "RepresentativeNameNumber" with "81212341234"
                And user click business start date
                And user click Work start date
                And user click button next on invitation business page
                And user click back to invitation page

    Scenario: User validate error field on data confirmation AR to 1
                Given I have been on the Business Loan Dashboard to see the loan types from AR Loans
                Then user click button next 
                And user should see error field "Nama bisnis wajib diisi" in the below of field "textErrorBusinessName"
                And user should see error field "Nama perwakilan wajib diisi" in the below of field "textErrorBusinessPic"
                And user should see error field "Nomor perwakilan wajib diisi" in the below of field "textErrorBusinessPicNumber"             

    Scenario: User validate error field on reason AR to 1
                Given I have been on the Business Loan Dashboard to see the loan types from AR Loans 
                Then user click button accept offer  
                And user fill a field "ReasonNotApproved" with "Tulis disini..."
                And user should see error field "Alasan wajib diisi" in the below of field "textErrorReason"
                And user click button send reason

    Scenario: User validate internet connection lost AR to 1
                Given I have been on the Business Loan Dashboard to see the loan types from AR Loans 
                And user see no connection
                And user click button try again
                And user click back to invitation page