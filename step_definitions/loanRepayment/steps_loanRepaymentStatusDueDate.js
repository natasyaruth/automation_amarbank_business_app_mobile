const { I, loginPage, loanDashboardPage, loanRepaymentPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate List Repayment in Loan dashboard with Status Due Date
Given('I have been on loan dashboard', () => {
 loanDashboardPage.goToLoanDashboard();
});
When('I am validating the list card repayment with status Due Date', async () => {
 await loanDisbursementPage.validateCardStatusDueDateRepayment();
});
Then('I should be see the closest active bill with status Due Date', () => {
 loanDisbursementPage.countDownDueDate();
});