@loanRepaymentManual
Feature: Loan Repayment For Status Success
 In order to test Loan Repayment
 As a customer
 I am able to processing loan repayment for loan type AP, Direct AP, PO, and AR with status success repayment

 Scenario: Access Push Notification for Loan dashboard with status Success
  Given I got push notification about loan repayment with status Success
  When I click the push notification for loan repayment with status Success
  Then I direct to the history billing SMB application with filter "Selesai"
  And I should be see the card of Succes Repayment

 Scenario: Access Link Notification from Email for Loan dashboard with status Success
  Given I got link notification email about loan repayment with status Success
  When I click the link notification email for loan repayment with status Success
  Then I direct to the history billing SMB application with filter "Selesai"
  And I should be see the card of Succes Repayment

 Scenario: Access Push Notification for Loan dashboard with status Failed
  Given I got push notification about loan repayment with status Failed
  When I click the push notification for loan repayment with status Failed
  Then I direct to the history billing SMB application with filter "Sedang Berjalan"
  And I should be see the card of Failed Repayment

 Scenario: Access Link Notification from Email for Loan dashboard with status Failed
  Given I got link notification email about loan repayment with status Failed
  When I click the link notification email for loan repayment with status Failed
  Then I direct to the history billing SMB application with filter "Sedang Berjalan"
  And I should be see the card of Failed Repayment

 Scenario: Access Push Notification for Loan dashboard with status Due Date
  Given I got push notification about loan repayment with status Due Date
  When I click the push notification for loan repayment with status Due Date
  Then I direct to the history billing SMB application with filter "Sedang Berjalan"
  And I should be see the card of Due Date Repayment

 Scenario: Access Link Notification from Email for Loan dashboard with status Due Date
  Given I got link notification email about loan repayment with status Due Date
  When I click the link notification email for loan repayment with status Due Date
  Then I direct to the history billing SMB application with filter "Sedang Berjalan"
  And I should be see the card of Due Date Repayment

 Scenario: Access Push Notification for Loan dashboard with status Normal
  Given I got push notification about loan repayment with status Normal
  When I click the push notification for loan repayment with status Normal
  Then I direct to the history billing SMB application with filter "Sedang Berjalan"
  And I should be see the card of Normal Repayment

 Scenario: Access Link Notification from Email for Loan dashboard with status Normal
  Given I got link notification email about loan repayment with status Normal
  When I click the link notification email for loan repayment with status Normal
  Then I direct to the history billing SMB application with filter "Sedang Berjalan"
  And I should be see the card of Normal Repayment