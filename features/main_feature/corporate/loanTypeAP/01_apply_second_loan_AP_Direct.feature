Feature: Apply Second Loan With Flagging Corporate Using AP Direct
 As a customer lead
 I want to apply second loan using AP Direct with flagging corp

 Background:
    Given I am a registered customer with foll
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

Scenario: User apply second loan AP Direct and want to see AP loan schema
    Given I click button loan dashboard  
    #section select loan type
    When user click button ajukan limit baru
    And user select loan type "AP"
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button Distributor Financing

Scenario: User validate dropdown list on nominal option
    Given I click button loan dashboard
    When user click button ajukan limit baru
    And User select loan type "AP"
    And User on Loan Needs Page
    And user click dropdown option
    Then user can validate limit for MSME
    And user can validate limit for Corp

Scenario: Validate Error meesage on Loan Needs when empty field
    Given user click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page   
    And user click button Lanjut Isi Data Distributor    
    Then user should see error message "Nominal limit kredit wajib diisi" in the field "errorAmountLoanField"
    And user should see error message "Tenor limit kredit wajib diisi" in the field "errorTenorLoanField"
    

  Scenario: Validate Error input nominal min Rp.50000000001
    Given user click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal below minimun nominal "13500000"
    And user click button Save
    Then user can see error message "Min Rp.5.000.000.001, Max Rp.25.000.000.000" in the field "errorAmountLoanField"
    
  Scenario: user clear the text input nominal
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal for Corp "13500000"
    Then user click button clear to delete all input nominal and back to zero    


 Scenario: User apply second loan AP Direct type with flagging Corporate
    Given I click button loan dashboard
    When user click button ajukan limit baru
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"
    And user click button Lanjut Isi Data Supplier 
    #section select Anchor
    And user click another anchor
    And user fill a field "anchorName" with "PT.ABCD"
    And user select industry type
    And user select the date cooperating
    And user fill a field "anchorAddress" with "Jl. Jalan Ke Pasar Minggu"
    #section supplier representatives has contact
    And user fill a field "PICNameField" with "Irvandy"
    And user fill a field "PICNumberField" with "081234567890"
    And user fill a field "PICEmailField" with "hartono@test.com"
    And user agree with the terms and condition    
    And user click button Kirim Pengajuan Pinjaman 
    ##sectionn buttom sheet success
    And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
    And user should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
    And user want to click button ok
    #section upload document
    And user click button Upload Dokumen
    And user on upload document page
    And user upload document "ktpNpwpOfComp"
    And user upload document "proofOfPurchase"
    And user upload document "paymentMutation"
    And user upload document "financialReports"
    And user click button refresh
    And user click back button to loan processing
    #section trigered status loan
    Then user trigered api change status loan is approved