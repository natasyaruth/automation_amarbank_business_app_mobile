const loanDisbursement = require("../../pages/loanDisbursement");

const { I, loginPage, loanDashboardPage, loanDisbursementPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate request loan disbursement for type Loan AP - Direct Loan when customer have any past due date
Given('I have been on Loan Dashboard to checking if customer have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAPDirectLoan();
});
When('I click button "Gunakan Limit" in card type Loan AP - Direct Loan', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAPDirectLoan();
});

Then('I have any past due date', () => {
 I.wait(3);
});

Then('I direct to pay the bill limit section', async () => {
 await loanDisbursement.validateSectionHavePastDueDate();
});

//Scenario: Validate request loan disbursement for type Loan AP - Direct Loan when customer don't have any past due date
Given('I have been on Loan Dashboard to checking if customer do not have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAPDirectLoan();
});

When('I click button "Gunakan Limit" in card type Loan AP - Direct Loan', () => {
 loanDisbursement.usingLimitLoanDisbursementTypeAPDirectLoan();
});

Then('I do not have any past due date', () => {
 I.wait(3);
});

Then('I direct to page for checking Loan Tenor', async () => {
 await loanDisbursementPage.validateSectionHavePastDueDate();
});

// Scenario: Validate request loan disbursement for type Direct Loan AP when Loan Tenor More Than Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor more than Facility due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAPDirectLoan();
});
When('I click button "Gunakan Limit" in card type Direct Loan AP', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

When('system check that loan tenor more than facility due date', () => {
 I.wait(3);
});

Then('I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section', async () => {
 await loanDisbursementPage.validateLoanIsTenorMoreThanPastDueDate();
});