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

  Scenario: User validate dropdown list on nominal option
    Given user click button ajukan pinjaman
    And User select loan type "AP"
    And User on Loan Needs Page
    And user click dropdown option
    Then user can validate List of Nominal Limit Credit   
    And user can click close button and back to loan needs page


  Scenario: Validate Error meesage on Loan Needs when empty field
    Given user click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page   
    And user click button Lanjut Isi Data Supplier    
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
    And user click back button to back to page drop down option nominal

    
  Scenario: Validate error input tenor below min 30 hari 
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

  Scenario: Validate error input tenor more than 180 hari 
    Given I click button loan dashboard
    When user click button ajukan pinjaman
    And User select loan type "AP"
    And user on select loan Needs Page 
    And User choose nominal "Lebih dari 5 Milyar"    
    And user input nominal for Corp "10000000000"
    And user click button Save
    And user input tenor "240"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

 Scenario: User apply first loan AP Direct with business type PT.Perusahaan and flaging Corp 
    Given I click button loan dashboard
    When user click button pinjaman
    And User select loan type "AP"
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
    And user validate content list of documents for PT.Perusahaan
    And user click buttton Pilih Metode Upload Dokumen    
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

    
  Scenario: Validate bottom sheet for Metode Upload Dokumen Langsung dari Aplikasi
    Given I click button loan dashboard
    When user click button pinjaman
    And User select loan type "AP"
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
    And user validate content list of documents for PT.Perusahaan
    And user click buttton Pilih Metode Upload Dokumen  
    And user on bottom sheet metode upload Dokumen
    And user validate wording for "Langsung dari Aplikasi"
    And user click button close bottom sheet
   




   