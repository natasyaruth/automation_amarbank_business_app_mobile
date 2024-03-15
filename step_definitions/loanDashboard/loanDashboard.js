const { I, loginPage, loanDashboardPage } = inject();

// @C88625 Scenario: Validate design of loan dashboard offer
Given('I got a loan limit offer from system', () => {

});
When('I access loan business in main dashboard', () => {
    loanDashboardPage.goToLoanDashboard();
});

Then('I should see approve loan offer card', () => {
    I.wait(3);
    loanDashboardPage.validateLimitCardOffering();
});

Then('I should see the button to apply for new limit loan', () => {
    loanDashboardPage.applyNewLimitLoan();
});

//@C88626 Scenario: Access Loan limit Approval Page
Given('I have been on loan dashboard page and show a loan limit offer card', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.validateLimitCardOffering();
});

When('I am accessing loan limit approval page', () => {
    loanDashboardPage.goToApprovalLimitOffering();
});

And ('I see loan offering page MSME', () => {
    loanDashboardPage.validateApprovalLimitOfferStillRunningMSME();
});

And ('I see loan offering page CORP with admin and provisi is displayed', () => {
    loanDashboardPage.validateApprovalLimitOfferStillRunningCORP();
});

When('I approve loan limit', () => {
    loanDashboardPage.approveLimitLoanOffering();
});

Then('system should display this feature under development', () => {
    loanDashboardPage.verifyApproveLimit();

});

//@C88627 Scenario: Access Loan limit Approval Page When Offering Time is Expired
Given('I have been on loan dashboard page and show expired loan limit offer card', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.validateLimitCardOffering();
});
When('I access loan limit approval page with card got expired time', () => {
    loanDashboardPage.goToApprovalLimitOffering();
});

Then('system should display loan limit offer has been expired page', () => {
    loanDashboardPage.validateApprovalLimitOfferHasExpired();

});

//@C88628 Scenario: Close page Loan limit Approval Page
Given('I have been access loan limit approval page', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToApprovalLimitOffering();
});
When('I close page', () => {
    loanDashboardPage.closeApproveLimitLoanPage();
});

Then('loan limit approval page is closed', () => {
    loanDashboardPage.validateButtonCloseInvisible();
});

Then('I back to the previous page to verify loan Dashboard', () => {
    loanDashboardPage.validateLimitCardOffering();

});

//@C88629 Scenario: Apply for new limit loan
Given('I have been access loan dashboard to apply new limit loan', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.validateLimitCardOffering();
});
When('I am adding apply for new limit loan', () => {
    loanDashboardPage.applyNewLimitLoan();
});
Then('Show Loan Schema', () => {
    loanDashboardPage.validateSchemaLoanPage();
});

//@C88630 Scenario: Access History Limit Dashboard
Given('I have been access loan dashboard to see history loan', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.validateLimitCardOffering();
});
When('I am accessing history', () => {
    loanDashboardPage.goToHistory();
});
Then('History loan page will be showed', () => {
    loanDashboardPage.validateHistoryPage();
});

//@C88631 Scenario: Back to The Main Dashboard
Given('I am on the loan Dashboard', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.validateLimitCardOffering();
});
When('I back to the previous page', () => {
    loanDashboardPage.clickButtonBack();
});

Then('I should see main dashboard', () => {
    I.see("Dashboard Screen");
    I.see("Loan Dashboard");
});

//@C88632 Scenario: Validate Card Limit For Type Loan AP
Given('I have been on Loan Dashboard to see the loan type of Loan AP', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan AP"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording and card design of "Loan AP"', async () => {
    await loanDashboardPage.validateLoanTypeofLoanAP();
});

//@C88633 Scenario: Validate Card Limit For Type Loan AP Direct Loan
Given('I have been on Loan Dashboard to see the loan type of Loan AP Direct Loan', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan AP direct loan"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording and card design of "Loan AP Direct Loan"', async () => {
    await loanDashboardPage.validateLoanTypeofLoanAPDirectLoan();
});

//@C88634 Scenario: Validate Card Limit For Type Loan PO
Given('I have been on Loan Dashboard to see the loan type of Loan PO', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan PO"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording and card design of "Loan PO"', async () => {
    await loanDashboardPage.validateLoanTypeofLoanPO();
});

//@C88635 Validate Card Limit For Type Loan AR Direct Loan
Given('I have been on Loan Dashboard to see the loan type of Loan AR Direct Loan', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan AR direct loan"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording and card design of "Loan AR Direct Loan"', async () => {
    await loanDashboardPage.validateLoanTypeofLoanARDirectLoan();
});