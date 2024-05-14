Feature: Apply Second Loan With Flagging Corporate Using AR Direct
 As a customer lead
 I want to apply second loan using AR Direct with flagging corp

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
    Then I successed go to dashbord
    Then I click menu tab testing
    And I click button loan dashboard

Scenario: User apply second loan AR Direct and want to see AR loan schema
    Given I click button loan dashboard  
    #section select loan type
    When user click button "ajukan limit baru"
    And user select loan type "AP"
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button Supplier Financing

    @debt3
    Scenario: User apply second loan AR direct type with flagging Corporate
        Given I click button loan dashboard
         When user click button "ajukan limit baru"
        And User select loan type "AP"
        And User on Loan Needs Page
        And User choose nominal "Lebih dari 5 Milyar" 
        And user input nominal for Corp "15000000000"
         user click button Lanjut Isi Data Supplier 
        #section select Anchor
        And user click another anchor
        And user fill a field "anchorName" with "UD Combo Box Fire"
        And user select industry type
        And user select the date cooperating
        And user fill a field "anchorAddress" with "Jl. Jalan Ke Pasar Minggu"
        #section supplier representatives has contact
        And user fill a field "PICNameField" with "Irvandy"
        And user fill a field "PICNumberField" with "081234567890"
        And user fill a field "PICEmailField" with "hartono@test.com"
        And user agree with the terms and condition        
        When user click button Kirim Pengajuan Pinjaman
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