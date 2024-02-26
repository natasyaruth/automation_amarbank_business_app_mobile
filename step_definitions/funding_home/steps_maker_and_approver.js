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
    headerPage.openHelpCenter();
});

When("I input incorrect password for approver", () => {
    I.waitForText("Password", 10);
    I.see("Silahkan masukkan password Amar Bank Bisnis kamu");

    approvalTransactionPage.fillPassword("aaaa12");
});

When("I input password for approver", () => {
    I.waitForText("Password", 10);
    I.see("Silahkan masukkan password Amar Bank Bisnis kamu");

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

When("I try again to input password", () => {
    approvalTransactionPage.clickButtonIncorrectPassword();
    I.wait(1);
});

When("I close page password for transaction approval", () => {
    headerPage.closePage();
});

When("I input OTP to approve transaction", async () => {
    I.waitForText("Kode OTP", 10);
    I.see("Masukkan Kode OTP");
    I.see("Kode OTP telah dikirim ke nomor");

    const phoneNumber = (await resetStateDao.getPhoneNumber(globalVariable.login.userID, globalVariable.login.password)).phoneNumber;
    const actualPhoneNumber = await approvalTransactionPage.getPhoneNumber().replace(/\s+/g, '').replace(/+/g, '');

    I.assertEqual("+" + actualPhoneNumber, phoneNumber);

    const otpCode = await otpDao.getOTP(actualPhoneNumber);
    approvalTransactionPage.fillOtpCode(otpCode);
});

When("I input incorrect OTP for approve transaction", async () => {
    I.waitForText("Kode OTP", 10);

    approvalTransactionPage.fillOtpCode("000000");
});

When("I input incorrect OTP {string} times", (times) => {
    I.waitForText("Kode OTP", 10);

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

When("I resend otp code to approve transaction", async ()=>{
    I.wait(3);
    globalVariable.registration.phoneNumber = (await approvalTransactionPage.getPhoneNumber()).replace(/\s+/g, '').replace(/-/g, '');
    globalVariable.registration.otpCode = (await otpDao.getOTP(globalVariable.registration.phoneNumber)).otp;

    I.waitForElement(approvalTransactionPage.links.resendOtp, 70);
    approvalTransactionPage.resendOtp();
    I.waitForText("Kode OTP berhasil dikirim.", 10);
});

When("I resend otp code to approve transaction five times", async()=>{
    I.waitForText("Kode OTP", 10);

    I.wait(3);
    globalVariable.registration.phoneNumber = (await approvalTransactionPage.getPhoneNumber()).replace(/\s+/g, '').replace(/-/g, '');

    for (let x = 0; x < 5; x++) {
        I.waitForElement(approvalTransactionPage.links.resendOtp, 70);
        approvalTransactionPage.resendOtp();
        I.waitForText("Kode OTP berhasil dikirim.", 10);
    };
});

When("I approve the transaction", ()=>{
    approvalTransactionPage.approveTransaction();
});

When("I reject the transaction", ()=>{
    approvalTransactionPage.rejectTransaction();
});

Then("I will not see menu transaction approval", () => {
    I.waitForText(globalVariable.login.userID.toUpperCase(), 10);
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
    I.see(profilePage.buttons.documentProcuration);
});

Then("I will see menu document management", () => {
    I.see(profilePage.buttons.documentBusiness);
});

Then("I will see page transaction approval is empty", () => {
    I.waitForText("Halaman Ini Masih Kosong", 10);
    I.see("Saat ini, belum ada transaksi yang membutuhkan persetujuan untuk ditampilkan.")
});

Then("I don't see any card transaction in main dashboard", () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.dontSee(approvalTransactionPage.buttons.openDetailTransaction);
    I.dontSee(onboardingAccOpeningPage.buttons.cardTransaction);
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

    I.waitForText("Menunggu Persetujuan Transaksi", 10);

    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.dashboard.senderName);

    I.seeElement(approvalTransactionPage.texts.senderBankName);
    globalVariable.transfer.senderBankName = await approvalTransactionPage.getSenderBankName();

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    I.seeElement(approvalTransactionPage.texts.recipientBankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transfer Keluar");
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const actualAmount = numberString.join('');
    I.see("-Rp " + actualAmount);

    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    const expectedMakerName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualMakerName, expectedMakerName);

    I.see(approvalTransactionPage.texts.referenceNumber);
    I.see(approvalTransactionPage.buttons.copy);

    const actualDate = await approvalTransactionPage.getDateTransaction();
    const expectedDate = day + " " + months[month] + " " + year
    I.assertEqual(actualDate, expectedDate);
    globalVariable.transfer.date = expectedDate;

    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);
});

Then("I will direct to page waiting for approval from other director", async () => {

    I.waitForText("Butuh Persetujuan Transaksi", 10);

    const actualSenderName = await approvalTransactionPage.getSenderName();
    I.assertEqual(actualSenderName, globalVariable.dashboard.senderName);

    const actualSenderBankName = await approvalTransactionPage.getSenderBankName();
    I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

    const actualSenderAccNumber = (await approvalTransactionPage.getSenderAccountNumber()).replace(/\s+/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualReceiverName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualReceiverName, globalVariable.friendList.friendListName);

    const actualReceiverBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualReceiverBankName, globalVariable.dashboard.recipientBankName);

    const actualReceiverAccNumber = (await approvalTransactionPage.getRecipientAccountNumber()).replace(/\s+/g, '');
    I.assertEqual(actualReceiverAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transfer Keluar");
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const actualAmount = numberString.join('');
    I.see("-Rp " + actualAmount);

    const actualMakerName = await approvalTransactionPage.getNameCreatedBy();
    const expectedMakerName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualMakerName, expectedMakerName);

    I.see(approvalTransactionPage.texts.referenceNumber);
    I.see(approvalTransactionPage.buttons.copy);

    const actualDate = await approvalTransactionPage.getDateTransaction();
    const expectedDate = day + " " + months[month] + " " + year
    I.assertEqual(actualDate, expectedDate);
    globalVariable.transfer.date = expectedDate;

    const actualCategory = await approvalTransactionPage.getCategoryName();
    I.assertEqual(actualCategory, globalVariable.transfer.category);
});

Then("I will see card maker transaction in main dashboard", async () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);
    globalVariable.dashboard.senderName = await mainActivePage.getCompanyName();

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("Persetujuan Transaksi");
    I.see("Lihat Semua");
    I.seeElement(onboardingAccOpeningPage.buttons.openAllTransactionApproval);

    I.seeElement(onboardingAccOpeningPage.buttons.cardTransaction);
    I.see("Menunggu Persetujuan");

    const actualCompanyReceiver = await onboardingAccOpeningPage.getRecipientName();
    I.assertEqual(actualCompanyReceiver, globalVariable.friendList.friendListName);

    I.seeElement(onboardingAccOpeningPage.texts.transactionRecipientBank);
    globalVariable.dashboard.recipientBankName = await onboardingAccOpeningPage.getRecipientBankName();

    const actualDate = await onboardingAccOpeningPage.getTransactionDate();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    const actualAmount = await onboardingAccOpeningPage.getAmountTransaction();
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedAmount = numberString.join('');
    I.assertEqual(actualAmount, "Rp" + expectedAmount);
});

Then("I will see card approver transaction in main dashboard", async () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("Persetujuan Transaksi");
    I.see("Lihat Semua");
    I.seeElement(onboardingAccOpeningPage.buttons.openAllTransactionApproval);

    I.seeElement(onboardingAccOpeningPage.buttons.cardTransaction);
    I.see("Butuh Persetujuan");

    const actualCompanyReceiver = await onboardingAccOpeningPage.getRecipientName();
    I.assertEqual(actualCompanyReceiver, globalVariable.friendList.friendListName);

    I.seeElement(onboardingAccOpeningPage.texts.transactionRecipientBank);
    globalVariable.dashboard.recipientBankName = await onboardingAccOpeningPage.getRecipientBankName();

    const actualDate = await onboardingAccOpeningPage.getTransactionDate();
    I.assertEqual(actualDate, globalVariable.transfer.date);

    const actualAmount = await onboardingAccOpeningPage.getAmountTransaction();
    const numberString = globalVariable.transfer.amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedAmount = numberString.join('');
    I.assertEqual(actualAmount, "Rp" + expectedAmount);
});

Then("I will see card maker transaction", () => {
    I.waitForElement(mainActivePage.buttons.btnTransfer, 20);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.seeElement(onboardingAccOpeningPage.buttons.cardTransaction);
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
    I.waitForElement(approvalTransactionPage.buttons.tabOnProgress, 10);
    I.see("Persetujuan Transaksi");
});

Then("I will direct to tab profile", () => {
    I.waitForText(globalVariable.login.userID.toUpperCase(), 10);
});

Then("I will see card maker with information same with card in main dashboard", async () => {
    I.waitForElement(approvalTransactionPage.buttons.openDetailTransaction, 10);

    const actualRecipientName = await approvalTransactionPage.getRecipientName();
    I.assertEqual(actualRecipientName, globalVariable.dashboard.recipientName);

    const actualRecipientBankName = await approvalTransactionPage.getRecipientBankName();
    I.assertEqual(actualRecipientBankName, globalVariable.dashboard.recipientBankName);

    const actualDate = await approvalTransactionPage.getDateTransaction();
    I.assertEqual(actualDate, globalVariable.dashboard.date);

    const actualAmount = await approvalTransactionPage.getAmountTransaction();
    const numberString = globalVariable.dashboard.amountTransaction.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const expectedAmount = numberString.join('');

    I.assertEqual(actualAmount, "Rp " + expectedAmount);
});

Then("I will see pop up password is incorrect", () => {
    I.waitForElement(approvalTransactionPage.buttons.passwordIncorrect);

    I.see("Data Yang Dimasukkan Salah");
    I.see("Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun");
    I.see("Coba Lagi");
});

Then("I will notify I will direct lo login page", () => {
    I.waitForElement(approvalTransactionPage.buttons.passwordIncorrect);

    I.see("Data Yang Dimasukkan Salah");
    I.see("Anda akan langsung diarahkan ke halaman Masuk Akun");
    I.see("Mengerti");
});

Then("I click button direct to login", () => {
    approvalTransactionPage.clickButtonIncorrectPassword();
});

Then("I will direct to page detail approval transaction", () => {
    I.waitForText("Butuh Persetujuan Transaksi", 10);
});

Then("I will see message error {string} in the below of field otp for approver", async (messageError) => {
    const actualMessageError = await approvalTransactionPage.getMessageErrorOtp();
    I.assertEqual(actualMessageError, messageError);
});

Then("I should be notified that I can verify the OTP tomorrow", async () => {
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

    const hours = tomorrowDate.getHours();
    const minutes = tomorrowDate.getMinutes();
    const currentTime = hours.toString().padStart(2, '0') + ":" + minutes.toString().padStart(2, '0');

    let actualMsgError = await approvalTransactionPage.getMessageErrorOtp();

    I.assertEqual(actualMsgError, "Kode OTP dikirim kembali pada: tanggal " + formattedDay +
        " " + months[month] + " " + year + ", pukul " + currentTime);

    I.dontSeeElement(approvalTransactionPage.links.resendOtp);
    const actualPhoneNumber = await approvalTransactionPage.getPhoneNumber().replace(/\s+/g, '').replace(/+/g, '');
    await otpDao.resetLimitRequestOtp(globalVariable.registration.actualPhoneNumber);
});

Then("I will get new OTP different with my first OTP to approve transaction", async ()=>{
    I.wait(2);
    const newOtpCode = (await otpDao.getOTP(globalVariable.registration.phoneNumber)).otp;

    I.assertNotEqual(newOtpCode, globalVariable.registration.otpCode);
});

Then("I will see attempt left {string}", (attemptLeft) =>{
    I.waitForText(attemptLeft, 5);
});

Then("I will not see card approver that has been approved",  ()=>{
    I.dontSee(globalVariable.friendList.friendListName);
});

Then("I will not see card approver that has been rejected",  ()=>{
    I.dontSee(globalVariable.friendList.friendListName);
});

Then("I will see snackbar with wording {string}", (wordingSnackBar)=>{
    I.waitForText(wordingSnackBar, 10);
});

Then("I can click link to see the transaction with status {string}", async (statusApproval)=>{
    approvalTransactionPage.openDetailApprovalOnSnackbar();

    const actualStatusApproval = await approvalTransactionPage.getStatusTransaction();
    I.assertEqual(actualStatusApproval, statusApproval);
});
