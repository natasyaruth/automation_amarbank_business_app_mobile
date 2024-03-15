Feature: Apply Second Loan With Flagging MSME Using AP Direct
    As a customer lead
    I want to apply second loan using AP Direct with MSME has flag

    Background:
        Given I am a registered customer with following details:
            | userID   | niza1356   |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | niza1356   |
            | password | Test1234 |
        And I click login
        Then I successed go to dashbord
        Then I click menu tab testing
        # And I click button loan dashboard

    @emes1
    Scenario: User apply second loan AP direct type with flagging MSME
        Given I click button loan dashboard
        #section input nominal
        When user click button apply new limit
        And user Input Nominal Pinjaman "4000000000"
        And user input loan tenor "30"
        And user click on button Selanjutnya
        And user on loan type page
        #section select schema loan type
        When user select loan type "AP"
        And user click button lihat skema pinjaman AP
        And user click button select the schema
        #section select Anchor
        And user click another anchor
        And user fill a field "anchorName" with "UD Combo Box Fire"
        And user select industry type
        And user select the date cooperating
        And user fill a field "anchorAddress" with "Jl. Jalan Ke Pasar Minggu"
        #section supplier representatives has contact
        And user swipe to supplier
        And user fill a field "PICNameField" with "Irvandy"
        And user fill a field "PICNumberField" with "081234567890"
        And user fill a field "PICEmailField" with "hartono@test.com"
        And user agree with the terms and condition
        And user allow to agree to use my digital signature through Privy.id
        When user click button Kirim Pengajuan Pinjaman
        ##sectionn buttom sheet success
        And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        When user should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
        And user want to click button ok
        # section upload document
        Given user click button Upload Dokumen
        And user on upload document page
        When user upload document "3contohInvoicewithSupplier"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is approved