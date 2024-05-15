Feature: Apply Second Loan With Flagging Corporate Using AR Anchor
 As a customer lead
 I want to apply second loan using AR Anchor with flagging corporate

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

Scenario: User apply second loan AR Anchor and want to see AR loan schema
    Given I click button loan dashboard  
    #section select loan type
    When user click button "ajukan limit baru"
    And user select loan type "AR"
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button Supplier Financing

Scenario: User validate dropdown list on nominal option
    Given I click button loan dashboard
    When user click button "ajukan limit baru"
    And User select loan type "AP"
    And User on Loan Needs Page
    And user click dropdown option
    Then user can validate limit for MSME
    And user can validate limit for Corp
    
 Scenario: User apply second loan AR anchor type with flagging Corporate
    Given I click button loan dashboard
    When user click button "ajukan limit baru"
    And User select loan type "AR"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Lanjut Isi Data Supplier 
    #section select Anchor    
    And user fill search anchor "PT Tirta Investama"
    And user select the date cooperating
    And user checklist checbox term and condition    
    And user click button kIirim Pengajuan Pinjaman    
    ##sectionn buttom sheet success
    And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
    And user should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
    And user want to click button ok
    #section upload document
    Given user click button Upload Dokumen
    And user on upload document page
    When user upload document "ktpNpwpOfComp"
    Then user upload document "proofOfPurchase"
    And user upload document "paymentMutation"
    And user upload document "financialReports"
    And user click button refresh
    And user click back button to loan processing
    #section trigered status loan
    And user trigered api change status loan is approved