Feature: CSAT for Lending
    In order to give feedback after repyament success
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



Scenario: Validate CSAT will displayed after AP MSME repyament success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai
        And I click card AP repayment success
        And I will see pop up CSAT


Scenario: Validate CSAT will displayed after AR MSME repyament success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai        
        And I click card AR repayment success
        And I will see pop up CSAT

Scenario: Validate CSAT will displayed after PO MSME repyament success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card PO repayment success
        And I will see pop up CSAT

Scenario: Validate CSAT will displayed after AP Corp repyament success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card AP repayment success
        And I will see pop up CSAT

Scenario: Validate CSAT will displayed after AR Corp repyament success
       Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card AR repayment success
        And I will see pop up CSAT


Scenario: Add scenario for give 5 rating on repayment success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card AR
        And I will see pop up CSAT
        And I give '5' for disburse success
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       
Scenario: Add scenario for give 4 rating on disbursement success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card AP
        And I will see pop up CSAT
        And I give '4' for disburse success
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       

Scenario: Add scenario for give 3 rating on disbursement success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card PO
        And I will see pop up CSAT
        And I give '3' for disburse success
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent

Scenario: Add scenario for give 2 rating on disbursement success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card AP
        And I will see pop up CSAT
        And I give '2' for disburse success
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       
Scenario: Add scenario for give 1 rating on disbursement success
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        And I should see history "Tagihan"
        And I click tab Selesai      
        And I click card AR
        And I will see pop up CSAT
        And I give '1' for disburse success
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
       
