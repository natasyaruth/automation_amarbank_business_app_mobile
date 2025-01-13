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


@C142984
Scenario: Verify bottom sheet Loan Schema
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru 
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page


@C142985
Scenario: User apply second loan AR Direct and want to see AR loan schema
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru    
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Supplier Financing"
    Then System will display Schema of Supplier Financing

@C142986
Scenario: User apply second loan AR Anchor and want to see AR loan schema
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru    
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button Supplier Financing
    Then System will display Schema of Supplier Financing


@C142988
Scenario: Validate Error meesage on Loan Needs when empty field
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AR"    
    And user click button Lanjut Isi Data Supplier
    Then user should see error message "Nominal limit kredit wajib diisi" in the field "errorAmountLoanField"
    And user should see error message "Tenor limit kredit wajib diisi" in the field "errorTenorLoanField"
    
@C142989
Scenario: Validate Error input nominal min Rp.100.000
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AR"        
    And user input nominal below minimun nominal "100000"
    And user click button Lanjut Isi Data Supplier
    Then user can see error message "Minimal nominal Rp50.000000" in the field "errorAmountLoanField"


@C142991  
Scenario: Validate error input tenor below min 30 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AR"  
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Minimal tenor 30 hari"

@C142992
Scenario: Validate error input tenor more than 180 hari 
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru 
    And User select loan type "AR"    
    And user input nominal for Corp "10000000000"    
    And user input tenor "240"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Maximal tenor 180 hari"

@C142993
Scenario: User apply second loan AR anchor type with flagging Corporate UD
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru 
    And User select loan type "AR"    
    And user input nominal for Corp "15000000000"    
    And user input tenor "90"
    And user click button Lanjut Isi Data Supplier 
    #section select Anchor    
    And user fill search anchor "PT Tirta Investama"
    And click button Pilih Supplier Ini   
    And user select year cooperating  "2020"   
    And usr click Pilih      
    And user tick on Terms & condition
    And user click button Lanjut Upload Dokumen 
    And user validate description prepare the following documents 'SecondCorpARPT.Perorangan' 
    And user click buttton Pilih Metode Upload Dokumen  
    #section upload document
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page

@C142994
Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"    
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." 
    Then user can click button Upload Ulang Dokumen

@C142995
Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    Then user validate wording information "Tim Amar Bank sedang menganalisis riwayat kredit"
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." 
    And user validate wording information "Tim Amar Bank sedang verifkasi data & dokumen yang sudah Anda upload"

@C142996 
Scenario: Validate bottom sheet for Metode Upload Dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman 
    And user on Aktivitas Pinjaman Page
    And user click loan with status Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    Then user will see bottom sheet metode upload Dokumen

@C142997 
Scenario: user can select and upload multiple document
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi 
  And user upload document "ktpofComm"    
  And user upload document "npwpOfComm"
  And user upload document "3contohInvoicewithBuyer"
  And user upload document "paymentMutation"
  And user upload document "2YearfinancialReports"
  
@C142998
Scenario: user validate field after success upload document
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "3contohInvoicewithBuyer
  And user verify upload all document Invoice
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report
  Then user see button Kirim Pengajuan Limit Kredit
  
@C142999
Scenario: User add another document after the user success to uploads the previous document
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "3contohInvoicewithBuyer"     
  And user verify upload all document invoice 
  And user upload multiple document "3contohInvoicewithSupplier"
  Then user will see the document will be uploaded and show in one row below uploaded document list 

@C143000
Scenario: USer validate field after one or more than one file has been failed upload document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithBuyer"     
    And user show a retry icon when the document fails to upload
    And user show an error message in row field if the document fails to upload 

@C143001
Scenario: User validate button Kirim Pengajuan Limit Kredit disable after reupload failed dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithBuyer"    
    And user upload multiple document "paymentMutation"     
    And user see error message network problem
    Then user click button retry 

@C143002
Scenario: user verify pop up confirmation to delete uploaded file
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report
  And user click button delete file uploaded
  Then user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 

@C143003
Scenario: user delete uploaded file
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report
  And user click button delete file uploaded
  And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 
  And user click button Hapus
  Then user back to Progres Upload Dokumen page

@C143004
Scenario: user cancel to delete uploaded file
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi 
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report
  And user click button delete file uploaded
  And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 
  And user click button Kembali
  Then pop up confirmation will disappear

@C143005
Scenario: user upload file more than 15MB
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document more than 15 MB "3contohInvoicewithBuyer"  
  Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."
  
@C143006
Scenario: user validate button Kirim Pengajuan Kredit Limit after all document uploaded
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Progres Upload Dokumen 
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report
  And user see button Kirim Pengajuan Limit Kredit
   
@C143007
Scenario: user have not upload mandatory document
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Progres Upload Dokumen
  Then user will not see button Kirim Pengajuan Limit Kredit


@C143008
Scenario: user back to main dashboard from progress loan page
  Given user on monitoring loan process page
  And user can see X button to back to Main Dashboard
  And user click X button
  Then user back to Main Dashboard page

 





   







