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
});

Then('I should see approve loan offer card', () => {
    loanDashboardPage.validateLimitCardOffering();
});

Then('I should see the button to apply for new limit loan', () => {
    I.seeElement(this.buttons.buttonNewLimit);
});


//Scenario: Access Loan limit Approval Page
Given('I have been on loan dashboard page and show a loan limit offer card', () => {
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
Then('New limit loan page will show', () => {

});

//Scenario: Access History Limit Dashboard
Given('I have been access loan dashboard to see history loan', () => {
    loanDashboardPage.validateLimitCardOffering();
});
When('I am accessing history', () => {
    loanDashboardPage.goToHistory();
});
Then('history loan page will be showed', () => {
    loanDashboardPage.validateHistoryPage();
});

