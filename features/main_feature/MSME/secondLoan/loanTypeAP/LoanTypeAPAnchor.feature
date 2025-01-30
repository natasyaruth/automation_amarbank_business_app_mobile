Feature: Apply Second Loan With Flagging MSME Using AP Anchor
    As a customer lead
    I want to apply second loan using AP Anchor with MSME has flag

Background: User must login to home dashboard
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


@C142805
Scenario: Verify bottom sheet Loan Schema
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page

@C142806
Scenario: User apply second loan AP Anchor and want to see AP loan schema
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru    
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Distributor Financing"
    Then System will display Schema of Distributor Financing

@C142807
Scenario: Validate error input tenor below min 30 hari 
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "AP"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Minimal tenor 30 hari"

@C142808
Scenario: Validate error input tenor more than 180 hari 
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "AP"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "300"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Maximal tenor 30 hari"

@C142809
Scenario: User apply second loan AP Anchor with business type PT.Perusahaan and flagging MSME
   Given User click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "AP"
    And user input nominal for MSME "5000000000"
    And user input loan tenor "30" 
    And user click button Lanjut Isi Data Supplier  
    #section select Anchor    
    And user select "Anchor MSME Test"
    And click button Pilih Supplier Ini   
    And user select year cooperating  "2020"   
    And usr click Pilih 
    And user click button Selanjutnya   
    And user checklist checkbox term and condition  
    And user checklist checkbox Privy term and condition
    And user click button Lanjut Upload Dokumen      
    And user validate description prepare the following documents 'SecondLoanAPMSMEPT.Perusahaan' 
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page 
    And user upload document "KTPcomm"
    And user upload document "NPWPcomm"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page
    And user trigered api change status loan is approved


@C142810 
Scenario: Validate bottom sheet for Metode Upload Dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    Then user will see bottom sheet metode upload Dokumen


@C142811
Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"    
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforAR"
    Then user can click button Upload Ulang Dokumen


@C142812
Scenario: user validate button Simpan Dokumen when upload ulang dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document page
    Then user see button Simpan Dokumen


@C142813
Scenario: user click button Simpan Dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    And user upload multiple document "KTPComm"  
    Then user click button Simpan Dokumen
    And user will back to loan process page


@C142814
Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    Then user validate wording information "Tim Amar Bank sedang menganalisis riwayat kredit"
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforAR"
    And user validate wording information "Tim Amar Bank sedang verifkasi data & dokumen yang sudah Anda upload"


@C142815
Scenario: user can select and upload multiple document for PT.Perusahaan
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "KTPComm"    
  And user upload multiple document "npwpOfComm"
  And user upload multiple document "3contohInvoicewithSupplier"
  And user upload multiple document "paymentMutation"
  And user upload multiple document "1YearfinancialReports"  
  Then I should see all documents uploaded successfully
 

@C142816
Scenario: User successfully uploads multiple documents PT.Perusahaan
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi 
  And user upload multiple document "KTPComm"          
  And user upload multiple document "npwpOfComm"  
  And user upload multiple document "3contohInvoicewithSupplier"  
  And user upload multiple document "paymentMutation"  
  And user upload multiple document "1YearfinancialReports"  
  Then user see button Kirim Pengajuan Limit Kredit
  

@C142817
Scenario: User add another document after the user success to uploads the previous document
  Given I am on the "Progress Upload Dokumen" page
  When user upload multiple document "3contohInvoicewithSupplier"   
  Then user will see the document will be uploaded and show in one row below uploaded document list  


@C142818
Scenario: user verify pop up confirmation to delete uploaded file
  Given I am on the "Progress Upload Dokumen" page   
  And I add multiple document "npwpOfComm"
  And I should see all documents uploaded successfully
  And user click button delete file uploaded
  Then user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 


@C142819
Scenario: user delete uploaded file
  Given I am on the "Progress Upload Dokumen" page   
  And I add upload multiple document "npwpOfComm"
  And I should see all documents uploaded successfully
  And I click button delete file uploaded   
  And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 
  And user click button Hapus
  Then user back to Progres Upload Dokumen page


@C142820
Scenario: user cancel to delete uploaded file
  Given I am on the "Progress Upload Dokumen" page   
  And I add upload multiple document "npwpOfComm"  
  And I add upload multiple document "paymentMutation"
  And I should see all documents uploaded successfully
  And I click button delete file uploaded
  And I should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 
  And I click button Kembali
  Then pop up confirmation will disappear



@C142821
Scenario: user upload file more than 15MB
  Given I am on the "Progress Upload Dokumen" page   
  And I add upload multiple document "npwpOfComm"  
  And I add upload multiple document "paymentMutation"
  And I upload multiple document more than 15 MB "KTPComp"  
  Then I see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."
  

@C142823
Scenario: user have not upload mandatory document
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Progres Upload Dokumen
  Then user will not see button Kirim Pengajuan Limit Kredit


@C142824
Scenario: user back to main dashboard from progress loan page
  Given user on monitoring loan process page
  And user can see X button to back to Main Dashboard
  And user click X button
  Then user back to Main Dashboard page
