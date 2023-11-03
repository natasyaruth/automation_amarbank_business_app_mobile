@loanRepayment
Feature: Loan Repayment For Status Failed
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan repayment for loan type AP, Direct AP, PO, and AR with status failed repayment

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  When I filling in form login with the following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  And I click login
  Then I will direct to dashboard

 Scenario: Validate List Repayment in Loan dashboard with Status Failed
  Given I have been on loan dashboard with status Failed
  When I am validating the list card repayment with status Failed
  Then I should be see the closest active bill with status Failed

 Scenario: Accessing The Detail in History Bill with Filter In Process for Status Failed
  Given I have been on loan dashboard to access the detail of history bill with filter in process for status failed
  When I access the detail of status failed from the first row
  Then I should be see the bill detail page of status failed

 Scenario: Accessing "Lihat Detail" to See The Payment Info From Any Loan Tipe with Status Failed
  Given I am on history bill with filter "Sedang Berjalan" and status Failed
  When I am accessing the card with status failed
  And I am accessing the detail to see the payment info from any loan type with status failed
  Then I should be see the payment info from loan type AP or Direct AP or PO or AR in status failed

 Scenario: Calling the Call Center in Detail Status Failed
  Given I have been on history card "Tagihan" with filter "Sedang Berjalan" and Status Failed
  When I call the call Center in Detail Bill Failed Status
  Then the call center is opened

 Scenario: Validate Bill Information With Type Loan AP Status Failed
  Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed
  When I access the detail of billing information status failed
  Then I should be see the loan type AP status failed

 Scenario: Validate Bill Information With Type Loan Direct AP Status Failed
  Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed
  When I access the detail bill information with status failed
  Then I should be see the loan type of Direct AP status failed

 Scenario: Validate Bill Information With Type PO Status Failed
  Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed
  When I access the detail bill information with status failed
  Then I should be see the loan type of PO status failed

 Scenario: Validate Bill Information With Type AR Status Failed
  Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed
  When I access the detail bill information with status failed
  Then I should be see the loan type of AR status failed