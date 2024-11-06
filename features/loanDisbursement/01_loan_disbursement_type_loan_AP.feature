@loanDisbursementAP
Feature: Loan Disbursement for Loan Type AP
    In order to test Loan Disbursement
    As a customer
    I am able to processing loan disbursement for type AP

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

    @Sprint6Lending @C136378
    Scenario: Validate request loan disbursement for type Loan AP when customer have any past due date
        Given I have been on Loan Dashboard to checking if customer have any past due date in type AP
        When I click button "Gunakan Limit" in card type Loan AP
        And I have any past due date in type AP
        Then I direct to pay the bill limit section in type AP

    @Sprint6Lending @C136379
    Scenario: Validate request loan disbursement for type Loan AP when customer don't have any past due date
        Given I have been on Loan Dashboard to checking if customer don't have any past due date in type AP
        When I click button "Gunakan Limit" in card type Loan AP
        And I don't have any past due date in type AP
        Then I direct to page for checking Loan Tenor in type AP

    @Sprint6Lending @C136380
    Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor More Than Facility Due Date
        Given I have been on Loan Dashboard to checking if loan tenor more than Facility due date
        When I click button "Gunakan Limit" in card type Loan AP
        And system check that loan tenor more than facility due date
        Then I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section

    @Sprint6Lending @C136381
    Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor Less Than or Equal With Facility Due Date
        Given I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date
        When I click button "Gunakan Limit" in card type Loan AP
        And system check that loan tenor less than or equal with facility due date
        Then I direct to anchor detail page

    @Sprint6Lending @C136382
    Scenario: Validate request loan disbursement for type Loan AP when Anchor Have Not Uploaded Invoice Yet
        Given I have been on Loan Dashboard to checking if anchor have not uploaded invoice yet
        When I click button "Gunakan Limit" in card type Loan AP
        And system check that anchor have not uploaded invoice yet
        Then I should be see anchor has card is empty in anchor detail page

    @Sprint6Lending @C136383
    Scenario: Validate request loan disbursement for type Loan AP when Anchor Already Upload Invoice
        Given I have been on Loan Dashboard to checking if anchor already upload invoice
        When I click button "Gunakan Limit" in card type Loan AP
        And system check that anchor already upload invoice
        Then I should be see anchor has card in anchor detail page

    @Sprint6Lending @C136384
    Scenario: Validate page Loan Program Information for type AP LTV 100%
        Given  I have been in anchor detail page to validate loan program information for type AP
        When  I click buton "Gunakan Limit" in card type Loan AP
        And  I am on Anchor Detail Page
        And  I click button "Info Selengkapnya" for type AP
        Then  I should be see Program Loan Information for type AP

    @Sprint6Lending @C136395
    Scenario: Validate page Loan Program Information for type AP LTV < 100%
        Given  I have been in anchor detail page to validate loan program information for type AP
        When  I click buton "Gunakan Limit" in card type Loan AP
        And  I am on Anchor Detail Page
        And  I click button "Info Selengkapnya" for type AP < 100%
        Then  I should be see Program Loan Information for type AP

    @Sprint6Lending @C136385
    Scenario: Close Section Loan Program Infomation for type AP
        Given I have been in anchor detail page to close the loan program information section for type AP
        When I click button "Info Selanjutnya" for type AP
        And I click Close button for type AP
        Then Loan Program Information should be dissapear for type AP
        And Back to the Anchor detail page for type AP

    @Sprint6Lending @C136386
    Scenario: Access Invoice Card Confirmation Detail for type AP
        Given I have been in anchor detail page for type AP
        When I click button detail invoice for the first row for type AP
        Then I should be see Invoice Confirmation page for type AP
        And I should be see detail invoice for type AP

    @Sprint6Lending @C136387
    Scenario: Open Document Invoice Transaction Page
        Given I have been in detail invoice to open invoice transaction detail
        When I open invoice document card
        Then the document will appears
        And user select invoice number
        And user select invoice date
        And User select invoice due date

    @Sprint6Lending @C136388
    Scenario: Open Link "Klik disini" to Send Note if There are Any Problems
        Given I have been in detail invoice to send limit disbursement
        When I have any issue
        Then show section "Invoice Tidak Sesuai"
        And back to the confirmation invoice detail after close section

    @Sprint6Lending @C136389
    Scenario: Send notes "Invoice Tidak Sesuai"
        Given I have been been in detail invoice to report my invoice issue
        When I input invoice issue
        Then show toastbar "Kendala invoice sudah dilaporkan"
        And button Continue Disbursement Calculations is dissapear

    @Sprint6Lending @C136390
    Scenario: Send Disbursement Calculations When Limit is Insufficient
        Given I have been in detail invoice to send disbursement calculation when limit is Insufficient
        When I click button "lanjut perhitungan pencairan"
        Then show section limit is insufficient
        And back to the confirmation invoice detail after I close the section

    @Sprint6Lending @C136391
    Scenario: Send Disbursement Calculations When Disbursement Amount More Than 2 Billion
        Given I have been in detail invoice to send disbursement calculation when disbursement amount more than 2 Billion
        When I click button "lanjut perhitungan pencairan"
        Then show disbursement calculation page if amount more than 2 billion

    @Sprint6Lending @C136392
    Scenario: Send Disbursement Calculations When Disbursement Amount Less or Equal than 2 Billion
        Given I have been in detail invoice to send disbursement calculation when disbursement amount less or equal than 2 Billion
        When I click button "lanjut perhitungan pencairan"
        Then show disbursement calculation page if amount more than 2 billion

    @Sprint6Lending @C136393
    Scenario: Continue Disburse The Loan When The PIN Has Not Been Created
        Given I haven been in calculation page of amount
        When I click button continue disburse loan with PIN has not been Created
        Then direct to the created PIN

    @Sprint6Lending @C136394
    Scenario: Continue Disburse The Loan When Input False Pin
        Given I haven been in calculation page of amount
        When I click button continue disburse loan with input false PIN
        Then I should be see <Error_Message>
        Then : Input PIN Disbursement
            | PIN  | Error_Message            |
            | 1234 | Pin salah silakan ulangi |
            |      | Pin wajib diisi          |

    @Sprint6Lending @C136396
    Scenario: Continue Disburse The Loan When Input True Pin
        Given I haven been in calculation page of amount
        When I click button continue disburse loan with input true PIN
        Then I should be see the page of delivery PDC
        And The address should be copied after I click button copy
        And back to the main dashboard after I close the section

    @Sprint6Lending @C136397
    Scenario: Validate Disbursement Details
        Given I have been on "Limit Tersedia"
        When user should see field "invoice percentage disbursement"
        Then user field LTV can be various static 80%

    @Sprint6Lending @C136398
    Scenario: Validate Disbursement Calculations When Invoice Value 100%
        Given I have been on "Perhitungan pencairan page"
        When user should see field "Nominal Pinjaman" in the below of field "textFundingAmount"
        When user should see field "Total Bunga" in the below of field "textInterestFee"
        When user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"
        Then show amount disbursement calculation page if invoice value 100%

    @Sprint6Lending @C136399
    Scenario: Validate Disbursement Calculations When Invoice Value 80%
        Given I have been on "Perhitungan pencairan page"
        When user should see field "Nominal Pinjaman" in the below of field "textFundingAmount"
        When user should see field "Total Bunga" in the below of field "textInterestFee"
        When user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"
        Then show amount disbursement calculation page if invoice value 80%

    
    Scenario: Validate Display Provision Fee Information method is every disbursement  
        Given I have successfully disburse for loan AP
        When I go to to page History
        And I click tab Pencairan 
        And I click menu Berhasil dicairkan
        And I click card AP
        Then I click Detail disbursement
        And I see Biaya Provisi
        And I see provision fee percentage
        And I see provision fee amount

    Scenario: Validate Do Not Display Provision Fee When Percentage is Zero
        Given I have successfully disburse for loan AP with provisi is zero
        When I go to to page History
        And I click tab Pencairan 
        And I click menu Berhasil dicairkan
        And I click card AP
        Then I click Detail disbursement
        And I dont see Biaya Provisi
        And I dont see provision fee percentage
        And I dont see provision fee amount


    Scenario: Validate Display Provision Fee Information method is facility created
        Given I have successfully disburse for loan AP with program facilty created
        When I go to to page History
        And I click tab Pencairan 
        And I click menu Berhasil dicairkan
        And I click card AP
        Then I click Detail disbursement
        And I dont see Biaya Provisi
        And I dont see provision fee percentage
        And I dont see provision fee amount