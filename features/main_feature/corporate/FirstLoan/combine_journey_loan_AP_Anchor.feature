Feature: Apply First Loan With Flagging Corp Using AP Anchor
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


  @Sprint6Lending @C142544
  Scenario: Verify bottom sheet Loan Schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page

  @Sprint6Lending @C142545
  Scenario: User apply first loan AP Anchor and want to see AP loan schema
    Given User on Main Dashboard
    #section select loan type
    When user click button Ajukan Limit Kredit
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Distributor Financing"
    Then System will display Schema of Distributor Financing
    And user validate content loan schema "AP"
    And user click back to loan type page

  
  @Sprint6Lending @C142547
  Scenario: Validate Error meesage on Loan Needs when empty field
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"    
    And user click button Lanjut Isi Data Supplier
    Then user should see error message "Nominal limit kredit wajib diisi" in the field "errorAmountLoanField"
    And user should see error message "Tenor limit kredit wajib diisi" in the field "errorTenorLoanField"

  @Sprint6Lending @C142548
  Scenario: Validate Error input nominal min Rp.100.000
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"        
    And user input nominal below minimun nominal "100000"
    And user click button Lanjut Isi Data Supplier
    Then user can see error message "Minimal nominal Rp50.000000" in the field "errorAmountLoanField"

  
  @Sprint6Lending @C142550
  Scenario: Validate error input tenor below min 30 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"  
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Minimal tenor 30 hari"

  @Sprint6Lending @C142551
  Scenario: Validate error input tenor more than 180 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"    
    And user input nominal for Corp "10000000000"    
    And user input tenor "240"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Maksimal tenor 180 hari"


  @Sprint6Lending @C142552
  Scenario: User apply combine journey loan AP Anchor with business type PT.Perusahaan and flaging Corp
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"   
    And user input nominal for Corp "15000000000"    
    And user input tenor "60"
    And user click button Lanjut Isi Data Supplier
    And user fill search anchor "PT Tirta Investama"
    And user click button Pilih Supplier Ini
    And user select year cooperating  "2020"
    And usr click Pilih
    And user click button Lanjut Melengkapi Data
    And user click button Lanjut Proses KYC
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
    And user validate description prepare the following documents 'CorpAPPT.Perusahaan'
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
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page

  @Sprint6Lending @C142553
  Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"
    Then user see button "Upload Ulang Dokumen"

  @Sprint6Lending @C142554
  Scenario: user validate button Simpan Dokumen when upload ulang dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document page
    Then user see button Simpan Dokumen

  @Sprint6Lending @C142555
  Scenario: user click button Simpan Dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    And user upload multiple document "ktpcomm"
    Then user click button Simpan Dokumen
    And user will back to loan process page

  @Sprint6Lending @C142556
  Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    Then user validate wording information "Tim Amar Bank sedang menganalisis riwayat kredit"

  @Sprint6Lending @C142557
  Scenario: Validate bottom sheet for Metode Upload Dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman 
    And user on Aktivitas Pinjaman Page
    And user click loan with status Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    Then user will see bottom sheet metode upload Dokumen

  @Sprint6Lending @C142558
  Scenario: user can select and upload multiple document for PT.Perusahaan
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload document "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload multiple document "ktpcomm"
    And user upload multiple document "npwpcomm"
    And user upload multiple document "3contohInvoicewithSupplier"
    And user upload multiple document "paymentMutation"
    And user upload multiple document "2YearfinancialReports"
    Then user see button Kirim Pengajuan Limit Kredit

  @Sprint6Lending @C142559
  Scenario: user validate field after success upload document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload document "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload multiple document "ktpcomm"
    And user upload multiple document "npwpcomm"
    And user upload multiple document "ktpcomm"
    And user verify upload all document KTP
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "2YearfinancialReports"
    And user verify upload all document Finance Report
    Then user click button Kirim Pengajuan Limit Kredit
    And user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page
    # section trigered status loan
    And user trigered api change status loan is approved

  @Sprint6Lending @C142560
  Scenario: User add another document after the user success to uploads the previous document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "KTPComm"
    And user verify upload all document KTP dan NPWP
    Then user will see the document will be uploaded and show in one row below uploaded document list

  @Sprint6Lending @C142561
  Scenario: user verify pop up confirmation to delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "ktpcomm"
    And user verify upload all document KTP
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "2YearfinancialReports"
    And user verify upload all document Finance Report
    And user click button delete file uploaded
    Then user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"

  @Sprint6Lending @C142562
  Scenario: user delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "ktpcomm"
    And user click button delete file uploaded
    And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
    And user click button Hapus
    Then user back to Progres Upload Dokumen page

  @Sprint6Lending @C142563
  Scenario: user cancel to delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "ktpcomm"
    And user verify upload all document KTP
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "2YearfinancialReports"
    And user verify upload all document Finance Report
    And user click button delete file uploaded
    And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
    And user click button Kembali
    Then pop up confirmation will disappear

  @Sprint6Lending @C142564
  Scenario: user upload file more than 15MB
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document more than 15 MB "ktpdannpwp"
    Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."

  @Sprint6Lending @C142565
  Scenario: user validate button Kirim Pengajuan Kredit Limit after all document uploaded
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progres Upload Dokumen
    And user upload document "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload multiple document "ktpcomm"
    And user upload multiple document "npwpcomm"
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "2YearfinancialReports"
    And user verify upload all document Finance Report
    And user see button Kirim Pengajuan Limit Kredit

  @Sprint6Lending @C142566
  Scenario: user have not upload mandatory document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progres Upload Dokumen
    Then user will not see button Kirim Pengajuan Limit Kredit

  @Sprint6Lending @C142567
  Scenario: user back to main dashboard from progress loan page
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user click X button
    Then user back to Main Dashboard page
