@loanDisbursementAPDirectLoan
Feature: Loan Disbursement for Loan Type AP - Direct Loan
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan disbursement for type AP - Direct Loan

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | rutha013 |
   | password | 1234Test |
  When I filling in form login with the following details:
   | userID   | rutha013 |
   | password | 1234Test |
  And I click login
  Then I will direct to dashboard

 Scenario: Validate request loan disbursement for type Loan AP - Direct Loan when customer have any past due date
  Given I have been on Loan Dashboard to checking if customer have any past due date
  When I click button "Gunakan Limit" in card type Loan AP - Direct Loan
  And I have any past due date
  Then I direct to pay the bill limit section

 Scenario: Validate request loan disbursement for type Loan AP - Direct Loan when customer don't have any past due date
  Given I have been on Loan Dashboard to checking if customer don't have any past due date
  When I click button "Gunakan Limit" in card type Loan AP - Direct Loan
  And I don't have any past due date
  Then I direct to page for checking Loan Tenor

 Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor More Than Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
  When I click button "Gunakan Limit" in card type Loan AP
  And system check that loan tenor more than facility due date
  Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

 Scenario: Validate Request Loan Disbursement for Type Loan AP when Loan Tenor Less Than or Equal With Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
  When I click button "Gunakan Limit" in card type Loan AP
  And system check that loan tenor less than or equal with facility due date
  Then I direct to anchor detail page

 Scenario: Validate Loan Program Information for Type AP - Direct Loan
  Given I have been in anchor detail page for type AP - Direct Loan
  When I click "Info Selengkapnya" in limit card
  Then I should be see loan program information section for that card's anchor
  And I close the loan information section
  And I back to the anchor detail
