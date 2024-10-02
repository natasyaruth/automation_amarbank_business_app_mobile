Feature: Combine Journey for recording in smartlook
    In DSMB
    As a customer
    I need to validate recording from smartlook

    @C140405
    Scenario: user start from Drop Off KYC In Process Loan
        Given user on main dashboard
        When user click click button drop off
        And user should see personal data page
        Then user finish the KYC process
    @C140406
    Scenario: user validate smartlook wont record from Drop off KYC
        Given user already successfully KYC KYB process
        When user go to smartlook
        And user will not see the record in KYC and KYC

    @C140407
    Scenario: user click button close on Choose Type Loan Page
        Given user on Loan Dashboard page
        When user click button Ajukan Limit Baru
        And user on Choose Type Loan Page
        And user click close button
        Then user will see smartlook will stop record
    @C140408
    Scenario: user validate smartlook until process close on Choose type loan page
        Given user already click Ajukan Limit Baru from Loan Dashboard
        When user go to smartlook
        And user play the record
        Then user will see smartlook record the process and stop until the choose type loan page

    @C140409
    Scenario: user validate smartlook will record KYB and KYC Process in Combine Journey
        Given user already successfully apply loan
        When user go to smartlook
        And user play the record
        Then user will smartlook record the KYC and KYB process

    @C1404010
    Scenario: user start combine journey until successfully apply loan
        Given user on main dashboard
        When user click button Ajukan Limit Kredit
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
        And user go to page list of document for PT.Perusahaan
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
        Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        Then user can see smartlook will stop recording

    @C140411
    Scenario: user validate smartlook will record until combine journey success
        Given user already successfully apply loan
        When user go to smartlook
        And user play the record
        Then user will see smartlook record combine journey until success

    @C140412
    Scenario: user start combine journey until successfully apply loan
        Given user on main dashboard
        When user click button Ajukan Limit Kredit
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
        And user go to page list of document for PT.Perusahaan
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
        Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        Then user can see smartlook will stop recording

    Scenario: user validate smartlook will record until combine journey success
        Given user already successfully apply loan
        When user go to smartlook
        And user play the record
        Then user will see smartlook record combine journey until success


    Scenario: user start combine journey and close the page on Pengajuan Limit Kredit
        Given user on main dashboard
        When user click button Ajukan Limit Kredit
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
        And user go to page list of document for PT.Perusahaan
        And user close the button
        Then user will see that smarlook will stop record

