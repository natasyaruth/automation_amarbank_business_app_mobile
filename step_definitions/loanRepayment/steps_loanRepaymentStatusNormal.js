const { I, loginPage, loanDashboardPage, loanRepaymentPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate List Repayment in Loan dashboard with Status Normal
Given('I have been on loan dashboard', () => {
 loanDashboardPage.goToLoanDashboard();
});

When('I am validating the list card repayment with status Normal', async () => {
 await loanRepaymentPage.validateCardStatusNormalRepayment();
});

Then('I should be see the closest active bill with status Normal', () => {

});

// Scenario: Validate Alert Text After Loan Disbursement was Successfull
Given('I have been got Successfull disbursement', () => {

});

When('I go to loan dashboard', () => {
 loanDashboardPage.goToLoanDashboard();
});

Then('I should be see alert text that loan was successfull disbursed', async () => {
 await loanRepaymentPage.validateAlertAfterLoanWasSuccessful();
});

Then('I should not be see the alert text loan was successfull after I close the section', () => {
 loanRepaymentPage.closeInformationTextLoanHasBeenSuccessedDisbursed();
});
