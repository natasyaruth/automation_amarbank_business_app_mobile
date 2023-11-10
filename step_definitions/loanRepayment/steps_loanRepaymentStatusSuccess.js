const { I, loginPage, loanDashboardPage, loanRepaymentPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate List Repayment in Loan dashboard with Status Success
Given('I have been on loan dashboard', () => {
 loanDashboardPage.goToLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.validateHistoryPage();
 loanDashboardPage.goToTabBills();
 loanDashboardPage.goToStatusDoneinTabBills();
});
When('I am validating the list card repayment with status Success', async () => {
 await loanRepaymentPage.accessCardDetailForStatusSuccess();
});

Then('I should be see the closest active bill with status Success', () => {

});

// Scenario: Accessing The Detail in History Bill with Filter In Process for Status Success
Given('I have been on loan dashboard to access the detail of history bill with filter in process for status success', () => {
 loanDashboardPage.goToLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.validateHistoryPage();
 loanDashboardPage.goToTabBills();
 loanDashboardPage.goToStatusDoneinTabBills();
});
When('I access the detail of status success from the first row', async () => {
 await loanRepaymentPage.validateBillSuccessStatus();
});
Then('I should be see the bill detail page of status success', async () => {
 await loanRepaymentPage.accessCardDetailForStatusSuccess();
});

// Scenario: Accessing "Lihat Detail" to See The Payment Info From Any Loan Tipe with Status Success
Given('I am on history bill with filter "Sedang Berjalan" in status Failed', () => {
 loanDashboardPage.goToLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.validateHistoryPage();
 loanDashboardPage.goToTabBills();
 loanDashboardPage.goToStatusDoneinTabBills();
});

When('I am accessing the card with status success', async () => {
 await loanRepaymentPage.accessCardDetailForStatusSuccess();
 loanRepaymentPage.validateBillSuccessStatus();
});

When('I am accessing the detail to see the payment info from any loan type with status success', () => {
 loanRepaymentPage.goToBillInformationStatusSuccess();
});

Then('I should be see the payment info from loan type AP or Direct AP or PO or AR in status success', () => {
 loanRepaymentPage.validateBillRepaymentSuccessStatus();
 loanRepaymentPage.closeBillInformation();
});

// Scenario: Validate Bill Information With Type Loan AP
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success', () => {
 loanDashboardPage.goToLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.validateHistoryPage();
 loanDashboardPage.goToTabBills();
 loanDashboardPage.goToStatusDoneinTabBills();
});

When('I access the detail', async () => {
 await loanRepaymentPage.accessCardDetailForStatusSuccess();
 loanRepaymentPage.validateBillRepaymentSuccessStatus();
 loanRepaymentPage.goToBillInformationStatusSuccess();
});

Then('I should be see the loan type AP', async () => {
 await loanRepaymentPage.goToDetailRepaymentSuccessStatusInfoLoanAP();
});

// Scenario: Validate Bill Information With Type Loan Direct AP
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success', () => {
 loanDashboardPage.goToLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.validateHistoryPage();
 loanDashboardPage.goToTabBills();
 loanDashboardPage.goToStatusDoneinTabBills();
});
When('I access the detail', async () => {
 await loanRepaymentPage.accessCardDetailForStatusSuccess();
 loanRepaymentPage.validateBillRepaymentSuccessStatus();
 loanRepaymentPage.goToBillInformationStatusSuccess();
});
Then('I should be see the loan type of Direct AP', async () => {
 await loanRepaymentPage.goToDetailRepaymentSuccessStatusInfoLoanDirectAP();
});

// Scenario: Validate Bill Information With Type PO
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success', () => {
 loanDashboardPage.goToLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.validateHistoryPage();
 loanDashboardPage.goToTabBills();
 loanDashboardPage.goToStatusDoneinTabBills();
});
When('I access the detail', async () => {
 await loanRepaymentPage.accessCardDetailForStatusSuccess();
 loanRepaymentPage.validateBillRepaymentSuccessStatus();
 loanRepaymentPage.goToBillInformationStatusSuccess();
});

Then('I should be see the loan type of PO', () => {
 loanRepaymentPage.goToDetailRepaymentSuccessStatusInfoLoanPO();
});

// Scenario: Validate Bill Information With Type AR
Given('I have been on history card "Tagihan" with filter "Sedang Berjalan" to see bill information with status success', () => {
 loanDashboardPage.goToLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.validateHistoryPage();
 loanDashboardPage.goToTabBills();
 loanDashboardPage.goToStatusDoneinTabBills();
});
When('I access the detail', async () => {
 await loanRepaymentPage.accessCardDetailForStatusSuccess();
 loanRepaymentPage.validateBillRepaymentSuccessStatus();
 loanRepaymentPage.goToBillInformationStatusSuccess();
});
Then('I should be see the loan type of AR', () => {
 loanRepaymentPage.goToDetailRepaymentSuccessStatusInfoLoanAR();
});
