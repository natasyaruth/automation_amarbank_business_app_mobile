Feature: Apply First Loan With Flagging MSME Using AP Direct
  As a customer lead
  I want to apply first loan using AP Direct with flaging MSME
  As a customer lead
  I want to apply first loan using AP Direct with flaging MSME

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
  


  @Sprint6Lending @C142642
  Scenario: Verify bottom sheet Loan Schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit    
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page

  @Sprint6Lending @C142643
  Scenario: User apply first loan AP direct and want to see AP loan schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit   
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Distributor Financing"
    Then System will display Schema of Distributor Financing
    And user validate content loan schema "AP"
    And user click back to loan type page

  @Sprint6Lending @C142645
  Scenario: Validate error input tenor below min 30 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Minimal tenor 30 hari"

  @Sprint6Lending @C142646
  Scenario: Validate error input tenor more than 180 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "300"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Maximal tenor 180 hari"

  @Sprint6Lending @C142647
  Scenario: User apply first loan AP Direct with bussiness type UD and flaging MSME
    Given User on Main Dashboard    
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"
    And user input nominal for MSME "5000000000"    
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Supplier
    #section select Anchor
    And user on buyer cooperating page
    And user select another supplier
    And user fill a field "anchorName" with "AP Direct Tes"
    And user select industry type
    And user select the year cooperating
    And user click Pilih
    And user input business address
    #section supplier representatives has contact
    And user input supplier representatives name
    And user input contact name
    And user input email address supplier
    And user click button Lanjut Melengkapi Data   
    And user click button Lanjut Proses KYC
    #section KYC Process
    Given user choose Business Type "UD"
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
    Then user click button Lanjut Lengkapi Data Bisnis
    #section KYB Process        
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
      | address  | Jl. Gambir Belok Kiri No. 10 |
      | rt       | 000                          |
      | rw       | 011                          |
      | province | DKI JAKARTA                  |
      | city     | JAKARTA TIMUR                |
      | district | DUREN SAWIT                  |
      | village  | PONDOK BAMBU                 |
    And user checklist checkbox term and condition
    And user checklist checkbox right and obligations
    And user checklist checbox privy
    And user click button Lanjut Upload Dokumen
    And user validate description prepare the following documents 'MSMEAPUD'    
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload document "ktpcomm"
    And user upload document "npwpcomm"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page

  @Sprint6Lending @C142648
  Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"
    Then user see button "Upload Ulang Dokumen"

  @Sprint6Lending @C142649
  Scenario: user validate button Simpan Dokumen when upload ulang dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document page
    Then user see button Simpan Dokumen

  @Sprint6Lending @C142650
  Scenario: user click button Simpan Dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    And user upload multiple document "3contohInvoicewithSupplier"   
    Then user click button Simpan Dokumen
    And user will back to loan process page

  @C142651
  Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    Then user validate wording information "Tim Amar Bank sedang menganalisis riwayat kredit"

  @C142652
  Scenario: Validate bottom sheet for Metode Upload Dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    Then user will see bottom sheet metode upload Dokumen

  @Sprint6Lending @C142653
  Scenario: user can select and upload multiple document UD
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload document "nib"
    And user upload document "npwpbisnis"
    And user upload multiple document "3contohInvoicewithSupplier"
    And user upload multiple document "paymentMutation"
    And user upload multiple document "1YearfinancialReports"
    Then user see button Kirim Pengajuan Limit Kredit


  @Sprint6Lending @C142654
  Scenario: user validate field after success upload document for UD
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload document "nib"
    And user upload document "npwpbisnis"
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    And user click button Kirim Pengajuan Limit Kredit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page


  @C142655
  Scenario: User add another document after the user success to uploads the previous document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document invoice
    And user upload multiple document "3contohInvoicewithSupplier"
    Then user will see the document will be uploaded and show in one row below uploaded document list

  @C142655
  Scenario: User add another document after the user success to uploads the previous document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document invoice
    And user upload multiple document "3contohInvoicewithSupplier"
    Then user will see the document will be uploaded and show in one row below uploaded document list


  @C142656
  Scenario: user verify pop up confirmation to delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    And user click button delete file uploaded
    Then user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
 

  @C142657
  Scenario: user delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice    
    And user click button delete file uploaded
    And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
    And user click button Hapus
    Then user back to Progres Upload Dokumen page

  @C142658
  Scenario: user cancel to delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    And user click button delete file uploaded
    And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
    And user click button Kembali
    Then pop up confirmation will disappear


  @C142659
  Scenario: user upload file more than 15MB
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document more than 15 MB "3contohInvoicewithSupplier"
    Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."


  @C142659
  Scenario: user upload file more than 15MB
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document more than 15 MB "3contohInvoicewithSupplier"
    Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."


  @C142660
  Scenario: user validate button Kirim Pengajuan Kredit Limit after all document uploaded
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progres Upload Dokumen
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    And user see button Kirim Pengajuan Limit Kredit

  @C142661
  Scenario: user have not upload mandatory document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progres Upload Dokumen
    Then user will not see button Kirim Pengajuan Limit Kredit



  @Sprint6Lending @C142662
  Scenario: user back to main dashboard from progress loan page
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user click X button
    Then user back to Main Dashboard page
