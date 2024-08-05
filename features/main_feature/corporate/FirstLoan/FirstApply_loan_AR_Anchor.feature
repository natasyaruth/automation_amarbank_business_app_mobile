Feature: Apply First Loan With Flagging Corp                                                               Using AP Direct
 As a customer lead
 I want to apply first loan using AP Achor with flaging Corp

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

  Scenario: Verify bottom sheet Loan Schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page

 Scenario: User apply first loan AR Anchor and want to see AR loan schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit  
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Supplier Financing"
    Then System will display Schema of Supplier Financing
    And user validate content loan schema "AR"
    And user click back to loan type page

  Scenario: User validate dropdown list on nominal option
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And User on Loan Needs Page
    And user click dropdown option
    Then user can validate List of Nominal Limit Credit   
    And user can click close button and back to loan needs page

  Scenario: Validate Error meesage on Loan Needs when empty field
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And user on select loan Needs Page   
    And user click button Lanjut Isi Data Buyer    
    Then user should see error message "Nominal limit kredit wajib diisi" in the field "errorAmountLoanField"
    And user should see error message "Tenor limit kredit wajib diisi" in the field "errorTenorLoanField"
    

  Scenario: Validate Error input nominal min Rp.50000000001
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal below minimun nominal "13500000"
    And user click button Save
    Then user can see error message "Min Rp.5.000.000.001, Max Rp.25.000.000.000" in the field "errorAmountLoanField"
    
  Scenario: user clear the text input nominal
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And user on select loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar"
    And user input nominal for Corp "13500000"
    Then user click button clear to delete all input nominal and back to zero
    And user click back button to back to page drop down option nominal 

   Scenario: Validate error input tenor below min 30 hari 
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Buyer
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

  Scenario: Validate error input tenor more than 180 hari 
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "240"
    And user click button Lanjut Isi Data Buyer
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"
    
 Scenario: User apply first loan AR Anchor with business type CV and flaging Corp
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And User input tenor "60"
    And user click button Lanjut Isi Data Buyer 
    #section select Anchor
    And user fill search anchor "PT AR Anchor Tes Nurul"
    And user select result of search
    And user select the date cooperating
    And user click button Selanjutnya   
    And user click button Lanjut Lengkapi Data    
    #section KYC Process
    Given user choose Business Type "CV"
    And user click Selanjutnya
    And user click button Ambil Foto eKTP
    And user click button Saya Mengerti
    And user click buton take photo eKTP   
    And user click button Kirim Foto
    And user input and save eKTP data
    And user click button Ambil Foto Diri
    And user click Ambil Foto
    And user click button Kirim Foto      
    And user input Pendidikan terakhir "S1"
    And user input nama ibu kandung "Tom Tom"
    And user input nama kerabat "Tintin"
    And user input nomor kerbat "867300989"
    And user upload document "npwpindividu"
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select "Pegawai Swasta"
    And user select sumber pendapatan "Pemasukan dari usaha"   
    And user click button Simpan Data Pekerjaan
    And system direct to Success screen
    And user click button Lanjut Lengkapi Data Bisnis    
    #KYB
    And user in Profil Bisnis page
    And user input profil bisnis and click button Simpan Profil Bisnis
    And user click button Simpan Daftar Direktur
    And I fill my business address as followings:
        | address  | Jl. Gambir Belok Kanan No. 10 |
        | rt       | 000                          |
        | rw       | 011                          |
        | province | DKI JAKARTA                  |
        | city     | JAKARTA TIMUR                |
        | district | DUREN SAWIT                  |
        | village  | PONDOK BAMBU                 |    
    And user checklist checkbox term and condition  
    And user checklist checkbox right and obligations
    And user click button Lanjut Upload Dokumen
    And user validate description prepare the following documents 'CorpARPT.Perusahaan'
    And user click buttton Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "nib"
    And user upload document "aktaperusahaan"
    And user upload document "skkemenkumhan"
    And user upload document "npwpComp"
    And user upload document "ktpofComm"    
    And user upload document "npwpOfComm"
    And user upload document "3contohInvoicewithBuyer"
    And user upload document "paymentMutation"
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page
    
  Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"    
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforAR"
    Then user can click button Upload Ulang Dokumen

  Scenario: user validate button Simpan Dokumen when upload ulang dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    Then user see button Simpan Dokumen

  
  Scenario: user click button Simpan Dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    And user upload multiple document "KTPComm"  
    Then user click button Simpan Dokumen
    And user will back to loan process page

  Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    Then user validate wording information "Tim Amar Bank sedang menganalisis riwayat kredit"
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforAR"
    And user validate wording information "Tim Amar Bank sedang verifkasi data & dokumen yang sudah Anda upload"


  Scenario: Validate bottom sheet for Metode Upload Dokumen Langsung dari Aplikasi
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AR"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"
    And user click button Lanjut Isi Data Supplier 
    #section select Anchor
    And user fill search anchor "PT Tirta Investama"
    And user select result of search
    And user select the date cooperating        
    And user click button Selanjutnya   
    And user click button Lanjut Lengkapi Data
    #section KYC Process
    Given user choose Business Type "PT Perusahaan"
    And user click Selanjutnya     
    And user click button Ambil Foto eKTP
    And user click button Saya Mengerti
    And user click buton take photo eKTP   
    And user click button Kirim Foto
    And user input and save eKTP data
    And user click button Ambil Foto Diri
    And user click Ambil Foto
    And user click button Kirim Foto 
    And user input Pendidikan terakhir "S1"
    And user input nama ibu kandung "Susi Susanti"
    And user input nama kerabat "Susi Similikiti"
    And user input nomor kerbat "867300987"
    And user upload document "npwpindividu"
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select "Pegawai Swasta"
    And user select sumber pendapatan "Pemasukan dari usaha"  
    And click Simpan Data Pekerjaan
    And system direct to Success screen
    And user click button Lanjut Lengkapi Data Bisnis
    #section KYB Process
    And user in Profil Bisnis page
    And user input profil bisnis and click button Simpan Profil Bisnis
    And user input and click Simpan Daftar Direktur
    And I fill my business address as followings:
        | address  | Jl. Gambir Belok Kiri No. 10 |
        | rt       | 000                          |
        | rw       | 011                          |
        | province | DKI JAKARTA                  |
        | city     | JAKARTA TIMUR                |
        | district | DUREN SAWIT                  |
        | village  | PONDOK BAMBU                 |    
    And user checklist checkbox term and condition  
    And user checklist checkbox right and obligations
    And user click button Lanjut Upload Dokumen
    And user go to page list of document for PT.Perusahaan
    And user click buttton Pilih Metode Upload Dokumen  
    And user on bottom sheet metode upload Dokumen
    And user validate wording for "Langsung dari Aplikasi"
    And user click button close bottom sheet
   
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

Scenario: user upload file more than 15MB
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document more than 15 MB "3contohInvoicewithSupplier"  
  Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."
  

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
   
  
Scenario: user have not upload mandatory document
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Progres Upload Dokumen
  Then user will not see button Kirim Pengajuan Limit Kredit

Scenario: user back to main dashboard from progress loan page
  Given user on monitoring loan process page
  And user can see X button to back to Main Dashboard
  And user click X button
  Then user back to Main Dashboard page

 





   











    


