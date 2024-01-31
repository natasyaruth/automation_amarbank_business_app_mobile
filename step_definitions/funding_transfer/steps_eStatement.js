const {
  I,
  friendListPage,
  createPINPage,
  globalVariable,
  transactionHistoryPage,
} = inject();

// Scenario: User open transaction history
Given('I am a customer who want to open transaction history', () => {
    transactionHistoryPage.seeBtnHistory();
});

When('I click history menu', () => {
    transactionHistoryPage.clickBtnHistory();
});

Then('I direct to history page', async () => {
    await transactionHistoryPage.viewPageHistoryTransaction();
});

Then('I will see the button e-Statement', () => {
    transactionHistoryPage.viewButtonDownloadEStatement();
});


// Scenario: Download e-Statement by the latest month
Given('I am a customer who want to download e-Statement based on the latest month', () => {
    transactionHistoryPage.seeBtnHistory();
});

When('I click button e-Statement download', () => {
    transactionHistoryPage.clicBtnDownloadeStatement();
});

When('I choose the latest month to download e-Statement', () => {
    transactionHistoryPage.clicBtnLatesteStatement();
});

Then('The e-Statement downloaded', () => {
    transactionHistoryPage.viewAlertBar();
});

Then('Receive notification email', () => {
    
});

// Scenario: Download e-Statement when e-Statement not exist
Given('I am a customer who want to download e-Statement when e-Statement not exist', () => {
    transactionHistoryPage.seeBtnHistory();
});

Then('Notification e-Statement not exist will appear', () => {
    transactionHistoryPage.validationeStatementNotExist();
});

// Scenario: Show alert bar when success download e-Statement
Then('Alert bar success will appear', async () => {
    await transactionHistoryPage.checkAlertBar();
});

// Scenario: Show alert bar when failed download e-Statement
Then('Alert bar failed will appear', async () => {
    await transactionHistoryPage.checkAlertBar();
});