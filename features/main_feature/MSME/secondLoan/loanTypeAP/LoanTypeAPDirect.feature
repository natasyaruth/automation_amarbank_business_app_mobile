Feature: Apply Either Loan and select the loan type
    As a customer lead
    I want to login Aplly loan and select the loan type AP Direct


    Background:
        Given I am a registered customer with following details
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
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        And I click button loan dashboard

    Scenario: User apply second loan AP direct and want to see AP loan schema
        Given I click button loan dashboard  
        #section select loan type
        When user click button "ajukan limit baru"
        And user select loan type "AP"
        #section wants to see loan schema
        And User click button Pelajari Tipe Skema Kredit
        And User click button Distributor Financing
        Then System will display Schema of Distributor Financing

    Scenario: user choose type loan AP Direct
        Given I click button loan dashboard
        When user click button "ajukan limit baru"
        And User select loan type "AP"
        And User on Loan Needs Page
        And User choose nominal "Rp50 juta - 5 Miliar"  
        And user input loan tenor "30" 
        And user click button Lanjut Isi Data Supplier
        And I fill a field "anchorName" with "PT. AP Direct 1"
        When I select industry type
        And I select the date cooperating
        And I fill a field "PICNameField" with "Budi"
        And I fill a field "PICNumberField" with "08123456789"
        And I will see checkbox Rights & Policy, T&C about loan and Privy
        And I click button Kirim Pengajuan Pinjaman
        And I should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        And I should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
        And user close the bottom sheet
        And I am on user on monitoring loan process page
        And I click button Upload Dokumen     
        And I upload document "npwpOfComp"
        And I upload document "proofOfPurchase"
        And I upload document "paymentMutation"
        And I upload document "financialReports"
        And I click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is approved

    
    Scenario: User AP validate Limit Loan Activation Approved
        Given I have been access history loan limit to see status "Dalam Proses"
        When I access menu bar limit with status "Dalam Proses"
        Then I select first list card loan approved
        And user validate status is approved
        And user validate content limit approved page

    Scenario: Validate Card Limit For Type Loan AP
        Given I have been on Loan Dashboard to see the loan type of Loan AP
        When I validate the card of "Loan AP"
        Then I should see the wording dan card design of "Loan AP"
        And user click button back
        And user should see text view "Selamat, Limit Pinjaman Telah Aktif" on bottom sheet "titleLimitPinjaman"
        And user should see text bottom sheet "Limit Tersedia" in field "titleLimitTersedia"
        And user should see text bottom sheet "Supplier" in field "titleSupplier"
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
        