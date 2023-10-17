const loanDisbursement = require("../../pages/loanDisbursement.js");

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
 await loanDisbursement.validateSectionHavePastDueDate();
});

// Scenario: Validate request loan disbursement for type Loan PO when customer do not have any past due date
Given('I have been on Loan Dashboard to checking if customer Loan PO do not have any past due date', () => {
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanPO();
});

When('I click button "Gunakan Limit" in card type Loan PO', () => {

});
When('I do not have any past due date', () => {

});
Then('I direct to page for checking Loan Tenor', () => {

});

// Scenario: Validate request loan disbursement for type Loan PO when Loan Tenor More Than Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor more than Facility due date', () => {

});
When('I click button "Gunakan Limit" in card type loan PO', () => {

});
When('system check that loan tenor more than facility due date', () => {

});
Then('I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section', () => {

});

// Scenario: Validate Request Loan Disbursement for Type Loan PO when Loan Tenor Less Than or Equal With Facility Due Date
Given('I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date', () => {

});

When('I click button "Gunakan Limit" in card type Loan PO', () => {

});

When('system check that loan tenor less than or equal with facility due date', () => {

});

Then('I direct to anchor detail page', () => {

});

// Scenario: Validate Loan Program Information for Type Loan PO
Given('I have been in anchor detail page for type Loan PO', () => {

});

When('I click "Info Selengkapnya" in limit card', () => {

});

Then('I should be see loan program information section for that card has anchor', () => {

});

Then('I close the loan information section', () => {

});

Then('I back to the anchor detail', () => {

});
