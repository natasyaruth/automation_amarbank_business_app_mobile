@TestLimit
Feature: History Page Limit
    As a customer,
    I want to filter my history limit records
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


Scenario: Access History Dashboard For 'Limit' Bar
    Given I have access history loan to see tab limit
    When I access and click menu bar 'Limit'
    Then I Should see history loan 'Limit'


Scenario: Access History Page Limit For Dalam Proses
    Given I have been access history loan limit to see status "Dalam Proses" in loan limit
    When I access menu bar limit with status "Dalam Proses"
    Then I should see history limit on process


Scenario: Access History Page Limit For Status Aktif
    Given I have been access history loan limit to see status "Aktif" in loan limit
    When I access menu bar limit with status "Aktif"
    Then I should see history limit active

Scenario: Access History Page Limit For Status Selesai
    Given I have been access history loan limit to see status "Selesai" on loan limit
    When I access menu bar limit with status "Selesai"
    Then I should see history limit done