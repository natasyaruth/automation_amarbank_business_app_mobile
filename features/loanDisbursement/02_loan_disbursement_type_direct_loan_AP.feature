@loanDisbursementAPDirectLoan
Feature: Loan Disbursement for Loan Type AP - Direct Loan
 In order to test Loan Disbursement
 As a customer
 I am able to processing loan disbursement for type AP - Direct Loan

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

 @C98038
 Scenario: Validate request loan disbursement for type Loan AP - Direct Loan when customer have any past due date
  Given I have been on Loan Dashboard to checking if customer Loan AP - Direct AP have any past due date
  When I click button "Gunakan Limit" in card type Loan AP - Direct Loan
  And I have any past due date
  Then I direct to pay the bill limit section

 @C98039
 Scenario: Validate request loan disbursement for type Loan AP - Direct Loan when customer do not have any past due date
  Given I have been on Loan Dashboard to checking if customer Loan AP - Direct AP do not have any past due date
  When I click button "Gunakan Limit" in card type Loan AP - Direct Loan
  And I do not have any past due date
  Then I direct to page for checking Loan Tenor

 @C98040
 Scenario: Validate request loan disbursement for type Direct Loan AP when Loan Tenor More Than Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
  When I click button "Gunakan Limit" in card type Direct Loan AP
  And system check that loan tenor more than facility due date
  Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

 @C9841
 Scenario: Validate Request Loan Disbursement for Type Loan AP- Direct Loan when Loan Tenor Less Than or Equal With Facility Due Date
  Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
  When I click button "Gunakan Limit" in card type Loan AP - Direct Loan
  And system check that loan tenor less than or equal with facility due date
  Then I direct to anchor detail page

 @C98042
 Scenario: Validate Loan Program Information for Type AP - Direct Loan
  Given I have been in anchor detail page for type AP - Direct Loan
  When I click "Info Selengkapnya" in limit card
  Then I should be see loan program information section for that card has anchor
  And I close the loan information section
  And I back to the anchor detail

 @C98043
 Scenario: Take Picture to Upload Invoice Type Direct Loan AP
  Given I have been on anchor detail to take picture
  When I upload invoice document
  And I take the picture
  Then Document invoice will be showed in "Konfirmasi Invoice"

 @C98044
 Scenario: Click button Close in Section Upload Invoice
  Given I have been on anchor detail
  When I upload invoice document
  Then I close the upload invoice document section

 @C98045
 Scenario: Upload Invoice Picture From Gallery With Type Direct Loan AP
  Given I have been on anchor detail to upload invoice mount from gallery
  When I upload invoice document
  And I upload from galery
  Then Document invoice will be showed in "Konfirmasi Invoice" page

 @C98046
 Scenario: Upload Invoice Picture From Gallery With Condition Failed to Upload
  Given I have been on anchor detail to upload invoice mount from gallery
  When I upload invoice document
  And I upload from gallery
  Then show "Upload Invoice Gagal"

 @C98047
 Scenario: Reuploaded Invoice Document
  Given I have been upload invoice document with status failed upload
  When I reupload invoice
  Then invoice will upload
  And show Invoice document in "Konfirmasi Invoice"

 @C98048
 Scenario: Continue to Payment When Detail Invoice are Empty
  Given I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty
  When I keep "Nominal invoice" is empty
  And I keep "Tanggal Invoice" is empty
  And I continue payment
  Then I should be see the error message of "Nominal invoice" and "Tanggal Invoice"

 @C98049
 Scenario: Validate Section After Continue Disbursement with Case Invoice Amount Less or Equal Than Available Limit
  Given I have been in invoice detail to continue disbursement
  When I continue to disburse the invoice with invoice amount less or equal than available limit
  Then I should be see "Perhitungan Pencairan" page

 @C98050
 Scenario: Validate Section After Continue Disbursement with Case Invoice Amount More Than Available Limit
  Given I have  been in invoice detail to continue disbursement
  When I continue to disburse the invoice with invoice amount more than available limit
  Then I should be see "Limit tidak mencukupi" section
  Then I back to the "Konfirmasii Page" after close the section

 @C98051
 Scenario: Continue Disburse The Loan With Status Success After "Perhitungan Pencairan" Has Been Displayed With PIN is True
  Given I have been on "Perhitungan pencairan page"
  When I continue disburse the loan and the status is Done
  Then continue to input PIN page
  And system will direct to "Pengiriman PDC(Cek Mundur)" page
  And system show "Segera Kirim PDC" after close the success page and back to the loan dashboard

 @C98052
 Scenario: Continue Disburse The Loan With Status Waiting After "Perhitungan Pencairan" Has Been Displayed With PIN is True
  Given I have been on "Perhitungan pencairan page"
  When I continue disburse the loan and the status is process waiting
  Then continue to input PIN page
  And system will direct to "Proses Pengecekan Invoice"
  And system show "Proses Pengecekan Invoice" after close the waiting page and back to the loan dashboard

 @C98053
 Scenario: Continue Disburse The Loan With Status Rejected Process After "Perhitungan Pencairan"
  Given I have been on "Perhitungan pencairan page"
  When I continue to input PIN page
  Then system will direct to "Invoice Tidak Disetujui"
  And system will be direct to the dashboard after close the page

 @C98054
 Scenario: Validate Disbursement Details
  Given I have been on "Limit Tersedia"
  When user should see field "invoice percentage disbursement"
  Then user field LTV can be various static 80%
 
 @C98055
 Scenario: Validate Disbursement Calculations When Invoice Value 100%
  Given I have been on "Perhitungan pencairan page"
  When user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"
  When user should see field "Total Bunga" in the below of field "textInterestFee"
  When user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"
  Then show amount disbursement calculation page if invoice value 100%

 @C98056
 Scenario: Validate Disbursement Calculations When Invoice Value 80%
  Given I have been on "Perhitungan pencairan page"
  When user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"
  When user should see field "Total Bunga" in the below of field "textInterestFee"
  When user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"
  Then show amount disbursement calculation page if invoice value 80%