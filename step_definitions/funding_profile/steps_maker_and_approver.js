const {
    I,
    resetStateDao,
    otpDao,
    headerPage,
    transferPage,
    globalVariable,
    approvalTransactionPage,
    onboardingAccOpeningPage,
    mainActivePage,
    profilePage,
    amountDetailPage,
    notificationCenterPage,
} = inject();

Given("I see card maker transaction", async () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.seeElement(onboardingAccOpeningPage.buttons.cardTransaction);
    I.see("Menunggu Persetujuan");

    globalVariable.dashboard.recipientName = await onboardingAccOpeningPage.getRecipientName();
    globalVariable.dashboard.recipientBankName = await onboardingAccOpeningPage.getRecipientBankName();
    globalVariable.dashboard.date = await onboardingAccOpeningPage.getTransactionDate();
    globalVariable.dashboard.amountTransaction = (await onboardingAccOpeningPage.getAmountTransaction()).replace(/[Rp.]/g, '');
});

Given("don't have list pending task", async () => {
    await
        resetStateDao.deleteListPendingTask(globalVariable.login.userID, globalVariable.login.password);
});

Given("we don't have list pending task", async () => {

    await
        resetStateDao.deleteListPendingTask(globalVariable.login.userID, globalVariable.login.password);

    await
        resetStateDao.deleteListPendingTask(globalVariable.login.userIDPartner, globalVariable.login.passwordPartner);

});

Given("we all don't have any pending task", async () => {
    const listPartnerUserID = globalVariable.login.listUserID;
    const listPartnerPassword = globalVariable.login.listPassword;

    for(let i=0;i<listPartnerUserID.length;i++){
        await
            resetStateDao.deleteListPendingTask(listPartnerUserID[i], listPartnerPassword[i]);
        I.wait(2);
    }

});

When("I swipe to section transaction approval", async () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.waitForElement(onboardingAccOpeningPage.buttons.openAllTransactionApproval, 10);
});

When("I click menu transaction approval", async () => {
    profilePage.openTransactionApproval();
});

When("I click waiting approval section", () => {
    approvalTransactionPage.openTabWaitingForApproval();
});

When("I click tab approval has been done", () => {
    approvalTransactionPage.openTabDone();
});

When("I click card maker transaction", () => {
    onboardingAccOpeningPage.openCardTransaction();
});

When("I click card approver transaction", () => {
    onboardingAccOpeningPage.openCardTransaction();
});

When("I see information card maker transaction", async () => {
    I.waitForText("Menunggu Persetujuan", 10);

    globalVariable.friendList.friendListName = await onboardingAccOpeningPage.getRecipientName();
    globalVariable.transfer.date = await onboardingAccOpeningPage.getTransactionDate();
    globalVariable.transfer.amount = await onboardingAccOpeningPage.getAmountTransaction();
});

When("I click see all approval transaction from main dashboard", () => {
    onboardingAccOpeningPage.openAllTransactionApproval();
});

When("I click help center", () => {
    headerPage.goToCallCenter();
});

When("I input PIN {string} approver", (Pin) => {
    I.waitForText("Masukkan PIN", 10);
    I.see("PIN")
    transferPage.inputPin(Pin);
}),

    When("I input incorrect password for approver", () => {
        I.waitForText("Password", 10);
        I.see("Silahkan masukkan password Amar Bank Bisnis Anda");

        approvalTransactionPage.fillPassword(globalVariable.login.dummyPassword);
    });

When("I input password for approver", () => {
    I.waitForText("Password", 10);
    I.see("Silahkan masukkan password Amar Bank Bisnis Anda");

    approvalTransactionPage.fillPassword(globalVariable.login.password);
});

When("I Unmask the password", () => {
    approvalTransactionPage.clickIconEyePassword();
});

When("I Mask the password", () => {
    approvalTransactionPage.clickIconEyePassword();
});

When("I submit my password for approver", () => {
    I.see("Selanjutnya");
    approvalTransactionPage.submitPassword();
});

When("I try again to input PIN", () => {
    approvalTransactionPage.clickButtonTryAgain();
    I.wait(1);
});

When("I try again to input password", () => {
    approvalTransactionPage.clickButtonTryAgain();
    I.wait(1);
});

When("I close page password for transaction approval", () => {
    headerPage.closePage();
});

When("I close page detail card completed", () => {
    headerPage.closePage();
});

When("I close page detail approval transaction", () => {
    headerPage.closePage();
});

When("I wait till my profile data load completed", () => {
    I.waitForText(globalVariable.login.userID.toUpperCase(), 10);
    I.wait(3);

    I.waitForText("Tipe Industri", 10);
    I.waitForText("Jenis Bisnis", 10);
    I.waitForText("Tanggal Berdiri", 10);
    I.waitForText("Alamat Bisnis", 10);
    I.waitForElement(profilePage.buttons.transactionApprovalDetail, 10);
    I.swipeUp(profilePage.buttons.transactionApprovalDetail, 800, 800);
});

When("I input OTP to approve transaction", async () => {
    I.wait(3);
    I.waitForText("Kode OTP", 10);
    I.see("Masukkan Kode OTP");
    I.see("Kode OTP telah dikirim ke nomor");

    const phoneNumber = (await resetStateDao.getPhoneNumber(globalVariable.login.userID, globalVariable.login.password)).phoneNumber;
    const actualPhoneNumber = (await approvalTransactionPage.getPhoneNumber()).replace(/ /g, '').replace(/\+/g, '');

    I.assertEqual("+" + actualPhoneNumber, phoneNumber);

    const otpCode = (await otpDao.getOTPWithoutToken()).otp;
    approvalTransactionPage.fillOtpCode(otpCode);
});

When("I input incorrect OTP for approve transaction", async () => {
    I.waitForText("Kode OTP", 10);

    approvalTransactionPage.fillOtpCode("000000");
});

When("I input incorrect OTP {string} times", (times) => {
    I.waitForText("Kode OTP", 10);
    I.wait(3);

    for (let i = 0; i < times; i++) {
        approvalTransactionPage.fillOtpCode("000000");
        I.waitForElement(approvalTransactionPage.messageErrorField.textMsgErrorOtp, 10);
        approvalTransactionPage.clearFieldOtp();
        I.wait(1);
    };
});

When("I let the otp code for approve transaction expire", () => {
    I.wait(63);
    I.waitForElement(approvalTransactionPage.links.resendOtp, 10);
});

When("I resend otp code to approve transaction", async () => {
    I.wait(3);
    globalVariable.registration.phoneNumber = (await approvalTransactionPage.getPhoneNumber()).replace(/ /g, '').replace(/\+/g, '');
    globalVariable.registration.otpCode = (await otpDao.getOTPUsingToken(globalVariable.login.userID, globalVariable.login.password)).otp;

    I.waitForElement(approvalTransactionPage.links.resendOtp, 70);
    approvalTransactionPage.resendOtp();
    I.waitForText("Kode OTP berhasil dikirim.", 10);
});

When("I resend otp code to approve transaction more than five times", async () => {
    I.waitForText("Kode OTP", 10);

    I.wait(3);
    globalVariable.registration.phoneNumber = (await approvalTransactionPage.getPhoneNumber()).replace(/\s+/g, '').replace(/-/g, '');

    for (let x = 0; x < 6; x++) {
        I.waitForElement(approvalTransactionPage.links.resendOtp, 70);
        approvalTransactionPage.resendOtp();
        if (x < 5) {
            I.waitForText("Kode OTP berhasil dikirim.", 10);
        }
    };
});

When("I can click detail card completed", () => {
    approvalTransactionPage.openCardTransaction();
});

When("I approve the transaction", () => {
    approvalTransactionPage.approveTransaction();
});

When("I reject the transaction", () => {
    approvalTransactionPage.rejectTransaction();
});

When("I canceled my transaction", () => {
    approvalTransactionPage.cancelTransaction();
});

When("I click notification maker transaction", () => {
    I.waitForElement(notificationCenterPage.texts.pendingTrxStatus+"0", 10);
    notificationCenterPage.openDetailNotifTransaction(0);
});

When("I click notification approver transaction", () => {
    I.waitForElement(notificationCenterPage.texts.pendingTrxStatus+"0", 10);
    notificationCenterPage.openDetailNotifTransaction(0);
});

Then("I will not see menu transaction approval", () => {
    I.wait(3);
    I.dontSee(profilePage.buttons.transactionApprovalDetail);
});

Then("I will not see menu download power of attorney", () => {
    I.dontSee(profilePage.buttons.documentProcuration);
});

Then("I will not see menu document management", () => {
    I.dontSee(profilePage.buttons.documentBusiness);
});

Then("I will see menu download power of attorney", () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.waitForElement(profilePage.buttons.documentProcuration, 10);
});

Then("I will see menu document management", () => {
    I.waitForElement(profilePage.buttons.documentBusiness, 10);
});

Then("I will see page transaction approval is empty", () => {
    I.waitForText("Halaman Ini Masih Kosong", 10);
    I.see("Saat ini, belum ada transaksi yang membutuhkan persetujuan untuk ditampilkan.")
});

Then("I don't see any card transaction in main dashboard", () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 30);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.dontSee(onboardingAccOpeningPage.buttons.openAllTransactionApproval);
    I.dontSee(onboardingAccOpeningPage.buttons.cardTransaction);
});

Then("I will see my blocking amount increase but active balance decrease from amount transfer", async () => {
    const actualActiveBalance = await amountDetailPage.getActiveAmount();
    const actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    const actualTotalAmount = await amountDetailPage.getTotalAmount();

    const previousBlockingAmount = globalVariable.dashboard.blockingAmount.replace(/Rp|\./g, '');
    const previousActiveBalance = globalVariable.dashboard.activeAmount.replace(/Rp|\./g, '');

    const number = parseInt(previousBlockingAmount);
    const numberActiveBalance = parseInt(previousActiveBalance);

    const totalBlockingAmount = number + globalVariable.transfer.amount;
    const numberString = totalBlockingAmount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedBlockingAmount = numberString.join('');
    I.assertEqual(actualBlockingAmount, "Rp" + expectedBlockingAmount);

    I.assertEqual(actualTotalAmount, globalVariable.dashboard.totalAmount);

    const activeBalance = numberActiveBalance - globalVariable.transfer.amount
    const numberStringActiveBalance = activeBalance.toString().split('');

    for (let i = numberStringActiveBalance.length - 3; i > 0; i -= 3) {
        numberStringActiveBalance.splice(i, 0, '.');
    }

    const expectedActiveBalance = numberStringActiveBalance.join('');
    I.assertEqual(actualActiveBalance, "Rp" + expectedActiveBalance);
});

Then("I will see my active balance and total amount are decreased but my blocking amount back like in beginning", async () => {
    const actualActiveBalance = await amountDetailPage.getActiveAmount();
    const actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    const actualTotalAmount = await amountDetailPage.getTotalAmount();

    const previousActiveBalance = globalVariable.dashboard.activeAmount.replace(/Rp|\./g, '');
    const previousTotalBalance = globalVariable.dashboard.totalAmount.replace(/Rp|\./g, '');
    const numberActiveBalance = parseInt(previousActiveBalance);
    const numberTotalBalance = parseInt(previousTotalBalance);

    const activeBalance = numberActiveBalance - globalVariable.transfer.amount
    const numberStringActiveBalance = activeBalance.toString().split('');

    for (let i = numberStringActiveBalance.length - 3; i > 0; i -= 3) {
        numberStringActiveBalance.splice(i, 0, '.');
    }

    const expectedActiveBalance = numberStringActiveBalance.join('');
    I.assertEqual(actualActiveBalance, "Rp" + expectedActiveBalance);

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);

    const totalBalance = numberTotalBalance - globalVariable.transfer.amount
    const numberStringTotalBalance = totalBalance.toString().split('');

    for (let i = numberStringTotalBalance.length - 3; i > 0; i -= 3) {
        numberStringTotalBalance.splice(i, 0, '.');
    }

    const expectedTotalBalance = numberStringTotalBalance.join('');
    I.assertEqual(actualTotalAmount, "Rp" + expectedTotalBalance);
});

Then("I will see my active balance, blocking amount and total amount back like in the beginning", async () => {
    const actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);

    const actualActiveBalance = await amountDetailPage.getActiveAmount();
    I.assertEqual(actualActiveBalance, globalVariable.dashboard.activeAmount);

    const actualTotalAmount = await amountDetailPage.getTotalAmount();
    I.assertEqual(actualTotalAmount, globalVariable.dashboard.totalAmount);
});

Then("I will direct to page need approval from other director", async () => {
    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForText("Menunggu Persetujuan Transaksi", 20);

    globalVariable.registration.companyName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.registration.companyName);

    const actualSenderBankName = await approvalTransactionPage.getSenderBankName();
    globalVariable.transfer.senderBankName = "Bank Amar Indonesia";
    I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);
    globalVariable.transfer.senderAccountNumber = expectedSenderAccNumber;

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualReceiverBankName, globalVariable.friendList.bankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const actualAmount = numberString.join('');
    I.see("-Rp" + actualAmount);
    globalVariable.transfer.amountTransfer = "Rp" + actualAmount;

    I.see("Dibuat oleh");
    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    const expectedMakerName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualMakerName, expectedMakerName);
    globalVariable.transfer.makerName = expectedMakerName;

    I.see("Nomor Referensi");
    I.waitForElement(approvalTransactionPage.texts.referenceNumber, 10);
    I.waitForElement(approvalTransactionPage.buttons.copy, 10);

    I.see("Tanggal");
    const actualDate = await approvalTransactionPage.getDateTransaction();
    const expectedDate = day + " " + months[month] + " " + year
    I.assertEqual(actualDate, expectedDate);
    globalVariable.transfer.date = expectedDate;

    I.see("Waktu");
    I.waitForElement(approvalTransactionPage.texts.time, 10);

    I.see("Kategori")
    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.swipeUp(approvalTransactionPage.texts.nameCreatedBy, 1000, 1000);

    I.see("Catatan");
    if (globalVariable.transfer.note !== "") {
        const actualNotes = await approvalTransactionPage.getNotes();
        I.assertEqual(globalVariable.transfer.note, actualNotes);
    }

    I.waitForText("Batalkan", 10);
    I.waitForElement(approvalTransactionPage.buttons.cancel, 10);
});

Then("I will direct to page waiting for approval from other director", async () => {
    I.waitForText("Butuh Persetujuan Transaksi", 10);

    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.registration.companyName);

    const actualSenderBankName = await approvalTransactionPage.getSenderBankName();
    I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '').replace(/-/g, '');
    I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualReceiverBankName, globalVariable.friendList.bankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const expectedAmount = numberString.join('');
    I.see("-Rp" + expectedAmount);

    I.see("Dibuat oleh");
    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    I.assertEqual(actualMakerName, globalVariable.transfer.makerName);

    I.see("Nomor Referensi");
    I.waitForElement(approvalTransactionPage.texts.referenceNumber, 10);
    I.waitForElement(approvalTransactionPage.buttons.copy, 10);

    I.see("Tanggal");
    const actualDate = await approvalTransactionPage.getDateTransaction();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    I.see("Waktu");
    I.waitForElement(approvalTransactionPage.texts.time, 10);

    I.see("Kategori");
    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.see("Catatan");
    if (globalVariable.transfer.note !== "") {
        const actualNotes = await approvalTransactionPage.getNotes();
        I.assertEqual(globalVariable.transfer.note, actualNotes);
    }

});

Then("I will see list maker transaction in notification center", async () => {
    I.waitForElement(notificationCenterPage.tabs.all, 20);

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = globalVariable.getCurrentFullDate(globalVariable.constant.formatDate.ddmmmyyyy);
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getLatestStatusTrx();
    I.assertEqual(actualStatusTrx, "Persetujuan Transaksi");

    const actualStatusPending = await notificationCenterPage.getPendingTrxStatus(0);
    I.assertEqual(actualStatusPending, "Menunggu Persetujuan Direksi");

    const actualDesc = await notificationCenterPage.getLatestTitle();
    if (
        globalVariable.transfer.method === "OVERBOOK"
    ) {
        globalVariable.notificationCenter.descTrx = "Ke Bank Amar Indonesia - " + globalVariable.friendList.friendListName;

    } else {
        globalVariable.notificationCenter.descTrx = "Ke Bank " + globalVariable.friendList.bankName + " - " + globalVariable.friendList.friendListName;
    }

    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getLatestDescription();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I will see list approver transaction in notification center", async () => {
    I.waitForElement(notificationCenterPage.tabs.all, 20);

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = globalVariable.getCurrentFullDate(globalVariable.constant.formatDate.ddmmmyyyy);
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getLatestStatusTrx();
    I.assertEqual(actualStatusTrx, "Persetujuan Transaksi");

    const actualStatusPending = await notificationCenterPage.getPendingTrxStatus(0);
    I.assertEqual(actualStatusPending, "Butuh Persetujuan Anda");

    const actualDesc = await notificationCenterPage.getLatestTitle();
    if (
        globalVariable.transfer.method === "OVERBOOK"
    ) {
        globalVariable.notificationCenter.descTrx = "Ke Bank Amar Indonesia - " + globalVariable.friendList.friendListName;

    } else {
        globalVariable.notificationCenter.descTrx = "Ke Bank " + globalVariable.friendList.bankName + " - " + globalVariable.friendList.friendListName;
    }

    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getLatestDescription();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I will see notification approval change to waiting from other director", async () => {
    I.waitForElement(notificationCenterPage.tabs.all, 20);

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getLatestStatusTrx();
    I.assertEqual(actualStatusTrx, "Persetujuan Transaksi");

    const actualStatusPending = await notificationCenterPage.getPendingTrxStatus(0);
    I.assertEqual(actualStatusPending, "Menunggu Persetujuan Direksi");

    const actualDesc = await notificationCenterPage.getLatestTitle();
    if (
        globalVariable.transfer.method === "OVERBOOK"
    ) {
        globalVariable.notificationCenter.descTrx = "Ke Bank Amar Indonesia - " + globalVariable.friendList.friendListName;

    } else {
        globalVariable.notificationCenter.descTrx = "Ke Bank " + globalVariable.friendList.bankName + " - " + globalVariable.friendList.friendListName;
    }

    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getLatestDescription();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I will see card maker transaction", () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForElement(onboardingAccOpeningPage.buttons.cardTransaction, 10);
    I.see("Menunggu Persetujuan");
});

Then("I will see card approver transaction", () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.seeElement(onboardingAccOpeningPage.buttons.cardTransaction);
    I.see("Butuh Persetujuan");
});

Then("there is no button approve and reject the transaction", () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.dontSeeElement(approvalTransactionPage.buttons.approveTransaction);
    I.dontSeeElement(approvalTransactionPage.buttons.rejectTransaction);
    I.dontSee("Tolak");
    I.dontSee("Setujui");
});

Then("along with button approve and reject the transaction", () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.seeElement(approvalTransactionPage.buttons.approveTransaction);
    I.seeElement(approvalTransactionPage.buttons.rejectTransaction);
    I.see("Tolak");
    I.see("Setujui");
});

Then("I will direct to page transaction approval", () => {
    I.waitForElement(approvalTransactionPage.buttons.tabOnProgress, 30);
    I.see("Persetujuan Transaksi");
});

Then("I will direct to tab profile", () => {
    I.waitForText(globalVariable.login.userID.toUpperCase(), 20);
});

Then("I will see card maker with information same with card in main dashboard", async () => {
    I.waitForElement(approvalTransactionPage.buttons.openDetailTransaction, 10);

    const actualRecipientName = await onboardingAccOpeningPage.getRecipientName();
    I.assertEqual(actualRecipientName, globalVariable.dashboard.recipientName);

    const actualRecipientBankName = await onboardingAccOpeningPage.getRecipientBankName();
    I.assertEqual(actualRecipientBankName, globalVariable.dashboard.recipientBankName);

    const actualDate = await onboardingAccOpeningPage.getTransactionDate();
    I.assertEqual(actualDate, globalVariable.dashboard.date);

    const actualAmount = await onboardingAccOpeningPage.getAmountTransaction();
    const numberString = globalVariable.dashboard.amountTransaction.split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedAmount = numberString.join('');

    I.assertEqual(actualAmount, "Rp" + expectedAmount);
});

Then("I will see pop up data is incorrect", () => {
    I.waitForElement(approvalTransactionPage.buttons.tryAgainInput, 10);

    I.see("Data Yang Dimasukkan Salah");
    I.see("Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun");
    I.see("Coba Lagi");
});

Then("I can click try again to input PIN", async () => {
    approvalTransactionPage.clickButtonTryAgain();

    await
        resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
});

Then("I can click try again to input password", async () => {
    approvalTransactionPage.clickButtonTryAgain();

    await
        resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
});

Then("I will notify I will direct lo login page", async () => {
    I.waitForElement(approvalTransactionPage.buttons.understand, 10);

    I.see("Data Yang Dimasukkan Salah");
    I.see("Anda akan langsung diarahkan ke halaman Masuk Akun");
    I.see("Mengerti");

    await
        resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
});

Then("I click button direct to login", () => {
    approvalTransactionPage.directToLogin();
});

Then("I will direct to page detail approval transaction", () => {
    I.waitForText("Menunggu Persetujuan Transaksi", 10);
});

Then("I will see message error {string} in the below of field otp for approver", async (messageError) => {
    const actualMessageError = await approvalTransactionPage.getMessageErrorOtp();
    I.assertEqual(actualMessageError, messageError);

    await
        otpDao.resetLimitRequestOtpUsingToken(globalVariable.login.userID, globalVariable.login.password);
});

Then("I should be notified that I can verify the OTP tomorrow", async () => {

    const actualMsgError = await approvalTransactionPage.getMessageErrorOtp();

    const currentDate = new Date();
    const tomorrowDate = new Date(currentDate);
    tomorrowDate.setDate(currentDate.getDate() + 1);

    const day = tomorrowDate.getDate();
    const formattedDay = (day < 10 ? '0' : '') + day;
    const month = tomorrowDate.getMonth();
    const year = tomorrowDate.getFullYear();
    const months = [
        "Jan", "Feb", "Mar", "Apr",
        "Mei", "Jun", "Jul", "Aug",
        "Sep", "Okt", "Nov", "Des"
    ];

    const hours = currentDate.getHours();
    const minutes = currentDate.getMinutes();
    const currentTime = hours.toString().padStart(2, '0') + ":" + minutes.toString().padStart(2, '0');

    I.assertEqual(actualMsgError, "Kode OTP dikirim kembali pada: tanggal " + formattedDay +
        " " + months[month] + " " + year + ", pukul " + currentTime);

    I.dontSeeElement(approvalTransactionPage.links.resendOtp);
    await
        otpDao.resetLimitRequestOtpUsingToken(globalVariable.login.userID, globalVariable.login.password);

});

Then("I will get new OTP different with my first OTP to approve transaction", async () => {
    I.wait(2);
    const newOtpCode = (await otpDao.getOTPUsingToken(globalVariable.login.userID, globalVariable.login.password)).otp;

    I.assertNotEqual(newOtpCode, globalVariable.registration.otpCode);
});

Then("I will see attempt left {string}", async (attemptLeft) => {
    I.waitForText(attemptLeft, 5);

    await
        otpDao.resetLimitRequestOtpUsingToken(globalVariable.login.userID, globalVariable.login.password);
});

Then("I will not see card approver that has been approved", () => {
    I.dontSee(globalVariable.friendList.friendListName);
});

Then("I will not see card maker that has been canceled", () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.dontSee(globalVariable.friendList.friendListName);
});

Then("I will not see card approver that has been rejected", () => {
    I.dontSee(globalVariable.friendList.friendListName);
});

Then("I will see snackbar with wording {string}", (wordingSnackBar) => {
    I.waitForText(wordingSnackBar, 40);
});

Then("I will see card maker that has been approved", async () => {
    I.waitForText("Persetujuan Transaksi", 10);
    I.see("Dalam Proses");
    I.see("Selesai");

    const actualRecipientName = await onboardingAccOpeningPage.getRecipientName();
    I.assertEqual(actualRecipientName, globalVariable.friendList.friendListName);

    const actualRecipientBankName = await onboardingAccOpeningPage.getRecipientBankName();
    I.assertEqual(actualRecipientBankName, globalVariable.friendList.bankName);

    const actualDate = await onboardingAccOpeningPage.getTransactionDate();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    const actualAmount = await onboardingAccOpeningPage.getAmountTransaction();
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedAmount = numberString.join('');

    I.assertEqual(actualAmount, "Rp" + expectedAmount);

    const actualStatusApproval = await approvalTransactionPage.getStatusTransaction();
    I.assertEqual(actualStatusApproval, "Transaksi Disetujui");
});

Then("I will see detail card maker that has been approved", async () => {
    I.waitForText("Transaksi Disetujui", 10);

    const currentDate = new Date();

    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.registration.companyName);

    const actualSenderBankName = await approvalTransactionPage.getSenderBankName();
    I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualReceiverBankName, globalVariable.friendList.bankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const expectedAmount = numberString.join('');
    I.see("-Rp" + expectedAmount);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("Dibuat oleh");
    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    I.assertEqual(actualMakerName, globalVariable.transfer.makerName);

    I.see("Disetujui oleh");
    const actualApprovedBy = await approvalTransactionPage.getNameApprovedBy();

    if(
        globalVariable.dashboard.approverName === ""
    ){
        globalVariable.dashboard.approverName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    }
    
    I.assertEqual(actualApprovedBy, globalVariable.dashboard.approverName);

    I.see("Nomor Referensi");
    I.waitForElement(approvalTransactionPage.texts.referenceNumber, 10);
    I.waitForElement(approvalTransactionPage.buttons.copy, 10);

    I.see("Tanggal Disetujui");
    const actualDate = await approvalTransactionPage.getDateTransaction();
    const expectedDate = day + " " + months[month] + " " + year
    I.assertEqual(actualDate, expectedDate);

    I.see("Waktu");
    I.waitForElement(approvalTransactionPage.texts.time, 10);

    I.see("Kategori");
    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.waitForText("Catatan", 10);
    if (globalVariable.transfer.note !== "") {
        const actualNotes = await approvalTransactionPage.getNotes();
        I.assertEqual(globalVariable.transfer.note, actualNotes);
    }
});

Then("I will see card maker that has been rejected", async () => {
    I.waitForText("Persetujuan Transaksi", 10);
    I.see("Dalam Proses");
    I.see("Selesai");

    const actualRecipientName = await onboardingAccOpeningPage.getRecipientName();
    I.assertEqual(actualRecipientName, globalVariable.friendList.friendListName);

    const actualRecipientBankName = await onboardingAccOpeningPage.getRecipientBankName();
    I.assertEqual(actualRecipientBankName, globalVariable.friendList.bankName);

    const actualDate = await onboardingAccOpeningPage.getTransactionDate();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    const actualAmount = await onboardingAccOpeningPage.getAmountTransaction();
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedAmount = numberString.join('');

    I.assertEqual(actualAmount, "Rp" + expectedAmount);

    const actualStatusApproval = await approvalTransactionPage.getStatusTransaction();
    I.assertEqual(actualStatusApproval, "Transaksi Ditolak");
});

Then("I will see detail card maker that has been rejected", async () => {
    I.waitForText("Transaksi Ditolak", 10);
    I.see("Saldo Anda tidak terpotong & akan langsung dikembalikan ke Saldo Aktif");

    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.registration.companyName);

    const actualSenderBankName = await approvalTransactionPage.getSenderBankName();
    I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualReceiverBankName, globalVariable.friendList.bankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const expectedAmount = numberString.join('');
    I.see("-Rp" + expectedAmount);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("Dibuat oleh");
    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    I.assertEqual(actualMakerName, globalVariable.transfer.makerName);

    I.see("Ditolak oleh");
    const actualRejectedName = await approvalTransactionPage.getNameRejectedBy();
    if(
        globalVariable.dashboard.approverName === ""
    ){
        globalVariable.dashboard.approverName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    }
    I.assertEqual(actualRejectedName, globalVariable.dashboard.approverName);

    I.see("Nomor Referensi");
    I.waitForElement(approvalTransactionPage.texts.referenceNumber, 10);
    I.waitForElement(approvalTransactionPage.buttons.copy, 10);

    I.see("Tanggal Ditolak");
    const actualDate = await approvalTransactionPage.getDateTransaction();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    I.see("Waktu");
    I.waitForElement(approvalTransactionPage.texts.time, 10);

    I.see("Kategori");
    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.waitForText("Catatan", 10);
    if (globalVariable.transfer.note !== "") {
        const actualNotes = await approvalTransactionPage.getNotes();
        I.assertEqual(globalVariable.transfer.note, actualNotes);
    }
});

Then("I will see card with status has been canceled", async () => {
    I.waitForText("Persetujuan Transaksi", 10);
    I.see("Dalam Proses");
    I.see("Selesai");

    const actualRecipientName = await onboardingAccOpeningPage.getRecipientName();
    I.assertEqual(actualRecipientName, globalVariable.friendList.friendListName);

    const actualRecipientBankName = await onboardingAccOpeningPage.getRecipientBankName();
    I.assertEqual(actualRecipientBankName, globalVariable.friendList.bankName);

    const actualDate = await onboardingAccOpeningPage.getTransactionDate();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    const actualAmount = await onboardingAccOpeningPage.getAmountTransaction();
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedAmount = numberString.join('');

    I.assertEqual(actualAmount, "Rp" + expectedAmount);

    const actualStatusApproval = await approvalTransactionPage.getStatusTransaction();
    I.assertEqual(actualStatusApproval, "Transaksi Dibatalkan");
});

Then("I will see detail card maker that has been canceled", async () => {
    I.waitForText("Transaksi Dibatalkan", 10);
    I.see("Saldo Anda tidak terpotong & akan langsung dikembalikan ke Saldo Aktif");

    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.registration.companyName);

    const actualSenderBankName = await approvalTransactionPage.getSenderBankName();
    I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualReceiverBankName, globalVariable.friendList.bankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const expectedAmount = numberString.join('');
    I.see("-Rp" + expectedAmount);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("Dibuat oleh");
    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    I.assertEqual(actualMakerName, globalVariable.transfer.makerName);

    I.see("Dibatalkan oleh");
    const actualCanceledName = await approvalTransactionPage.getNameCanceledBy();
    const expectedCanceledName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualCanceledName, expectedCanceledName);

    I.see("Nomor Referensi");
    I.waitForElement(approvalTransactionPage.texts.referenceNumber, 10);
    I.waitForElement(approvalTransactionPage.buttons.copy, 10);

    I.see("Tanggal");
    const actualDate = await approvalTransactionPage.getDateTransaction();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    I.see("Waktu");
    I.waitForElement(approvalTransactionPage.texts.time, 10);

    I.see("Kategori");
    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.see("Catatan");
    if (globalVariable.transfer.note !== "") {
        const actualNotes = await approvalTransactionPage.getNotes();
        I.assertEqual(globalVariable.transfer.note, actualNotes);
    }
});

Then("I don't see list pending task", () => {
    I.waitForText("Notifikasi", 20);

    I.dontSeeElement(notificationCenterPage.texts.pendingTrxStatus + "0");
});

Then("I don't see indicator red in tab profile", () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);

    I.dontSeeElement(profilePage.indicators.redDotProfile);
});

Then("I will not see counter pending task", async () => {
    I.waitForElement(profilePage.buttons.transactionApprovalDetail, 10);
    I.dontSeeElement(profilePage.texts.countPendingTrx);
});

Then("I will see indicator red in tab profile", () => {
    I.waitForElement(profilePage.indicators.redDotProfile, 20);
});

Then("I see counter pending task", () => {
    I.waitForElement(profilePage.texts.countPendingTrx, 20);
});

Then("I will not see list approver transaction in notification center", async () => {
    I.waitForElement(notificationCenterPage.tabs.all, 20);

    I.dontSee("Persetujuan Transaksi");
    I.dontSee("Butuh Persetujuan Anda");
});

Then("I will not see list maker transaction in notification center", async () => {
    I.waitForElement(notificationCenterPage.tabs.all, 20);

    I.dontSee("Persetujuan Transaksi");
    I.dontSee("Menunggu Persetujuan Direksi");
});

Then("I will direct to page waiting approval from other director", async () => {
    I.waitForText("Menunggu Persetujuan Transaksi", 10);

    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.registration.companyName);

    const actualSenderBankName = await approvalTransactionPage.getSenderBankName();
    I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualReceiverBankName, globalVariable.friendList.bankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    I.see("-" + globalVariable.transfer.amountTransfer);

    I.see("Dibuat oleh");
    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    I.assertEqual(actualMakerName, globalVariable.transfer.makerName);

    I.see("Nomor Referensi");
    I.waitForElement(approvalTransactionPage.texts.referenceNumber, 10);
    I.waitForElement(approvalTransactionPage.buttons.copy, 10);

    I.see("Tanggal");
    const actualDate = await approvalTransactionPage.getDateTransaction();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    I.see("Waktu");
    I.waitForElement(approvalTransactionPage.texts.time, 10);

    I.see("Kategori")
    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);

    I.see("Catatan");
    if (globalVariable.transfer.note !== "") {
        const actualNotes = await approvalTransactionPage.getNotes();
        I.assertEqual(globalVariable.transfer.note, actualNotes);
    }

    I.dontSee("Batalkan");
    I.dontSeeElement(approvalTransactionPage.buttons.cancel);
});