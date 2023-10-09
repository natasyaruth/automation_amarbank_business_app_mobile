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
  Given I have been on Loan Dashboard to checking if customer do not have any past due date
  When I click button "Gunakan Limit" in card type Loan AP - Direct Loan
  And I do not have any past due date
  Then I direct to page for checking Loan Tenor

 Scenario: Validate request loan disbursement for type Direct Loan AP when Loan Tenor More Than Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
  When I click button "Gunakan Limit" in card type Direct Loan AP
  And system check that loan tenor more than facility due date
  Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

 Scenario: Validate Request Loan Disbursement for Type Loan AP- Direct Loan when Loan Tenor Less Than or Equal With Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
  When I click button "Gunakan Limit" in card type Loan AP - Direct Loan
  And system check that loan tenor less than or equal with facility due date
  Then I direct to anchor detail page

 Scenario: Validate Loan Program Information for Type AP - Direct Loan
  Given I have been in anchor detail page for type AP - Direct Loan
  When I click "Info Selengkapnya" in limit card
  Then I should be see loan program information section for that card has anchor
  And I close the loan information section
  And I back to the anchor detail

 Scenario: Validate Section After Continue Disbursement with Case Invoice Amount Less or Equal Than Available Limit
  Given I have been in invoice detail to continue disbursement
  When I continue to disburse the invoice with invoice amount less or equal than available limit
  Then I should be see "Perhitungan Pencairan" page

 Scenario: Validate Section After Continue Disbursement with Case Invoice Amount More Than Available Limit
  Given I have been in invoice detail to continue disbursement
  When I continue to disburse the invoice with invoice amount more than available limit
  Then I should be see "Limit tidak mencukupi" section

 Scenario: Continue Disburse The Loan After "Perhitungan Pencairan" Has Been Displayed With PIN is True
  Given I have been on "Perhitungan pencairan page"
  When I continue disburse the loan
  Then continue to input PIN page
  And system will direct to "Pengiriman PDC(Cek Mundur) page"
