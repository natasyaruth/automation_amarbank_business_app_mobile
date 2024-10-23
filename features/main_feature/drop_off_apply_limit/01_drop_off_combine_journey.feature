Feature: Apply Combine Journey with new drop off management
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
    Then I successed go to main dashbord


Scenario: User apply combine journey until drop off before submit detail kredit
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar"
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"    
    And user click button Lanjut Isi Data Supplier   
    And user on Data Supplier Page 
    And user click back button to Detail Kredit
    And user back to select type Loan Page
    And user click X button
    Then user on Main Dashboard


Scenario: User validate status Pengajuan Limit
    Given user on main dashboard
    When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"       
    And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
    And user should see text card "1" on field "textCardValueProcess"
    And user should see text card "Proses" on field "textCardProcess"   
    And user click button Aktivitas Pinjaman
    And user on Aktvitas Pinjaman page
    And user see text card Pengajuan Lmit


Scenario: User continue journey from status Pengajuan Limit until before submit data anchor
    Given user on Aktivitas Pinjaman
    When user click card with status Pengajuan Limit    
    And user on Detail Kredit Page
    And user click button Lanjut Isi Data Supplier
    And user fill search anchor "AP Corp Tes 3"
    And user click button Pilih Supplier Ini
    And user select year cooperating  "2020"
    And user click Pilih
    And user checklist on Term and Condition
    And user click button Lanjut Melengkapi Data
    And user on Process Continue KYC Page
    And user click back button to Data Supplier Page
    And user click back button to Detail Kredit Page
    And user back to select Type Loan Page
    And user back to main dashboard

Scenario: User continue journey from status Pengajuan Limit until drop off KYC
    Given user on Aktivitas Pinjaman
    When user click card with status Pengajuan Limit
    And user on Data Supplier Page
    And user click button Lanjut Melengkapi Data
    And user click button Lanjut Proses KYC
    And user choose Business Type "PT.Perusahaan"
    And user click back button



Scenario: User validate Drop Off KYC In Process Loan
    Given user on main dashboard
    When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"       
    And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
    And user should see text card "1" on field "textCardValueProcess"
    And user should see text card "Proses" on field "textCardProcess"
    And user should see text button "Lanjut Lengkapi Data Personal" on field "btnTextDropOffAccOpeningOnlyKyc"


Scenario: User continue proses from continue KYC until drop off Onboarding KYB
    Given user on Aktivitas Pinjaman
    Then user click button drop off
    And user on Ajukan Pinjaman Bisnis Page
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
    And user on Profil Bisnis page
    Then user click back button



Scenario: User validate drop off main dashboard loan process on waiting kyb
    Given user on main dashboard
    When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
    When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
    When user should see text card "1" on field "textCardValueProcess"
    When user should see text card "Proses" on field "textCardProcess"
    And user should see text button "Lanjut Lengkapi Data Bisnis" on field "btnTextDropOffAccOpeningOnlyKyb"
    And user should see text card "Lanjutkan Proses Pinjaman" on field "textCardContinueProcessLoan"
    Then user click button drop off
    And user should see business data page



Scenario: User continue from Drop Off KYB In Process Loan
    Given user on Main Dashboard
    When user click button drop off KYB 
    And User on Profil Bisnis Page
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
    And user validate description prepare the following documents 'CorpAPIndividu'
    And user click X button


Scenario: User validate Drop Off Upload Document in Loan Process + Waiting Invited Regis
    Given user on main dashboard
    When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"       
    And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
    And user should see text card "1" on field "textCardValueProcess"
    And user should see text card "Proses" on field "textCardProcess"   
    And user should see text card "Menunggu proses registrasi Daftar Direksi lainnya" on field "textCardInvetedUserDireksi"
    And user should see text button "Lihat Daftar Direksi" on field "btnTextDropOffAccOpeningOnlyInvitedUser"
    And user click button Aktivitas Pinjaman
    And user on Aktvitas Pinjaman page
    And user see text card Upload Dokumen
    
    
Scenario: User continue journey from status Upload Dokumen
    Given user on Aktivitas Pinjaman
    When user click card with status Upload Dokumen    
    And user validate description prepare the following documents 'CorpAPPT.Perusahaan'
    And user click buttton Pilih Metode Upload Dokumen
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

