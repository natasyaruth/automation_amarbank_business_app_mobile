@LoanTenor
Feature: Select the Loan Amount and Tenor
    As a customer lead
    I want to select Loan Amount and tenor

    Background:
        Given I am a registered customer with following details:
            | userID   | botseb19  |
            | password | TestSmb123 |
        When I filling in form login with the following details:
            | userID   | botseb19  |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        Then I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user on loan type page
        And user select loan type "AP"
        And user click button lihat skema pinjaman
        And user on loan schema "AP"
        And user click button select the schema
        And user on the anchor page
        And user click icon other anchor
        And user on anchor cooperating page
        And user fill a field "anchorName" with "UD Dagangan"
        And user select industry type
        And user select the date cooperating
        And user click button next

    @C83823 @LoanTenor
    Scenario: Validate Error Field on Select Loan Amount and Tenor Form
        Given user on select loan amount page
        When user click button next on select loan amount page
        Then user should see error "Minimal pinjaman Rp50.000.000 (50 Juta)" in the field "errorAmountLoanField"
        And user should see error "Tenor pinjaman wajib diisi" in the field "errorTenorLoanField"
        And user filling field "amountLoanField" with "6000000000"
        And user click button next on select loan amount page
        And user should see error "Maksimal pinjaman Rp5.000.000.000 (5 Miliar)" in the field "errorAmountLoanField"
        And user should see error "Setujui syarat dan ketentuan" in the field "agreetnc"

    @C83823 @LoanTenor
    Scenario: Success Select Loan Amount and Tenor
        Given user on select loan amount page
        When user filling field "amountLoanField" with "200000000"
        Then user select the tenor "1Month"
        And user click checkbox T&C on select loan amount page
        And user validate wording tnc
        And user click wording tnc
        And user click button next on select loan amount page
        And user on legality business page

    @C83824 @LoanTenor
    Scenario: Validate Error Field on legality business form
        Given user on select loan amount page
        And user filling field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click checkbox T&C on select loan amount page
        When user validate wording tnc
        And user click button next on select loan amount page
        Then user on legality business page
        And user click button next on legality business page
        And user should see error "Jenis legalitas bisnis wajib dipilih" in the field "errorBussTypeField"
        And user should see error "Tanggal usaha berdiri wajib diisi" in the field "errorDateEstablishField"

    @C83824 @LoanTenor
    Scenario: User success fill legality business form
        Given user on select loan amount page
        And user filling field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click checkbox T&C on select loan amount page
        And user validate wording tnc
        And user click button next on select loan amount page
        When user on legality business page
        And user select legality business type
        And user select business establishment date
        And user select the day date "Previous"
        And user select the month date "Previous"
        And user select the year date "Previous"
        Then user choose the date
        And user click button next on legality business page
        And user on head office location page

    @C83825 @LoanTenor
    Scenario: Validate Error Field on head office location
        Given user on select loan amount page
        And user filling field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click checkbox T&C on select loan amount page
        And user validate wording tnc
        And user click button next on select loan amount page
        When user on legality business page
        And user select legality business type
        And user select business establishment date
        And user select the day date "Previous"
        And user select the month date "Previous"
        And user select the year date "Previous"
        Then user choose the date
        And user click button next on legality business page
        Given user on head office location page
        And user select location others
        When user click button next on head office location page
        Then user should see error "Lokasi bisnis wajib diisi" in the field "errorBussLocationField"

    @C83825 @LoanTenor
    Scenario: Validate Loan Not available on business location
        Given user on select loan amount page
        And user filling field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click checkbox T&C on select loan amount page
        And user validate wording tnc
        And user click button next on select loan amount page
        When user on legality business page
        And user select legality business type
        And user select business establishment date
        And user select the day date "Previous"
        And user select the month date "Previous"
        And user select the year date "Previous"
        And user choose the date
        Then user click button next on legality business page
        And user on head office location page
        And user select location others
        And user filling field "bussLocationField" with "Medan"
        And user click button next on head office location page
        And user should see new page head office location not provided
        And user click close button

    @C83825 @LoanTenor
    Scenario: User Success Select Head Office Location
        Given user on select loan amount page
        And user filling field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click checkbox T&C on select loan amount page
        And user validate wording tnc
        And user click button next on select loan amount page
        When user on legality business page
        And user select legality business type
        And user select business establishment date
        And user select the day date "Previous"
        And user select the month date "Previous"
        And user select the year date "Previous"
        And user choose the date
        Then user click button next on legality business page
        And user on head office location page
        And user select location jabodetabek
        And user click button next on head office location page
        And user on success apply loan page

    @C83826 @LoanTenor
    Scenario: Validate Wording on Success Apply Loan Page
        Given user on select loan amount page
        And user filling field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click checkbox T&C on select loan amount page
        And user validate wording tnc
        And user click button next on select loan amount page
        When user on legality business page
        And user select legality business type
        And user select business establishment date
        And user select the day date "Previous"
        And user select the month date "Previous"
        And user select the year date "Previous"
        And user choose the date
        Then user click button next on legality business page
        And user on head office location page
        And user select location jabodetabek
        And user click button next on head office location page
        And user on success apply loan page
        And user validate text success apply loan "Selamat, Anda memenuhi syarat untuk melakukan pengajuan pinjaman" on field "titleSuccesApplyLoanField"
        And user validate text success apply loan "Untuk mempercepat proses pengajuan pinjaman, mohon melengkapi data" on field "subTitleSuccesApplyLoanField"
        And user validate information business need done
        And user validate information loan need done
        And user validate complete the data section
        And user click button continue complete the data
        And user on success complete the data page
