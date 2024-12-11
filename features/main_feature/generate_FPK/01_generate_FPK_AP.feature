Feature: Apply Loan then receive form FPK
    In Apply Loan Page
    As a customer
    I want to apply loan and debtor submit credit application from mobile apps, then system will auto generate credit application form



Scenario: User receive FPK as an attachement when user apply coombine journey AP
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar"
    And user input nominal for Corp "15000000000"
    And user click button Save
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
    And user click button Kirim Pengajuan Kredit Limit
    Then then system will auto generate credit application form in PDF format


Scenario: User validation credit application form will be generated via email
    Given user have received email with generate credit application form (FPK) included apply loan T&C
    When user open the email
    And user will see file name “Form Permohonan Kredit (FPK)” is attached on the email
    And user click the file
    And user will see dynamic field on FPK will auto filled based on debtor data that has been inputted



Scenario: User receive FPK as an attachement when user apply loan only
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru 
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "90"
    And user click button Lanjut Isi Data Supplier 
    #section select Anchor    
    And user fill search anchor "PT Tirta Investama"
    And click button Pilih Supplier Ini   
    And user select year cooperating  "2020"   
    And user click Pilih       
    And user tick on Terms & condition
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
    And user click button Kirim Pengajuan Kredit Limit
    Then then system will auto generate credit application form in PDF format


Scenario: Checking Template of FPK
    Given I have download the FPK
    When I open the PDF file
    And I see Nomor Pengajuan
    And I see Tanggal Pengajuan
    And I see Badan Usaha
    And I see Nama
    And I see Bidang Usaha
    And I see Alamat Utama Kantor/ Usaha
    And I see No.NPWP/ KTP
    And I see Nama Direktur
    And I see Alamat Tinggal saat Ini
    And I see No.Handphone
    And I see Fasilitas yang Dimohon
    And I see Pengajuan Limit
    And I see Pengajuan Tenor
    And I see Jangka Waktu
    And I see Tujuan Pengajuan

Scenario: User validate Once generated loan application form (FPK) will be sent to LMS
     Given user have received email with generate credit application form (FPK) included apply loan T&C
     When I login to LMS
     And I input LOS ID
     And I click button search
     And I click document
     And I click icon View Docs
     And I click type Legal Documents for Business
     Then I see Document Type Form Permohonan Kredit (FPK) have sent to LMS