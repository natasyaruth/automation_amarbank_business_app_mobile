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
    filterLoanHistory.validateCardListDisbursement();
});

// Scenario: Access Histoy Page Repayment For Only 1 Facility
Then('I click bottom sheet "1 Facility"', () =>{
    filterLoanHistory.selectIndexRadioButtonByFacility();
});
Then('I should see history "Tagihan" for more than 1 facility', () => {
    filterLoanHistory.validateCardListDisbursement();
});
