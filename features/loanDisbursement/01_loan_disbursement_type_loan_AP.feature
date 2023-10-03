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

 Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor More Than Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
  When I click button "Gunakan Limit" in card type Loan AP
  And system check that loan tenor more than facility due date
  Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

 Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor Less Than or Equal With Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
  When I click button "Gunakan Limit" in card type Loan AP
  And system check that loan tenor less than or equal with facility due date
  Then I direct to anchor detail page

 Scenario: Validate request loan disbursement for type Loan AP when Anchor Have Not Uploaded Invoice Yet
  Given I have been on Loan Dashboard to checking if anchor have not uploaded invoice yet
  When I click button "Gunakan Limit" in card type Loan AP
  And system check that anchor have not uploaded invoice yet
  Then I should be see anchor's card is empty in anchor detail page

 Scenario: Validate request loan disbursement for type Loan AP when Anchor Already Upload Invoice
  Given I have been on Loan Dashboard to checking if anchor already upload invoice
  When I click button "Gunakan Limit" in card type Loan AP
  And system check that anchor already upload invoice
  Then I should be see anchor's card in anchor detail page






