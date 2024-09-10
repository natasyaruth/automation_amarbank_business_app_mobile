const {
    I,
    transactionHistoryPage,
    onboardingAccOpeningPage,
    amountDetailPage,
    resetStateDao,
    globalVariable,
    documentSafePage,
    getDataDao,
    headerPage,
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
    I.wait(5);
});

Given("complete onboarding document safe and survey", async () => {
    await
        resetStateDao.updateFlagOnboardingDocumentSafeAndSurvey(globalVariable.login.userID, true);
    I.wait(5);
});

Given("notification red dot document safe is on", () => {
    I.waitForElement(onboardingAccOpeningPage.icons.redDotNotificationDoc, 20);
});

Given("notification red dot document safe is off", () => {
    I.wait(2);
    I.dontSee(onboardingAccOpeningPage.icons.redDotNotificationDoc);
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