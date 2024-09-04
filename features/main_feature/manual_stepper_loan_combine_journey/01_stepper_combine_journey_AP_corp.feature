
Feature: Apply First Loan With Flagging Corp Using AP 
 As a customer lead
 I want to apply first loan using AP with flaging Corp


Scenario: User apply first loan AP Anchor with business type PT.Perusahaan and flaging Corp 
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AP"
    And User on Loan Needs Page 
    And User on Stepper Detail Kredit       
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"
    And user click button Lanjut Isi Data Supplier     
    And user on stepper Data Supplier
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
    And user have completed in stepper Proses KYC & KYB
    And user on Stepper Upload Dokumen
    And user validate description prepare the following documents 'CorpAPPT.Perusahaan' 
    And user click buttton Pilih Metode Upload Dokumen    
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "nib"
    And user upload document "aktaperusahaan"
    And user upload document "skkemenkumhan"
    And user upload document "npwpComp"
    And user upload document "ktpofComm"    
    And user upload document "npwpOfComm"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page


Scenario: User apply first loan AP Direct with business type UD and flaging Corp
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And User select loan type "AP"
    And User on Loan Needs Page
    And user on stepper Detail Kredit
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"
    And user click button Lanjut Isi Data Supplier
    And user on stepper Data Supplier
    #section select Anchor
    When user on buyer cooperating page
    And user select another supplier
    And user fill a field "anchorName" with "AP Direct Tes"
    And user select industry type
    And user click Pilih
    And user select the year cooperating
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
    And user click button Ambil Foto eKTP
    And user click button Saya Mengerti
    And user click buton take photo eKTP   
    And user click button  Kirim Foto
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
    And user select "Gaji Bulanan"
    And click Simpan Data Pekerjaan
    And system direct to Success screen
    Then user click button Lanjut Lengkapi Data Bisnis
    #section KYB Process
    Given user in Profil Binis Page
    When user input and click simpan Profil Bisnis
    And user input and click Simpan Pemilik Bisnis   
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
    And user have completed in stepper Proses KYC & KYB
    And user on Stepper Upload Dokumen
    And And user validate description prepare the following documents 'CorpAPPT.Perorangan' 
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "nib"
    And user upload document "aktaperusahaan"   
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page


Scenario: User apply first loan AP Direct with business type Individu and flaging Corp
    Given I click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"
    And user click button Lanjut Isi Data Supplier
    #section select Anchor
    When user on buyer cooperating page
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
    Given user choose Business Type "Individu"
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
    And user input nama ibu kandung "Dewi Astuti"
    And user input nama kerabat "Ramdhan"
    And user input nomor kerbat "867300987"
    And user select tujuan pembuatan rekening "Transaksi Bisnis"
    And user upload document "npwpindividu"
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select jenis pekerjaan "Pegawai Swasta"
    And user select sumber penghasilan "Gaji Bulanan"
    And user select pendapatan bulanan "20-30 juta"
    And user select industri perusahaan  "Industri Kreatif"
    And user input nama perusahaan "Kreatif Indonesia"
    And user checklist checkbox term and condition  
    And user checklist checkbox right and obligations
    And user click button Lanjut Upload Dokumen
    Scenario: User apply first loan AP Direct with business type Individu and flaging Corp
    Given I click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "60"
    And user click button Lanjut Isi Data Supplier
    #section select Anchor
    When user on buyer cooperating page
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
    Given user choose Business Type "Individu"
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
    And user input nama ibu kandung "Dewi Astuti"
    And user input nama kerabat "Ramdhan"
    And user input nomor kerbat "867300987"
    And user select tujuan pembuatan rekening "Transaksi Bisnis"
    And user upload document "npwpindividu"
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select jenis pekerjaan "Pegawai Swasta"
    And user select sumber penghasilan "Gaji Bulanan"
    And user select pendapatan bulanan "20-30 juta"
    And user select industri perusahaan  "Industri Kreatif"
    And user input nama perusahaan "Kreatif Indonesia"
    And user checklist checkbox term and condition  
    And user checklist checkbox right and obligations
    And user click button Lanjut Upload Dokumen
    And user have completed in stepper Proses KYC & KYB
    And user on Stepper Upload Dokumen
    And And user validate description prepare the following documents 'CorpAPIndividu'
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload document "nib"
    And user upload document "aktaperusahaan"   
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page