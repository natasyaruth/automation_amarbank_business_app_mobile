Feature: Apply Either Loan and select the loan type
    As a customer lead
    I want to login Aplly loan and select the loan type AR Anchor


    Background:
        Given I am a registered customer with following details:
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

Scenario: User apply second loan AR Anchor and want to see AP loan schema
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
    And user click button Lanjut Isi Data Buyer   
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

Scenario: Validate error input tenor more than 180 hari 
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Rp50 juta - 5 Miliar"       
    And user input tenor "1"
    And user click button Lanjut Isi Data Buyer
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

    Scenario: User apply second loan AR Anchor type with flagging MSME
        Given I click button loan dashboard
        When user click button "ajukan limit baru"
        And User select loan type "AR"
        And User on Loan Needs Page
        And User choose nominal "Rp50 juta - 5 Miliar"  
        And user input loan tenor "30" 
        And user click button Lanjut Isi Data Buyer 
        #section select Anchor
        And user on buyer cooperating page
        And user select one of supplier list
        And user select the date cooperating
        And user checklist checbox term and condition
        And user checklist checbox privy
        And user click button kIirim Pengajuan Pinjaman     
        #sectionn buttom sheet success
        And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        When user should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
        And user want to click button ok
        # section upload document
        Given user click button Upload Dokumen
        And user on upload document page
        When user upload document "ktpNpwpOfComp"
        Then user upload document "proofOfPurchase"
        And user upload document "paymentMutation"
        And user upload document "financialReports"
        And user click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is approved

    Scenario: Validate Card Limit For Type Loan AR
        Given I have been on Loan Dashboard to see the loan type of Loan AP
        When I validate the card of "Loan AR"
        Then I should see the wording dan card design of "Loan AP"
        And user click button back
        And user should see text view "Selamat, Limit Pinjaman Telah Aktif" on bottom sheet "titleLimitPinjaman"
        And user should see text bottom sheet "Limit Tersedia" in field "titleLimitTersedia"
        And user should see text bottom sheet "Supplier" in field "titleSupplier"
        And user should see text bottom sheet "No. Pinjaman" in field "titleNoPinjaman"
        And user click button copy
        And user should see text bottom sheet "Informasi Tambahan" in field "titleInformasiTambahan"
        And user click button lihat pinjaman