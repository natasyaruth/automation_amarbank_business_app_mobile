Feature: File Upload and Size Validation for Loan Type Corp
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
 

Scenario: User upload files and validate its size for Loan Type AP PT.Perusahaan Corp
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload document "skkemenkumhan"
  And user verify the file size SK should be displayed
  And user upload document "npwpComp"
  And user verify the file size NPWPPerusahaan should be displayed
  And user upload multiple document "KTPComm"     
  And user verify upload all document KTP and file size should be displayed  
  And user upload multiple document "npwpOfComm"
  And user verify upload all document NPWP and file size should be displayed
  And user upload multiple document "3contohInvoicewithSupplier"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 

Scenario: User upload files and validate its size for Loan Type AR PT.Perusahaan Corp
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload document "skkemenkumhan"
  And user verify the file size SK should be displayed
  And user upload document "npwpComp"
  And user verify the file size NPWPPerusahaan should be displayed
  And user upload multiple document "KTPComm"     
  And user verify upload all document KTP and file size should be displayed  
  And user upload multiple document "npwpOfComm"
  And user verify upload all document NPWP and file size should be displayed
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice Buyer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 


Scenario: User upload files and validate its size for Loan Type AP PT.Perorangan or UD Corp
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload multiple document "3contohInvoicewithSupplier"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 


Scenario: User upload files and validate its size for Loan Type AR PT.Perorangan or UD Corp
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice Buyer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 

Scenario: User upload files and validate its size for Loan Type AP Individu Corp
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page 
  And user upload multiple document "3contohInvoicewithSupplier"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit

Scenario: User upload files and validate its size for Loan Type AR Individu Corp
  Given user already apply loan but have not upload document
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
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit


#MSME
Scenario: User upload files and validate its size for Loan Type AP PT.Perusahaan MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload document "skkemenkumhan"
  And user verify the file size SK should be displayed
  And user upload document "npwpComp"
  And user verify the file size NPWPPerusahaan should be displayed
  And user upload multiple document "KTPComm"     
  And user verify upload all document KTP and file size should be displayed  
  And user upload multiple document "npwpOfComm"
  And user verify upload all document NPWP and file size should be displayed
  And user upload multiple document "3contohInvoicewithSupplier"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 

Scenario: User upload files and validate its size for Loan Type AR PT.Perusahaan MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload document "skkemenkumhan"
  And user verify the file size SK should be displayed
  And user upload document "npwpComp"
  And user verify the file size NPWPPerusahaan should be displayed
  And user upload multiple document "KTPComm"     
  And user verify upload all document KTP and file size should be displayed  
  And user upload multiple document "npwpOfComm"
  And user verify upload all document NPWP and file size should be displayed
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice Buyer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit

Scenario: User upload files and validate its size for Loan Type PO PT.Perusahaan MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload document "skkemenkumhan"
  And user verify the file size SK should be displayed
  And user upload document "npwpComp"
  And user verify the file size NPWPPerusahaan should be displayed
  And user upload multiple document "KTPComm"     
  And user verify upload all document KTP and file size should be displayed  
  And user upload multiple document "npwpOfComm"
  And user verify upload all document NPWP and file size should be displayed
  And user upload multiple document "SPKBouwheer"
  And user verify upload all document SPK Bouwheer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 
 
Scenario: User upload files and validate its size for Loan Type AP PT.Perorangan or UD MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload multiple document "3contohInvoicewithSupplier"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 


Scenario: User upload files and validate its size for Loan Type AR PT.Perorangan or UD MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice Buyer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit
 

Scenario: User upload files and validate its size for Loan Type PO PT.Perorangan or UD MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed  
  And user upload multiple document "SPKBouwheer"
  And user verify upload all document SPK Bouwheer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit


Scenario: User upload files and validate its size for Loan Type AP Individu Corp MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page 
  And user upload multiple document "3contohInvoicewithSupplier"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit

Scenario: User upload files and validate its size for Loan Type AR Individu Corp
  Given user already apply loan but have not upload document
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
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit


Scenario: User upload files and validate its size for Loan Type PO Individu MSME
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page  
  And user upload multiple document "SPKBouwheer"
  And user verify upload all document SPK Bouwheer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  Then user see button Kirim Pengajuan Limit Kredit

## successfully upload document ##

Scenario: User successfully upload document combine journey loan AP Corp PT.Perusahaan
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page  
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed
  And user upload document "skkemenkumhan"
  And user verify the file size SK should be displayed
  And user upload document "npwpComp"
  And user verify the file size NPWPPerusahaan should be displayed
  And user upload multiple document "KTPComm"     
  And user verify upload all document KTP and file size should be displayed  
  And user upload multiple document "npwpOfComm"
  And user verify upload all document NPWP and file size should be displayed
  And user upload multiple document "3contohInvoicewithSupplier"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "2YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  And user see button Kirim Pengajuan Limit Kredit display after upload all mandatory documents
  And user click button Kirim Pengajuan Limit Kredit
  And user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
  And user click button Lihat Progres Pengajuan
  And user on monitoring loan process page


Scenario: User successfully upload document combine journey loan AR MSME PT.Perorangan
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page  
  And user upload document "nib"
  And user verify the file size nib should be displayed
  And user upload document "aktaperusahaan"
  And user verify the file size akta perusahaan should be displayed   
  And user upload multiple document "3contohInvoicewithBuyer"
  And user verify upload all document Invoice Buyer and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  And user see button Kirim Pengajuan Limit Kredit display after upload all mandatory documents
  And user click button Kirim Pengajuan Limit Kredit
  And user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
  And user click button Lihat Progres Pengajuan
  And user on monitoring loan process page


Scenario: User successfully upload document combine journey loan PO MSME Individu
  Given user already apply loan but have not upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Upload File Page   
  And user upload multiple document "SPKBouwheer"
  And user verify upload all document Invoice Supplier and file size should be displayed
  And user upload multiple document "paymentMutation"
  And user verify upload all document Mutasi and file size should be displayed
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report and file size should be displayed
  And user see button Kirim Pengajuan Limit Kredit display after upload all mandatory documents
  And user click button Kirim Pengajuan Limit Kredit
  And user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
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
    And user go back to page Upload document page
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




  