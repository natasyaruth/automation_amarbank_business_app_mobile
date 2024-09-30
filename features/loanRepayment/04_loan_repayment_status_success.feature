@loanRepayment
Feature: Loan Repayment For Status Success
  In order to test Loan Repayment
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

  @C98116
  Scenario: Validate List Repayment in Loan dashboard with Status Success
    Given I have been on loan dashboard
    When I am validating the list card repayment with status Success
    Then I should be see the closest active bill with status Success

  @C98117
  Scenario: Accessing The Detail in History Bill with Filter In Process for Status Success
    Given I have been on loan dashboard to access the detail of history bill with filter in process for status success
    When I access the detail of status success from the first row
    Then I should be see the bill detail page of status success

  @C98118
  Scenario: Accessing "Lihat Detail" to See The Payment Info From Any Loan Tipe with Status Success
    Given I am on history bill with filter "Sedang Berjalan" in status Failed
    When I am accessing the card with status success
    And I am accessing the detail to see the payment info from any loan type with status success
    Then I should be see the payment info from loan type AP or Direct AP or PO or AR in status success

  @C98119
  Scenario: Calling the Call Center
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan"
    When I call the call Center
    Then the call center is opened

  Scenario: Validate Bill Information With Type Loan AP
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success
    When I access the detail
    Then I should be see the loan type AP

  @C98121
  Scenario: Validate Bill Information With Type Loan Direct AP
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success
    When I access the detail
    Then I should be see the loan type of Direct AP

  Scenario: Validate Bill Information With Type PO
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success
    When I access the detail
    Then I should be see the loan type of PO

  Scenario: Validate Bill Information With Type AR
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success
    When I access the detail
    Then I should be see the loan type of AR


  @FunctTestLendingSprint5
  Scenario: Validate Bill Information With Type Loan AP when flagging "Provisi dibayar diakad" and status success
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information
    When I access the detail
    Then I should be see the loan type of AP 
    And I don't see Provisi
    And I don't see Biaya Admin

@FunctTestLendingSprint5
Scenario: Validate Bill Information With Type Loan AR when flagging "Provisi dibayar diakad" and status success
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information
    When I access the detail
    Then I should be see the loan type of AR 
    And I don't see Provisi
    And I don't see Biaya Admin

  @FunctTestLendingSprint5
  Scenario: Validate Bill Information With Type Loan PO when flagging "Provisi dibayar diakad" and status success
    Given I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information
    When I access the detail
    Then I should be see the loan type of PO 
    And I don't see Provisi
    And I don't see Biaya Admin