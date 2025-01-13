Feature: Event Tracker Lending Disbursement
    As a customer lead
    I want to see event tracker disbursement


Scenario: Validate event name on Main Dashboard 
    Given I have Active Limit
    And I go to Firebase
    And I will see event name abb_pg_mainDashboard
    Then I will see user property business_type = MSME

Scenario: Validate event name on button Gunakan Limit
    Given I have active limit
    When I click Gunakan Limit
    And I go to firebase
    And I will see event name abb_btn_gunakanLimit_click
    And I will see event parameter loan_type = AP
    And I will see event parameter anchor_type = Direct Loan 

Scenario: validate event name on Disbursement Page
    Given I have active limit
    When I click Gunakan Limit
    And I go to firebase
    And I am on Disbursement type AP Anchor page 
    And I see event name abb_pg_disbursementLimit

Scenario: Validate event name on Button Ajukan Pencairan
    Given I am on AP Anchor page disbursement
    When I click button Ajukan Pencairan
    And I will see event name abb_btn_applyDisbursement

Scenario: Validate event name on Upload Invoice Source
    Given I am on AP Anchor page disbursement
    When I click button Ajukan Pencairan
    And I will see bottom sheet metode upload Invoice
    And I go to firebase
    And I will see event name abb_pop_uploadInvoiceSource

Scenario: Validate event name on Metode Upload Invoice
    Given I see bottom sheet metode upload Invoice
    When I click Ambil dari kamera
    And I go to firebase
    And I will see event name abb_btn_selectCamera
    And I click Ambil dari galer
    And I will see event name abb_btn_selectGallery
    And I click upload dari perangkat lain
    And I will see event name abb_btn_selectDelegation

Scenario: Validate event name on Take Photo Invoice
    Given I see bottom sheet metode upload Invoice
    When I click Ambil dari kamera
    And I am on mode take a picture
    And I will see event name abb_pg_takePhotoInvoice
    And I click Photo
    And I will see event name abb_btn_takePhotoInvoice

Scenario: Validate event name on Detail Invoice
    Given I have take a picture of Invoice
    When I am on Detil Invoice page
    And I go to firebase
    And I will see event name abb_pg_detailInvoice
    And I click button Lanjut Konfirmasi
    And I will see event name abb_btn_confirmationNext

Scenario: Validate event name on Konfirmasi Invoice
    Given I have take a picture of Invoice
    When I am on Detil Invoice page
    And I click button Lanjut Pembayaran
    And I am on Detil Pengajuan page
    Then I will see event name abb_pg_confirmationInvoice

Scenario: validate event name on Proses Pengecekan Invoice
    Given I am on Detil Pengajuan page
    When I click button Lanjut Ajukan Pencairan
    And I am on INPUT pin page
    And I will direct to page Proses Pengecekan Invoice
    And I go to firebase
    Then I will see event name abb_pg_invoiceChecking

Scenario: Validate event name on Disbursement Calculation
    Given I have receive push notif Pencairan disetujui
    When I click the notif
    And I will direct to page Perhitungan Pencairan
    And I go to firebase
    And I see event name abb_pg_calculationDisbursement

Scenario: validate event name on abb_pg_sendPDCInfo
    Given I am on Perhitungan Pencairan
    When I click button Terima Pencairan
    And I input pin
    And I direct to page send Product
    And I go to firebase
    Then I will see event name abb_pg_sendPDCInfo
