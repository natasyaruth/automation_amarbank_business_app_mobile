const loanDashboardPage = require("../pages/loanDashboard");
const { fields } = require("../pages/login");

const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};

// Scenario: Access History Limit Dashboard
Given('I have been access loan dashboard to see history loan', () => {

});
When('I am accessing history', () => {


});

//Scenario: Access History Dashboard For 'Pencairan' Bar
Given('I have been access history loan to see menu "Pencairan"', () => {
    loanDashboardPage.goToHistory();
});

When('I access menu bar "Pencairan"', () => {

});

Then('I should see history "Pencairan"', () => {

});

//Scenario: Access History Dashboard For 'Limit' Bar
Given('I have been access history loan to see menu "Limit"', () => {
    loanDashboardPage.goToHistory();
});
When('I access menu bar "Limit"', () => {

});
Then('I should see history "Limit"', () => {

});

// Scenario: Access History Dashboard For 'Tagihan' Bar
Given('I have been access history loan to see menu "Tagihan"', () => {
    loanDashboardPage.goToHistory();
});
When('I access menu bar "Tagihan"', () => {

});
Then('I should see history "Tagihan"', () => {

});

//Scenario: Access History Limit Dashboard For Status On Process
Given('I have been access history loan limit to see status "Dalam Proses"', () => {
    loanDashboardPage.goToHistory();
});
When('I access menu bar limit with status "Dalam Proses"', () => {
    loanDashboardPage.goToStatusInProcessLimitHistory();
});
Then('I should see history limit on process', () => {

});

//Scenario: Access History Limit Dashboard For Status Active
Given('I have been access history loan limit to see status "Aktif"', () => {
    loanDashboardPage.goToHistory();
});
When('I access menu bar limit with status "Aktif"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});
Then('I should see history limit active', () => {

});

//Scenario: Access History Limit Dashboard For Status Done
Given('I have been access history loan limit to see status "Selesai"', () => {
    loanDashboardPage.goToHistory();
});
When('I access menu bar limit with status "Selesai"', () => {
    loanDashboardPage.goToStatusDoneLimitHistory();
});
Then('I should see history limit done', () => {

});