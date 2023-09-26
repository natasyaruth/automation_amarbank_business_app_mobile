const { I, loginPage, loanDashboardPage } = inject();

const globalVar = {
    password: "",
    userID: "",
};

//@C88614 Scenario: Access History Dashboard For 'Limit' Bar
Given('I have been access history loan to see menu Limit', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
});
When('I access menu bar "Limit"', () => {
    loanDashboardPage.goToTabLimit();

});
Then('I should see history "Limit"', () => {
    loanDashboardPage.validateTabLimit();
});

//@C88615 Scenario: Access History Dashboard For 'Pencairan' Bar
Given('I have been access history loan to see menu "Pencairan"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
});

When('I access menu bar "Pencairan"', () => {
    loanDashboardPage.goToTabDisbursement();

});

Then('I should see history "Pencairan"', () => {
    loanDashboardPage.validateTabDisbursement();
});

//@C88617 Scenario: Access History Dashboard For 'Tagihan' Bar
Given('I have been access history loan to see menu "Tagihan"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
});
When('I access menu bar "Tagihan"', () => {
    loanDashboardPage.goToTabBills();

});
Then('I should see history "Tagihan"', () => {
    loanDashboardPage.validateTabBills();
});

//@C88618 Scenario: Access History Limit Dashboard For Status On Process
Given('I have been access history loan limit to see status "Dalam Proses"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabLimit();

});

When('I access menu bar limit with status "Dalam Proses"', () => {
    loanDashboardPage.goToStatusInProcessLimitHistory();

});
Then('I should see history limit on process', () => {
    loanDashboardPage.validateStatusInProcessLimitHistory();
});

//@C88619 Scenario: Access History Limit Dashboard For Status Active
Given('I have been access history loan limit to see status "Aktif"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabLimit();
});
When('I access menu bar limit with status "Aktif"', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});
Then('I should see history limit active', () => {
    loanDashboardPage.validateStatusActiveLimitHistory();
});

//@C88620 Scenario: Validate Limit Active With Multiple Active Loan
Given('I have been access history loan limit to see status user have more than one status active', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabLimit();
});
When('I access menu bar limit with status active', () => {
    loanDashboardPage.goToStatusActiveLimitHistory();
});
Then('I should see more than one active limit loan', () => {
    loanDashboardPage.verifyMultipleActiveLimit();
    //loanDashboardPage.grabNumberFromText;
    //loanDashboardPage.totalCardActive();
});

//@C88621 Scenario: Access History Limit Dashboard For Status Done
Given('I have been access history loan limit to see status "Selesai"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabLimit();
});
When('I access menu bar limit with status "Selesai"', () => {
    loanDashboardPage.goToStatusDoneLimitHistory();
});
Then('I should see history limit done', () => {
    loanDashboardPage.validateStatusDoneLimitHistory();
});

//@C88622 Scenario: Access History Loan Disbursement Dashboard For All Status
Given('I have been access history of loan disbursement to see status "Semua"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabDisbursement();

});
When('I access menu bar of loan disbursement with status "Semua"', () => {
    loanDashboardPage.goToAllStatusDisbursementHistory();
});

Then('I should see all history of disbursement', () => {
    loanDashboardPage.validateAllStatusDisbursementHistory();
});

//@C88623 Scenario: Access History Loan Disbursement For Status Send PDC
Given('I have been access history of loan disbursement to see status "Kirim PDC"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabDisbursement();
});
When('I access menu bar of loan disbursement with status "Kirim PDC"', () => {
    loanDashboardPage.goToStatusSendPDCofDisbursementHistory();
});
Then('I should see history of "Kirim PDC"', () => {
    loanDashboardPage.validateStatusSendPDCofDisbursementHistory();
});

//@C88624 Scenario: Access History Loan Disbursement For Status Waiting Confirmation
Given('I have been access history of loan disbursement to see status "Menunggu Konfirmasi"', () => {
    loanDashboardPage.goToLoanDashboard();
    loanDashboardPage.goToHistory();
    loanDashboardPage.goToTabDisbursement();
});
When('I access menu bar of loan disbursement with status "Menunggu Konfirmasi"', () => {
    loanDashboardPage.goToWaitingConfirmationStatusDisbursementHistory();
});

Then('I should see history of "Menunggu Konfirmasi"', () => {
    loanDashboardPage.validateWaitingConfirmationStatusDisbursementHistory();
});