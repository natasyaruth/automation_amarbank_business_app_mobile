@loanDisbursementAP
Feature: Loan Disbursement for Loan Type AP
  In order to test Loan Disbursement
  As a customer
  I am able to processing loan disbursement for type AP

  Background: Login with registered account
    Given I am a registered customer with following details:
      | userID   | botseb19   |
      | password | TestSmb123 |
    When I filling in form login with the following details:
      | userID   | botseb19   |
      | password | TestSmb123 |
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
    Then I should be see anchor has card is empty in anchor detail page

  Scenario: Validate request loan disbursement for type Loan AP when Anchor Already Upload Invoice
    Given I have been on Loan Dashboard to checking if anchor already upload invoice
    When I click button "Gunakan Limit" in card type Loan AP
    And system check that anchor already upload invoice
    Then I should be see anchor has card in anchor detail page

  Scenario: Validate page Loan Program Information
    Given I have been in anchor detail page to validate loan program information
    When I click button "Info Selanjutnya"
    Then I should be see Program Loan Information

  Scenario: Close Section Loan Program Infomation
    Given I have been in anchor detail page to close the loan program information section
    When I click button "Info Selanjutnya"
    And I click Close button
    Then Loan Program Information should be dissapear
    And Back to the Anchor detail page

  Scenario: Access Invoice Card Confirmation Detail
    Given I have been in anchor detail page
    When I click button detail invoice for the first row
    Then I should be see Invoice Confirmation page
    And I should be see detail invoice

  Scenario: Open Document Invoice Transaction Page
    Given I have been in detail invoice to open invoice transaction detail
    When I open invoice document card
    Then the document will appears

  Scenario: Open Link "Klik disini" to Send Note if There are Any Problems
    Given I have been in detail invoice to send limit disbursement
    When I have any issue
    Then show section "Invoice Tidak Sesuai"
    And back to the confirmation invoice detail after close section

  Scenario: Send notes "Invoice Tidak Sesuai"
    Given I have been been in detail invoice to report my invoice issue
    When I input invoice issue
    Then show toastbar "Kendala invoice sudah dilaporkan"
    And button Continue Disbursement Calculations is dissapear

  Scenario: Send Disbursement Calculations When Limit is Insufficient
    Given I have been in detail invoice to send disbursement calculation when limit is Insufficient
    When I click button "lanjut perhitungan pencairan"
    Then show section limit is insufficient
    And back to the confirmation invoice detail after I close the section

  Scenario: Send Disbursement Calculations When Disbursement Amount More Than 2 Billion
    Given I have been in detail invoice to send disbursement calculation when disbursement amount more than 2 Billion
    When I click button "lanjut perhitungan pencairan"
    Then show disbursement calculation page if amount more than 2 billion

  Scenario: Send Disbursement Calculations When Disbursement Amount Less or Equal than 2 Billion
    Given I have been in detail invoice to send disbursement calculation when disbursement amount less or equal than 2 Billion
    When I click button "lanjut perhitungan pencairan"
    Then show disbursement calculation page if amount more than 2 billion

  Scenario: Continue Disburse The Loan When The PIN Has Not Been Created
    Given I haven been in calculation page of amount
    When I click button continue disburse loan with PIN has not been Created
    Then direct to the created PIN

  Scenario: Continue Disburse The Loan When Input False Pin
    Given I haven been in calculation page of amount
    When I click button continue disburse loan with input false PIN
    Then I should be see <Error_Message>
  Example: Input PIN Disbursement
      | PIN  | Error_Message            |
      | 1234 | Pin salah silakan ulangi |
      |      | Pin wajib diisi          |

  Scenario: Continue Disburse The Loan When Input True Pin
    Given I haven been in calculation page of amount
    When I click button continue disburse loan with input true PIN
    Then I should be see the page of delivery PDC
    And The address should be copied after I click button copy
    And back to the main dashboard after I close the section


















