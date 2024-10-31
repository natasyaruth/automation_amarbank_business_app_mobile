@TestDisbursement
Feature: History Page Disbursement
    As a customer,
    I want to filter my history disbursement records
    So that I can easily find specific transactions.

    Background: Login with registered account
        Given I am a registered customer with following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Pencairan"

    #Feature Description

    Scenario: Access History Page Disbursement For More Than 1 Facility
        Given I have been acces history disbursement to see "Pilih Fasilitas"
        When I click menu bar "Pilih Fasilitas"
        When I should see bottom sheet "Pilih Fasilitas"
        When I click bottom sheet "Semua"
        Then I should see history "Pencairan" for more than 1 facility

    Scenario: Access Histoy Page Disbursement For Only 1 Facility
        Given I have been acces history disbursement to see "Pilih Fasilitas"
        When I click menu bar "Pilih Fasilitas"
        When I should see bottom sheet "Pilih Fasilitas"
        When I click bottom sheet 1 Facility
        Then I should see history Disbursement for only 1 facility

    
    Scenario: Access History Page Disbursement For Semua Status
        Given I have been acces history disbursement to see "Pilih Status"
        When I click menu bar "Pilih Status"
        When I should see bottom sheet "Filter Status"
        When I click bottom sheet "Semua"
        Then I should see history "Pencairan" for semua status

    
    Scenario: Acces History Page Disbursement For Dalam Proses
        Given I have been acces history disbursement to see "Pilih Status"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Dalam Proses"
        Then I should see history "Pencairan" for dalam proses

    Scenario: Acces History Page Disbursement For Pencairan Berhasil
        Given I have been acces history disbursement to see "Pilih Status"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Pencairan Berhasil"
        Then I should see history "Pencairan" for pencairan berhasil
    
    Scenario: Acces History Page Disbursement For Tidak Disetujui
        Given I have been acces history disbursement to see "Pilih Status"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Tidak Disetujui"
        Then I should see history "Pencairan" for tidak disetujui


