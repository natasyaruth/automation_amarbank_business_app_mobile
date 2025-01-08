Feature: Transaction Event Tracker Funding
    As a customer lead
    I want to see event tracker for each step in Funding

@C173091
Scenario: Validate Event Name when User on Page Daftar Penerima
    Given I am on Main Dashboard page
    When I click button Menu Transfer
    And I will direct to Page Daftar Penerima
    And I go to Firebase
    Then I see event name abb_pg_daftarPenerima

@C173092
Scenario: Validate Event Name when User click button Transfer ke Penerima Baru on Page Daftar Penerima
    Given I am on page Daftar Penerima
    When I click button Transfer ke Penerima Baru
    And I will direct to Page Transfer ke Penerima
    And I go to Firebase
    Then I see event name abb_btn_transferKePenerimaBaru

@C173093
Scenario: Validate Event Name when User on Page Pop Up Transfer Buat PIN
    Given I am on page Daftar Penerima with user dont have PIN
    When I click button Transfer ke Penerima Baru
    And I will see pop up Buat PIN
    And I go to Firebase
    Then I see event name abb_pop_transferBuatPin

@C173094
Scenario: Validate Event Name when User click Button Buat PIN
    Given I am on pop up Buat PIN
    When I click button Buat PIN
    And I will direct to page PIN 
    And I go to Firebase
    Then I see event name abb_btn_transferBuatPin

@C173095
Scenario: Validate Event Name when User click Button Kembali Ke Dashboard
    Given I am on pop up Buat PIN
    When I click button Kembali ke Dahsboard
    And I will direct to Dashboard page
    And I go to Firebase
    Then I see event name abb_btn_transferKembaliKeDashboard

@C173096
Scenario: Validate Event Name when User on Page Transfer ke Penerima Beneficiary
    Given I am on page Daftar Penerima
    When I click button Transfer ke Penerima Baru
    And I will direct to Page Transfer ke Penerima
    And I go to Firebase
    Then I see event name abb_pg_transferKePenerimaBeneficiary

@C173097
Scenario: Validate Event Name when User click Button Selanjutnya on page Transfer Ke Penerima
    Given I am on page Transfer ke Penerima
    When I click button Selanjutnya
    And I will see page Transfer ke Penerima Detail
    And I go to Firebase
    Then I see event name abb_btn_transferSelanjutnya

@C173098
Scenario: Validate Event Name when User on Page Transfer ke Penerima Detail
    Given I am on page Transfer ke Penerima
    When I click button Selanjutnya
    And I will see page Transfer ke Penerima Detail
    And I go to Firebase
    Then I see event name abb_pg_transferKePenerimaDetail

@C173099
Scenario: Validate Event Name when User click Button Pilih Layanan 
    Given I am on page Transfer ke Penerima Detail
    When I click button Layanan Transfer
    And I will direct to Page Layanan Transfer
    And I go to Firebase
    Then I see event name abb_btn_pilihLayananTransfer

@C173100
Scenario: Validate Event Name when User click Button Overbooking 
    Given I am on page Transfer ke Penerima Detail
    When I click button Selanjutnya
    And I will direct to Page Detail Transfer
    And I go to Firebase
    Then I see event name abb_btn_overBooking

@C173101
Scenario: Validate Event Name when User on Page Layanan Transfer
    Given I am on page Transfer ke Penerima Detail
    When I click button Layanan Transfer
    And I will direct to Page Layanan Transfer
    And I go to Firebase
    Then I see event name abb_pg_layananTransfer

@C173102
Scenario: Validate Event Name when User click Button Transfer 
    Given I am on page Layanan Transfer
    When I click button Transfer
    And I will direct to Page Konfirmasi Transfer
    And I go to Firebase
    Then I see event name abb_btn_transfer

@C173103
Scenario: Validate Event Name when User on Page Konfirmasi Transfer 
    Given I am on page Layanan Transfer
    When I click button Transfer
    And I will direct to Page Konfirmasi Transfer
    And I go to Firebase
    Then I see event name abb_pg_konfirmasiTransfer

@C173104
Scenario: Validate Event Name when User click Button Transfer Sekarang 
    Given I am on page Konfirmasi Transfer
    When I click button Transfer Sekarang
    And I will direct to Page PIN
    And I go to Firebase
    Then I see event name abb_btn_transferSekarang

@C173105
Scenario: Validate Event Name when User on Page Transfer Masukan PIN
    Given I am on page Konfirmasi Transfer
    When I click button Transfer Sekarang
    And I will direct to Page PIN
    And I go to Firebase
    Then I see event name abb_pg_transferMasukkanPin

@C173106
Scenario: Validate Event Name when User on Page Transfer Berhasil
    Given I am on page PIN
    When I input valid PIN while service has no issue
    And I will direct to Page Transfer Berhasil
    And I go to Firebase
    Then I see event name abb_pg_transferBerhasil

@C173107
Scenario: Validate Event Name when User on Page Waiting Approval 
    Given I am on page PIN
    When I input valid PIN with user maker
    And I will direct to Page Menunggu Persetujuan Transaksi
    And I go to Firebase
    Then I see event name abb_pg_waitingApproval

@C173108
Scenario: Validate Event Name when User on Page Transfer Failed
    Given I am on page PIN
    When I input valid PIN while service has issue
    And I will direct to Page Transfer gagal diproses
    And I go to Firebase
    Then I see event name abb_pg_transferFailed