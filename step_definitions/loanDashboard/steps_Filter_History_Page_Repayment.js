const filterLoanHistory = require("../../pages/filterLoanHistory");
const { radioButton } = require("../../pages/loanApplication/selectLoanAmountTenor");

const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};

Then('I acces menu bar "Tagihan"', () => {
    loanDashboardPage.goToTabBills();
});

//Scenario: Access History Page Repayment For More Than 1 Facility  
Given ('I have been access history repayment to see "Pilih Fasilitas"', () => {
    filterLoanHistory.validateFilterByFacility();
});
Then('I should see history "Tagihan" for more than 1 facility', () => {
    filterLoanHistory.validateCardListRepayment();
});

Then('I click bottom sheet "1 Facility"', () =>{
    filterLoanHistory.clickRadioButtonByTitle();
});

When('I click bottom sheet more than 1 facility repayment', () =>{
    filterLoanHistory.clickMoreThan1FacilityRepayment();
});

When('I click bottom sheet more than 1 facility repaymen', () =>{
    filterLoanHistory.click1Facili();
});

When('I click bottom sheet only 1 Facility repayment', () => {
    filterLoanHistory.clickMoreThan1FacilityRepayment();
});
When('I click bottom sheet "1 Facility" repaymen', () => {
    filterLoanHistory.click1Facility();
});

// Scenario: Access History Page Repayment For Semua Status
Given('I have been access history repayment to see "Pilih Status"', () => {
    filterLoanHistory.validateFilterByStatus();
});

Then('I should see history "Tagihan" for semua status', () => {
    filterLoanHistory.validateCardListRepayment();
});

// Scenario: Access History Page Repayment For Sedang Berjalan
When('I click bottom sheet "Sedang Berjalan"', () => {
    filterLoanHistory.clickFilterByStatusSedangBerjalan();
});
Then('I should see history "Tagihan" for semua sedang berjalan', () => {
    filterLoanHistory.validateCardListRepayment();
});

//Scenario: Access History Page Repayment For Selesai
When('I click bottom sheet "Selesai"', () => {
    filterLoanHistory.clickFilterByStatusSelesai();
});
Then('I should see history "Tagihan" for semua selesai', () => {
    filterLoanHistory.validateCardListRepayment();
});

//Scenario: Access History Page Repayment For only 1 facility and For Semua Status
Then('I should see history "Tagihan" for only 1 facility and For Semua Status', () => {
    filterLoanHistory.validateCardListRepayment();
});

When('I should see history', () => {
});