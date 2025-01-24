Feature: Notification Redirection for all loan push apps notification and email 
    In All Loan Push Apps
    As a customer
    I want to click on a push notification when i have not log in

@C163692
Scenario: Validate Push Notif Apply Success direct to relevant page when session is expired
    Given I have I receive push notif Apply Success on mobile
    When I see the the title "Pengajuan pinjaman Anda berhasil Dikirim. Cek disini"
    And I logout from DSMB
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page loan offering

@C163693
Scenario: Validate Push Notif Reject VP direct to relevant page when session is expired
    Given I receive push notif Reject VP on mobile and email 
    When I see the the title "Mohon Maaf, Pinjaman Anda Belum Disetujui. Cek disini"
    And I logut from DSMB
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page loan reject page

@C163694
Scenario: Validate Push Notif Approve VP direct to relevant page when session is expired
    Given I receive push notif Approve VP on mobile and email
    When I see the the title "Selamat, Pinjaman Anda Telah Disetujui. Cek disini"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page loan process

@C163695
Scenario: Validate Push Notif offering reminder  reminder direct to relevant page when session is expired
    Given I receive push notif reminder offering reminder and email
    When I see the the title "Segera setujui pinjaman sebelum batas waktu berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page loan offering page

@C163696
Scenario: Validate Push Notif Offering expired direct to relevant page when session is expired
    Given I receive push notif Offering expired and email
    When I see the the title "Penawaran Limit Pinjaman telah berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page with status "Penawaran limit sudah berakhir" 

@C163697
Scenario: Validate Push notif loan signing reminder  direct to relevant page when seesion is expired
    Given I receive push notif reminder loan signing and email
    When I see the the title "Segera tanda tangani pinjaman sebelum batas waktu berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page privy signing


Scenario: Validate email notification offering expired direct to relevant page when session is expired
    Given I receive push notif and email offering expired
    When I see the title "Pencairan Disetujui"
    And I click the email
    And I see Limit yang disetujui
    And I see Tenor yang disetujui
    And I see Bunga per bulan
    And I see Skema
    And I see Supplier
    And I click button Beri Alasan
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I will direct to page Penawaran limit sudah berakhir




@C163698
Scenario: Validate Push notif Loan Signing Expired direct to relevant page when session is expired
    Given I receive push notif Loan Signing Expired and email
    When I see the the title "Penawaran Limit Pinjaman telah berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page status "Penawaran limit sudah berakhir"

@C163699
Scenario: Validate Push Notif Facility activated direct to relavant page when session is expired
    Given I receive push notif Facility activated and email
    When I see the the title "Limit injaman Anda telah aktif. Cek disini"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page Active Loan


Scenario: Validate Push notif disburse after the back office approves the disbursement when session is expired
    Given I receive push notif and email Disbursement Approved
    When I see the title "Pencairan Disetujui. Cek kembali perhitungan pencairan sebelum melanjutkan proses."
    And I click the notification
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page Perhitungan Pencairan

Scenario: Validate email notification disbursement approved from back office when session is expired
    Given I receive push notif and email Disbursement Approved
    When I see the title "Pencairan Disetujui"
    And I click the email
    And I see button Cek Disini
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I will direct to page Perhitungan Pencairan


@C163700
Scenario: Validate Push Notif Disburse confirm invoice direct to relevant page when session is expired
    Given I receive push notif Disburse confirm invoice and email 
    When I see the the title ""
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page 


@C163701
Scenario: Validate Push Notif Disburse reject invoice direct to relevant page when session is expired
    Given I receive push notif Disburse reject and email 
    When I see the the title "Mohon Maaf, Invoice Pembelian Tidak Disetujui. Cek disini"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page Invoice Tidak Disetujui


@C163702
Scenario: Validate Push notif Disbursement success direct to relevant page when session is expired
    Given I receive push notif Disburse success and email
    When I see the the title "Pinjaman Anda berhasil dicairkan. Cek disini"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page Active card disburse

@C163703
Scenario: Validate Push Notif BILL TEMPO WITHIN 3 DAYS when session is expired
    Given I receive push notif BILL TEMPO_WITHIN 3 DAYS
    When I see the the title "Tagihan Akan Di Autodebet Dalam"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page detail tagihan with countdown 3 hari

@C163704
Scenario: Validate Push Notif BILL AUTODEBIT TODAY when session is expired
    Given I receive push notif BILL_AUTODEBIT_TODAY
     When I see the the title "Tagihan Berhasil Dibayar"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
   Then I direct to page detail tagihan with countdown 0 hari

@C163705
Scenario: Validate Push Notif AUTODEBET SUCCESS when session is expired
    Given I receive push notif AUTODEBET_SUCCESS
    When I see the the title "Tagihan Berhasil Dibayar"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
   Then I direct to page detail tagihan with status Tagihan berhasil dibayar


@C163706
Scenario: Validate Push Notif AUTODEBET FAILED when session is expired
    Given I receive push notif AUTODEBET FAILED
     When I see the the title "Autodebet Gagal"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
   Then I direct to page detail tagihan with status Autodebet gagal, Pastikan saldo mencukupi.
