@loanDisbursementTypePO
Feature: Loan Disbursement for Loan Type PO
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan disbursement for type PO

 Background: Login with registered account
  Given I am a registered customer with following details:
   | userID   | rutha013 |
   | password | 1234Test |
  When I filling in form login with the following details:
   | userID   | rutha013 |
   | password | 1234Test |
  And I click login
  Then I will direct to dashboard

 Scenario: Validate request loan disbursement for type Loan PO when customer have any past due date
  Given I have been on Loan Dashboard to checking if customer Loan AP - Direct AP have any past due date
  When I click button "Gunakan Limit" in card type Loan PO
  And I have any past due date
  Then I direct to pay the bill limit section

 Scenario: Validate request loan disbursement for type Loan PO when customer do not have any past due date
  Given I have been on Loan Dashboard to checking if customer Loan PO do not have any past due date
  When I click button "Gunakan Limit" in card type Loan PO
  And I do not have any past due date
  Then I direct to page for checking Loan Tenor

 Scenario: Validate request loan disbursement for type Loan PO when Loan Tenor More Than Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
  When I click button "Gunakan Limit" in card type loan PO
  And system check that loan tenor more than facility due date
  Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

 Scenario: Validate Request Loan Disbursement for Type Loan PO when Loan Tenor Less Than or Equal With Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
  When I click button "Gunakan Limit" in card type Loan PO
  And system check that loan tenor less than or equal with facility due date
  Then I direct to anchor detail page

 Scenario: Validate Loan Program Information for Type Loan PO
  Given I have been in anchor detail page for type Loan PO
  When I click "Info Selengkapnya" in limit card
  Then I should be see loan program information section for that card has anchor
  And I close the loan information section
  And I back to the anchor detail

 Scenario: Take Picture to Upload Invoice Type PO
  Given I have been on anchor detail to take picture
  When I upload invoice document
  And I take the picture
  Then Document invoice will be showed in "Konfirmasi Invoice"

 Scenario: Click button Close in Section Upload Invoice
  Given I have been on anchor detail
  When I upload invoice document
  Then I close the upload invoice document section

 Scenario: Upload Invoice Picture From Gallery With Type PO
  Given I have been on anchor detail to upload invoice mount from gallery
  When I upload invoice document
  And I upload from galery
  Then Document invoice will be showed in "Konfirmasi Invoice" page

 Scenario: Upload Invoice Picture From Gallery With Condition Failed to Upload
  Given I have been on anchor detail to upload invoice mount from gallery
  When I upload invoice document
  And I upload from gallery
  Then show "Upload Invoice Gagal"

 Scenario: Reuploaded Invoice Document
  Given I have been upload invoice document with status failed upload
  When I reupload invoice
  Then invoice will upload
  And show Invoice document in "Konfirmasi Invoice"

 Scenario: Continue to Payment When Detail Invoice are Empty
  Given I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty
  When I keep "Nominal invoice" is empty
  And I keep "Tanggal Invoice" is empty
  And I continue payment
  Then I should be see the error message of "Nominal invoice" and "Tanggal Invoice"

 Scenario: Validate Empty Data Supplier Section
  Given I have been in "Konfirmasi Invoice"