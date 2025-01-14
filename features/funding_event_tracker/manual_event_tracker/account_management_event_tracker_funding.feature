Feature: Account Management Event Tracker Funding
    As a customer lead
    I want to see event tracker for each step in Funding

@C173067
Scenario: Validate Event Name when User on Page Main Dashboard
    Given I am a registered customer 
    When I fill the form wtih the correct username and password  
    And I click button Login
    Then I will direct to Maindashboard page
    And I go to Firebase
    And I select menu DebugView
    Then I will see event name abb_pg_mainDashboard

@C173068
Scenario: Validate Event Name when User click Button Brankas Banner
    Given I am on Main Dashboard page
    When I click button Brankas Banner
    And I will direct to Page Brankas Dokumen
    And I go to Firebase
    Then I see event name abb_btn_brankasBanner

@C173069
Scenario: Validate Event Name when User click Button Menu Brankas
    Given I am on Main Dashboard page
    When I click button Brankas
    And I will direct to Page Brankas Dokumen
    And I go to Firebase
    Then I see event name abb_btn_menuBrankas

@C173070
Scenario: Validate Event Name when User click Button Menu Transfer 
    Given I am on Main Dashboard page
    When I click button Menu Transfer
    And I will direct to Page Daftar Penerima
    And I go to Firebase
    Then I see event name abb_btn_menuTransfer

@C173071
Scenario: Validate Event Name when User click Button Menu Lainnya 
    Given I am on Main Dashboard page
    When I click button Menu Lainnya
    And I will direct to Page Lainnya
    And I go to Firebase
    Then I see event name abb_btn_menuLainnya

@C173072
Scenario: Validate Event Name when User click Button Gunakan Brankas
    Given I am on Brankas Dokumen Information Page
    When I click button Gunakan Brankas
    And I will direct to Page Brankas Dokumen
    And I go to Firebase
    Then I see event name abb_btn_gunakanBrankas

@C173073
Scenario: Validate Event Name when User on Page Brankas Dokumen 
    Given I am on Brankas Dokumen Information Page
    When I click button Gunakan Brankas
    And I will direct to Page Brankas Dokumen
    And I go to Firebase
    Then I see event name abb_pg_brankasDokumen

@C173074
Scenario: Validate Event Name when User click Button Brankas Fab
    Given I am on Brankas Dokumen Page
    When I click button Brankas Fab
    And I will show pop up Brankas Fab
    And I go to Firebase
    Then I see event name abb_btn_brankasFab

@C173075
Scenario: Validate Event Name when User on Pop Up Brankas Fab
    Given I am on Brankas Dokumen Page
    When I click button Brankas Fab
    And I will show pop up Brankas Fab
    And I go to Firebase
    Then I see event name abb_pop_brankasFab

@C173076
Scenario: Validate Event Name when User click Button Upload Dokumen on Pop Up Brankas Fab
    Given I am on pop up Brankas Fab
    When I click button Upload Dokumen
    And I will direct to local device directory
    And I go to Firebase
    Then I see event name abb_btn_brankasFabUploadDok

@C173077
Scenario: Validate Event Name when User click Button Buat Folder Dok on Pop Up Brankas Fab
    Given I am on pop up Brankas Fab
    When I click button Upload Dokumen
    And I will direct to local device directory
    And I go to Firebase
    Then I see event name abb_btn_brankasFabBuatFolder

@C173078
Scenario: Validate Event Name when User see Dokumen Uploaded on Pop Up Brankas Fab
    Given I am on local device directory
    When I choose file to upload
    And I will direct to pop up Upload Dokumen Fab
    And I go to Firebase
    Then I see event name abb_pg_dokUploadedBrankas

@C173079
Scenario: Validate Event Name when User click Button Simpan Dokumen on Pop Up Brankas Fab
    Given I am on pop up Upload Dokumen Fab
    When I click button Simpan Dokumen
    And I will direct to Page Brankas Dokumen
    And I go to Firebase
    Then I see event name abb_btn_brankasSimpanDokumen

@C173080
Scenario: Validate Event Name when User on Pop Up Folder Baru 
    Given I am on pop up Brankas Fab
    When I click button Buat Folder Baru
    And I will show pop up Buat Folder Baru
    And I go to Firebase
    Then I see event name abb_pg_folderBaruBrankas

@C173081
Scenario: Validate Event Name when User on Page Menu Lainnya
    Given I am on Main Dashboard page
    When I click button Menu Lainnya
    And I will direct to Page Lainnya
    And I go to Firebase
    Then I see event name abb_pg_menuLainnya

@C173082
Scenario: Validate Event Name when User click Button Permintaan Buku Cek
    Given I am on page Lainnya
    When I click button Menu Buku Cek
    And I will direct to page Buku Cek
    And I go to Firebase
    Then I see event name abb_btn_permintaanBukuCek

@C173083
Scenario: Validate Event Name when User on Page Permintaan Buku Cek
    Given I am on page Lainnya
    When I click button Menu Buku Cek
    And I will direct to page Buku Cek
    And I go to Firebase
    Then I see event name abb_btn_permintaanBukuCek

@C173084
Scenario: Validate Event Name when User click Button Lanjutkan Permintaan on Page Permintaan Buku Cek
    Given I am on page Buku Cek
    When I click button Lanjutkan Permintaan
    And I see page Permintaan Anda sedang diproses
    And I go to Firebase
    Then I see event name abb_btn_lanjutkanPermintaanBukuCek

@C173085
Scenario: Validate Event Name when User on Page Permintaan Buku Cek Sukses
    Given I am on page Buku Cek
    When I click button Lanjutkan Permintaan
    And I see page Permintaan Anda sedang diproses
    And I go to Firebase
    Then I see event name abb_pg_permintaanBukuCekSuccess