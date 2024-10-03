Feature: Apply First Loan With Flagging MSME Using AP Direct
    As a customer lead
    I want to apply first loan using AP Direct with flaging MSME

    @FunctTestLendingSprint5
    Scenario: User apply first loan AP Direct with bussiness type UD and flaging MSME
        Given User on Main Dashboard
        When user click button Ajukan Limit Kredit
        And User select loan type "AP"
        And User on Loan Needs Page
        And user on Stepper Detail Kredit
        And User choose nominal "Rp50 juta - 5 Miliar"
        And user input loan tenor "30"
        And user click button Lanjut Isi Data Supplier
        And user on stepper Data Supplier
        #section select Anchor
        And user on buyer cooperating page
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
        Given user choose Business Type "UD"
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
        And user checklist checkbox right and obligations
        And user checklist checbox privy
        And user click button Lanjut Upload Dokumen
        And user have completed in stepper Proses KYC & KYB
        And user on Stepper Upload Dokumen
        And user validate description prepare the following documents 'MSMEAPPT.Perorangan'
        And user click buttton Pilih Metode Upload Dokumen
        #Upload Dokumen from Aplikasi
        And user click button Langsung dari Aplikasi
        And user on Progress Upload Dokumen Page
        And user upload document "nib"
        And user upload document "aktaperusahaan"
        And user upload document "3contohInvoicewithSupplier"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button Perbaharui Progres
        And user click button Kirim Pengajuan Kredit Limit
        Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        And user on monitoring loan process page

    @FunctTestLendingSprint5
    Scenario: User apply first loan AP Anchor with bussiness type PT Perusahaan flaging MSME
        Given User on Main Dashboard
        When user click button Ajukan Limit Kredit
        When user click button "ajukan pinjaman"
        And User select loan type "AP"
        And User on Loan Needs Page
        And user on stepper Detail Kredit
        And User choose nominal "Rp50 juta - 5 Miliar"
        And user input loan tenor "30"
        And user click button Lanjut Isi Data Supplier
        And user on stepper Data Supplier
        #section select Anchor
        And user on buyer cooperating page
        And user fill search anchor "PT Tirta Investama"
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
        And user checklist checkbox right and obligations
        And user checklist checbox privy
        And user click button Lanjut Upload Dokumen
        And user have completed in stepper Proses KYC & KYB
        And user on Stepper Upload Dokumen
        And user validate description prepare the following documents 'MSMEAPPT.Perusahaan'
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
        And user upload document "3contohInvoicewithSupplier"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button Perbaharui Progres
        And user click button Kirim Pengajuan Kredit Limit
        Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        And user on monitoring loan process page
