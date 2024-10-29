@testRepaymentHistory
Feature: History Page Repayment
    As a customer,
    I want to filter my history repayment records
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

    @C001 
    Scenario: Verify bottom sheet "Pilih Fasilitas"
        Given I am on Main Dashboard
        When I click icon history
        And I click menu bar "Tagihan"
        And I click menu bar "Pilih Fasilitas"
        Then I should see bottom sheet page of "Pilih Fasilitas"
        And I click back button to back to history "Tagihan"

    @C002 
    Scenario: Verify bottom sheet "Pilih Status"
        Given I am on Main Dashboard
        When I click icon history
        And I click menu bar "Tagihan"
        And I click menu bar "Pilih Status"
        Then I should see bottom sheet page of "Pilih Status"
        And I click back button to back to history "Tagihan"

    @C003 
    Scenario: Access History Dashboard For "Tagihan" Bar
        Given I have acces history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        Then I should see history "Tagihan"

    @C004
    Scenario: Access History Page Repayment For More Than 1 Facility  
        Given I have been access history repayment to see "Pilih Fasilitas"
        When I click menu bar "Pilih Fasilitas" 
        And I should see bottom sheet "Pilih Fasilitas"
        And I click bottom sheet "Semua"
        Then I should see history "Tagihan" for more than 1 facility

    @C005
    Scenario: Access Histoy Page Repayment For Only 1 Facility
        Given I have been access history repayment to see "Pilih Fasilitas"
        When I click menu bar "Pilih Fasilitas"
        And I should see bottom sheet "Pilih Fasilitas"
        And I click bottom sheet "1 Facility"
        Then I should see history "Tagihan" for more than 1 facility

    @C006
    Scenario: Access History Page Repayment For Semua Status
        Given I have been access history repayment to see "Pilih Status"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Semua"
        Then I should see history "Tagihan" for semua status

    @C007
    Scenario: Access History Page Repayment For Sedang Berjalan
        Given I have been access history repayment to see "Pilih Status"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Sedang Berjalan"
        Then I should see history "Tagihan" for semua sedang berjalan

    @C008
    Scenario: Access History Page Repayment For Selesai
        Given I have been access history repayment to see "Pilih Status"
        When I click menu bar "Pilih Status"
        And I should see bottom sheet "Filter Status"
        And I click bottom sheet "Selesai"
        Then I should see history "Tagihan" for semua selesai
    