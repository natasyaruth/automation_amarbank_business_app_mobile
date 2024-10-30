const loanDashboard = require("../../pages/loanDashboard");

const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};

When('I click menu lihat detail pinjaman', () =>{
    loanDashboardPage.goToLoanDetail();
});
When('I click menu history', () => {
    loanDashboardPage.goToHistory();
}); 
// Scenario: Access History Dashboard For Limit Bar
Given('I have access history loan to see tab limit', () => {
});

When('I access and click menu bar {string}', () => {
    loanDashboardPage.goToTabLimit(); 
}); 

Then('I Should see history loan {string}', () => {
    loanDashboardPage.validateTabLimit();
});

// Scenario: Access History Page Limit For Dalam Proses
Given('I have been access history loan limit to see status "Dalam Proses" in loan limit', () =>{
    loanDashboardPage.validateStatusOnProces();
}); // lanjutannya ada di loan dashboard.js

// Scenario: Access History Page Limit For Status Aktif
Given('I have been access history loan limit to see status "Aktif" in loan limit', () => {
    loanDashboardPage.validateStatusActive();
}); // lanjutannya ada di loan dashboard.js

// Scenario: Access History Page Limit For Status Selesai
Given('I have been access history loan limit to see status "Selesai" on loan limit', () => {
    loanDashboardPage.validateStatusDone();
});