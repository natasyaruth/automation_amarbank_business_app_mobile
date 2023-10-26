@loanRepayment
Feature: Loan Repayment For Status Due Date
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan repayment for loan type AP, Direct AP, PO, and AR with status due date repayment

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  When I filling in form login with the following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  And I click login
  Then I will direct to dashboard

 Scenario: Validate List Repayment in Loan dashboard with Status Due Date
  Given I have been on loan dashboard with status Due Date D-3
  When I am validating the list card repayment with status Due Date D-3
  Then I should be see the closest active bill with status Due Date D-3

 Scenario: Accessing The Detail in History Bill with Filter In Process for Status "Due Date" D-3
  Given I have been on loan dashboard to access the detail of history bill with filter in process for status due date d-3
  When I access the detail of status due date d-3 from the first row
  Then I should be see the bill detail page of status due date d-3


