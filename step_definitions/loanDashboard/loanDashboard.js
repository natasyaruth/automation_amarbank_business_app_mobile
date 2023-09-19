// const loanDashboardPage = require("../pages/loanDashboard");
// const { fields } = require("../pages/login");

const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};

// Scenario: Validate design of loan dashboard offer
Given('I got a loan limit offer from system', () => {

});
When('I access loan business in main dashboard', () => {
    I.click("Loan Dashboard")
});

Then('I should see approve loan offer card', () => {
    I.wait(3);
    loanDashboardPage.validateLimitCardOffering();
});

Then('I should see the button to apply for new limit loan', () => {
    //I.seeElement(this.buttons.buttonNewLimit);
    I.see("Ajukan Limit Baru");
});


//Scenario: Access Loan limit Approval Page
Given('I have been on loan dashboard page and show a loan limit offer card', () => {
    I.click("Loan Dashboard");
    loanDashboardPage.validateLimitCardOffering();
});

When('I am accessing loan limit approval page', () => {
    loanDashboardPage.goToApprovalLimitOffering();
});

When('I approve loan limit', () => {
    loanDashboardPage.approveLimitLoanOffering();
});

Then('system should display this feature under development', () => {
    loanDashboardPage.verifyApproveLimit();

});

// Scenario: Access Loan limit Approval Page When Offering Time is Expired
Given('I have been on loan dashboard page and show expired loan limit offer card', () => {
    loanDashboardPage.validateLimitCardOffering();
});
When('I access loan limit approval page with card got expired time', () => {
    loanDashboardPage.goToApprovalLimitOffering();
});

Then('system should display loan limit offer has been expired page', () => {
    loanDashboardPage.validateApprovalLimitOfferHasExpired();

});

// Scenario: Close page Loan limit Approval Page
Given('I have been access loan limit approval page', () => {
    loanDashboardPage.goToApprovalLimitOffering();
});
When('I close page', () => {
    loanDashboardPage.closeApproveLimitLoanPage();
});

Then('loan limit approval page is closed', () => {
    I.waitForInvisible(this.buttons.buttonClose);
});

Then('I back to the loan dashboard page', () => {
    loanDashboardPage.validateLimitCardOffering();

});

//Scenario: Apply for new limit loan
Given('I have been access loan dashboard', () => {
    loanDashboardPage.validateLimitCardOffering();
});
When('I am adding apply for new limit loan', () => {
    loanDashboardPage.applyNewLimitLoan();
});
Then('Show Loan Schema', () => {
    loanDashboardPage.validateSchemaLoanPage();
});

//Scenario: Access History Limit Dashboard
Given('I have been access loan dashboard to see history loan', () => {
    I.click("Loan Dashboard");
    loanDashboardPage.validateLimitCardOffering();
});
When('I am accessing history', () => {
    loanDashboardPage.goToHistory();
});
Then('History loan page will be showed', () => {
    loanDashboardPage.validateHistoryPage();
});

// Scenario: Back to The Main Dashboard
Given('I am on the loan Dashboard', () => {
    I.click("Loan Dashboard");
    loanDashboardPage.validateLimitCardOffering();
});
When('I back to the previous page', () => {
    loanDashboardPage.clickButtonBack();
});

Then('I should see main dashboard', () => {
    I.see("Loan Dashboard");
});

// Scenario: Validate Card Limit For Type Loan AP
Given('I have been on Loan Dashboard to see the loan type of Loan AP', () => {
    I.click("Loan Dashboard");
    loanDashboardPage.validateLimitCardOffering();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan AP"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording dan card design of "Loan AP"', () => {
    loanDashboardPage.validateLoanTypeofLoanAP();
});

// Scenario: Validate Card Limit For Type Loan AP Direct Loan
Given('I have been on Loan Dashboard to see the loan type of Loan AP Direct Loan', () => {
    I.click("Loan Dashboard");
    loanDashboardPage.validateLimitCardOffering();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan AP direct loan"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording dan card design of "Loan AP Direct Loan"', () => {
    loanDashboardPage.validateLoanTypeofLoanAPDirectLoan();
});

// Scenario: Validate Card Limit For Type Loan PO
Given('I have been on Loan Dashboard to see the loan type of Loan PO', () => {
    I.click("Loan Dashboard");
    loanDashboardPage.validateLimitCardOffering();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan PO"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording dan card design of "Loan PO"', () => {
    loanDashboardPage.validateLoanTypeofLoanPO();
});

// Scenario: Validate Card Limit For Type Loan PO
Given('I have been on Loan Dashboard to see the loan type of Loan AR Direct Loan', () => {
    I.click("Loan Dashboard");
    loanDashboardPage.validateLimitCardOffering();
    loanDashboardPage.goToHistory();
});

When('I validate the card of "Loan AR direct loan"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});

Then('I should see the wording dan card design of "Loan AR Direct Loan"', () => {
    loanDashboardPage.validateLoanTypeofLoanARDirectLoan;
});




