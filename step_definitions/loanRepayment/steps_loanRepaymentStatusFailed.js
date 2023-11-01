const { I, loginPage, loanDashboardPage, loanRepaymentPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate List Repayment in Loan dashboard with Status Failed
Given('I have been on loan dashboard with status Failed', () => {
 loanDashboardPage.goToLoanDashboard();
});

When('I am validating the list card repayment with status Failed', async () => {
 loanRepaymentPage.validateCardStatusFailed();
});

Then('I should be see the closest active bill with status Failed', () => {

});

//Scenario: Accessing The Detail in History Bill with Filter In Process for Status Failed
Given('I have been on loan dashboard to access the detail of history bill with filter in process for status failed', () => {
 loanDashboardPage.goToLoanDashboard();
});

When('I access the detail of status failed from the first row', async () => {
 await loanRepaymentPage.validateCardStatusFailed();
});
Then('I should be see the bill detail page of status failed', async () => {
 await loanRepaymentPage.accessCardDetailForStatusFailed();
});

// Scenario: Accessing "Lihat Detail" to See The Payment Info From Any Loan Tipe with Status Failed
Given('I am on history bill with filter "Sedang Berjalan" in status Failed', async () => {
 loanDashboardPage.goToLoanDashboard();
});
When('I am accessing the card with status failed', () => {

});
When('I am accessing the detail to see the payment info from any loan type with status failed', () => {
 loanRepaymentPage.goToBillInformation();
});
Then('I should be see the payment info from loan type AP or Direct AP or PO or AR in status failed', () => {

});