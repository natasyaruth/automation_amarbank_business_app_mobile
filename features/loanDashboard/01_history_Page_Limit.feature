Feature: History Page Limit
    As a customer,
    I want to filter my history limit records
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

Scenario: Access History Dashboard For "Limit" Bar
    Given I have access history loan to see menu "Limit"
    When I access menu bar "Limit"
    Then I Should see history "Limit"


Scenario: Access History Page Limit For Dalam Proses
    Given I have been access history loan limit to see status "Dalam Proses"
    When I access menu bar limit with status "Dalam Proses"
    Then I should see history limit on process

Scenario: Access History Page Limit For Status Dalam Proses
    Given I have been access history loan limit to see status "Dalam Proses"
    When I access menu bar limit with status "Dalam Proses"
    Then I should see history limit on process

Scenario: Access History Page Limit For Status Aktif
    Given I have been access history loan limit to see status "Aktif"
    When I access menu bar limit with status "Aktif"
    Then I should see history limit on process

Scenario: Access History Page Limit For Status Selesai
    Given I have been access history loan limit to see status "Selesai"
    When I access menu bar limit with status "Selesai"
    Then I should see history limit on process