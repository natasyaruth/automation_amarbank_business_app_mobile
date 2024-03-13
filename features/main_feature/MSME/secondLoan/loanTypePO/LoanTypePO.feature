Feature: Apply Second Loan With Flagging MSME Using PO Direct
    As a customer lead
    I want to apply second loan using PO Direct with MSME has flag

    Background:
        Given I am a registered customer with following details:
            # | userID   | bots2912   |
            # | password | TestSmb123 |
            | userID   | niza1356   |
            | password | Test1234 |
        When I filling in form login with the following details:
            # | userID   | bots2912   |
            # | password | TestSmb123 |
            | userID   | niza1356   |
            | password | Test1234 |
        And I click login
        Then I successed go to dashbord

    @emes8
    Scenario: User apply second loan PO direct type with flagging MSME
        Given I click button loan dashboard
        #section input nominal
        When user click button "ajukan limit baru"
        And user Input Nominal Pinjaman less than 5 billion
        And user input loan tenor
        And user click button "Selanjutnya"
        #section domicile office
        And user select domicile office
        And user click button "Selanjutnya" in page domicile office
        And user on loan type page
        #section select schema loan type
        When user select loan type "PO"
        And user click button lihat skema pinjaman PO
        And user click button select the schema
        #section select Anchor
        When user on buyer cooperating page
        And user fill a field "BowheerName"
        And user select industry type
        And user select the date cooperating
        And user checklist checbox term and condition
        And user checklist checbox privy
        When user click button next
        #section domicile office
        And user select domicile office
        And user click button "Selanjutnya" in page domicile office
        Then direct to "Selamat, Pengajuan Berhasil Dikirim"
        And user click OK
        # section upload document
        Given user on upload document page
        When user upload document "3contohInvoicewithBuyer"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is approved