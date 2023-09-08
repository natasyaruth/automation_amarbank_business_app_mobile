const loanDashboardPage = require("../pages/loanDashboard");
const { fields } = require("../pages/login");

const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};

//Scenario: Validate design of entry point signature user drop off for approval limit loan
Given('I got a card for signature loan limit offer from system', () => {

});
When('I access loan business in main dashboard for checking the signature entry point', () => {

});

Then('I should see signature approval card for the loan offer', () => {
    loanDashboardPage.validateSignatureCard();
});

//Scenario: Back to The Main Dashboard
Given('I am on the loan Dashboard', () => {
    loanDashboardPage.validateSignatureCard();

});
When('I back to the previous page', () => {
    loanDashboardPage.clickButtonBack();

});
Then('I should see main dashboard', () => {

});

//Scenario: Access Signature Loan limit Approval Page
Given('I have been on signature approval card for the loan offer', () => {
    loanDashboardPage.validateSignatureCard();
});
When('I am accessing loan limit approval page', () => {
    loanDashboardPage.goToSignaturedPage();

});
Then('I am directing to signature approval page', () => {
    loanDashboardPage.validateSignaturePage();
});

//Scenario: Access Signature Loan Limit Page When Offering Time is Expired
Given('I have been on loan dashboard page and show expired loan limit offer card', () => {

});
When('I access loan limit approval page with card got expired time', () => {
    loanDashboardPage.validateSignatureCard();
});
Then('system should display loan limit offer has been expired page', () => {
    loanDashboardPage.validateSignatureCardisExpired();
});

Then('I cannot access detail limit offer card', () => {
    loanDashboardPage.validateOfferCardDisable();
});

// Scenario: Validate Slider After Card Added
Given('I got a card for another loan limit offer card from system', () => {

});
When('I access loan business in main dashboard for checking the addition card', () => {
    loanDashboardPage.validateSignatureCard();
});
Then('I should slide the card section', () => {
    loanDashboardPage.multipleEntryPointSliderCard();
});

// Scenario: Back to The Previous Dashboard
Given('I am on the loan limit offer card', () => {
    loanDashboardPage.multipleEntryPointSliderCard();
});
When('I back to the previous page', () => {
    loanDashboardPage.clickButtonBack();
});

Then('I should see previous page', () => {

});




