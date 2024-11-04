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

Then('I will see the button filter', () => {
    transactionHistoryPage.viewButtonFilterTransactionHistory();
});


// Scenario: Download e-Statement by the latest month
Given('I am a customer who want to download e-Statement based on the latest month', () => {
    transactionHistoryPage.seeBtnHistory();
});

When('I click button e-Statement download', () => {
    transactionHistoryPage.clickBtnDownloadeStatement();
});

When('I choose the latest month to download e-Statement', () => {
    transactionHistoryPage.clickBtnLatesteStatement();
});

When('I will direct to input password page', () => {
    transactionHistoryPage.seePasswordPage();
});

When('I input valid password {string} on field password', (password) => {
    transactionHistoryPage.fillPasswordeStatement(password);
});

When('I input invalid password {string} on field password', (password) => {
    transactionHistoryPage.fillPasswordeStatement(password);
});

When('I click button Next', () => {
    transactionHistoryPage.clickBtnNexteStatement();
});

Then('The e-Statement downloaded', () => {
    transactionHistoryPage.viewSuccessAlertBar();
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
    await transactionHistoryPage.viewSuccessAlertBar();
});

// Scenario: Show alert bar when failed download e-Statement
Then('Alert bar failed will appear', async () => {
    await transactionHistoryPage.viewSuccessAlertBar();
});

// Scenario: Download e-statement with wrong password once
When('I input invalid password on field password', () => {
    transactionHistoryPage.fillInvalidPasswordeStatement();
});

Then('I should see pop up {string} with button {string}', async (errorText, buttonName) => {
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText(errorText, 10);
    I.waitForElement(transactionHistoryPage.buttons[buttonName], 10);
});

// Scenario: Download e-statement with wrong password twice
When('I click button "try again"', () => {
    transactionHistoryPage.clickBtnTryAgaineStatement();
});

// Scenario: Download e-statement with wrong password third
Then('I direct to login page', () => {
    transactionHistoryPage.clickBtnLatesteStatement();
});

Then(
    "I should see notification {string} in the below of field {string}",
    async (expectedMsgError, fieldName) => {
      actualMessage = await transactionHistoryPage.getMessageErrorFieldeStatementPassword(fieldName);
      I.assertEqual(actualMessage, expectedMsgError);
    }
  );


// Scenario: User want to see password when download e-statement
When('I click eye icon on field password', () => {
    transactionHistoryPage.clickBtnEyeeStatement();
});

Then('I should see password inputted', () => {
    transactionHistoryPage.seePasswordeStatement();
});

