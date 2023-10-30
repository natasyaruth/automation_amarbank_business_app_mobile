@loanRepayment
Feature: Loan Repayment For Status Success
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan repayment for loan type AP, Direct AP, PO, and AR with status success repayment

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  When I filling in form login with the following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  And I click login
  Then I will direct to dashboard

 Scenario: Validate List Repayment in Loan dashboard with Status Success
  Given I have been on loan dashboard
  When I am validating the list card repayment with status Success
  Then I should be see the closest active bill with status Success

