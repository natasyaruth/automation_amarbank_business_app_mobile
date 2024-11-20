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

    @Sprint6Lending @C136419
    Scenario: Validate request loan disbursement for type Loan PO when customer have any past due date
        Given I have been on Loan Dashboard to checking if customer Loan PO have any past due date
        When I click button "Gunakan Limit" in card type Loan PO
        And I have any past due date
        Then I direct to pay the bill limit section

    @Sprint6Lending @C136420
    Scenario: Validate request loan disbursement for type Loan PO when customer do not have any past due date
        Given I have been on Loan Dashboard to checking if customer Loan PO do not have any past due date
        When I click button "Gunakan Limit" in card type Loan PO
        And I do not have any past due date
        Then I direct to page for checking Loan Tenor

    @Sprint6Lending @C136421
    Scenario: Validate request loan disbursement for type Loan PO when Loan Tenor More Than Facility Due Date
        Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
        When I click button "Gunakan Limit" in card type loan PO
        And system check that loan tenor more than facility due date
        Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

    @Sprint6Lending @C136422
    Scenario: Validate Request Loan Disbursement for Type Loan PO when Loan Tenor Less Than or Equal With Facility Due Date
        Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
        When I click button "Gunakan Limit" in card type Loan PO
        And system check that loan tenor less than or equal with facility due date
        Then I direct to anchor detail page

    @Sprint6Lending @C136423
    Scenario: Validate page Loan Program Information for type PO LTV 100%
        Given I have been in anchor detail page to validate loan program information for type PO
        When I click buton "Gunakan Limit" in card type Loan PO
        And I am on Anchor Detail Page
        And I click button "Info Selengkapnya" for type PO
        Then I should be see Program Loan Information for type PO

    @Sprint6Lending @C161306
    Scenario: Validate page Loan Program Information for type PO LTV < 100%
        Given I have been in anchor detail page to validate loan program information for type PO
        When I click buton "Gunakan Limit" in card type Loan PO
        And I am on Anchor Detail Page
        And I click button "Info Selengkapnya" for type PO < 100%
        Then I should be see Program Loan Information for type PO

    @Sprint6Lending @C136424
    Scenario: Take Picture to Upload Invoice Type PO
        Given I have been on anchor detail to take picture
        When I upload invoice document
        And I take the picture
        Then Document invoice will be showed in "Konfirmasi Invoice"


   Scenario: Successful invoice number submission  
        Given I am on Konfirmasi Invoice page
        When I input nominal invoice  "Rp 1.300.000" 
        And I input a valid invoice number "INV1234-56"
        And the system should accept the invoice number
        Then the disbursement process continues without errors

    Scenario: Trimming spaces from invoice number 
        Given the user inputs an invoice number with leading, trailing, or in-between spaces
        When I input nominal invoice "Rp 1.300.000"
        And I input invoice number with "INV / 001 / 1000"
        And user moves to the next field
        Then the system should automatically trim the spaces

    
    Scenario: Validation for disallowed special characters 
        Given I am on Konfirmasi Invoice Page 
        When I input nominal invoice  "Rp 1.300.000" 
        And I input an invoice number with invalid characters "INV1234@56!"        
        Then the system should display an error message "Special karakter yang dibolehkan hanya / - dan \ "
        And I prompted to correct the input


    Scenario: Validating allowed characters 
        Given I am on Konfirmasi Invoice Page 
        When I input nominal invoice  "Rp 1.300.000" 
        And I input an invoice number characters "INV-123/456"        
        And the system should accept the invoice number
        Then the disbursement process continues without errors


    Scenario: Maximal character limit
        Given I am on Konfirmasi Invoice Page 
        When I input nominal invoice  "Rp 1.300.000" 
        And I input an invoice number characters more than 256 char       
        Then the system should display an error message "Invoice number exceeds the maximum character limit"  
   

    @Sprint6Lending @C136425
    Scenario: Click button Close in Section Upload Invoice
        Given I have been on anchor detail
        When I upload invoice document
        Then I close the upload invoice document section

    @Sprint6Lending @C136426
    Scenario: Upload Invoice Picture From Gallery With Type PO
        Given I have been on anchor detail to upload invoice mount from gallery
        When I upload invoice document
        And I upload from galery
        Then Document invoice will be showed in "Konfirmasi Invoice" page

    @Sprint6Lending @C136427
    Scenario: Upload Invoice Picture From Gallery With Condition Failed to Upload
        Given I have been on anchor detail to upload invoice mount from gallery
        When I upload invoice document
        And I upload from gallery
        Then show "Upload Invoice Gagal"

    @Sprint6Lending @C136428
    Scenario: Reuploaded Invoice Document
        Given I have been upload invoice document with status failed upload
        When I reupload invoice
        Then invoice will upload
        And show Invoice document in "Konfirmasi Invoice"

    @Sprint6Lending @C136429
    Scenario: Continue to Payment When Detail Invoice are Empty
        Given I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty
        When I keep "Nominal invoice" is empty
        And I keep "Tanggal Invoice" is empty
        And I continue payment
        Then I should be see the error message of "Nominal invoice" and "Tanggal Invoice"

    @Sprint6Lending @C136430
    Scenario: Validate Empty Data Supplier Section
        Given I have been in "Konfirmasi Invoice" to validate empty data supplier section
        When continue to input data Supplier
        Then I should be see list of bank name of Supplier
        And I should be see field of search bank name

    @Sprint6Lending @C136431
    Scenario: Continue to Payment When Detail Invoice are Empty in Loan Type PO
        Given I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty in Loan Type PO
        When I keep "Nominal invoice" is empty
        And I keep "Tanggal Invoice" is empty
        And I select supplier list
        And I continue payment
        Then I should be see the error message of "Nominal invoice" and "Tanggal Invoice"

    @Sprint6Lending @C136432
    Scenario: Adding Supplier List
        Given I have been in "Konfirmasi Invoice" page to adding supplier list
        When I access supplier list
        And I adding supplier list
        Then Supplier list will be show in "Konfirmasi Invoice" page

    @Sprint6Lending @C136433
    Scenario: Validate Section After Continue Disbursement with Case Invoice Amount Less or Equal Than Available Limit
        Given I have been in invoice detail to continue disbursement
        When I continue to disburse the invoice with invoice amount less or equal than available limit
        Then I should be see "Perhitungan Pencairan" page

    @Sprint6Lending @C136434
    Scenario: Validate Section After Continue Disbursement with Case Invoice Amount More Than Available Limit
        Given I have  been in invoice detail to continue disbursement
        When I continue to disburse the invoice with invoice amount more than available limit
        Then I should be see "Limit tidak mencukupi" section
        Then I back to the "Konfirmasi Invoice Page" after close the section

    @Sprint6Lending @C136435
    Scenario: Continue Disburse The Loan Type PO With Status Success After "Perhitungan Pencairan" Has Been Displayed With PIN is True
        Given I have been on "Perhitungan pencairan page" loan type PO
        When I continue disburse the loan and the status is Done
        Then continue to input PIN page
        And system will direct to "Pengiriman PDC(Cek Mundur)" page
        And system show "Segera Kirim PDC" after close the success page and back to the loan dashboard

    @Sprint6Lending @C136436
    Scenario: Continue Disburse The Loan Type PO With Status Waiting After "Perhitungan Pencairan" Has Been Displayed With PIN is True
        Given I have been on "Perhitungan pencairan page" loan type PO
        When I continue disburse the loan and the status is process waiting
        Then continue to input PIN page
        And system will direct to "Proses Pengecekan Invoice"
        And system show "Proses Pengecekan Invoice" after close the waiting page and back to the loan dashboard

    @Sprint6Lending @C136437
    Scenario: Continue Disburse The Loan Type PO With Status Rejected Process After "Perhitungan Pencairan"
        Given I have been on "Perhitungan pencairan page" loan type PO
        When I continue to input PIN page
        Then system will direct to "Invoice Tidak Disetujui"
        And system will be direct to the dashboard after close the page

    @Sprint6Lending @C136438
    Scenario: Validate Disbursement Details
        Given I have been on "Limit Tersedia"
        When user should see field "invoice percentage disbursement"
        Then user field LTV can be various static 80%

    @Sprint6Lending @C136439
    Scenario: Validate Disbursement Calculations When Invoice Value 100%
        Given I have been on "Perhitungan pencairan page"
        When user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"
        When user should see field "Total Bunga" in the below of field "textInterestFee"
        When user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"
        Then show amount disbursement calculation page if invoice value 100%

    @Sprint6Lending @C136440
    Scenario: Validate Disbursement Calculations When Invoice Value 80%
        Given I have been on "Perhitungan pencairan page"
        When user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"
        When user should see field "Total Bunga" in the below of field "textInterestFee"
        When user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"
        Then show amount disbursement calculation page if invoice value 80%

    @Sprint6Lending @C136441
    Scenario: Open Document Invoice Transaction Page
        Given I have been in detail invoice to open invoice transaction detail
        When I open invoice document card
        Then the document will appears
        And user select invoice number
        And user select invoice date
        And User select invoice due date

    
    Scenario: Validate Display Provision Fee Information method is every disbursement  
        Given I have successfully disburse for loan PO
        When I go to to page History
        And I click tab Pencairan 
        And I click menu Berhasil dicairkan
        And I click card PO
        Then I click Detail disbursement
        And I see Biaya Provisi
        And I see provision fee percentage
        And I see provision fee amount


     Scenario: Validate Do Not Display Provision Fee When Percentage is Zero
        Given I have successfully disburse for loan PO with provisi is zero
        When I go to to page History
        And I click tab Pencairan 
        And I click menu Berhasil dicairkan
        And I click card PO
        Then I click Detail disbursement
        And I dont see Biaya Provisi
        And I dont see provision fee percentage
        And I dont see provision fee amount


    Scenario: Validate Display Provision Fee Information method is facility created
        Given I have successfully disburse for loan PO with program facilty created
        When I go to to page History
        And I click tab Pencairan 
        And I click menu Berhasil dicairkan
        And I click card PO
        Then I click Detail disbursement
        And I dont see Biaya Provisi
        And I dont see provision fee percentage
        And I dont see provision fee amount