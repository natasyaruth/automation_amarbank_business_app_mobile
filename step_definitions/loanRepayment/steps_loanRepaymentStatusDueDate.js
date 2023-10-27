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
 await loanRepaymentPage.accessCardDetailForDueDate3();
 loanRepaymentPage.validateBillDateDueDate3();
});

// Scenario: Accessing "Lihat Detail" to See The Payment Info From Any Loan Tipe with Status Due Date D - 3
Given('I am on history bill with filter "Sedang Berjalan"', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusDueDateRepayment();
 await loanRepaymentPage.accessCardDetailForDueDate3();
});

When('I am accessing the card with status due date', () => {
 loanRepaymentPage.validateBillDateDueDate3();
});

When('I am accessing the detail to see the payment info from any loan type', () => {
 loanRepaymentPage.goToBillInformation();
});

Then('I should be see the payment info from loan type AP or Direct AP or PO or AR', () => {
 loanRepaymentPage.validateBillRepayment();
 loanRepaymentPage.closeBillInformation();
});


// Scenario: Calling the Call Center
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan"', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusDueDateRepayment();
 await loanRepaymentPage.accessCardDetailForDueDate3();
 loanRepaymentPage.validateBillDateDueDate3();
});

When('I call the call Center', () => {
 loanRepaymentPage.goTolinkComplaint();

});

Then('the call center is opened', () => {

});


// Scenario: Validate Bill Information With Type Loan AP
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusDueDateRepayment();
 await loanRepaymentPage.accessCardDetailForDueDate3();
 loanRepaymentPage.validateBillDateDueDate3();

});

When('I access the detail', () => {
 loanRepaymentPage.goToBillInformation();
});

Then('I should be see the loan type AP', async () => {
 await loanRepaymentPage.goToDetailRepaymentInfoLoanAP();
});


// Scenario: Validate Bill Information With Type Loan Direct AP
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusDueDateRepayment();
 await loanRepaymentPage.accessCardDetailForDueDate3();
 loanRepaymentPage.validateBillDateDueDate3();
});

When('I access the detail', () => {
 loanRepaymentPage.goToBillInformation();
});

Then('I should be see the loan type of Direct AP', async () => {
 await loanRepaymentPage.goToDetailRepaymentInfoLoanDirectAP();
});


// Scenario: Validate Bill Information With Type PO
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusDueDateRepayment();
 await loanRepaymentPage.accessCardDetailForDueDate3();
 loanRepaymentPage.validateBillDateDueDate3();
});

When('I access the detail', () => {
 loanRepaymentPage.goToBillInformation();
});

Then('I should be see the loan type of PO', async () => {
 await loanRepaymentPage.goToDetailRepaymentInfoLoanPO();
});


// Scenario: Validate Bill Information With Type AR
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusDueDateRepayment();
 await loanRepaymentPage.accessCardDetailForDueDate3();
 loanRepaymentPage.validateBillDateDueDate3();
});

When('I access the detail', () => {
 loanRepaymentPage.goToBillInformation();
});

Then('I should be see the loan type of AR', async () => {
 await loanRepaymentPage.goToDetailRepaymentInfoLoanAR();
});
