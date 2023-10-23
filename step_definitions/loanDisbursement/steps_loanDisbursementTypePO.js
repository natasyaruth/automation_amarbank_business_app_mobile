const { I, loginPage, loanDashboardPage, loanDisbursementPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate request loan disbursement for type Loan PO when customer have any past due date
Given('I have been on Loan Dashboard to checking if customer Loan PO have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanPO();
});
When('I click button "Gunakan Limit" in card type Loan PO', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypePO();
});

When('I have any past due date', () => {
 I.wait(3);
});
Then('I direct to pay the bill limit section', async () => {
 await loanDisbursementPage.validateSectionHavePastDueDate();
});

// Scenario: Validate request loan disbursement for type Loan PO when customer do not have any past due date
Given('I have been on Loan Dashboard to checking if customer Loan PO do not have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanPO();
});

When('I click button "Gunakan Limit" in card type Loan PO', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypePO();
});
When('I do not have any past due date', () => {
 I.wait(3);
});
Then('I direct to page for checking Loan Tenor', async () => {
 await loanDisbursementPage.validateSectionHaveNotPastDueDate();

});

// Scenario: Validate request loan disbursement for type Loan PO when Loan Tenor More Than Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor more than Facility due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanPO();

});
When('I click button "Gunakan Limit" in card type loan PO', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypePO();
});

When('system check that loan tenor more than facility due date', () => {
 I.wait(3);
});
Then('I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section', async () => {
 await loanDisbursementPage.validateLoanIsTenorMoreThanPastDueDate();
});

// Scenario: Validate Request Loan Disbursement for Type Loan PO when Loan Tenor Less Than or Equal With Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanPO();
});

When('I click button "Gunakan Limit" in card type Loan PO', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypePO();
});

When('system check that loan tenor less than or equal with facility due date', () => {
 I.dontSee('Pengajuan Anda Melebihi Batas Aktif Fasilitas');
});

Then('I direct to anchor detail page', () => {
 loanDisbursementPage.validateAnchorDetail();
});

// Scenario: Validate Loan Program Information for Type Loan PO
Given('I have been in anchor detail page for type Loan PO', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanPO();
});

When('I click "Info Selengkapnya" in limit card', () => {
 loanDisbursementPage.goToProgramLoanInformation();
});

Then('I should be see loan program information section for that card has anchor', () => {
 loanDisbursementPage.validateProgramLoanInformation();
});

Then('I close the loan information section', () => {
 loanDisbursementPage.closeProgramLoanInformation();
});

Then('I back to the anchor detail', () => {
 I.dontSee('Informasi Program Pinjaman');
});

// Scenario: Take Picture to Upload Invoice Type PO
Given('I have been on anchor detail to take picture', () => {

});

When('I upload invoice document', () => {

});

When('I take the picture', () => {

});

Then('Document invoice will be showed in "Konfirmasi Invoice"', () => {

});

// Scenario: Click button Close in Section Upload Invoice
Given('I have been on anchor detail', () => {

});

When('I upload invoice document', () => {

});
Then('I close the upload invoice document section', () => {

});

// Scenario: Upload Invoice Picture From Gallery With Type PO
Given('I have been on anchor detail to upload invoice mount from gallery', () => {

});
When('I upload invoice document', () => {

});

When('I upload from galery', () => {

});

Then('Document invoice will be showed in "Konfirmasi Invoice" page', () => {

});

// Scenario: Upload Invoice Picture From Gallery With Condition Failed to Upload
Given('I have been on anchor detail to upload invoice mount from gallery', () => {

});
When('I upload invoice document', () => {

});

When('I upload from gallery', () => {

});

Then('show "Upload Invoice Gagal"', () => {

});

// Scenario: Reuploaded Invoice Document
Given('I have been upload invoice document with status failed upload', () => {

});
When('I reupload invoice', () => {

});

Then('invoice will upload', () => {

});

Then('show Invoice document in "Konfirmasi Invoice"', () => {

});

// Scenario: Continue to Payment When Detail Invoice are Empty
Given('I have been in "Konfirmasi Invoice" page to continue payment with detail invoice are Empty', () => {

});

When('I keep "Nominal invoice" is empty', () => {

});

When('I keep "Tanggal Invoice" is empty', () => {

});

When('I continue payment', () => {

});

Then('I should be see the error message of "Nominal invoice" and "Tanggal Invoice"', () => {

});

// Scenario: Validate Empty Data Supplier Section
Given('I have been in "Konfirmasi Invoice" to validate empty data supplier section', () => {

});

When('continue to input data Supplier', () => {

});

Then('I should be see list of bank name of Supplier', () => {

});

Then('I should be see field of search bank name', () => {

});

// Scenario: Continue Disburse The Loan Type PO With Status Success After "Perhitungan Pencairan" Has Been Displayed With PIN is True
Given('I have been on "Perhitungan pencairan page" loan type PO', () => {

});

When('I continue disburse the loan and the status is Done', () => {

});
Then('continue to input PIN page', () => {

});
Then('system will direct to "Pengiriman PDC(Cek Mundur)" page', () => {

});

Then('system show "Segera Kirim PDC" after close the success page and back to the loan dashboard', () => {

});

// Scenario: Continue Disburse The Loan Type PO With Status Waiting After "Perhitungan Pencairan" Has Been Displayed With PIN is True
Given('I have been on "Perhitungan pencairan page" loan type PO', () => {

});

When('I continue disburse the loan and the status is process waiting', () => {

});

Then('continue to input PIN page', () => {

});

Then('system will direct to "Proses Pengecekan Invoice"', () => {

});

Then('system show "Proses Pengecekan Invoice" after close the waiting page and back to the loan dashboard', () => {

});

// Scenario: Continue Disburse The Loan Type PO With Status Rejected Process After "Perhitungan Pencairan"
Given('I have been on "Perhitungan pencairan page" loan type PO', () => {

});

When('I continue to input PIN page', () => {

});
Then('system will direct to "Invoice Tidak Disetujui"', () => {

});

Then('system will be direct to the dashboard after close the page', () => {

});