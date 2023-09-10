const loanDashboardPage = require("../pages/loanDashboard");
const { fields } = require("../pages/login");

const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};

//Scenario: Access History Dashboard For 'Limit' Bar
Given('I have been access history loan to see menu "Limit"', () => {
    loanDashboardPage.goToHistory();
});
When('I access menu bar "Limit"', () => {
    loanDashboardPage.goToTabLimit();

});
Then('I should see history "Limit"', () => {
    loanDashboardPage.validateTabLimit();
});

//Scenario: Access History Dashboard For 'Pencairan' Bar
Given('I have been access history loan to see menu "Pencairan"', () => {
    loanDashboardPage.goToHistory();
});

When('I access menu bar "Pencairan"', () => {
    loanDashboardPage.goToTabDisbursement();

});

Then('I should see history "Pencairan"', () => {
    loanDashboardPage.validateTabDisbursement();
});

// Scenario: Access History Dashboard For 'Tagihan' Bar
Given('I have been access history loan to see menu "Tagihan"', () => {
    loanDashboardPage.goToHistory();
});
When('I access menu bar "Tagihan"', () => {
    loanDashboardPage.goToTabBills();

});
Then('I should see history "Tagihan"', () => {
    loanDashboardPage.validateTabBills();
});

//Scenario: Access History Limit Dashboard For Status On Process
Given('I have been access history loan limit to see status "Dalam Proses"', () => {
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabLimit();

});

When('I access menu bar limit with status "Dalam Proses"', () => {
    loanDashboardPage.goToStatusInProcessLimitHistory();

});
Then('I should see history limit on process', () => {
    loanDashboardPage.validateStatusInProcessLimitHistory();
});

//Scenario: Access History Limit Dashboard For Status Active
Given('I have been access history loan limit to see status "Aktif"', () => {
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabLimit();
});
When('I access menu bar limit with status "Aktif"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});
Then('I should see history limit active', () => {
    loanDashboardPage.validateStatusActiveLimitHistory();
});

//Scenario: Access History Limit Dashboard For Status Done
Given('I have been access history loan limit to see status "Selesai"', () => {
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabLimit();
});
When('I access menu bar limit with status "Selesai"', () => {
    loanDashboardPage.goToStatusDoneLimitHistory();
});
Then('I should see history limit done', () => {
    loanDashboardPage.validateStatusDoneLimitHistory();
});

//Scenario: Access History Loan Disbursement Dashboard For All Status
Given('I have been access history of loan disbursement to see status "Semua"', () => {
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabDisbursement();

});
When('I access menu bar of loan disbursement with status "Semua"', () => {
    loanDashboardPage.goToAllStatusDisbursementHistory();
});

Then('I should see all history of disbursement', () => {
    loanDashboardPage.validateAllStatusDisbursementHistory();
});

//Scenario: Access History Loan Disbursement For Status "Kirim PDC"
Given('I have been access history of loan disbursement to see status "Kirim PDC"', () => {
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabDisbursement();
});
When('I access menu bar of loan disbursement with status "Kirim PDC"', () => {
    loanDashboardPage.goToStatusSendPDCofDisbursementHistory();
});
Then('I should see history of "Kirim PDC"', () => {
    loanDashboardPage.validateStatusSendPDCofDisbursementHistory();
});

//Scenario: Access History Loan Disbursement For Status "Menunggu Konfirmasi"
Given('I have been access history of loan disbursement to see status "Menunggu Konfirmasi"', () => {
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabDisbursement();
});
When('I access menu bar of loan disbursement with status "Menunggu Konfirmasi"', () => {
    loanDashboardPage.goToWaitingConfirmationStatusDisbursementHistory();
});

Then('I should see history of "Menunggu Konfirmasi"', () => {
    loanDashboardPage.validateWaitingConfirmationStatusDisbursementHistory();
});