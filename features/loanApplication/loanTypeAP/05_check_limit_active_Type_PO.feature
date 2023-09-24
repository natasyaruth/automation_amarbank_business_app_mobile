@loanActiveTypePO
Feature:Checking Loan Type PO with Status Active
 In order to checking limit active for loan type PO
 As a customer
 I am able to verify limit active loan type AP and direct AP in history page

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | rutha013 |
   | password | 1234Test |
  When I filling in form login with the following details:
   | userID   | rutha013 |
   | password | 1234Test |
  And I click login
  Then I will direct to dashboard

 Scenario: Validate Card Limit For Type Loan PO
  Given I have been on Loan Dashboard to see the loan type of Loan PO
  When I validate the card of "Loan PO"
  Then I should see the wording and card design of "Loan PO"