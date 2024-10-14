Feature: CSAT for Lending
    In order to give feedback after disbursement success
    As a Customer
    I want to give rating and feedback


Background: User must login to home dashboard
    Given I am a registered customer with following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    When I filling in form login with the following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    And I click login
    And I click later
    Then I will direct to main dashboard



Scenario: Validate CSAT will displayed on History Dashboard on AP MSME
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card AP 
        And I will see pop up CSAT


Scenario: Validate CSAT will displayed on History Dashboard on AR MSME
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card AR
        And I will see pop up CSAT

Scenario: Validate CSAT will displayed on History Dashboard on PO MSME
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT

Scenario: Validate CSAT will displayed on History Dashboard on AP Corp
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT

Scenario: Validate CSAT will displayed on History Dashboard on AR Corp
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT

Scenario: Validate CSAT will displayed on History Dashboard on PO Corp
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT

Scenario: Add scenario for give 5 rating on disbursement success
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT
        And I give '5' for disburse success
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       
Scenario: Add scenario for give 4 rating on disbursement success
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT
        And I give '4' for disburse success
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       
Scenario: Add scenario for give 3 rating on disbursement success
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT
        And I give '3' for disburse success
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent

Scenario: Add scenario for give 3 rating on disbursement success
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT
        And I give '3' for disburse success
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent

Scenario: Add scenario for give 2 rating on disbursement success
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT
        And I give '2' for disburse success
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       
Scenario: Add scenario for give 1 rating on disbursement success
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        And I should see history "Pencairan"
        And I click tab Berhasil Dicairkan
        And I click card PO
        And I will see pop up CSAT
        And I give '1' for disburse success
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       
