const { I, loginPage, loanDashboardPage, loanRepaymentPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate List Repayment in Loan dashboard with Status Due Date
Given('I have been on loan dashboard with status Due Date D-3', () => {
 loanDashboardPage.goToLoanDashboard();
});
When('I am validating the list card repayment with status Due Date D-3', async () => {
 await loanRepaymentPage.validateCardStatusDueDateRepayment();
});
Then('I should be see the closest active bill with status Due Date D-3', () => {
 loanRepaymentPage.countDownDueDate();
});

// Scenario: Accessing The Detail in History Bill with Filter In Process for Status "Due Date" D - 3
Given('I have been on loan dashboard to access the detail of history bill with filter in process for status due date d - 3', () => {
 loanDashboardPage.goToLoanDashboard();
});
When('I access the detail of status due date d - 3 from the first row', () => {
 loanRepaymentPage.validateCardStatusDueDateRepayment();
 loanRepaymentPage.countDownDueDate();
});
Then('I should be see the bill detail page of status due date d - 3', async () => {
 await loanRepaymentPage.accessDetailForDueDate3();
 loanRepaymentPage.validateBillDateDueDate3();
});