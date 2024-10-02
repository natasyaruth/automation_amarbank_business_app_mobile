const {
    I,
    transferPage,
    friendListPage,
    createPINPage,
    resetStateDao,
    globalVariable,
    mainActivePage,
    getDataDao,
    headerPage,
} = inject();

const dummyPin = "946573";

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
    let actualMessageError = await transferPage.getMessageErrorField(fieldName);
    I.assertEqual(actualMessageError, expectedValue);
});

When("I input amount {string}", async (amount) => {
    transferPage.inputAmountTransfer(amount);
    const numberAmount = parseInt(amount)
    globalVariable.transfer.amount = numberAmount;

    globalVariable.transfer.activeAmount = await transferPage.getAmountActive();
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

Then("I can see BIFAST and SKN", async () => {

    I.waitForElement(transferPage.radioButtons.methodBifast, 10);
    const actualAdminFeeBifast = await transferPage.getAdminFeeBIFAST();
    I.assertEqual(actualAdminFeeBifast, "Rp " + globalVariable.transfer.adminFeeBIFAST);
    I.see("BI Fast");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 250.000.000");

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeBIFAST);

    const actualTotalAmount = await transferPage.getValueTotalAmount();
    const formattedString = globalVariable.transfer.adminFeeBIFAST.replace(/Rp|\./g, '');
    const numberAdminFee = parseInt(formattedString);
    const numberTotalAmount = globalVariable.transfer.amount + numberAdminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalAmount, "Rp" + expectedTotalAmount);

    I.dontSee(transferPage.radioButtons.methodRtol);
    I.dontSee(transferPage.texts.adminFeeRTOL);
    I.dontSee("RTOL");
    I.dontSee("Rp " + globalVariable.transfer.adminFeeRTOL);
    I.dontSee("Rp 10.000 - Rp 50.000.000");

    I.waitForElement(transferPage.radioButtons.methodSkn, 10);
    const actualAdminFeeSkn = await transferPage.getAdminFeeSKN();
    I.assertEqual(actualAdminFeeSkn, "Rp " + globalVariable.transfer.adminFeeSKN);
    I.see("SKN");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 1.000.000.000");

    I.dontSee(transferPage.radioButtons.methodRtgs);
    I.dontSee(transferPage.texts.adminFeeRTGS);
    I.dontSee("RTGS");
    I.dontSee("Rp " + globalVariable.transfer.adminFeeRTGS);
    I.dontSee("> Rp 100.000.000");
});

Then("I can see BIFAST, SKN and RTGS", async () => {

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForElement(transferPage.radioButtons.methodBifast, 10);
    const actualAdminFeeBifast = await transferPage.getAdminFeeBIFAST();
    I.assertEqual(actualAdminFeeBifast, "Rp " + globalVariable.transfer.adminFeeBIFAST);
    I.see("BI Fast");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 250.000.000");

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeBIFAST);

    const actualTotalAmount = await transferPage.getValueTotalAmount();
    const formattedString = globalVariable.transfer.adminFeeBIFAST.replace(/Rp|\./g, '');
    const numberAdminFee = parseInt(formattedString);
    const numberTotalAmount = globalVariable.transfer.amount + numberAdminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalAmount, "Rp" + expectedTotalAmount);

    I.dontSee(transferPage.radioButtons.methodRtol);
    I.dontSee(transferPage.texts.adminFeeRTOL);
    I.dontSee("Rp " + globalVariable.transfer.adminFeeRTOL);
    I.dontSee("RTOL");
    I.dontSee("Rp 10.000 - Rp 50.000.000");

    I.waitForElement(transferPage.radioButtons.methodSkn, 10);
    const actualAdminFeeSkn = await transferPage.getAdminFeeSKN();
    I.assertEqual(actualAdminFeeSkn, "Rp " + globalVariable.transfer.adminFeeSKN);
    I.see("SKN");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 1.000.000.000");

    I.waitForElement(transferPage.radioButtons.methodRtgs, 10);
    const actualAdminFeeRtgs = await transferPage.getAdminFeeRTGS();
    I.assertEqual(actualAdminFeeRtgs, "Rp " + globalVariable.transfer.adminFeeRTGS);
    I.see("RTGS");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("> Rp 100.000.000");
});

Then("I can see SKN and RTGS", async () => {

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeSKN);

    I.dontSee(transferPage.radioButtons.methodBifast);
    I.dontSee(transferPage.texts.adminFeeBIFAST);
    I.dontSee("Rp " + globalVariable.transfer.adminFeeBIFAST);
    I.dontSee("BI Fast");
    I.dontSee("Rp 10.000 - Rp 250.000.000");

    const actualTotalAmount = await transferPage.getValueTotalAmount();
    const formattedString = globalVariable.transfer.adminFeeSKN.replace(/Rp|\./g, '');
    const numberAdminFee = parseInt(formattedString);
    const numberTotalAmount = globalVariable.transfer.amount + numberAdminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalAmount, "Rp" + expectedTotalAmount);

    I.dontSee(transferPage.radioButtons.methodRtol);
    I.dontSee(transferPage.texts.adminFeeRTOL);
    I.dontSee("Rp " + globalVariable.transfer.adminFeeRTOL);
    I.dontSee("RTOL");
    I.dontSee("Rp 10.000 - Rp 50.000.000");

    I.waitForElement(transferPage.radioButtons.methodSkn, 10);
    const actualAdminFeeSkn = await transferPage.getAdminFeeSKN();
    I.assertEqual(actualAdminFeeSkn, "Rp " + globalVariable.transfer.adminFeeSKN);
    I.see("SKN");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 1.000.000.000");

    I.waitForElement(transferPage.radioButtons.methodRtgs, 10);
    const actualAdminFeeRtgs = await transferPage.getAdminFeeRTGS();
    I.assertEqual(actualAdminFeeRtgs, "Rp " + globalVariable.transfer.adminFeeRTGS);
    I.see("RTGS");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("> Rp 100.000.000");
});

Then("I can see RTGS", async () => {
    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeRTGS);

    I.dontSee(transferPage.radioButtons.methodBifast);
    I.dontSee(transferPage.texts.adminFeeBIFAST);
    I.dontSee("Rp " + globalVariable.transfer.adminFeeBIFAST);
    I.dontSee("BI Fast");
    I.dontSee("Rp 10.000 - Rp 250.000.000");

    const actualTotalAmount = await transferPage.getValueTotalAmount();
    const formattedString = globalVariable.transfer.adminFeeRTGS.replace(/Rp|\./g, '');
    const numberAdminFee = parseInt(formattedString);
    const numberTotalAmount = globalVariable.transfer.amount + numberAdminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalAmount, "Rp" + expectedTotalAmount);

    I.dontSee(transferPage.radioButtons.methodRtol);
    I.dontSee(transferPage.texts.adminFeeRTOL);
    I.dontSee("Rp " + globalVariable.transfer.adminFeeRTOL);
    I.dontSee("RTOL");
    I.dontSee("Rp 10.000 - Rp 50.000.000");

    I.dontSee(transferPage.radioButtons.methodSkn);
    I.dontSee(transferPage.texts.adminFeeSKN);
    I.dontSee("Rp " + globalVariable.transfer.adminFeeSKN);
    I.dontSee("SKN");
    I.dontSee("Rp 10.000 - Rp 1.000.000.000");

    I.waitForElement(transferPage.radioButtons.methodRtgs, 10);
    const actualAdminFeeRtgs = await transferPage.getAdminFeeRTGS();
    I.assertEqual(actualAdminFeeRtgs, "Rp " + globalVariable.transfer.adminFeeRTGS);
    I.see("RTGS");
    I.dontSee("Dana langsung sampai ke penerima");
    I.see("Dana akan sampai pada hari kerja");
    I.see("Nominal transfer:");
    I.see("> Rp 100.000.000");
});


Then("I can see BIFAST, RTOL and SKN", async () => {

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForElement(transferPage.radioButtons.methodBifast, 10);
    const actualAdminFeeBifast = await transferPage.getAdminFeeBIFAST();
    I.assertEqual(actualAdminFeeBifast, "Rp " + globalVariable.transfer.adminFeeBIFAST);
    I.see("BI Fast");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 250.000.000");

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeBIFAST);

    const actualTotalAmount = await transferPage.getValueTotalAmount();
    const formattedString = globalVariable.transfer.adminFeeBIFAST.replace(/Rp|\./g, '');
    const numberAdminFee = parseInt(formattedString);
    const numberTotalAmount = globalVariable.transfer.amount + numberAdminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalAmount, "Rp" + expectedTotalAmount);

    I.waitForElement(transferPage.radioButtons.methodRtol, 10);
    const actualAdminFeeRTOL = await transferPage.getAdminFeeRTOL();
    I.assertEqual(actualAdminFeeRTOL, "Rp " + globalVariable.transfer.adminFeeRTOL);
    I.see("RTOL");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 50.000.000");

    I.waitForElement(transferPage.radioButtons.methodSkn, 10);
    const actualAdminFeeSkn = await transferPage.getAdminFeeSKN();
    I.assertEqual(actualAdminFeeSkn, "Rp " + globalVariable.transfer.adminFeeSKN);
    I.see("SKN");
    I.see("Dana langsung sampai ke penerima");
    I.see("Nominal transfer:");
    I.see("Rp 10.000 - Rp 1.000.000.000");

    I.dontSee(transferPage.radioButtons.methodRtgs);
    I.dontSee(transferPage.texts.adminFeeRTGS);
    I.dontSee("RTGS");
    I.dontSee("Rp " + globalVariable.transfer.adminFeeRTGS);
    I.dontSee("> Rp 100.000.000");
});

Then("I choose transfer service RTGS", async () => {
    transferPage.chooseRtgs();
    globalVariable.transfer.adminFee = 30000;
    globalVariable.transfer.method = "RTGS";

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeRTGS);

    const actualTotalTransfer = await transferPage.getValueTotalAmount();
    const numberTotalAmount = globalVariable.transfer.amount + globalVariable.transfer.adminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalTransfer, "Rp" + expectedTotalAmount);
    globalVariable.transfer.totalAmount = "Rp" + expectedTotalAmount;
});

Then("I choose transfer service RTOL", async () => {
    transferPage.chooseRtol();
    globalVariable.transfer.adminFee = 6500;
    globalVariable.transfer.method = "RTOL";

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeRTOL);

    const actualTotalTransfer = await transferPage.getValueTotalAmount();
    const numberTotalAmount = globalVariable.transfer.amount + globalVariable.transfer.adminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalTransfer, "Rp" + expectedTotalAmount);
    globalVariable.transfer.totalAmount = "Rp" + expectedTotalAmount;

});

Then("I choose transfer service BIFAST", async () => {
    transferPage.chooseBifast();
    globalVariable.transfer.adminFee = 2500;
    globalVariable.transfer.method = "BIFAST";

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeBIFAST);

    const actualTotalTransfer = await transferPage.getValueTotalAmount();
    const numberTotalAmount = globalVariable.transfer.amount + globalVariable.transfer.adminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalTransfer, "Rp" + expectedTotalAmount);
    globalVariable.transfer.totalAmount = expectedTotalAmount;
});

Then("I choose transfer service SKN", async () => {
    transferPage.chooseSkn();
    globalVariable.transfer.adminFee = 2900;
    globalVariable.transfer.method = "SKN";

    const actualAdminFee = await transferPage.getValueAdminFee();
    I.assertEqual(actualAdminFee, "+Rp" + globalVariable.transfer.adminFeeSKN);

    const actualTotalTransfer = await transferPage.getValueTotalAmount();
    const numberTotalAmount = globalVariable.transfer.amount + globalVariable.transfer.adminFee;
    const expectedTotalAmount = transferPage.formattedToThreeDigit(numberTotalAmount);
    I.assertEqual(actualTotalTransfer, "Rp" + expectedTotalAmount);
    globalVariable.transfer.totalAmount = expectedTotalAmount;
});

When("I click transfer", () => {
    transferPage.processTransfer();
});

When("I input PIN {string}", (Pin) => {
    I.waitForText("Masukkan PIN Transaksi", 10);
    transferPage.inputPin(Pin);
}),

    When("I click transfer now", async () => {
        I.waitForText("Konfirmasi Transfer", 10);
        transferPage.confirmTransfer();
    });

Then("I successfully transferred", async () => {
    I.waitForText("Transfer Berhasil", 40);
    I.waitForElement(headerPage.buttons.closePage, 10)

    const actualSenderName = await transferPage.getSenderName();

    const typeBusiness = (await resetStateDao.getAccountType()).accountType;
    let expectedSenderName;

    if (
        typeBusiness === "1"
    ) {
        expectedSenderName = (await resetStateDao.getFullName()).ktpName;

    } else {

        expectedSenderName = (await resetStateDao.getCompanyName()).businessName;

    }

    I.assertEqual(actualSenderName, expectedSenderName);
    globalVariable.transfer.senderName = expectedSenderName;

    const actualSenderBankName = await transferPage.getSenderBankName();
    I.assertEqual(actualSenderBankName, "Amar Bank");

    const actualSenderAccNumber = (await transferPage.getSenderAccNnumber()).replace(/\s+/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber()).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualReceiverName = await transferPage.getReceiverName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await transferPage.getReceiverBankName();
    const expectedReceiverBankName = globalVariable.friendList.bankName;
    I.assertEqual(actualReceiverBankName, expectedReceiverBankName);

    const actualReceiverAccNumber = (await transferPage.getReceiverAccNnumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transfer Keluar");
    const numberAmount = globalVariable.transfer.amount;
    const actualTransferOut = numberAmount + globalVariable.transfer.adminFee;

    const numberString = actualTransferOut.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const actualAmount = numberString.join('');
    I.see("Rp" + actualAmount);
    globalVariable.transfer.amountTransfer = transferPage.getAmount();

    I.see("Nomor Referensi");
    I.waitForElement(transferPage.buttons.copy, 10);
    I.waitForElement(transferPage.texts.referenceNumber, 10);

    I.see("Tanggal");
    I.waitForElement(transferPage.texts.dateTransfer, 10);

    I.see("Waktu");
    I.waitForElement(transferPage.texts.timeTransfer, 10);

    if (
        globalVariable.transfer.note !== ""
    ) {
        I.see("Catatan");
        const actualNotes = await transferPage.getNotes();
        I.assertEqual(actualNotes, globalVariable.transfer.note);

    } else {

        I.dontSee("Catatan");
        I.dontSee(transferPage.texts.note);
        I.dontSee(globalVariable.transfer.note);

    }

    I.see("Bagikan Bukti Transfer");
    I.waitForElement(transferPage.buttons.share, 10);

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

When("I input amount more than active amount", async () => {
    const amountActive = (await transferPage.getAmountActive()).replace(/Rp|\./g, '');

    const numberActiveAmount = parseInt(amountActive);

    const amountTransfer = numberActiveAmount + 100000

    transferPage.inputAmountTransfer(amountTransfer);
});

When("I input amount same with amount active", async () => {
    const amountActive = (await transferPage.getAmountActive()).replace(/Rp|\./g, '');

    const numberActiveAmount = parseInt(amountActive);

    transferPage.inputAmountTransfer(numberActiveAmount);

    globalVariable.transfer.amount = numberActiveAmount
});


When("I input wrong PIN", () => {
    transferPage.inputPin(dummyPin);
});

When("I reset attempt failed PIN", async () => {
    await
        resetStateDao.resetAttemptFailedLogin();
});

When("I try again to input PIN", () => {
    I.waitForText("Coba Lagi", 10);
    transferPage.clickTry();
});

When("I click understand to page login", () => {
    I.waitForText("Mengerti", 10);
    transferPage.clickTry();
});

Then("I see message error total amount shouldn't more than active amount", async () => {
    const actualMsgError = await transferPage.getMessageErrorField("balance");
    I.assertEqual(actualMsgError, "Total transfer melebihi saldo aktif");

    const disabledButton = await I.grabAttributeFrom(transferPage.buttons.transfer, 'enabled');

    I.assertEqual(disabledButton, "true");
});

Then("I shouldn't see message error total amount more than active amount", async () => {
    I.wait(1);
    I.dontSee(transferPage.messageErrorFields.balance);
    I.dontSee("Total transfer melebihi saldo aktif");

    const disabledButton = await I.grabAttributeFrom(transferPage.buttons.transfer, 'enabled');

    I.assertEqual(disabledButton, "false");
});

Then("I see PIN message error {string}", async (expectedMessageErrorPIN) => {
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText(expectedMessageErrorPIN, 10);
});

Then("I am on receiver list page", () => {
    transferPage.viewPageFriendList();
});

Then("I am on receiver list page", () => {
    transferPage.viewPageFriendList();
});

Then("I choose menu Transfer from main dashboard", () => {
    transferPage.clickSectionBtnTransfer();
});

Then("I am on Transfer methode list page", async () => {
    transferPage.viewPageTrfMethodeList();

    const listExpectedTitle = {
        titleActiveSaldo: "Saldo aktif",
        titleAmountTransfer: "Nominal Transfer",
        titleAdminFee: "Biaya Transfer",
        titleTotalAmount: "Total Transfer"
    };

    const actualTitleActiveAmount = await transferPage.getTitleAmountActive();
    I.assertEqual(actualTitleActiveAmount, listExpectedTitle.titleActiveSaldo);

    const actualActiveAmount = (await transferPage.getValueAmountActive()).replace(/ /, '');
    I.assertEqual(actualActiveAmount, globalVariable.transfer.activeAmount);

    const actualTitleTransferAmount = await transferPage.getTitleAmountTransfer();
    I.assertEqual(actualTitleTransferAmount, listExpectedTitle.titleAmountTransfer);

    const actualTransferAmount = await transferPage.getValueAmountTransfer();
    const expectedTransferAmount = transferPage.formattedToThreeDigit(globalVariable.transfer.amount);
    I.assertEqual(actualTransferAmount, "Rp" + expectedTransferAmount);

    const actualTitleAdminFee = await transferPage.getTitleAdminFee();
    I.assertEqual(actualTitleAdminFee, listExpectedTitle.titleAdminFee);

    const actualTitleTotalAmount = await transferPage.getTitleTotalAmount();
    I.assertEqual(actualTitleTotalAmount, listExpectedTitle.titleTotalAmount);
});

Then("I am on page transfer confirmation", async () => {
    I.waitForText("Konfirmasi Transfer", 20);
    I.waitForElement(headerPage.buttons.back);

    const businessType = (await resetStateDao.getAccountType()).accountType;
    let expectedSenderName;
    let expectedSenderBankName = "Amar Bank"

    if (
        businessType === 1
    ) {
        expectedSenderName = (await resetStateDao.getFullName()).ktpName;

    } else {

        expectedSenderName = (await resetStateDao.getCompanyName()).businessName;
    }

    const actualSenderName = await transferPage.getConfirmSenderName();
    I.assertEqual(actualSenderName, expectedSenderName);
    globalVariable.transfer.senderName = expectedSenderName;

    const actualSenderBankName = await transferPage.getConfirmSenderBankName();
    I.assertEqual(actualSenderBankName, expectedSenderBankName);
    globalVariable.transfer.senderBankName = expectedSenderBankName;

    const actualSenderAccNumber = (await transferPage.getConfirmSenderAccNumber()).replace(/\s+/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber()).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualRecipientName = await transferPage.getConfirmRecipientName();
    I.assertEqual(actualRecipientName, globalVariable.friendList.friendListName);

    const actualRecipientBankName = await transferPage.getConfirmRecipientBankName();
    const expectedRecipientBankName = globalVariable.friendList.bankName;
    I.assertEqual(actualRecipientBankName, expectedRecipientBankName);

    const actualRecipientAccNumber = (await transferPage.getConfirmRecipientAccNumber()).replace(/[- ]/g, '');
    const expectedRecipientAccNumber = globalVariable.friendList.friendListAccNumber.replace(/[- ]/g, '');
    I.assertEqual(actualRecipientAccNumber, expectedRecipientAccNumber);

    I.see("Nominal Transfer");
    const actualNominalTransfer = await transferPage.getAmountConfirmation();
    const expectedNominalTransfer = transferPage.formattedToThreeDigit(globalVariable.transfer.amount);
    I.assertEqual(actualNominalTransfer, "Rp" + expectedNominalTransfer);

    I.see("Layanan Transaksi");
    const actualMethod = await transferPage.getServiceMethod();
    I.assertEqual(actualMethod, globalVariable.transfer.method);

    I.see("Biaya Transfer");
    const actualAdminFee = await transferPage.getConfirmAdminFee();
    const expectedAdminFee = transferPage.formattedToThreeDigit(globalVariable.transfer.adminFee);
    I.assertEqual(actualAdminFee, "Rp" + expectedAdminFee);

    I.see("Total");
    const actualTotalTransfer = await transferPage.getTotal();
    I.assertEqual(actualTotalTransfer, "Rp" + globalVariable.transfer.totalAmount);

    I.see("Kategori");
    const actualCategory = await transferPage.getCategory();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    if (
        globalVariable.transfer.note !== ""
    ) {
        I.see("Catatan");
        const actualNotes = await transferPage.getNotes();
        I.assertEqual(actualNotes, globalVariable.transfer.note);

    } else {

        I.dontSee("Catatan");
        I.dontSee(transferPage.texts.note);
        I.dontSee(globalVariable.transfer.note);

    }

    I.see("Transfer Sekarang");
    I.waitForElement(transferPage.buttons.transfer, 10);

});