Feature: History Page Disbursement
    As a customer,
    I want to filter my history disbursement records
    So that I can easily find specific transactions.

    Background: Login with registered account
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
        And I click login
        Then I will direct to dashboard

    #Feature Description

    Scenario: Access History Dashboard For "Pencairan" Bar
        Given I have acces history loan to see menu "Pencairan"
        When I acces menu bar "Pencairan"
        Then I should see history "Pencairan"


    Scenario: Access History Page Disbursement For More Than 1 Facility  
        Given I have been acces history disbursement to see "Pilih Fasilitas"
        When I click menu bar "Pilih Fasilitas" 
        And I should see bottom sheet "Pilih Fasilitas"
        And I click bottom sheet "Semua"
        Then I should see history "Pencairan" for more than 1 facility


    Scenario: Access Histoy Page Disbursement For Only 1 Facility
        Given I have been acces history disbursement to see "Pilih Fasilitas"
        When I click menu bar "Pilih Fasilitas"
        And I should see bottom sheet "Pilih Fasilitas"
        And I click bottom sheet "1 Facility"
        Then I should see history "Pencairan" for more than 1 facility


    Scenario: Access History Page Disbursement For Semua Status
        Given I have been acces history disbursement to see "Pilih Status"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Semua"
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

    Scenario: Verify bottom sheet "Pilih Fasilitas"
        Given I am on Main Dashboard
        When I click icon history
        And I click menu bar "Pencairan"
        And I click menu bar "Pilih Fasilitas"
        Then I should see bottom sheet page of "Pilih Fasilitas"
        And I click back button to back to history "Pencairan"

    Scenario: Verify bottom sheet "Pilih Status"
        Given I am on Main Dashboard
        When I click icon history
        And I click menu bar "Pencairan"
        And I click menu bar "Pilih Status"
        Then I should see bottom sheet page of "Pilih Status"
        And I click back button to back to history "Pencairan"


