Feature: Notification Redirection for all loan push apps notification and email
    In All Loan Push Apps
    As a customer
    I want to click on a push notification or email notification and should be redirected to the relevant screen if logged in

    @C163674
    Scenario: Validate Push Notif Apply Success direct to relevant page
        Given I receive push notif Apply Success on mobile
        When I see the the title "Pengajuan pinjaman Anda berhasil Dikirim. Cek disini"
        And I click the notif
        Then I direct to page apply progres loan

    @C163675
    Scenario: Validate Email notification Apply success on email direct to relevant page
        Given I recieve email notification
        When I see the title "Pengajuan Pinjaman Anda Berhasil Dikirim"
        And I click the email
        And I see "Skema"
        And I see "Nama Supplier"
        And I click button Cek Proses Disini
        Then I direct to page apply progres loan


    @C163676
    Scenario: Validate Push Notif Reject VP direct to relevant page
        Given I receive push notif Reject VP on mobile and email
        When I see the the title "Mohon Maaf, Pinjaman Anda Belum Disetujui. Cek disini"
        And I click the notif
        Then I direct to page detail rejected limit

    @C163677
    Scenario: Validate email Notification Reject VP direct to relevant page
        Given I receive push notif Reject VP on mobile and email
        When I see the the title "Pinjaman Anda Belum Disetujui"
        And I click the notif
        And I see "Skema"
        And I see "Supplier"
        And I clickk button Buka Aplikasi
        Then I direct to page detail rejected limit


    @C163678
    Scenario: Validate Push Notif Approve VP direct to relevant page
        Given I receive push notif Approve VP on mobile and email
        When I see the the title "Selamat, Pinjaman Anda Telah Disetujui. Cek disini"
        And I click the notif
        Then I direct to page loan process with status Selamat, Limit Pinjaman Telah Aktif

    @C163679
    Scenario: Validate email Notification Approve VP direct to relevant page
        Given I receive push notif Approve VP on mobile and email
        When I see the the title "Pinjaman Anda Telah Disetujui."
        And I click the email
        And I see "Limit yang disetujui"
        And I see "Tenor yang disetujui"
        And I see "Bunga per tahun"
        And I see "Supplier"
        And I see button Buka Aplikasi and direct to page loan process with status Selamat, Limit Pinjaman Telah Aktif

    @C163680
    Scenario: Validate Push Notif reminder offering expired direct to relevant page
        Given I receive push notif reminder offering expired and email
        When I see the the title "Segera setujui pinjaman sebelum batas waktu berakhir"
        And I click the notif
        Then I direct to page

    @C163681
    Scenario: Validate Push Notif Offering expired direct to relevant page
        Given I receive push notif Offering expired and email
        When I see the the title "Penawaran Limit Pinjaman telah berakhir"
        And I click the notif
        Then I direct to page

    @C163682
    Scenario: Validate Push notif reminder loan signing direct to relevant page
        Given I receive push notif reminder loan signing and email
        When I see the the title "Segera tanda tangani pinjaman sebelum batas waktu berakhir"
        And I click the notif
        Then I direct to page privy signing


    @C163683
    Scenario: Validate Push notif Loan Signing Expired direct to relevant page
        Given I receive push notif Loan Signing Expired and email
        When I see the the title "Penawaran Limit Pinjaman telah berakhir"
        And I click the notif
        Then I direct to page


    @C163684
    Scenario: Validate Push Notif Facility activated direct to relavant page
        Given I receive push notif Facility activated and email
        When I see the the title "Limit injaman Anda telah aktif. Cek disini"
        And I click the notif
        Then I direct to page Active Loan

    @C163685
    Scenario: Validate Push Notif Disburse confirm invoice direct to relevant page
        Given I receive push notif Disburse confirm invoice and email
        When I see the the title "Invoice Pembelian telah terverifikasi. Cek disini"
        And I click the notif
        Then I direct to page Pencairan Dalam Proses


    Scenario: Validate email Notification Disburse confirm invoice
        Given I receive push notif disburse confirm invoice  to email
        When I see the the title "Pemberitahuan: Invoice Pembelian Telah Diverifikasi"
        And I click the email
        And I see "Nominal Pencairan"
        And I see "Tanggal Verifikasi"
        And I see "Supplier"
        And I see button Cek Proses Disini

    @C163686
    Scenario: Validate Push Notif Disburse reject invoice direct to relevant page
        Given I receive push notif Disburse reject and email
        When I see the the title "Mohon Maaf, Invoice Pembelian Tidak Disetujui. Cek disini"
        And I click the notif
        Then I direct to page Invoice Tidak Disetujui


    Scenario: Validate email Notification Disburse reject invoice
        Given I receive push notif disburse confirm invoice  to email
        When I see the the title "Pemberitahuan: Invoice Pembelian Tidak Disetujui"
        And I click the email
        And I see "Nominal Invoice"
        And I see "Invoice Date"
        And I see "Supplier"
        And I see button Lihat Status Invoice

    @C163687
    Scenario: Validate Push notif Disbursement success direct to relevant page
        Given I receive push notif Disburse success and email
        When I see the the title "Pinjaman Anda berhasil dicairkan. Cek disini"
        And I click the notif
        Then I direct to page Active card disburse


    Scenario: Validate email Notification Disburse success
        Given I receive push notif disburse confirm invoice  to email
        When I see the the title "Pemberitahuan: Pinjaman Berhasil Dicairkan."
        And I click the email
        And I see "Nominal Pencairan"
        And I see "Tanggal Pencairan"
        And I see "Supplier"
        And I see button Cek Tagihan Pinjaman

    @C163688
    Scenario: Validate Push Notif BILL TEMPO WITHIN 3 DAYS
        Given I receive push notif BILL TEMPO_WITHIN 3 DAYS
        When I see the the title "Tagihan Akan Di Autodebet Dalam"
        And I click the notif
        Then I direct to page detail tagihan with countdown 3 hari

    @C163689
    Scenario: Validate Push Notif BILL AUTODEBIT TODAY
        Given I receive push notif BILL_AUTODEBIT_TODAY
        When I see the the title "Tagihan Akan Di Autodebet Dalam"
        And I click the notif
        Then I direct to page detail tagihan with countdown 0 hari

    @C163690
    Scenario: Validate Push Notif AUTODEBET SUCCESS
        Given I receive push notif AUTODEBET_SUCCESS
        When I see the the title "Tagihan Berhasil Dibayar"
        And I click the notif
        Then I direct to page detail tagihan with status Tagihan berhasil dibayar


    @C163691
    Scenario: Validate Push Notif AUTODEBET FAILED
        Given I receive push notif AUTODEBET FAILED
        When I see the the title "Autodebet Gagal"
        And I click the notif
        Then I direct to page detail tagihan with status Autodebet gagal, Pastikan saldo mencukupi.

