const filterLoanHistory = require("../../pages/filterLoanHistory");
const { radioButton } = require("../../pages/loanApplication/selectLoanAmountTenor");

const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};
// Scenario: Access History Dashboard For "Pencairan" Bar
Given('I have acces history loan to see menu "Pencairan"', () => {
    loanDashboardPage.validateTabPencairan();
});

When('I acces menu bar "Pencairan"', () => {
    loanDashboardPage.goToTabDisbursement();
});

Then('I Access Tab "Pencairan"', () => {
    loanDashboardPage.goToTabDisbursement();
});

//Scenario: Access History Page Disbursement For More Than 1 Facility  
Given('I have been acces history disbursement to see "Pilih Fasilitas"', () =>{
    filterLoanHistory.validateFilterByFacility();
});

When('I click menu bar "Pilih Fasilitas"', () => {
    filterLoanHistory.clickFilterByFacility();
});

When ('I should see bottom sheet "Pilih Fasilitas"', () => {
    I.waitForElement(filterLoanHistory.radioButtons.radioButtonAll, 3);
    I.see("Pilih Fasilitas");
    
});

When ('I click bottom sheet "Semua"', () => {
    filterLoanHistory.clickRadioButtonAll();
});


Then ('I should see history "Pencairan" for more than 1 facility', () => {
    filterLoanHistory.validateCardListDisbursement();
});

When('I click bottom sheet for than more 1 facility disbursement', () => {
    filterLoanHistory.clickMoreThan1FacilityDisbursement();
}),
When('I click bottom sheet only 1 Facility disbursement', () => {
    filterLoanHistory.clickOnly1FacilityDisbursement();
}),

//Scenario: Access Histoy Page Disbursement For Only 1 Facility
When('I click bottom sheet 1 Facility', () => {
    filterLoanHistory.selectIndexRadioButtonByFacility();
});
Then('I should see history Disbursement for only 1 facility', () => {
    I.wait(10); 
});

//Scenario: Access History Page Disbursement For Semua Status
Given('I have been acces history disbursement to see "Pilih Status"', () => {
    filterLoanHistory.validateFilterByStatus();
});
When('I click menu bar "Pilih Status"', () => {
    filterLoanHistory.clickFilterByStatus();
});
When('I should see bottom sheet "Filter Status"', () => {
    I.waitForElement(filterLoanHistory.radioButtons.radioButtonStatusAll, 3);
    I.see("Filter Status");
}); 
When('I click bottom sheet "Semua"', () => {
    filterLoanHistory.clickFilterByStatusAll();
});
Then('I should see history "Pencairan" for semua status', () => {
    filterLoanHistory.validateCardListDisbursement();
});

// Scenario: Acces History Page Disbursement For Dalam Proses
When('I click bottom sheet "Dalam Proses"', () => {
    filterLoanHistory.clickFilterByStatusDalamProses();
});
Then('I should see history "Pencairan" for dalam proses', () => {
    filterLoanHistory.validateCardListDisbursement();
});

//Scenario: Acces History Page Disbursement For Pencairan Berhasil
When('I click bottom sheet "Pencairan Berhasil"', () => {
    filterLoanHistory.clickFilterByStatusPencairanBerhasil();
});
Then('I should see history "Pencairan" for pencairan berhasil', () => {
    filterLoanHistory.validateCardListDisbursement();
});

//Scenario: Acces History Page Disbursement For Tidak Disetujui
Then('I click bottom sheet "Tidak Disetujui"', () => {
    filterLoanHistory.clickFilterByStatusTidakDisetujui();
});
Then('I should see history "Pencairan" for tidak disetujui', () => {
    filterLoanHistory.validateCardListDisbursement();
});




