Feature: Notification Redirection for all loan push apps notification and email 
    In All Loan Push Apps
    As a customer
    I want to click on a push notification when i got reminder from application amar bisnis


Scenario: Validate Push Notif Reminder For Approve Loan Offering 
    Given I have I receive push notif loan offering 
    When I see the the title "Segera setujui pinjaman sebelum batas waktu berakhir"
    And I logout from DSMB
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page loan offering


Scenario: Validate Push Notif Reject VP direct to relevant page
    Given I receive push notif Reject VP on mobile and email 
    When I see the the title "Mohon Maaf, Pinjaman Anda Belum Disetujui. Cek disini"
    And I logut from DSMB
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page loan reject page


Scenario: Validate Push Notif Approve VP direct to relevant page
    Given I receive push notif Approve VP on mobile and email
    When I see the the title "Selamat, Pinjaman Anda Telah Disetujui. Cek disini"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page loan process

Scenario: Validate Push Notif reminder offering expired direct to relevant page
    Given I receive push notif reminder offering expired and email
    When I see the the title "Segera setujui pinjaman sebelum batas waktu berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page 


Scenario: Validate Push Notif Offering expired direct to relevant page
    Given I receive push notif Offering expired and email
    When I see the the title "Penawaran Limit Pinjaman telah berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page 

Scenario: Validate Push notif reminder loan signing direct to relevant page
    Given I receive push notif reminder loan signing and email
    When I see the the title "Segera tanda tangani pinjaman sebelum batas waktu berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page privy signing

Scenario: Validate Push notif Loan Signing Expired direct to relevant page
    Given I receive push notif Loan Signing Expired and email
    When I see the the title "Penawaran Limit Pinjaman telah berakhir"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page 


Scenario: Validate Push Notif Facility activated direct to relavant page
    Given I receive push notif Facility activated and email
    When I see the the title "Limit injaman Anda telah aktif. Cek disini"
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page Active Loan

Scenario: Validate Push Notif Disburse confirm invoice direct to relevant page
    Given I receive push notif Disburse confirm invoice and email 
    When I see the the title ""
    And I click the notif
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page 


Scenario: Validate Push Notif Disburse reject invoice direct to relevant page
    Given I receive push notif Disburse reject and email 
    When I see the the title "Mohon Maaf, Invoice Pembelian Tidak Disetujui. Cek disini"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page Invoice Tidak Disetujui


Scenario: Validate Push notif Disbursement success direct to relevant page
    Given I receive push notif Disburse success and email
    When I see the the title "Pinjaman Anda berhasil dicairkan. Cek disini"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page Active card disburse


Scenario: Validate Push Notif BILL TEMPO WITHIN 3 DAYS
    Given I receive push notif BILL TEMPO_WITHIN 3 DAYS
    When I see the the title "Tagihan Akan Di Autodebet Dalam"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
    Then I direct to page detail tagihan with countdown 3 hari


Scenario: Validate Push Notif BILL AUTODEBIT TODAY
    Given I receive push notif BILL_AUTODEBIT_TODAY
     When I see the the title "Tagihan Berhasil Dibayar"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
   Then I direct to page detail tagihan with countdown 0 hari


Scenario: Validate Push Notif AUTODEBET SUCCESS
    Given I receive push notif AUTODEBET_SUCCESS
    When I see the the title "Tagihan Berhasil Dibayar"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
   Then I direct to page detail tagihan with status Tagihan berhasil dibayar



Scenario: Validate Push Notif AUTODEBET FAILED
    Given I receive push notif AUTODEBET FAILED
     When I see the the title "Autodebet Gagal"
    And I click the notif 
    And I will direct to page login
    And I input username
    And I input password
    And I click login
   Then I direct to page detail tagihan with status Autodebet gagal, Pastikan saldo mencukupi.
