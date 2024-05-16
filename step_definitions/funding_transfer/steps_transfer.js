const {
    I,
    transferPage,
    friendListPage,
    createPINPage,
    resetStateDao,
    globalVariable,
    mainActivePage,
} = inject();

When("I choose the friendlist", async () => {
    I.wait(1);
    globalVariable.friendList.friendListName = await friendListPage.getFriendListName();
    globalVariable.friendList.bankName = await friendListPage.getFriendListBankName();
    globalVariable.friendList.friendListAccNumber = await friendListPage.getFriendListAccNumber();
    I.click(friendListPage.cards.friendList);
});

When("I choose category {string}", (category) => {
    transferPage.chooseCategory(category);
    globalVariable.transfer.category = category;
});

When("I close bottom sheet category", (category) => {
    I.wait(2);
    I.assertEqual(actualService, globalVariable.transfer.category);
});

When("I input amount higher than active balance", async () => {
    const activeBalance = await transferPage.getBalance();
    const amount = activeBalance + 10.000
    transferPage.inputAmountTransfer(amount);
});

Then("I should see error message {string} in field {string}", async (expectedValue, fieldName) => {
    I.wait(2);
    let actualMessageError = await transferPage.getMessageErrorFieldOnOnInquiryTransfer(fieldName);
    I.assertEqual(actualMessageError, expectedValue);
});

When("I input amount {string}", (amount) => {
    transferPage.inputAmountTransfer(amount);
    const numberAmount = parseInt(amount)
    globalVariable.transfer.amount = numberAmount;
});

When("I search name {string} in friendlist", (friendListname) => {
    transferPage.fillSearchFriendlist(friendListname);
});

When("I submit to next flow", () => {
    transferPage.nextProcessTransfer();
});

When("I input notes with {string}", (notes) => {
    transferPage.fillNotes(notes);
    globalVariable.transfer.note = notes;
});

When("I click choose bank transfer service", () => {
    transferPage.chooseMethodTransfer();
});

Then("I can see RTOL", async () => {
    I.waitForElement(transferPage.radioButtons.methodRtol, 5);

    const actualAdminFee = await transferPage.getAdminFeeRTOL();
    I.assertEqual(actualAdminFee, "Rp "+globalVariable.transfer.adminFeeRTOL);
});

Then("I can see BI Fast", async() => {
    I.waitForElement(transferPage.radioButtons.methodBifast, 5);
    const actualAdminFee = await transferPage.getAdminFeeBIFAST();
    I.assertEqual(actualAdminFee, "Rp "+globalVariable.transfer.adminFeeBIFAST);
});

Then("I can see SKN", async () => {
    I.waitForElement(transferPage.radioButtons.methodSkn, 5);

    const actualAdminFeeSkn = await transferPage.getAdminFeeSKN();
    I.assertEqual(actualAdminFeeSkn, "Rp "+globalVariable.transfer.adminFeeSKN);
});

Then("I can see RTGS", async () => {
    I.waitForElement(transferPage.radioButtons.methodRtgs, 5);

    const actualAdminFee = await transferPage.getAdminFeeRTGS();
    I.assertEqual(actualAdminFee, "Rp "+globalVariable.transfer.adminFeeRTGS);
});

Then("I can see BI Fast, SKN and RTGS", async ()=>{
    I.waitForElement(transferPage.radioButtons.methodBifast, 5);
    I.waitForElement(transferPage.radioButtons.methodSkn, 5);
    I.waitForElement(transferPage.radioButtons.methodRtgs, 5);

    const actualAdminFeeBifast = await transferPage.getAdminFeeBIFAST();
    const actualAdminFeeSkn = await transferPage.getAdminFeeSKN();
    const actualAdminFeeRtgs = await transferPage.getAdminFeeRTGS();
    I.assertEqual(actualAdminFeeBifast, "Rp "+globalVariable.transfer.adminFeeBIFAST);
    I.assertEqual(actualAdminFeeSkn, "Rp "+globalVariable.transfer.adminFeeSKN);
    I.assertEqual(actualAdminFeeRtgs, "Rp "+globalVariable.transfer.adminFeeRTGS);
});

Then("I can see SKN and RTGS", async ()=>{
    I.waitForElement(transferPage.radioButtons.methodBifast, 5);
    I.waitForElement(transferPage.radioButtons.methodSkn, 5);
    I.waitForElement(transferPage.radioButtons.methodRtgs, 5);

    const actualAdminFeeBifast = await transferPage.getAdminFeeBIFAST();
    const actualAdminFeeSkn = await transferPage.getAdminFeeSKN();
    const actualAdminFeeRtgs = await transferPage.getAdminFeeRTGS();
    I.assertEqual(actualAdminFeeBifast, "Rp "+globalVariable.transfer.adminFeeBIFAST);
    I.assertEqual(actualAdminFeeSkn, "Rp "+globalVariable.transfer.adminFeeSKN);
    I.assertEqual(actualAdminFeeRtgs, "Rp "+globalVariable.transfer.adminFeeRTGS);
});

Then("I choose transfer service RTGS", () => {
    transferPage.chooseRtgs();
    globalVariable.transfer.adminFee = 30000;
});

Then("I choose transfer service RTOL", () => {
    transferPage.chooseRtol();
    globalVariable.transfer.adminFee = 6500;
});

Then("I choose transfer service BIFAST", () => {
    transferPage.chooseBifast();
    globalVariable.transfer.adminFee = 2500;
});

Then("I choose transfer service SKN", () => {
    transferPage.chooseSkn();
    globalVariable.transfer.adminFee = 2900;
});

When("I click transfer", () => {
    transferPage.processTransfer();
});

Then("I will directly go to page confirmation transfer", async () => {
    I.waitForElement(transferPage.texts.amount, 10);
    const actualAmount = await transferPage.getAmountConfirmation();
    I.assertEqual(actualAmount, "Rp. " + globalVariable.transfer.amount);

    I.waitForElement(transferPage.texts.service, 10);
    const actualService = await transferPage.getServiceMethod();

    I.see(transferPage.texts.total);

    I.waitForElement(transferPage.texts.category, 10);
    const actualCategory = await transferPage.getCategory();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.waitForElement(transferPage.texts.note, 10);
    const actualnotes = await transferPage.getNotes();
    I.assertEqual(actualnotes, globalVariable.transfer.note);
});

When("I input PIN {string}", (Pin) => {
    I.waitForText("Masukkan PIN Transaksi", 10);
    transferPage.inputPin(Pin);
}),

    When("I click transfer now", async () => {
        I.waitForText("Konfirmasi Transfer", 10);
        globalVariable.dashboard.senderName = await transferPage.getConfirmSenderName();
        transferPage.confirmTransfer();
    });

Then("I successfully transferred without notes", () => {
    I.see(transferPage.texts.status);
    I.see('Transfer Keluar');
    I.see("Rp" + globalVariable.transfer.amount);
    I.waitForElement(transferPage.buttons.copy, 10);
    I.dontSee(globalVariable.transfer.note);
    I.see(transferPage.buttons.share);
    I.waitForElement(transferPage.buttons.close);
});

Then("I successfully transferred", async () => {
    I.waitForText("Transfer Berhasil", 20);

    const actualSenderName = await transferPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.dashboard.senderName);

    const actualSenderAccNumber = (await transferPage.getSenderAccNnumber()).replace(/\s+/g, '');
    const expectedSenderAccNumber = await (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualReceiverName = await transferPage.getReceiverName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverAccNumber = (await transferPage.getReceiverAccNnumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transfer Keluar");
    const numberAmount = parseInt(globalVariable.transfer.amount);
    const actualTransferOut = numberAmount + globalVariable.transfer.adminFee;

    const numberString = actualTransferOut.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const actualAmount = numberString.join('');
    I.see("Rp" + actualAmount);

    I.waitForElement(transferPage.buttons.copy, 10);
    I.waitForElement(transferPage.buttons.share, 10);
    I.waitForElement(transferPage.buttons.closeDetailTransferPage, 10);
});

When("I close page detail transfer", () => {
    transferPage.closePageAfterTransfer();
});

When("I will directly go to page confirmation transfer between Amar Bank", async () => {
    I.waitForElement(transferPage.texts.amount, 10);
    const actualAmount = await transferPage.getAmountConfirmation();
    I.assertEqual(actualAmount, "Rp. " + globalVariable.transfer.amount);

    I.see(transferPage.texts.total);

    I.waitForElement(transferPage.texts.category, 10);
    const actualCategory = await transferPage.getCategory();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.waitForElement(transferPage.texts.note, 10);
    const actualnotes = await transferPage.getNotes();
    I.assertEqual(actualnotes, globalVariable.transfer.note);

    I.dontSee(globalVariable.transfer.service);
});


When("I input wrong PIN", () => {
    transferPage.inputPin(dummyPin);
});

Then("I see Pin message error {string}", async (ExpectedMessageErrorPIN) => {
    let actualmessageErrorPIN = await transferPage.getMessageErrorPIN();
    I.assertEqual(actualmessageErrorPIN, ExpectedMessageErrorPIN);
    transferPage.inputPin(dummyPin);
});

Then("Then I see Pin message error for click twice {string}", async (expectedMessageErrorPIN) => {
    let actualmessageErrorPIN = await transferPage.getMessageErrorPIN();
    I.assertEqual(actualmessageErrorPIN, expectedMessageErrorPIN);
    I.waitForText(transferPage.messageErrors.warningErrorPin, 10);
    transferPage.inputPin(dummyPin);
});

Then("My PIN transaction will be temporary blocked for 30 minutes", () => {
    I.waitForText("PIN Transaksimu Terblokir", 10);
    I.waitForText(transferPage.messageErrors.blockedPin, 10);
    createPINPage.closeSheetBlocked();
    transferPage.backToDashboard();
});

Then("I am on receiver list page", () => {
    transferPage.viewPageFriendList();
});

Then("I choose menu Transfer from main dashboard", () => {
    transferPage.clickSectionBtnTransfer();
});

Then("I am on Transfer methode list page", () => {
    transferPage.viewPageTrfMethodeList();
});

Then("I am on page transfer confirmation", () => {
    transferPage.viewPageConfirmTrf();
});