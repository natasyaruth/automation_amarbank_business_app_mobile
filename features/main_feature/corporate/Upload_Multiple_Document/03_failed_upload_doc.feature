Feature: Failed File Upload and Size Validation for All type loan
 As a customer lead
 I want to apply first loan flaging Corp and MSME

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
  And I click later
  Then I will direct to Main dashboard


Scenario: user upload file more than 15MB for Combine Journey PO PT.Perusahaan
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page 
  And user upload multiple document "KTPComm"     
  And user verify upload all document KTP and file size should be displayed  
  And user upload multiple document "npwpOfComm"
  And user verify upload all document NPWP and file size should be displayed
  And user upload multiple document more than 15 MB "SPKBouwheer"  
  Then user see file size is displayed and error message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."
  
Scenario: user upload file more than 15MB for Combine Journey AP Corp PT.Perorangan
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page 
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice Buyer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document more than 15 MB "2YearfinancialReports"  
  Then user see file size is displayed and error message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."
  
Scenario: user upload file more than 15MB for Second Loan AR MSME Individu
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page 
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice Buyer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document more than 15 MB "1YearfinancialReports"  
  Then user see file size is displayed and error message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."


Scenario: Validate Upload document with invalid file format
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page 
  And user upload multiple document with jpg format "3contohInvoicewithBuyer" 
  Then user see file size is displayed and error message for upload invalid format "File harus dalam format PDF."
