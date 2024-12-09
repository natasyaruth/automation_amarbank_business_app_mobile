
Feature: Apply Combine Journey and Apply Loan Only then system will auto generate credit application form (FPK)
    In Apply Loan Page
    As a customer
    I want to apply loan and debtor submit credit application from mobile apps, then system will auto generate credit application form


Scenario: Scenario: User receive FPK as an attachement when user apply coombine journey PO
    Given User on Main Dashboard    
    When user click button Ajukan Limit Kredit    
    And User select loan type "PO"
    And User on Loan Needs Page
    And User on nominal "Rp50 juta - 5 Miliar"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Bouwheer
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Bouwheer
    #section select Anchor
    When user on buyer cooperating page
    And user fill a field "BowheerName" with "PO test"
    And user select industry type
    And user select the year cooperating    
    And user click Pilih
    And user click button Lanjut Melengkapi Data    
    And user click button Lanjut Proses KYC
    #section KYC Process
    And user choose Business Type "CV"   
    And user click Selanjutnya
    And user take photo eKTP
    And user click "Saya Mengerti"
    And user click "Ambil Foto eKTP"
    And user click "Kirim Foto"
    And user input and save eKTP data
    And user click take "Foto Diri"
    And user click "Kirim Foto"
    And user input and save personal individual data
    And user select Pendidikan Terakhir "S1 (Sarjana)"
    And user input Nama Ibu Kandung "Tuti"
    And user input nama kerabat "Aji"
    And user input nomor kerabat "08572888999200"
    And user upload npwp individu
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select pekerjaan "Wiraswasta/Pengusaha"
    And user select sumber pendapatan "Pemasukan dari Usaha"
    And user click button Simpan Data Pekerjaan
    And system direct to Success screen of KYC process
    Then user click button Lanjut Lengkapi Data Bisnis
    #section KYB Process
    Given user in Profil Bisnis page
    When user input and save "Simpan Profil Bisnis"
    And user input and click "Simpan Daftar Direktur"
    And user input "Alamat Bisnis"
    And user checklist checkbox term and condition
    And user checklist checkbox right and obligations
    And user checklist checkbox privy    
    And user click button Lanjut Upload Dokumen   
    And user validate description prepare the following documents 'MSMEPOCV'
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Apliasi
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
    And user upload document "SPKdok"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then then system will auto generate credit application form in PDF format


Scenario: User receive FPK as an attachement when user apply loan only PO
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "PO"
    And User on Loan Needs Page
    And User on nominal "Rp50 juta - 5 Miliar"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Bouwheer
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Bouwheer
    #section select Anchor
    When user on buyer cooperating page
    And user fill a field "BowheerName" with "PO test"
    And user select industry type
    And user select the year cooperating    
    And user click Pilih
    And user tick on Terms & condition
    And user click button Lanjut Upload Dokumen 
    And user checklist checkbox term and condition
    And user checklist checkbox right and obligations
    And user checklist checkbox privy    
    And user click button Lanjut Upload Dokumen   
    And user validate description prepare the following documents 'MSMEPOCV'
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Apliasi
    And user on Progress Upload Dokumen Page
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload document "ktpcomm"
    And user upload document "npwpcomm"
    And user upload document "SPKdok"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then then system will auto generate credit application form in PDF format


Scenario: User validation credit application form will be generated via email
    Given user have received email with generate credit application form (FPK) included apply loan T&C
    When user open the email
    And user will see file name “Form Permohonan Kredit (FPK)” is attached on the email
    And user click the file
    And user will see dynamic field on FPK will auto filled based on debtor data that has been inputted


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