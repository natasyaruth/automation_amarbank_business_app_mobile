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


Scenario: Verify bottom sheet Loan Schema
    Given I click button loan dashboard
    #section select loan type
    When user click button ajukan pinjaman
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page


Scenario: User apply second loan AR Direct and want to see AR loan schema
    Given I click button loan dashboard  
    #section select loan type
    When user click button ajukan pinjaman    
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Supplier Financing"
    Then System will display Schema of Supplier Financing


Scenario: User validate dropdown list on nominal option
    Given user click button ajukan pinjaman
    And User select loan type "AP"
    And User on Loan Needs Page
    And user click dropdown option
    Then user can validate List of Nominal Limit Credit   
    And user can click close button and back to loan needs page

Scenario: Validate Error meesage on Loan Needs when empty field
    Given user click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page   
    And user click button Lanjut Isi Data Buyer
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
    And user click back button to back to page drop down option nominal

Scenario: Validate error input tenor below min 30 hari 
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Buyer
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

Scenario: Validate error input tenor more than 180 hari 
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "240"
    And user click button Lanjut Isi Data Buyer
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"
    
Scenario: User apply second loan AR direct type with flagging Corporate
     Given I click button loan dashboard
    When user click button "ajukan limit baru"
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "90"
    And user click button Lanjut Isi Data Buyer
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
    #section upload AR CORP Invoice
    Given user on tab limit active
    When user upload document invoice 
    And user take invoice from camera
    And user take invoice from galery

Scenario: User apply loan only AP Corp business
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "7000000000"
    And user click button Save
    And user input tenor "30"
    And user click button Lanjut Isi Data Supplier
    #section select Anchor
    When user on buyer cooperating page
    And user select another supplier
    And user fill a field "anchorName" with "AP Direct Tes"
    And user select industry type
    And user select the date cooperating
    And user input business address
    #section supplier representatives has contact
    And user input supplier representatives name
    And user input contact name
    And user input email address supplier
    And user click button Selanjutnya
    And user click button Lanjut Lengkapi Data
    #section upload document
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "KTPandnpwpOfComp"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page

Scenario: User apply loan only AP Corp individu
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "7000000000"
    And user click button Save
    And user input tenor "30"
    And user click button Lanjut Isi Data Supplier
    #section select Anchor
    When user on buyer cooperating page
    And user select another supplier
    And user fill a field "anchorName" with "AP Direct Tes"
    And user select industry type
    And user select the date cooperating
    And user input business address
    #section supplier representatives has contact
    And user input supplier representatives name
    And user input contact name
    And user input email address supplier
    And user click button Selanjutnya
    And user click button Lanjut Lengkapi Data   
    #section upload document
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page