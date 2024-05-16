Feature: Apply First Loan With Flagging Corp Using AP Direct
 As a customer lead
 I want to apply first loan using AP Direct with flaging Corp

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
  Then I successed go to Main dashbord

 Scenario: User apply first loan AP direct and want to see AP loan schema
    Given user click button ajukan pinjaman
    When user select loan type "AP"
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button Distributor Financing
    Then System will display Schema of Distributor Financing

  Scenario: User validate dropdown list on nominal option
    Given user click button ajukan pinjaman
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


  Scenario: User apply first loan AP Direct with flaging Corp
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"
    And user click button Lanjut isi data supplier
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
    And user checklist checbox term and condition   
    And user click button next   
    And user click button Lanjut Lengkapi Data
    #section KYC Process
    Given user choose Business Type "PT Perusahaan"
    And user click Selanjutnya
    And user take photo eKTP
    And user click "Saya Mengerti"
    And user click "Ambil Foto eKTP"
    And user click "Kirim Foto"
    And user input and save eKTP data
    And user click take "Foto Diri"
    And user click "Kirim Foto"
    And user input and save personal individual data
    And user select domicile address
    When user input "Data Pekerjaan"
    And click "Simpan Data Pekerjaan"
    And system direct to Success screen
    Then user click button "Lanjut Lengkapi Data Bisnis"
    #section KYB Process
    Given user in "Data Pekerjaan" filled
    When user input and save "Profil Bisnis"
    And user input and click "Simpan Daftar Direktur"
    And user input and save "Alamat Bisnis"
    Then direct to "Selamat, Pengajuan Berhasil Dikirim"
    And user click OK
    # section upload document
    Given user on upload document page
    When user upload document "KTPandnpwpOfComp"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button refresh
    And user click back button to loan processing
    #section trigered status loan
    And user trigered api change status loan is approved

