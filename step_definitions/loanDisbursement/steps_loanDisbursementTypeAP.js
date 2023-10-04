const loanDisbursement = require("../../pages/loanDisbursement");

const { I, loginPage, loanDashboardPage, loanDisbursementPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate request loan disbursement for type Loan AP when customer have any past due date
Given('I have been on Loan Dashboard to checking if customer have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});
When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAP();
});

Then('I have any past due date', () => {
 I.wait(3);
});

Then('I direct to pay the bill limit section', async () => {
 await loanDisbursement.validateSectionHavePastDueDate();
});

//Scenario: Validate request loan disbursement for type Loan AP when customer don't have any past due date
Given('I have been on Loan Dashboard to checking if customer do not have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});

When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAP();
});

Then('I do not have any past due date', () => {
 I.wait(3);
});

Then('I direct to page for checking Loan Tenor', async () => {
 await loanDisbursement.validateSectionHavePastDueDate();
});

// Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor More Than Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor more than Facility due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});
When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAP();
});

When('system check that loan tenor more than facility due date', () => {
 I.wait(3);
});

Then('I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section', async () => {
 await loanDisbursement.validateLoanIsTenorMoreThanPastDueDate();
});

// Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor Less Than or Equal With Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});

When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAP();
});

When('system check that loan tenor less than or equal with facility due date', () => {
 I.wait(3);
});

Then('I direct to anchor detail page', async () => {
 await loanDisbursement.validateLoanTenorLessThanPastDueDate;
});

// Scenario: Validate request loan disbursement for type Loan AP when Anchor Have Not Uploaded Invoice Yet
Given('I have been on Loan Dashboard to checking if anchor have not uploaded invoice yet', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});

When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAP();
});

When('system check that anchor have not uploaded invoice yet', () => {
 I.wait(3);
});

Then('I should be see anchor has card is empty in anchor detail page', async () => {
 loanDisbursement.validateNotUploadInvoiceYet();
});

// Scenario: Validate request loan disbursement for type Loan AP when Anchor Already Upload Invoice
Given('I have been on Loan Dashboard to checking if anchor already upload invoice', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});

When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAP();
});

When('system check that anchor already upload invoice', () => {
 I.wait(3);
});

Then('I should be see anchor has card in anchor detail page', async () => {
 await loanDisbursement.validateAlreadyUploadInvoice();
});

