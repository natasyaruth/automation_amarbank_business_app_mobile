
@TestRepayment1
Feature: History Page Repayment
    As a customer,
    I want to filter my history repayment records
    So that I can easily find specific transactions.

    @C164250
    Scenario: Access History Page Repayment For More Than 1 Facility
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Fasilitas"
        When I should see bottom sheet "Pilih Fasilitas"
        When I click bottom sheet more than 1 facility repayment
        Then I should see history "Tagihan" for more than 1 facility

    @C164251
    Scenario: Access Histoy Page Repayment For Only 1 Facility
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Fasilitas"
        And I should see bottom sheet "Pilih Fasilitas"
        And I click bottom sheet only 1 Facility repayment
        Then I should see history "Tagihan" for more than 1 facility


    @C164252
    Scenario: Access History Page Repayment For Semua Status
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Semua"
        Then I should see history "Tagihan" for semua status

    @C164253
    Scenario: Access History Page Repayment For Sedang Berjalan
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Sedang Berjalan"
        Then I should see history "Tagihan" for semua sedang berjalan

    @C164254
    Scenario: Access History Page Repayment For Selesai
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Selesai"
        Then I should see history "Tagihan" for semua selesai

    @C164255
    Scenario: Access History Page Repayment For more than 1 Facility and status Sedang berjalan
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Fasilitas"
        When I should see bottom sheet "Pilih Fasilitas"
        When I click bottom sheet more than 1 facility repayment
        Then I should see history "Tagihan" for more than 1 facility
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Sedang Berjalan"
        Then I should see history "Tagihan" for semua sedang berjalan

    @C164256
    Scenario: Access History Page Repayment For more than 1 Facility and status Selesai
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Fasilitas"
        When I should see bottom sheet "Pilih Fasilitas"
        When I click bottom sheet more than 1 facility repayment
        Then I should see history "Tagihan" for more than 1 facility
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Selesai"
        Then I should see history "Tagihan" for semua sedang berjalan

    @C164257
    Scenario: Access History Page Repayment For more than 1 Facility and status Sedang berjalan
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Fasilitas"
        When I should see bottom sheet "Pilih Fasilitas"
        When I click bottom sheet only 1 Facility repayment
        Then I should see history "Tagihan" for more than 1 facility
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Sedang Berjalan"
        Then I should see history "Tagihan" for semua sedang berjalan


    Scenario: Access History Page Repayment For more than 1 Facility and status Selesai
        Given I am a registered customer with following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID   | ecap2158 |
            | password | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click menu lihat detail pinjaman
        When I click menu history
        Then I acces menu bar "Tagihan"
        When I click menu bar "Pilih Fasilitas"
        When I should see bottom sheet "Pilih Fasilitas"
        When I click bottom sheet only 1 Facility repayment
        Then I should see history "Tagihan" for more than 1 facility
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Selesai"





