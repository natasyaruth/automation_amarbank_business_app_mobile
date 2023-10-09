Feature: User transfer RTOL
    In order to transfer
    As a customer
    I want to make transfer RTOL


    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        Then I will direct to dashboard

    Scenario: User failed to get active balance
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        Then I can see pop up message "gagal memuat saldo aktif"
        And I can see refresh button
        And I can see toastbar "Data berhasil disimpan ke daftar penerima"


    Scenario: User close buttom sheet category transaction
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I choose kategori 'Pembayaran'
        Then I close buttom sheet category

    Scenario: User close buttom sheet sub category transaction
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I choose kategori 'Pembayaran'
        And I choose sub kategori ''
        Then I close buttom sheet category

    Scenario: User empty category field
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input saldo
        And I click pilih layanan transfer
        Then I can see message "Kategori wajib diisi"

    Scenario: User input nominal higher than active balance
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal higher than active balance
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I click pilih layanan transfer
        Then I can see message "saldo aktif tidak mencukupi"

    Scenario: User input notes with symbol and emoji
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan with symbol and emoji
        And I click pilih layanan transfer
        Then I can see message "Catatan tidak menggunakan emoji dan symbol"

    Scenario: User transfer detail with RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.55.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        Then I can see BI Fast and RTOL
        And i choose layanan transfer 'RTOL'

    Scenario: User confirmation transfer with RTOL
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        Then I click transfer sekarang

    Scenario: User transfer with RTOL and input wrong password
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input wrong password
        Then I can see message "Input yang dimasukkan salah, silahkan coba lagi"

    Scenario: User transfer with RTOL and input wrong password
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input wrong password
        Then I can see message "Input yang dimasukkan salah, silahkan coba lagi"

    Scenario: User transfer with RTOL and input wrong PIN once
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input wrong PIN
        Then I can see message "Input yang dimasukkan salah, silahkan coba lagi"

    Scenario: User transfer with RTOL and input wrong password twice
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input wrong PIN
        Then I can see message "Input yang dimasukkan salah, silahkan coba lagi"
        And I can see warning message "Fitur transfer akan diblokir selama 30 menit
    jika kamu salah PIN 3 (tiga) kali"

    Scenario: User transfer with RTOL and input wrong password three times
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input wrong PIN
        Then I can see pop message "PIN Transaksimu Terkunci"
        And I click Kembali ke Dashboard

    Scenario: User get failed transfer
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input PIN
        Then I get message "Transfer gagal diproses, tapi jangan khawatir saldo Anda tidak terpotong"
        And I click copy button
        And I can click "Coba Metode Lain"

    Scenario: User successfully transfer
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input PIN
        Then I successfully transferred

    Scenario: User verify page successful to transfer 
        

        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779002'
        And I click on next
        And I input nominal 'Rp.35.000.000'
        And I choose kategori "Pembayaran"
        And I choose sub kategori "Pinjaman"
        And I input catatan
        And I click pilih layanan transfer
        And i choose layanan transfer 'RTOL'
        And I click transfer
        And I click transfer sekarang
        And Input PIN
        Then I successfully transfer

