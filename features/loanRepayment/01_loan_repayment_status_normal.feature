@loanRepayment
Feature: Loan Repayment For Status Normal
 In order to test Loan Repayment
 As a customer
 I am able to processing loan repayment for loan type AP, Direct AP, PO, and AR with status normal repayment

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  When I filling in form login with the following details:
   | userID   | botseb19   |
   | password | TestSmb123 |
  And I click login
  Then I will direct to dashboard

 @C98089
 Scenario: Validate List Repayment in Loan dashboard with Status Normal
  Given I have been on loan dashboard with status Normal
  When I am validating the list card repayment with status Normal
  Then I should be see the closest active bill with status Normal

 @C98090
 Scenario: Validate Alert Text After Loan Disbursement was Successfull
  Given I have been got Successfull disbursement
  When I go to loan dashboard
  Then I should be see alert text that loan was successfull disbursed
  And I should not be see the alert text loan was successfull after I close the section

 @C98091
 Scenario: Accessing History Detail to See All On Process Bill Activity
  Given I have been on loan dashboard to see all on process bill activity
  When I access "Lihat Semua"
  Then I should be direct to the history bill with filter on process

@FunctTestLendingSprint5
  Scenario: Validate List Repayment when the status "Provisi dibayar diakad"
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success
    When I access the detail
    And I should be see the loan type AP
    And I don't see Provisi
    And I don't see Biaya Admin