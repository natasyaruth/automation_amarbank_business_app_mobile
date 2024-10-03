Feature: Apply First Loan With Flagging MSME Using AP Anchor
  As a customer lead
  I want to apply first loan using AP Anchor with MSME has flag
  As a customer lead
  I want to apply first loan using AP Anchor with MSME has flag

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


  @C142663
  Scenario: Verify bottom sheet Loan Schema

  @C142663
  Scenario: Verify bottom sheet Loan Schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    When user click button Ajukan Limit Kredit
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page


  @C142664
  Scenario: User apply first loan AP Anchor and want to see AP loan schema
  @C142664
  Scenario: User apply first loan AP Anchor and want to see AP loan schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    When user click button Ajukan Limit Kredit
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Distributor Financing"
    Then System will display Schema of Distributor Financing
    And user validate content loan schema "AP"
    And user click back to loan type page

  @C142665
  Scenario: Validate error input tenor below min 30 hari
  @C142665
  Scenario: Validate error input tenor below min 30 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"
    And user on select loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user on select loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user input tenor "1"
    And user click button Lanjut Isi Data Supplier
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

  @C142666
  Scenario: Validate error input tenor more than 180 hari
  @C142666
  Scenario: Validate error input tenor more than 180 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"
    And user on select loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user on select loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user input tenor "1"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

  ## take out location bisnis#
  @FunctTestLending
  @C161660
  Scenario: Take out validation page of “Lokasi Bisnis” after input nominal
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"
    And user on select loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user on select loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user input tenor "1"
    And user click button Lanjut Isi Data Supplier
    Then user direct to Data Supplier Page

  @Sprint6Lending @C142667
  Scenario: User apply first loan AP Anchor with bussiness type PT Perusahaan flaging MSME
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    When user click button Ajukan Limit Kredit
    When user click button "ajukan pinjaman"
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Supplier
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Supplier
    #section select Anchor
    And user on buyer cooperating page
    And user fill search anchor "PT Tirta Investama"
    And click button Pilih Supplier Ini
    And user select year cooperating  "2020"
    And usr click Pilih
    And user click button Lanjut Melengkapi Data
    And click button Pilih Supplier Ini
    And user select year cooperating  "2020"
    And usr click Pilih
    And user click button Lanjut Melengkapi Data
    And user click button Lanjut Proses KYC
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
    And click Simpan Data Pekerjaan
    And system direct to Success screen
    Then user click button Lanjut Lengkapi Data Bisnis
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
    And user validate description prepare the following documents 'MSMEAPPT.Perusahaan'
    And user validate description prepare the following documents 'MSMEAPPT.Perusahaan'
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload document "ktpcomm"
    And user upload document "npwpcomm"
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

  @Sprint6Lending @C142668
  Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"
    And user click button Upload Ulang Dokumen
    Then user go back to page Progres Upload Dokumen

  @Sprint6Lending @C142669
  Scenario: user validate button Simpan Dokumen when upload ulang dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    Then user see button Simpan Dokumen

  @Sprint6Lending @C142670
  Scenario: user click button Simpan Dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    And user upload multiple document "KTPComm"
    And user upload multiple document "KTPComm"
    Then user click button Simpan Dokumen
    And user will back to loan process page

  @C142671
  @C142671
  Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    Then user validate wording information "Tim Amar Bank sedang verifkasi data & dokumen yang sudah Anda upload"

  @C142672
  Scenario: Validate bottom sheet for Metode Upload Dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    Then user will see bottom sheet metode upload Dokumen


  @Sprint6Lending @C142673
  Scenario: user can select and upload multiple document for PT.Perusahaan
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload multiple document "ktpcomm"
    And user upload multiple document "npwpcomm"
    And user upload multiple document "3contohInvoicewithSupplier"
    And user upload multiple document "paymentMutation"
    And user upload multiple document "1YearfinancialReports"

  @Sprint6Lending @C142674
  Scenario: user validate field after success upload document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload multiple document "ktpdcomm"
    And user upload multiple document "npwpcomm"
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    Then user see button Kirim Pengajuan Limit Kredit

  @C142675
  Scenario: User add another document after the user success to uploads the previous document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "paymentMutation"
    Then user will see the document will be uploaded and show in one row below uploaded document list


  @C142676
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
  @C142676
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

  @C142677
  Scenario: user delete uploaded file
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
    And user click button Hapus
    Then user back to Progres Upload Dokumen page
  @C142677
  Scenario: user delete uploaded file
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
    And user click button Hapus
    Then user back to Progres Upload Dokumen page

  @C142678
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
  @C142678
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

  @C142679
  Scenario: user upload file more than 15MB
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document more than 15 MB "paymentMutation"
    Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."

  @Sprint6Lending @C142680
  Scenario: user validate button Kirim Pengajuan Kredit Limit after all documen uploaded
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progres Upload Dokumen
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload document "ktpcomm"
    And user upload multiple document "npwpcomm"
    And user upload multiple document "3contohInvoicewithSupplier"
    And user verify upload all document Invoice
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    And user see button Kirim Pengajuan Limit Kredit

  @C142681
  Scenario: user have not upload mandatory document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progres Upload Dokumen
    Then user will not see button Kirim Pengajuan Limit Kredit

  @C142682
  Scenario: user back to main dashboard from progress loan page
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user click X button
    Then user back to Main Dashboard page
  @C142682
  Scenario: user back to main dashboard from progress loan page
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user click X button
    Then user back to Main Dashboard page
