Feature: Apply First Loan With Flagging MSME Using AP Anchor
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

 Scenario: Verify bottom sheet Loan Schema
    Given I click button loan dashboard
    #section select loan type
    When user click button ajukan pinjaman
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page


 Scenario: User apply first loan AP Anchor and want to see AP loan schema
    Given I click button loan dashboard  
    #section select loan type
    When user click button ajukan pinjaman    
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Distributor Financing"
    Then System will display Schema of Distributor Financing
    And user validate content loan schema "AP"
    And user click back to loan type page

Scenario: Validate error input tenor below min 30 hari 
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Rp50 juta - 5 Miliar"       
    And user input tenor "1"
    And user click button Lanjut Isi Data Supplier    
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

Scenario: Validate error input tenor more than 180 hari 
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Rp50 juta - 5 Miliar"       
    And user input tenor "1"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

Scenario: User apply first loan AP Anchor with bussiness type PT Perusahaan flaging MSME
    Given I click button loan dashboard
    When user click button "ajukan pinjaman"
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"  
    And user input loan tenor "30" 
    And user click button Lanjut Isi Lokasi Kantor Pusat Bank  
    #select business location
    And user choose business location "Jabodetabek"
    And user click button Lanjut isi data supplier    
    #section select Anchor
    And user on buyer cooperating page
    And user fill search anchor "PT Tirta Investama"
    And user select the date cooperating
    And user checklist checbox term and condition
    And user checklist checbox privy
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
    #section upload document
    Given user on upload document page
    When user upload document "KTPandnpwpOfComp"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "1YearsfinancialReports"
    And user click button refresh
    And user click back button to loan processing
    #section trigered status loan
    And user trigered api change status loan is approved
    #sectionn buttom sheet success
    And user click button close on Metode Upload Dokumen
    And user click button Langsung dari Aplikasi on Metode Upload Dokumen
    And user click button Dari Perangkat Lain Delegasi on Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload docuemnt "nib"
    And user upload document "aktaperusahaan"
    And user upload document "skkemenkumhan"
    And user upload document "npwpPerusahaan"
    And user upload document "KTPandnpwpOfComp"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page

  Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user validate title "Pengecekan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"    
    Then user can click button Upload Ulang Dokumen

  Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    Then user validate wording information "Tim Amar Bank sedang menganalisis riwayat kredit"
  
Scenario: Validate Error Field on Select Loan Amount and Tenor Form
    Given user on select loan need page
    When user click button Lanjut Isi Data Supplier
    Then user should see error "Nominal limit kredit wajib diisi" in the field "errorAmountLoanField"
    And user should see error "Tenor limit kredit wajib diisi" in the field "errorTenorLoanField"

Scenario: Validate bottom sheet for Upload Dokumen
    Given I click button loan
    When user click button "ajukan limit baru"
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Rp50 juta - 5 Miliar"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Supplier
    #section select Anchor
    And user select "Anchor MSME Test"
    And user select the date cooperating
    And user click button Selanjutnya
    And user checklist checkbox term and condition
    And user checklist checkbox Privy term and condition
    And user click button Lanjut Upload Dokumen
    And user validate content list of documents for PT.Perusahaan
    And user click buttton Pilih Metode Upload Dokumen
   