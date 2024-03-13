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
        And I click button loan dashboard

    @emes1
    Scenario: User apply second loan AP direct type with flagging MSME
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
        When user select loan type "AP"
        And user click button lihat skema pinjaman AP
        And user click button select the schema
        #section select Anchor
        When user on buyer cooperating page
        And user select another supplier
        And user fill a field "anchorName" with "UD Combo Box Fire"
        And user select industry type
        And user select the date cooperating
        And user input business address
        #section supplier representatives has contact
        And user input supplier representatives name
        And user input contact name
        And user input email address supplier
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
        When user upload document "3contohInvoicewithSupplier"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is approved