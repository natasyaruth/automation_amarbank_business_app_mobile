const {
    I,
    transactionHistoryPage,
    onboardingAccOpeningPage,
    amountDetailPage,
    resetStateDao,
    globalVariable,
    documentSafePage,
    getDataDao,
    surveyRatingPage,
    headerPage,
    uploadDao,
    notificationCenterPage,
    mockingDao
} = inject();

Given(/I am on home page/, () => {
    transactionHistoryPage.viewUserName();
});
When(/I should see button history on saldo card/, () => {
    transactionHistoryPage.seeBtnHistory();
});
Then(/I want to click button history transaction/, () => {
    transactionHistoryPage.clickBtnHistory();
});
Then(/I will redirect to history transaction page/, () => {
    transactionHistoryPage.viewPageHistoryTransaction();
});


// hitory page
Given(/I want to click button filter history/, () => {
    transactionHistoryPage.clicBtnFilter();
});
When(/I should see buttom sheet filter history/, () => {
    I.see("Filter Riwayat");
    I.see("Pilih sendiri rentang waktu transaksi");

    I.see("Tanggal Awal");
    I.see("Pilih tanggal");

    I.see("Tanggal Akhir");
    I.see("Pilih tanggal");

    I.see("Ok");

    I.waitForElement(transactionHistoryPage.fields.startDateField, 10);
    I.waitForElement(transactionHistoryPage.fields.endDateField, 10);
    I.waitForElement(transactionHistoryPage.buttons.submitFilter, 10);
    I.dontSee(transactionHistoryPage.link.reset);
});
Then(/I want to click button close/, () => {
    transactionHistoryPage.clicBtnClose();
});
Then(/I want to click button start date/, () => {
    transactionHistoryPage.clicFieldStartDate();
});
Then(/I should see form date displayed/, () => {
    transactionHistoryPage.viewFormDate();
});
Then(/I choose the start date \"([^\"]*)\" with tap \"([^\"]*)\"/, (Date, Qty) => {
    transactionHistoryPage.selectDayDate(Date, Qty);
    transactionHistoryPage.selectMonthDate(Date);
    transactionHistoryPage.clickBtnChoose();
});
Then(/I want to click button end date/, () => {
    transactionHistoryPage.clicFieldEndDate();
});
Then(/I choose the end date/, () => {
    transactionHistoryPage.clickBtnChoose();
});
Then(/I want to click button ok/, () => {
    transactionHistoryPage.clickBtnOk();
});


//transaction detail
Given(/I want to click list transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.clickListTransfer(trfType);
});
When(/I should see text view transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.validateTextViewTransfer(trfType);
});
Then(/I should see reference number value \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewRefNumber(trfType);
});
Then(/I want to copied reference number value/, () => {
    transactionHistoryPage.clickBtnCopied();
});
Then(/I should see text view value date transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewDate(trfType);
});
Then(/I should see text view value time transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewTime(trfType);
});
Then(/I should see text view value note transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewNoted(trfType);
});
Then(/I should see text view value category transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewCategory(trfType);
});
Then(/I click menu tab testing/, () => {
    transactionHistoryPage.clickTabTesting();
});

// Amount detail

Given("I wait until my account name displayed", async () => {
    const accType = (await resetStateDao.getAccountType(globalVariable.login.userID, globalVariable.login.password)).accountType;
    let accountName;

    if (
        accType === 1
    ) {
        const fullName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
        accountName = fullName;
    } else {
        const businessName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
        accountName = businessName;
    }

    I.waitForText(accountName, 30);
});

Given("still not complete onboarding document safe and survey", async () => {
    await
        resetStateDao.updateFlagOnboardingDocumentSafeAndSurvey(globalVariable.login.userID, false);
    I.wait(3);
});

Given("complete onboarding document safe and survey", async () => {
    await
        resetStateDao.updateFlagOnboardingDocumentSafeAndSurvey(globalVariable.login.userID, true);
    I.wait(3);
});

Given("notification red dot document safe is on", () => {
    I.waitForElement(onboardingAccOpeningPage.icons.redDotNotificationDoc, 20);
});

Given("notification red dot document safe is off", () => {
    I.wait(2);
    I.dontSee(onboardingAccOpeningPage.icons.redDotNotificationDoc);
});

Given("still not fill survey rating account opening", async () => {

    await
        mockingDao.configCSATSurveyON();

});

Given("has been filled survey rating account opening", async () => {

    await
        mockingDao.configCSATSurveyOFF();

});

Given("don't have any notification", async () => {

    await
        resetStateDao.deleteAllNotification(globalVariable.login.userID, globalVariable.login.password);

});

Given("I have {string} notification {string} in notification center", async (number, notifName) => {

    const numbers = parseInt(number);

    switch (notifName) {
        case "Maintenance App":
            for (let i = 0; i < numbers; i++) {
                await
                    uploadDao.pushNotificationMaintananceApp(globalVariable.login.userID);
                I.wait(2);
            }
            break;
        default:
            throw new Error("Notification name is not recognize");
    }

});

Given("I only have {string} notification {string} in notification center", async (number, notifName) => {

    const numbers = parseInt(number);

    await
        resetStateDao.deleteAllNotification(globalVariable.login.userID, globalVariable.login.password);

    switch (notifName) {
        case "Maintenance App":
            for (let i = 0; i < numbers; i++) {
                await
                    uploadDao.pushNotificationMaintananceApp(globalVariable.login.userID);
                I.wait(2);
            }
            break;
        default:
            throw new Error("Notification name is not recognize");
    }

});

When("I click detail amount", () => {
    amountDetailPage.openDetailAmount();
    I.waitForText("Saldo Rekening Giro", 10);
});

When("I mask my amount", () => {
    amountDetailPage.clickIconEye();
    I.wait(1);
});

When("I will see my active, blocking and total amount", async () => {
    globalVariable.dashboard.activeAmount = await amountDetailPage.getActiveAmount();
    globalVariable.dashboard.blockingAmount = await amountDetailPage.getBlockingAmount();
    globalVariable.dashboard.totalAmount = await amountDetailPage.getTotalAmount();
});

When("I see my blocking amount is Rp 0", async () => {
    let expectedAmount = "Rp0"

    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    I.assertEqual(actualBlockingAmount, expectedAmount);
});

When("I see my blocking amount coming from minimum amount", async () => {
    const minimumBusiness = "1.000.000";
    const minimumIndividual = "500.000";
    const accType = (await resetStateDao.getAccountType(globalVariable.login.userID, globalVariable.login.password)).accountType;

    if (
        accType === 1
    ) {
        const actualBlockingAmount = await amountDetailPage.getBlockingAmount();
        I.assertEqual(actualBlockingAmount, "Rp" + minimumIndividual);
    } else if (
        accType === 2
    ) {
        const actualBlockingAmount = await amountDetailPage.getBlockingAmount();
        I.assertEqual(actualBlockingAmount, "Rp" + minimumBusiness);
    }
});

When("I click widget document safe", () => {
    onboardingAccOpeningPage.openWidgetDocumentSafe();
});

When("I close page onboarding document safe", () => {
    headerPage.closePage();
});

When("I click button choose product", () => {
    I.waitForText("Pilih Produk", 10);
    documentSafePage.clickChooseProduct();
});

When("I continue to process loan", () => {
    I.waitForText("Lanjutkan Pengajuan Pinjaman", 10);
    documentSafePage.clickContinueToLoanProcess();
});

When("I continue to process account opening", () => {
    I.waitForText("Lanjutkan Pembukaan Rekening", 10);
    documentSafePage.clickContinueToAccOpening();
});

When("I click use document safe", () => {
    I.waitForText("Gunakan Brankas Dokumen", 10);
    documentSafePage.clickUseDocumentSafe();
});

When("I sent feedback survey", () => {
    documentSafePage.sentFeedback();
});

When("I give {string} ratings", (ratings) => {
    surveyRatingPage.clickRating(ratings);
});

When("I fill feedback survey {string}", async (feedback) => {
    surveyRatingPage.fillFeedback(feedback);

    const counter = await surveyRatingPage.getCountWord();

    globalVariable.survey.feedBack = feedback;

    const lengthFeedback = globalVariable.survey.feedBack.length;

    if (
        lengthFeedback < 259
    ) {

        I.assertEqual(counter, globalVariable.survey.feedBack.length + "/259");

    } else {

        I.assertEqual(counter, "259/259");

    }

});

When("I click notification center", () => {
    notificationCenterPage.openNotificationCenter();
});

When("I close page notification center", () => {
    headerPage.closePage();
});

When("I click tab All notification", () => {
    notificationCenterPage.clickTabAll();
});

When("I click tab Info notification", () => {
    notificationCenterPage.clickTabInfo();
});

When("I click tab Transaction notification", () => {
    notificationCenterPage.clickTabTransaction();
});

When("I click tab Loan notification", () => {
    notificationCenterPage.clickTabLoan();
});

When("I click bucketlist notification info", () => {
    notificationCenterPage.openDetailNotifInfo(0);
});

When("I click bucketlist notification transaction", () => {
    notificationCenterPage.openDetailNotifTransaction(0);
});

When("I click understand the notification", () => {
    notificationCenterPage.clickUnderstand();
});

Then("I will not see my active, blocking and total amount", async () => {
    I.dontSee(globalVariable.dashboard.activeAmount);
    I.dontSee(globalVariable.dashboard.blockingAmount);
    I.dontSee(globalVariable.dashboard.totalAmount);
});

Then("I will see my active, blocking and total amount are Rp 0", async () => {
    let expectedAmount = "Rp0"

    let actualActiveAmount = await amountDetailPage.getActiveAmount();
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualActiveAmount, expectedAmount);
    I.assertEqual(actualBlockingAmount, expectedAmount);
    I.assertEqual(actualTotalAmount, expectedAmount);

});

Then("I will see my detail active, blocking and total amount are Rp 0", async () => {

    let expectedAmount = "Rp0"

    I.waitForText("Saldo Aktif", 10);
    I.see("Nominal saldo yang dapat digunakan untuk transaksi");

    I.see("Saldo Tertahan");
    I.see("Saldo Minimum sebesar Rp500.000 (untuk individu)");
    I.see("Saldo Minimum sebesar Rp1.000.000 (untuk PT Perusahaan, CV, PT Perorangan, UD)");
    I.see("Total Penangguhan Saldo Pinjaman, jika Anda mempunyai pinjaman");
    I.see("Saldo tidak dapat digunakan untuk transaksi");

    I.see("Total Saldo");
    I.see("Seluruh total saldo yang ada di Amar Bank Bisnis");
    I.see("Rincian Perhitungan Total Saldo:");
    I.see("Saldo Aktif");
    I.see("Saldo Tertahan");
    I.see("Saldo Minimum + Total Penangguhan Saldo Pinjaman");
    I.see("Total Saldo");

    let actualActiveAmount = await amountDetailPage.getActiveAmount();
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualActiveAmount, expectedAmount);
    I.assertEqual(actualBlockingAmount, expectedAmount);
    I.assertEqual(actualTotalAmount, expectedAmount);

});

Then("I will see my active amount decreased", async () => {
    const previousActiveAmount = globalVariable.dashboard.activeAmount.replace(/Rp|\./g, '');
    const numberPreviousActiveAmount = parseInt(previousActiveAmount);

    const expectedActiveAmount = numberPreviousActiveAmount - globalVariable.transfer.amount - globalVariable.transfer.adminFee;

    const numberString = expectedActiveAmount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const formattedActiveAmount = numberString.join('');

    let actualActiveAmount = await amountDetailPage.getActiveAmount();

    I.assertEqual(actualActiveAmount, "Rp" + formattedActiveAmount);

    globalVariable.dashboard.activeAmount = "Rp" + formattedActiveAmount;
});

Then("I will see my active amount detail decreased", async () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    let actualActiveAmount = await amountDetailPage.getActiveAmount();

    I.assertEqual(actualActiveAmount, globalVariable.dashboard.activeAmount);
});

Then("my blocking amount still Rp. 500.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my blocking amount detail still Rp. 500.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my blocking amount still Rp. 1.000.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my blocking amount detail still Rp. 1.000.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my total amount decreased", async () => {
    const blockingAmount = globalVariable.dashboard.blockingAmount.replace(/Rp|\./g, '');
    const activeAmount = globalVariable.dashboard.activeAmount.replace(/Rp|\./g, '');
    const numberBlockingAmount = parseInt(blockingAmount);
    const numberActiveAmount = parseInt(activeAmount);
    const expectedTotalAmount = numberActiveAmount + numberBlockingAmount;

    const numberString = expectedTotalAmount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const formattedTotalAmount = numberString.join('');

    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualTotalAmount, "Rp" + formattedTotalAmount);

    globalVariable.dashboard.totalAmount = "Rp" + formattedTotalAmount;
});

Then("my total amount detail decreased", async () => {
    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualTotalAmount, globalVariable.dashboard.totalAmount);
});

Then("I will see detail blocking amount coming from loan fee", () => {
    I.waitForText("Saldo Tertahan", 10);
    I.waitForText("Total Biaya Bunga pinjaman, jika Anda mempunyai pinjaman", 10);
    I.waitForText("Saldo tidak dapat digunakan untuk transaksi", 10);
});

Then("I will see information {string} in the below of field blocking amount", async (information) => {
    const actualInformation = await amountDetailPage.getinformationBlockingAmount();
    I.assertEqual(actualInformation, information);
});

Then("I will see detail blocking amount coming from loan fee and minimum amount", () => {
    I.waitForText("Saldo Tertahan", 10);
    I.see("Saldo Minimum sebesar Rp500.000 (untuk individu)");
    I.see("Saldo Minimum sebesar Rp1.000.000 (untuk PT Perusahaan, CV, PT Perorangan, UD)");
    I.see("Total Biaya Bunga pinjaman, jika Anda mempunyai pinjaman");
    I.see("Saldo tidak dapat digunakan untuk transaksi");
});

Then("I will not see information {string} in the below of field blocking amount", async (information) => {
    I.waitForText("Saldo Rekening Giro", 10);

    const productType = (await resetStateDao.getProductType(globalVariable.login.userID, globalVariable.login.password)).productType;
    const statusPendingTask = await (await resetStateDao.isPendingTaskExist(globalVariable.login.userID, globalVariable.login.password)).hasPendingTransaction;

    if (
        productType === "MSME" &&
        statusPendingTask === false
    ) {
        I.dontSeeElement(amountDetailPage.text.informationBlockingAmount);
        I.dontSee(information);
    } else if (
        productType === "CORP" &&
        statusPendingTask === false
    ) {
        const actualDescBlockingAmount = await amountDetailPage.getinformationBlockingAmount();
        I.assertNotEqual(actualDescBlockingAmount, information);
    }

});

Then("I see widget document safe", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.see("Aman");
    I.see("Gratis");

    I.see("Pelajari");
    I.waitForElement(onboardingAccOpeningPage.buttons.widgetDocumentSafe, 10);
});

Then("I don't see widget onboarding document safe", () => {
    I.dontSee("Brankas Dokumen");
    I.dontSee("Aman");
    I.dontSee("Gratis");

    I.dontSee("Pelajari");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.widgetDocumentSafe);
});

Then("I will see onboarding page document safe continue to choose product", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.see("Brankas Dokumen");
    I.see("Brankas jaga dokumen bisnis berharga Anda");

    I.see("Terjamin Aman");
    I.see("Dokumen Anda disimpan dengan aman menggunakan teknologi keamanan terkini.");

    I.see("Kapasitas Besar");
    I.see("Kelola dokumen bisnis Anda tanpa khawatir kehabisan ruang penyimpanan.");

    I.see("Akses Kapan Saja");
    I.see("Unduh dan bagikan dokumen Anda kapanpun dibutuhkan, dengan cepat dan mudah.");

    I.see("Untuk dapat menggunakan fitur Brankas Dokumen, mulai pembukaan rekening atau pengajuan pinjaman terlebih dahulu");

    I.see("Pilih Produk");
    I.waitForElement(documentSafePage.buttons.continueOnboarding, 10);
});

Then("I will see onboarding page document safe continue to loan process", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.see("Brankas Dokumen");
    I.see("Brankas jaga dokumen bisnis berharga Anda");

    I.see("Terjamin Aman");
    I.see("Dokumen Anda disimpan dengan aman menggunakan teknologi keamanan terkini.");

    I.see("Kapasitas Besar");
    I.see("Kelola dokumen bisnis Anda tanpa khawatir kehabisan ruang penyimpanan.");

    I.see("Akses Kapan Saja");
    I.see("Unduh dan bagikan dokumen Anda kapanpun dibutuhkan, dengan cepat dan mudah.");

    I.see("Untuk dapat menggunakan fitur Brankas Dokumen, silakan lanjutkan pengajuan pinjaman Anda terlebih dahulu");

    I.see("Lanjutkan Pengajuan Pinjaman");
    I.waitForElement(documentSafePage.buttons.continueOnboarding, 10);
});

Then("I will see onboarding page document safe continue to account opening process", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.see("Brankas Dokumen");
    I.see("Brankas jaga dokumen bisnis berharga Anda");

    I.see("Terjamin Aman");
    I.see("Dokumen Anda disimpan dengan aman menggunakan teknologi keamanan terkini.");

    I.see("Kapasitas Besar");
    I.see("Kelola dokumen bisnis Anda tanpa khawatir kehabisan ruang penyimpanan.");

    I.see("Akses Kapan Saja");
    I.see("Unduh dan bagikan dokumen Anda kapanpun dibutuhkan, dengan cepat dan mudah.");

    I.see("Untuk dapat menggunakan fitur Brankas Dokumen, silakan lanjutkan pembukaan rekening Anda terlebih dahulu");

    I.see("Lanjutkan Pembukaan Rekening");
    I.waitForElement(documentSafePage.buttons.continueOnboarding, 10);
});

Then("I will see onboarding page document safe data still need verification", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.see("Brankas Dokumen");
    I.see("Brankas jaga dokumen bisnis berharga Anda");

    I.see("Terjamin Aman");
    I.see("Dokumen Anda disimpan dengan aman menggunakan teknologi keamanan terkini.");

    I.see("Kapasitas Besar");
    I.see("Kelola dokumen bisnis Anda tanpa khawatir kehabisan ruang penyimpanan.");

    I.see("Akses Kapan Saja");
    I.see("Unduh dan bagikan dokumen Anda kapanpun dibutuhkan, dengan cepat dan mudah.");

    I.see("Untuk dapat menggunakan fitur Brankas Dokumen, mohon menunggu proses verifikasi data Anda selesai terlebih dahulu");
    I.dontSeeElement(documentSafePage.buttons.continueOnboarding);

});

Then("I will see onboarding page to complete document safe", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.see("Brankas Dokumen");
    I.see("Brankas jaga dokumen bisnis berharga Anda");

    I.see("Terjamin Aman");
    I.see("Dokumen Anda disimpan dengan aman menggunakan teknologi keamanan terkini.");

    I.see("Kapasitas Besar");
    I.see("Kelola dokumen bisnis Anda tanpa khawatir kehabisan ruang penyimpanan.");

    I.see("Akses Kapan Saja");
    I.see("Unduh dan bagikan dokumen Anda kapanpun dibutuhkan, dengan cepat dan mudah.");

    I.see("Gunakan Brankas Dokumen");
    I.waitForElement(documentSafePage.buttons.continueOnboarding, 10);

});

Then("I will see pop up rating survey account opening", () => {
    I.waitForText("Berikan penilaian terhadap aplikasi Amar Bank Bisnis", 10);
    I.see("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.waitForElement(surveyRatingPage.buttons.oneStar, 10);
    I.waitForElement(surveyRatingPage.buttons.twoStar, 10);
    I.waitForElement(surveyRatingPage.buttons.threeStar, 10);
    I.waitForElement(surveyRatingPage.buttons.fourStar, 10);
    I.waitForElement(surveyRatingPage.buttons.fiveStar, 10);

    I.dontSee("Mengapa Memberi Penilaian Tersebut?");
    I.dontSee("Tulis disini...");
    I.dontSeeElement(surveyRatingPage.fields.feedback);
    I.dontSeeElement(surveyRatingPage.texts.counter);

    I.dontSee("Kirim Penilaian");
    I.dontSeeElement(surveyRatingPage.buttons.send);
});

Then("I will not see pop up rating survey account opening", () => {

    I.wait(2);

    I.dontSee("Berikan penilaian terhadap aplikasi Amar Bank Bisnis");
    I.dontSee("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.dontSeeElement(surveyRatingPage.buttons.oneStar);
});

Then("I will see field text feedback survey", () => {

    I.waitForText("Mengapa Memberi Penilaian Tersebut?", 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 500, y: 500 });

    I.waitForText("Tulis disini...", 10);
    I.waitForElement(surveyRatingPage.fields.feedback, 10);
    I.waitForElement(surveyRatingPage.texts.counter, 10);

    I.see("Kirim Penilaian");
    I.waitForElement(surveyRatingPage.buttons.send, 10);
});

Then("I will not see field text feedback survey", () => {

    I.wait(2);

    I.dontSee("Mengapa Memberi Penilaian Tersebut?");
    I.dontSee("Tulis disini...");
    I.dontSeeElement(surveyRatingPage.fields.feedback);
    I.dontSeeElement(surveyRatingPage.texts.counter);
});

Then("I will see snackbar my survey is sent", () => {
    I.waitForText("Terima kasih. Penilaian Anda sudah terkirim.", 10);
});

Then("I will see rating survey is in main dashboard", () => {

    I.waitForElement(onboardingAccOpeningPage.tabs.home, 10);
    I.waitForText("Berikan penilaian terhadap aplikasi Amar Bank Bisnis", 20);
    I.see("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.waitForElement(surveyRatingPage.buttons.oneStar, 10);
    I.waitForElement(surveyRatingPage.buttons.twoStar, 10);
    I.waitForElement(surveyRatingPage.buttons.threeStar, 10);
    I.waitForElement(surveyRatingPage.buttons.fourStar, 10);
    I.waitForElement(surveyRatingPage.buttons.fiveStar, 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.dontSee("Mengapa Memberi Penilaian Tersebut?");
    I.dontSee("Tulis disini...");
    I.dontSeeElement(surveyRatingPage.fields.feedback);
    I.dontSeeElement(surveyRatingPage.texts.counter);

    I.dontSee("Kirim Penilaian");
    I.dontSeeElement(surveyRatingPage.buttons.send);
});

Then("I will not see rating survey is in main dashboard", () => {

    I.waitForElement(onboardingAccOpeningPage.tabs.home, 10);

    I.dontSee("Berikan penilaian terhadap aplikasi Amar Bank Bisnis");
    I.dontSee("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.dontSeeElement(surveyRatingPage.buttons.oneStar);
});

Then("I will see field is filled with character only 259 char", async () => {

    const actualText = await surveyRatingPage.getValueFieldFeedback();

    I.assertEqual(actualText.length, 259);
});

Then("I will see field feedback is filled", () => {

    I.waitForText(globalVariable.survey.feedBack, 10);

});

Then("I see red dot notification center", () => {
    I.waitForElement(notificationCenterPage.indicators.notifRedDot, 20);
});

Then("I don't see red dot notification center", () => {
    I.waitForElement(notificationCenterPage.buttons.notifCenter, 20);
    I.dontSeeElement(notificationCenterPage.indicators.notifRedDot);
});

Then("I will direct to page notification center", () => {
    I.waitForText("Notifikasi", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);

    I.see("Semua");
    I.waitForElement(notificationCenterPage.tabs.all, 10);

    I.see("Info");
    I.waitForElement(notificationCenterPage.tabs.info, 10);

    I.see("Transaksi");
    I.waitForElement(notificationCenterPage.tabs.transaction, 10);

    I.see("Pinjaman");
    I.waitForElement(notificationCenterPage.tabs.loan, 10);
});

Then("I will see notification is empty", () => {
    I.wait(1);
    I.waitForText("Belum Ada Notifikasi Yang Dapat Ditampilkan", 10);
});

Then("I see notification Maintenance App Temporary", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Peringatan Pemeliharaan Sistem");

    const actualDesc = await notificationCenterPage.getDescription();
    globalVariable.notificationCenter.desc = day + "/" + month + "/" + year;
    I.assertEqual(actualDesc, "Pemeliharan sistem pada " + globalVariable.notificationCenter.desc + ", jam 23.00-01.00 WIB");
});

Then("I see notification register new device successfully changes", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Perubahan Perangkat");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Perangkat baru telah terdaftar untuk akun Anda.");

});

Then("I see notification attempt of register new device", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "1", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateBucketlist(1);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(1);

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Perubahan Perangkat");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Ada percobaan perubahan perangkat pada akun Anda.");

});

Then("I see notification PIN successfully changes", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "PIN Berhasil Diubah");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Pastikan untuk mengingat PIN baru Anda dan jaga kerahasiaannya.");

});

Then("I see notification password successfully changes", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Password Berhasil Diubah");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Gunakan password baru Anda untuk masuk ke akun Anda.");

});

Then("I see notification transfer in successfully", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Masuk");

    const actualDesc = await notificationCenterPage.getDescription();
    globalVariable.notificationCenter.descTrx = "Dari Bank Amar Indonesia - " + globalVariable.transfer.senderName;
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getTransferAmount();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I see notification transfer out successfully", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Berhasil");

    const actualDesc = await notificationCenterPage.getDescription();
    globalVariable.notificationCenter.descTrx = "Ke Bank " + globalVariable.friendList.bankName + " - " + globalVariable.friendList.friendListName
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getTransferAmount();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I see notification waiting approval transaction", async () => {

    const currentDate = new Date();
    const day = currentDate.getDate();
    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    globalVariable.notificationCenter.date = day + " " + months[month] + " " + year;
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Menunggu Persetujuan Direksi");

    const actualDesc = await notificationCenterPage.getDescription();
    globalVariable.notificationCenter.descTrx = "Ke Bank " + globalVariable.friendList.bankName + " - " + globalVariable.friendList.friendListName
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getTransferAmount();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I see notification transaction is approved from other director", async () => {

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Disetujui");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getTransferAmount();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I see notification transaction is rejected from other director", async () => {

    I.waitForElement(notificationCenterPage.indicators.notifRedDotBucketlist + "0", 10);

    const actualStatus = await notificationCenterPage.getInfoNotif();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateBucketlist(0);
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeBucketlist(0);

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Ditolak");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    const actualAmount = await notificationCenterPage.getTransferAmount();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);
});

Then("I will direct to detail notification PIN successfully changes", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "PIN Berhasil Diubah");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "PIN Anda telah berhasil diperbarui. Pastikan untuk mengingat PIN baru Anda dan jaga kerahasiaannya.");

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail password successfully changes", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Password Berhasil Diubah");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Password Anda telah berhasil diperbarui. Gunakan password baru Anda untuk masuk ke akun Anda.");

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail transfer in successfully", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Masuk");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    I.waitForText("Anda telah menerima transfer sebesar " + globalVariable.transfer.amountTransfer + " ke akun Anda. Periksa riwayat transaksi untuk detail lebih lanjut.", 10);

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail transfer out successfully", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Berhasil");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    I.waitForText("Transaksi Anda sebesar " + globalVariable.transfer.amountTransfer + " sudah berhasil ditransfer. Periksa riwayat transaksi untuk detail lebih lanjut.", 10);

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail register new device successfully changes", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Perubahan Perangkat");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Perangkat baru telah terdaftar untuk akun Anda. Jika Anda merasa bahwa perubahan ini tidak dilakukan oleh Anda, segera hubungi tim kami.");

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail attempt register new device", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Perubahan Perangkat");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Ada percobaan perubahan perangkat pada akun Anda. Jika Anda merasa bahwa perubahan ini tidak dilakukan oleh Anda, segera hubungi tim kami.");

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail Maintenance App Temporary", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Info");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualTitle = await notificationCenterPage.getTitle();
    I.assertEqual(actualTitle, "Peringatan Pemeliharaan Sistem");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, "Untuk meningkatkan layanan kami, kami akan melakukan pemeliharan sistem pada " + globalVariable.notificationCenter.desc + ", jam 23.00-01.00 WIB. Selama waktu ini, akses Anda pada aplikasi Amar Bank Bisnis mungkin terganggu. Mohon maaf atas ketidaknyamanannya. Terima kasih.");

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail notification waiting approval transaction", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Berhasil");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    I.waitForText("Transaksi Bisnis Anda sebesar " + globalVariable.transfer.amountTransfer + " sedang menunggu persetujuan dari semua direksi. Periksa menu Persetujuan Transaksi untuk melihat detail.", 10);

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail notification transaction is approved from other director", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Disetujui");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    I.waitForText("Transaksi Anda sebesar " + globalVariable.transfer.amountTransfer + " telah disetujui dan sudah berhasil transfer. Periksa riwayat transaksi untuk detail lebih lanjut.", 10);

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will direct to detail notification transaction is rejected from other director", async () => {

    I.waitForText("Detail Notifikasi", 10);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualStatus = await notificationCenterPage.getInfoNotifDetail();
    I.assertEqual(actualStatus, "Transaksi");

    const actualDate = await notificationCenterPage.getDateDetail();
    I.assertEqual(actualDate, globalVariable.notificationCenter.date);

    const actualTime = await notificationCenterPage.getTimeDetail();

    const actualStatusTrx = await notificationCenterPage.getStatusTrx();
    I.assertEqual(actualStatusTrx, "Transaksi Ditolak");

    const actualDesc = await notificationCenterPage.getDescription();
    I.assertEqual(actualDesc, globalVariable.notificationCenter.descTrx);

    I.waitForText("Transaksi Anda sebesar " + globalVariable.transfer.amountTransfer + " telah ditolak dan tidak dapat diproses. Periksa kembali detail dan saldo akun Anda, atau hubungi tim kami jika butuh bantuan.", 10);

    I.see("Mengerti");
    I.waitForElement(notificationCenterPage.buttons.understand, 10);
});

Then("I will see notification is sorted by the latest to oldest", async () => {

    I.waitForElement(notificationCenterPage.texts.date + "0", 10);

    const listDate = await I.grabTextFromAll('//android.widget.TextView[@content-desc[starts-with(., ' + notificationCenterPage.texts.date.slice(1) + ')]]');

    const newListDate = [];

    for (let i = 0; listDate.length; i++) {
        const date = listDate[i].substring(0, 1);
        newListDate.push(date);
    };

    for (let j = 0; j < newListDate.length - 1; j++) {

        if (newListDate[j] < newListDate[j + 1]) {

            throw new Error("Date is not listing from latest to oldest");
        }
    }
});

Then("I will see notification categorize by Info", async () => {

    I.wait(1);

    const numberInfo = await I.grabNumberOfVisibleElements('//android.widget.TextView[@content-desc[starts-with(., ' + notificationCenterPage.texts.date.slice(1) + ')]]');

    for (let i = 0; i < numberInfo; i++) {
        let index = i + 1;
        const text = await I.grabTextFrom('android.view.View/android.view.View[2]/android.view.View[' + index + ']');

        I.assertEqual(text, "Info");
    };
});

Then("I will see notification categorize by Transaction", async () => {

    I.wait(1);

    const numberTrx = await I.grabNumberOfVisibleElements('//android.widget.TextView[@content-desc[starts-with(., ' + notificationCenterPage.texts.date.slice(1) + ')]]');

    for (let i = 0; i < numberTrx; i++) {
        let index = i + 1;
        const text = await I.grabTextFrom('android.view.View/android.view.View[2]/android.view.View[' + index + ']');

        I.assertEqual(text, "Transaksi");
    };
});

Then("I will see all categorize notification", async () => {

    I.wait(1);

    const numberTrx = await I.grabNumberOfVisibleElements('//android.widget.TextView[@content-desc[starts-with(., ' + notificationCenterPage.texts.date.slice(1) + ')]]');

    for (let i = 0; i < numberTrx; i++) {
        let index = i + 1;
        const text = await I.grabTextFrom('android.view.View/android.view.View[2]/android.view.View[' + index + ']');

        if (
            text !== "Info" ||
            text !== "Transaksi"
        ) {
            throw new Error(text + " is not recognize in bucketlist. Should be Info or Transaction");
        }
    };
});