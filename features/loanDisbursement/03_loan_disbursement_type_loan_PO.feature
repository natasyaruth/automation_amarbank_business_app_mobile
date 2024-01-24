@loanDisbursementTypePO
Feature: Loan Disbursement for Loan Type PO
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan disbursement for type PO

 Background: User must login to home dashboard
  Given I am a registered customer with following details:
   | userID   | trys5524 |
   | password | Eca12345 |
  When I filling in form login with the following details:
   | userID   | trys5524 |
   | password | Eca12345 |
  And I click login
  And I click later
  Then I will direct to dashboard

 @C98054
 Scenario: Validate request loan disbursement for type Loan PO when customer have any past due date
  Given I have been on Loan Dashboard to checking if customer Loan PO have any past due date
  When I click button "Gunakan Limit" in card type Loan PO
  And I have any past due date
  Then I direct to pay the bill limit section

 @C98055
 Scenario: Validate request loan disbursement for type Loan PO when customer do not have any past due date
  Given I have been on Loan Dashboard to checking if customer Loan PO do not have any past due date
  When I click button "Gunakan Limit" in card type Loan PO
  And I do not have any past due date
  Then I direct to page for checking Loan Tenor

 @C98056
 Scenario: Validate request loan disbursement for type Loan PO when Loan Tenor More Than Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
  When I click button "Gunakan Limit" in card type loan PO
  And system check that loan tenor more than facility due date
  Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

 @C98057
 Scenario: Validate Request Loan Disbursement for Type Loan PO when Loan Tenor Less Than or Equal With Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
  When I click button "Gunakan Limit" in card type Loan PO
  And system check that loan tenor less than or equal with facility due date
  Then I direct to anchor detail page

 @C98058
 Scenario: Validate Loan Program Information for Type Loan PO
  Given I have been in anchor detail page to validate loan program information for type Loan PO
  When I click "Info Selengkapnya" in limit card for type Loan PO
  Then I should be see loan program information section for that card has anchor for type Loan PO
  And I close the loan information section for type Loan PO
  And I back to the anchor detail for type Loan PO

 @C98059
 Scenario: Take Picture to Upload Invoice Type PO
  Given I have been on anchor detail to take picture
  When I upload invoice document
  And I take the picture
  Then Document invoice will be showed in "Konfirmasi Invoice"

 @C98060
 Scenario: Click button Close in Section Upload Invoice
  Given I have been on anchor detail
  When I upload invoice document
  Then I close the upload invoice document section

 @C98061
 Scenario: Upload Invoice Picture From Gallery With Type PO
  Given I have been on anchor detail to upload invoice mount from gallery
  When I upload invoice document
  And I upload from galery
  Then Document invoice will be showed in "Konfirmasi Invoice" page

 @C98062
 Scenario: Upload Invoice Picture From Gallery With Condition Failed to Upload
  Given I have been on anchor detail to upload invoice mount from gallery
  When I upload invoice document
  And I upload from gallery
  Then show "Upload Invoice Gagal"

 @C98063
 Scenario: Reuploaded Invoice Document
  Given I have been upload invoice document with status failed upload
  When I reupload invoice
  Then invoice will upload
  And show Invoice document in "Konfirmasi Invoice"

 @C98064
 Scenario: Continue to Payment When Detail Invoice are Empty
  Given I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty
  When I keep "Nominal invoice" is empty
  And I keep "Tanggal Invoice" is empty
  And I continue payment
  Then I should be see the error message of "Nominal invoice" and "Tanggal Invoice"

 @C98065
 Scenario: Validate Empty Data Supplier Section
  Given I have been in "Konfirmasi Invoice" to validate empty data supplier section
  When continue to input data Supplier
  Then I should be see list of bank name of Supplier
  And I should be see field of search bank name

 @C98066
 Scenario: Continue to Payment When Detail Invoice are Empty in Loan Type PO
  Given I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty in Loan Type PO
  When I keep "Nominal invoice" is empty
  And I keep "Tanggal Invoice" is empty
  And I select supplier list
  And I continue payment
  Then I should be see the error message of "Nominal invoice" and "Tanggal Invoice"

 @C98067
 Scenario: Adding Supplier List
  Given I have been in "Konfirmasi Invoice" page to adding supplier list
  When I access supplier list
  And I adding supplier list
  Then Supplier list will be show in "Konfirmasi Invoice" page

 @C98068
 Scenario: Validate Section After Continue Disbursement with Case Invoice Amount Less or Equal Than Available Limit
  Given I have been in invoice detail to continue disbursement
  When I continue to disburse the invoice with invoice amount less or equal than available limit
  Then I should be see "Perhitungan Pencairan" page

 @C98069
 Scenario: Validate Section After Continue Disbursement with Case Invoice Amount More Than Available Limit
  Given I have  been in invoice detail to continue disbursement
  When I continue to disburse the invoice with invoice amount more than available limit
  Then I should be see "Limit tidak mencukupi" section
  Then I back to the "Konfirmasi Invoice Page" after close the section

 @C98070
 Scenario: Continue Disburse The Loan Type PO With Status Success After "Perhitungan Pencairan" Has Been Displayed With PIN is True
  Given I have been on "Perhitungan pencairan page" loan type PO
  When I continue disburse the loan and the status is Done
  Then continue to input PIN page
  And system will direct to "Pengiriman PDC(Cek Mundur)" page
  And system show "Segera Kirim PDC" after close the success page and back to the loan dashboard

 @C98071
 Scenario: Continue Disburse The Loan Type PO With Status Waiting After "Perhitungan Pencairan" Has Been Displayed With PIN is True
  Given I have been on "Perhitungan pencairan page" loan type PO
  When I continue disburse the loan and the status is process waiting
  Then continue to input PIN page
  And system will direct to "Proses Pengecekan Invoice"
  And system show "Proses Pengecekan Invoice" after close the waiting page and back to the loan dashboard

 @C98072
 Scenario: Continue Disburse The Loan Type PO With Status Rejected Process After "Perhitungan Pencairan"
  Given I have been on "Perhitungan pencairan page" loan type PO
  When I continue to input PIN page
  Then system will direct to "Invoice Tidak Disetujui"
  And system will be direct to the dashboard after close the page

@C98073
 Scenario: Open Document Invoice Transaction Page
  Given I have been in detail invoice to open invoice transaction detail
   When I open invoice document card
   Then the document will appears
   And user select invoice number
   And user select invoice date
   And User select invoice due date