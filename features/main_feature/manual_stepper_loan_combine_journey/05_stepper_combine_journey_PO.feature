


 Scenario: User apply first loan PO direct type with flagging MSME
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit    
    And User select loan type "PO"
    And User on Loan Needs Page
    And user on stepper Detail Kredit
    And User on nominal "Rp50 juta - 5 Miliar"
    And user input loan tenor "30" 
    And user click button Lanjut Isi Data Bouwheer 
    And user on stepper Data Bouwheer
    #section select Anchor
    When user on buyer cooperating page
    And user fill a field "BowheerName" with "PO test"
    And user select industry type
    And user select the year cooperating  
    And user click Pilih
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
    And user have completed in stepper Proses KYC & KYB
    And user on Stepper Upload Dokumen
    And user validate description prepare the following documents 'POPT.Perusahaan' 
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload docuemnt "nib"
    And user upload document "aktaperusahaan"
    And user upload document "skkemenkumhan"
    And user upload document "npwpofComp"
    And user upload document "KTPOfComm"
    And user upload document "npwpofComm"
    And user upload document "SPKdok"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page