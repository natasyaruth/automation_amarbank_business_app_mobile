Feature: Apply Second Loan With Flagging MSME Using PO Direct
    As a customer lead
    I want to apply second loan using PO Direct with MSME has flag

    Background:
        Given I am a registered customer with followng details:
            | userID      | yahyde6f |
            | password    | Akuntes1 |
            | userIDstg   | bots2643 |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | yahyde6f |
            | password    | Akuntes1 |
            | userIDstg   | bots2643 |
            | passwordStg | Test1234 |
        And I click login
        Then I successed go to dashbord

    Scenario: User apply first loan PO and want to see PO loan schema
       Given I click button loan dashboard  
        #section select loan type
        When user click button ajukan pinjaman    
        #section wants to see loan schema
        And User click button Pelajari Tipe Skema Kredit
        And User click button Supplier Financing
        Then System will display Schema of Supplier Financing


    Scenario: Validate error input tenor below min 30 hari 
        Given I click button loan dashboard
        When user click button ajukan pinjaman
        And User select loan type "AP"
        And user on select loan Needs Page 
        And User choose nominal "Rp50 juta - 5 Miliar"       
        And user input tenor "1"
        And user click button Lanjut Isi Data Bouwheer    
        Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

    Scenario: Validate error input tenor more than 180 hari 
        Given I click button loan dashboard
        When user click button ajukan pinjaman
        And User select loan type "AP"
        And user on select loan Needs Page 
        And User choose nominal "Rp50 juta - 5 Miliar"       
        And user input tenor "1"
        And user click button Lanjut Isi Data Bouwheer
        Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

    Scenario: User apply second loan PO direct type with flagging MSME
        Given I click button loan dashboard
        When user click button "ajukan limit baru"
        And User select loan type "AP"
        And User on Loan Needs Page
        And User on nominal "Rp50 juta - 5 Miliar"
        And user input loan tenor "30" 
        And user click button Lanjut Isi Data Bouwheer
        #section select Anchor
        When user on buyer cooperating page
        And user fill a field "BowheerName" with "Po Test Nurul"
        And user select industry type
        And user select the date cooperating
        And user checklist checbox term and condition
        And user checklist checbox privy
        And user click button Kirim Pengajuan Pinjaman
        # section upload document
        Given user on upload document page
        When user upload document "3contohInvoicewithBuyer"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is approved

    Scenario: Validate Card Limit For Type Loan AP
        Given I have been on Loan Dashboard to see the loan type of Loan AP
        When I validate the card of "Loan AP"
        Then I should see the wording dan card design of "Loan AP"
        And user click button back
        And user should see text view "Selamat, Limit Pinjaman Telah Aktif" on bottom sheet "titleLimitPinjaman"
        And user should see text bottom sheet "Limit Tersedia" in field "titleLimitTersedia"
        And user should see text bottom sheet "Bouwheer" in field "titleSupplier"
        And user should see text bottom sheet "No. Pinjaman" in field "titleNoPinjaman"
        And user click button copy
        And user should see text bottom sheet "Informasi Tambahan" in field "titleInformasiTambahan"
        And user click button lihat pinjaman

    Scenario: Verify bottom sheet Loan Schema
        Given I click button loan dashboard
        #section select loan type
        When user click button ajukan pinjaman
        #section wants to see loan schema
        And User click button Pelajari Tipe Skema Kredit
        Then user will see Distributor Financing
        And user will see Supplier Financing
        And user will see Project Financing
        Then use can click close button and back to type loan page