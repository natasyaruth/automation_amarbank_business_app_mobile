@loanDisbursementAP
Feature: Loan Disbursement for Loan Type AP
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan disbursement for type AP

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | rutha013 |
   | password | 1234Test |
  When I filling in form login with the following details:
   | userID   | rutha013 |
   | password | 1234Test |
  And I click login
  Then I will direct to dashboard

 Scenario: Validate request loan disbursement for type Loan AP when customer have any past due date
  Given I have been on Loan Dashboard to checking if customer have any past due date
  When I click button "Gunakan Limit" in card type Loan AP
  And I have any past due date
  Then I direct to pay the bill limit section

 Scenario: Validate request loan disbursement for type Loan AP when customer don't have any past due date
  Given I have been on Loan Dashboard to checking if customer don't have any past due date
  When I click button "Gunakan Limit" in card type Loan AP
  And I don't have any past due date
  Then I direct to page for checking Loan Tenor

