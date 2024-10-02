const { I, loginPage, loanDashboardPage, loanDisbursementPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate request loan disbursement for type Loan AR when customer have any past due date
Given('I have been on Loan Dashboard to checking if customer Loan AR have any past due date', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDisbursementPage.scrollToViewTextCardAR();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});
When('I click button "Gunakan Limit" in card type Loan AR', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeLoanAR();
});
When('I have any past due date', () => {
 I.wait(3);
});

Then('I direct to pay the bill limit section', async () => {
 await loanDisbursementPage.validateSectionHavePastDueDate();
});

// Scenario: Validate request loan disbursement for type Loan AR when customer do not have any past due date
Given('I have been on Loan Dashboard to checking if customer Loan AR do not have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});
When('I click button "Gunakan Limit" in card type Loan AR', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeLoanAR();
});

When('I do not have any past due date', () => {
 I.wait(3);
});

Then('I direct to page for checking Loan Tenor', async () => {
 await loanDisbursementPage.validateSectionHaveNotPastDueDate();
});

// Scenario: Validate request loan disbursement for type Loan AR when Loan Tenor More Than Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor more than Facility due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});

When('I click button "Gunakan Limit" in card type loan AR', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeLoanAR();
});

When('system check that loan tenor more than facility due date', () => {
 I.wait(3);
});

Then('I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section', async () => {
 await loanDisbursementPage.validateLoanIsTenorMoreThanPastDueDate();
});

// Scenario: Validate Request Loan Disbursement for Type Loan AR when Loan Tenor Less Than or Equal With Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});

When('I click button "Gunakan Limit" in card type Loan AR', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeLoanAR();
});

When('system check that loan tenor less than or equal with facility due date', () => {
 I.dontSee('Pengajuan Anda Melebihi Batas Aktif Fasilitas');
});

Then('I direct to anchor detail page', () => {
 loanDisbursementPage.validateAnchorDetail();
});

// Scenario: Validate Loan Program Information for Type Loan AR
Given('I have been in anchor detail for type AR', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDisbursementPage.scrollToViewTextCardAR();
 await loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.usingLimitLoanDisbursementTypeLoanAR();
});

When('I click "Info Selengkapnya" in limit card for type AR', () => {
 loanDisbursementPage.goToProgramLoanInformation();
});

When('I should be see Program Loan Information for type AR', () =>{
    loanDisbursementPage.validateProgramLoanInformationAR();
});

When('I should be see Program Loan Information for type AR below 100', () => {
    loanDisbursementPage.validateProgramLoanARLTVBelow100();
});


Then('I should be see loan program information section for that card has anchor for type AR', () => {
 loanDisbursementPage.validateProgramLoanInformationAR();
});

Then('I close the loan information section for type AR', () => {
 loanDisbursementPage.closeProgramLoanInformation();
});

Then('I back to the anchor detail for type AR', () => {
 I.dontSee('Informasi Program Pinjaman');
});

// Scenario: Take Picture to Upload Invoice Type Loan AR
Given('I have been on anchor detail to take picture', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDisbursementPage.scrollToViewTextCardAR();
 await loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.usingLimitLoanDisbursementTypeLoanAR();
});

When('I upload invoice document', () => {
 loanDisbursementPage.goToUploadDocument();
});
When('I take the picture', () => {
 loanDisbursementPage.takePicture();
});

Then('Document invoice will be showed in "Konfirmasi Invoice"', () => {
 loanDisbursementPage.validateInvoiceConfirmation();
});

// Scenario: Click button Close in Section Upload Invoice
Given('I have been on anchor detail', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDisbursementPage.scrollToViewTextCardAR();
 await loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.usingLimitLoanDisbursementTypeLoanAR();
});
When('I upload invoice document', () => {
 loanDisbursementPage.goToUploadDocument();
});

Then('I close the upload invoice document section', () => {
 loanDisbursementPage.closeUploadInvoiceSection();
});

// Scenario: Upload Invoice Picture From Gallery With Type Loan AR
Given('I have been on anchor detail to upload invoice mount from gallery', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});

When('I upload invoice document', () => {
 loanDisbursementPage.goToUploadDocument();
});
When('I upload from galery', () => {
 loanDisbursementPage.getInvoicePhotosFromGallery();
});

Then('Document invoice will be showed in "Konfirmasi Invoice" page', () => {
 loanDisbursementPage.validateInvoiceConfirmationAfterUploadPhotoFromGallery();
});

// Scenario: Upload Invoice Picture From Gallery With Condition Failed to Upload
Given('I have been on anchor detail to upload invoice mount from gallery', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});
When('I upload invoice document', () => {
 loanDisbursementPage.goToUploadDocument();
});

When('I upload from gallery', () => {
 loanDisbursementPage.takePicture();
});

Then('show "Upload Invoice Gagal"', () => {
 loanDisbursementPage.validateFailedUploadPhoto();
});

// Scenario: Reuploaded Invoice Document
Given('I have been upload invoice document with status failed upload', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.goToUploadDocument();
 loanDisbursementPage.takePicture();
 loanDisbursementPage.validateFailedUploadPhoto();
});
When('I reupload invoice', () => {
 loanDisbursementPage.reUploadInvoiceDocument();
});
Then('invoice will upload', () => {

});

Then('show Invoice document in "Konfirmasi Invoice"', () => {
 loanDisbursementPage.validateInvoiceConfirmation();
});

// Scenario: Continue to Payment When Detail Invoice are Empty
Given('I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.goToUploadDocument();
 loanDisbursementPage.takePicture();
 loanDisbursementPage.validateInvoiceConfirmation();
});

When('I keep "Nominal invoice" is empty', () => {
 loanDisbursementPage.keepAmountInvoiceisEmpty();
});

When('I keep "Tanggal Invoice" is empty', () => {
 loanDisbursementPage.keepFieldDateisEmpty();
});

When('I continue payment', () => {
 loanDisbursementPage.keepEmptyInvoiceDetail();
});

Then('I should be see the error message of "Nominal invoice" and "Tanggal Invoice"', () => {
 loanDisbursementPage.validateErrorMessageDetailInvoiceareEmpty();
});

// Scenario: Validate Section After Continue Disbursement with Case Invoice Amount Less or Equal Than Available Limit
Given('I have been in invoice detail to continue disbursement', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});

When('I continue to disburse the invoice with invoice amount less or equal than available limit', () => {
 loanDisbursementPage.grabtextAvailableLimitAR();

});

Then('I should be see "Perhitungan Pencairan" page', async () => {
 await loanDisbursementPage.fillingInvoiceDetailLessorEqualThanAvailableLimit();
});

// Scenario: Validate Section After Continue Disbursement with Case Invoice Amount More Than Available Limit
Given('I have  been in invoice detail to continue disbursement', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});

When('I continue to disburse the invoice with invoice amount more than available limit', () => {
 loanDisbursementPage.fillingInvoiceMoreThanAvailableLimit();
});

Then('I should be see "Limit tidak mencukupi" section', async () => {
 await loanDisbursementPage.fillingInvoiceDetailMoreThanAvailableLimit();
});

Then('I back to the "Konfirmasii Page" after close the section ', () => {
 loanDisbursementPage.closeSectionInsufficientLimit();
});

//Scenario: Continue Disburse The Loan With Status Success After "Perhitungan Pencairan" Has Been Displayed With PIN is True
Given('I have been on "Perhitungan pencairan page"', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.grabtextAvailableLimitAR();
});

When('I continue disburse the loan and the status is Done', async () => {
 await loanDisbursementPage.fillingInvoiceDetailLessorEqualThanAvailableLimit();
});

Then('continue to input PIN page', () => {
 loanDisbursementPage.isInvoiceAccbyAmarBank();
});

Then('system will direct to "Pengiriman PDC(Cek Mundur)" page', () => {

});

Then('system show "Segera Kirim PDC" after close the success page and back to the loan dashboard', () => {

});

// Scenario: Continue Disburse The Loan With Status Waiting After "Perhitungan Pencairan" Has Been Displayed With PIN is True
Given('I have been on "Perhitungan pencairan page"', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.grabtextAvailableLimitAR();
});

When('I continue disburse the loan and the status is process waiting', async () => {
 await loanDisbursementPage.fillingInvoiceDetailLessorEqualThanAvailableLimit();
});

Then('continue to input PIN page', () => {

});

Then('system will direct to "Proses Pengecekan Invoice"', () => {
 loanDisbursementPage.isInvoiceAccbyAmarBank();
});
Then('system show "Proses Pengecekan Invoice" after close the waiting page and back to the loan dashboard', () => {

});

// Scenario: Continue Disburse The Loan With Status Rejected Process After "Perhitungan Pencairan"
Given('I have been on "Perhitungan pencairan page"', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
 loanDisbursementPage.grabtextAvailableLimitAR();
});

When('I continue to input PIN page', async () => {
 await loanDisbursementPage.fillingInvoiceDetailLessorEqualThanAvailableLimit();
});
Then('system will direct to "Invoice Tidak Disetujui"', () => {
 loanDisbursementPage.isInvoiceAccbyAmarBank();
});
Then('system will be direct to the dashboard after close the page', () => {
 loanDisbursementPage.closeRejectInvoiceNotAccept();
});

Then('user should see field "invoice percentage disbursement"', () => {
 loanDisbursementPage.ValidateDisbursementDetails();
});
   
Then('user field LTV can be various static 80%', () => {
 loanDisbursementPage.ValidateDisbursementDetails();
});

Then('user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue100();
});
   
Then('user should see field "Total Bunga" in the below of field "textInterestFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue100();
});
   
Then('user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue100();
});
   
Then('user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue80();
});
      
Then('user should see field "Total Bunga" in the below of field "textInterestFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue80();
});
      
Then('user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue80();
});

Then('user select invoice number', () => {
 loanDisbursementPage.validateFieldInvoice();
});
   
Then('user select invoice date', () => {
 loanDisbursementPage.validateFieldInvoice();
});
   
Then('User select invoice due date', () => {
 loanDisbursementPage.validateFieldInvoice();
});