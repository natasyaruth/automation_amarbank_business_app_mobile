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
Given('I am on history bill with filter "Sedang Berjalan" and status Failed', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusFailed();
 await loanRepaymentPage.accessCardDetailForStatusFailed();
});
When('I am accessing the card with status failed', () => {
 loanRepaymentPage.validateBillFailedStatus();
});
When('I am accessing the detail to see the payment info from any loan type with status failed', () => {
 loanRepaymentPage.goToBillInformationStatusFailed();
});
Then('I should be see the payment info from loan type AP or Direct AP or PO or AR in status failed', () => {
 loanRepaymentPage.validateBillRepaymentFailedStatus();
 loanRepaymentPage.closeBillInformation();
});

// Scenario: Calling the Call Center in Detail Status Failed
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" and Status Failed', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusFailed();
 await loanRepaymentPage.accessCardDetailForStatusFailed();
 loanRepaymentPage.validateBillFailedStatus();
});
When('I call the call Center in Detail Bill Failed Status', () => {
 loanRepaymentPage.goTolinkComplaint();
});
Then('the call center is opened', () => {

});

// Scenario: Validate Bill Information With Type Loan AP Status Failed
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusFailed();
 await loanRepaymentPage.accessCardDetailForStatusFailed();
 loanRepaymentPage.validateBillFailedStatus();
});
When('I access the detail of billing information status failed', () => {
 loanRepaymentPage.goToBillInformationStatusFailed();
});

Then('I should be see the loan type AP status failed', async () => {
 await loanRepaymentPage.goToDetailRepaymentFailedInfoLoanAP();
});

// Scenario: Validate Bill Information With Type Loan Direct AP Status Failed
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusFailed();
 await loanRepaymentPage.accessCardDetailForStatusFailed();
 loanRepaymentPage.validateBillFailedStatus();
});
When('I access the detail bill information with status failed', () => {
 loanRepaymentPage.goToBillInformationStatusFailed();
});
Then('I should be see the loan type of Direct AP status failed', async () => {
 await loanRepaymentPage.goToDetailRepaymentFailedStatusInfoLoanDirectAP();
});

// Scenario: Validate Bill Information With Type PO Status Failed
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusFailed();
 await loanRepaymentPage.accessCardDetailForStatusFailed();
 loanRepaymentPage.validateBillFailedStatus();
});
When('I access the detail bill information with status failed', () => {
 loanRepaymentPage.goToBillInformationStatusFailed();
});
Then('I should be see the loan type of PO status failed', async () => {
 await loanRepaymentPage.goToDetailRepaymentFailedStatusInfoLoanPO();
});

// Scenario: Validate Bill Information With Type AR Status Failed
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status failed', async () => {
 loanDashboardPage.goToLoanDashboard();
 await loanRepaymentPage.validateCardStatusFailed();
 await loanRepaymentPage.accessCardDetailForStatusFailed();
 loanRepaymentPage.validateBillFailedStatus();
});
When('I access the detail bill information with status failed', () => {
 loanRepaymentPage.goToBillInformationStatusFailed();
});
Then('I should be see the loan type of AR status failed', async () => {
 await loanRepaymentPage.goToDetailRepaymentFailedStatusInfoLoanAR();
});