const {
    I,
    onboardingAccOpeningPage,
    uploadKtpPage,
    resetStateDao,
    headerPage,
    globalVariable } = inject();

Given("I am a customer want to open Giro Account", () => {
});

Given("I am a invited customer wants to complete my KYC data", () => {
});

Given("I am a customer want to open Giro Account later", () => {
});

Given("I am a customer want choose product type MSME", () => {
    onboardingAccOpeningPage.openGiroAccountMsme();
    headerPage.clickButtonBack();
    headerPage.clickButtonBack();
    onboardingAccOpeningPage.chooseLater();
    I.waitForElement(onboardingAccOpeningPage.buttons.openAccount, 10);
});

Given("I am a customer want choose product type BB", () => {
    onboardingAccOpeningPage.openGiroAccountCorporate();
    headerPage.clickButtonBack();
    headerPage.clickButtonBack();
    onboardingAccOpeningPage.chooseLater();
    I.waitForElement(onboardingAccOpeningPage.buttons.openAccount, 10)
});

Given("I see information and benefit of Giro Account", () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
    I.see("Dapatkan Rekening Giro");
    I.see("Layanan perbankan bisnis premium untuk memantau usaha Anda.");

    I.see("Benefit");
    I.dontSee("Gratis Biaya Admin");
    I.see("Transaksi Real-Time");
    I.see("Semua Proses dari Hp Anda");
    I.see("Multiple User");
    I.dontSee("Debit Card");
    I.see("Pilih Rekening Giro");
});

When("I swipe to card Giro Account", () => {
    onboardingAccOpeningPage.swipeToCardGiroAccount();
});

When("I back to dashboard", () => {
    headerPage.clickButtonBack();
});

When("I choose legality business type {string}", (businessType) => {
    onboardingAccOpeningPage.chooseLegalityBusinessType(businessType);
    globalVariable.onBoarding.legality = businessType;
});

When("I submit my legality type", () => {
    onboardingAccOpeningPage.continueToKYC();
    I.wait(3);
});

When("I choose Giro Account", () => {
    onboardingAccOpeningPage.openGiroAccount();
});

When("I choose Giro Account from dashboard", () => {
    onboardingAccOpeningPage.openGiroAccountFromDashboard();
});

When("I click later", () => {
    onboardingAccOpeningPage.chooseLater();
});

When("I choose Giro Account Corporate", () => {
    onboardingAccOpeningPage.openGiroAccountCorporate();
});

When("I choose Giro Account MSME", () => {
    onboardingAccOpeningPage.openGiroAccountMsme();
});

Then("I will directing to page legality business", () => {
    I.waitForText("Pilih salah satu tipe bisnis Anda", 10);
    I.wait(2);
});

Then("I can choose type account giro", () => {
    onboardingAccOpeningPage.openGiroAccountFromDashboard();
});

Then("I will directing to page capture eKTP with information {string}", async (expectedInfo) => {
    let actualInfo = await uploadKtpPage.getTextInformationType();
    await resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
    I.assertEqual(actualInfo, expectedInfo);

});

Then("I will directing to Hook 1 Onboarding Account Opening", async () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
});

Then("I will directing to page type giro account", async () => {
    I.waitForText("Pilih Rekening Giro", 10);
});

Then("I will directing to main dashboard with card loan application and account opening", async () => {
    I.waitForElement(onboardingAccOpeningPage.buttons.openLoan, 10);
    I.see("Pilihan Produk");
    I.see("Rp 5 Milyar");
    I.see("Pinjaman untuk Bisnis dari Amar Bank");
    I.see("Dapatkan pinjaman untuk pembiayaan transaksi bisnis Anda.");

    I.see("Perbankan Bisnis Premium");
    I.seeElement(onboardingAccOpeningPage.buttons.openAccount);
    I.see("Pilih Rekening Giro");
});

When("I see page {string}", (pageName) => {
    onboardingAccOpeningPage.validatePage(pageName);
});

Then("I will see card continue to data personal", () => {
    I.waitForText("Lengkapi Data Personal", 10);
    I.see("Lanjutkan Pembuatan Rekening Giro");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
    onboardingAccOpeningPage.continueCompleteData();
});

Then("I will see card continue to data business", () => {
    I.waitForText("Lengkapi Data Bisnis", 10);
    I.see("Lanjutkan Pembuatan Rekening Giro");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
    onboardingAccOpeningPage.continueCompleteData();
});

Then("I can continue to page {string}", async (pageName) => {
    onboardingAccOpeningPage.validatePage(pageName);

    if (pageName !== "Registration Director") {
        await
            resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
    }
});

When("I close page upload document", () => {
    onboardingAccOpeningPage.closePageUploadDoc();
});

When("I continue to register my KYC data", () => {
    onboardingAccOpeningPage.continueToKYC();
    I.waitForElement(uploadKtpPage.buttons.takePhoto, 10);
});

Then("I will see card continue to complete upload document business", () => {
    I.waitForText("Lihat Semua Dokumen", 10);
    I.see("Mohon lengkapi Dokumen yang dibutuhkan");
    I.seeElement(onboardingAccOpeningPage.buttons.completeDoc);
    onboardingAccOpeningPage.continueCompleteDoc();
});

Then("I will see card continue to complete upload document business and registration director list", () => {
    I.waitForText("Lihat Semua Dokumen", 10);
    I.see("Mohon lengkapi Dokumen yang dibutuhkan");
    I.see("Lihat Daftar Direksi");
    I.see("Menunggu proses registrasi Daftar Direksi lainnya");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.seeElement(onboardingAccOpeningPage.buttons.completeDoc);
    I.seeElement(onboardingAccOpeningPage.buttons.invitedDirectors);
    onboardingAccOpeningPage.continueCompleteRegistrationDirectors();
});

Then("I can see details registration director", async () => {
    I.see("Proses pengajuan pinjaman atau pembentukan rekening akan dilanjutkan setelah seluruh direktur teregistrasi.");
    I.seeElement(onboardingAccOpeningPage.buttons.refresh);
    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);

    onboardingAccOpeningPage.openDetailRegistrationDirector();

    const actualStatus = await onboardingAccOpeningPage.getStatus();
    const actualProgress = await onboardingAccOpeningPage.getProgress();
    const actualTextKtp = await onboardingAccOpeningPage.getTextDetail("ktp");
    const actualTextVerif = await onboardingAccOpeningPage.getTextDetail("verification");
    const actualTextSelfie = await onboardingAccOpeningPage.getTextDetail("selfie");

    I.see("Belum melakukan proses sebagai berikut:");
    I.assertEqual(actualStatus, "Belum registrasi");
    I.assertEqual(actualProgress, "0/3");
    I.assertEqual(actualTextKtp, "Foto eKTP");
    I.assertEqual(actualTextVerif, "Verifikasi Data eKTP");
    I.assertEqual(actualTextSelfie, "Selfie");

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will notify that my personal data details needs to be verified in main dashboard", () => {
    I.waitForText("Perbankan Giro", 10);
    I.see("Menunggu verifikasi data selesai");
    I.see("Proses pembuatan rekening giro maksimal dalam waktu 3x24 jam");
});

Then("I will see card continue to complete registration user invited", () => {
    onboardingAccOpeningPage.continueToKYC();
});

When("I update my last journey step to {string}", async (stepName) => {
    await onboardingAccOpeningPage.updateStep(stepName, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will see details info of giro account MSME", async () => {
    I.waitForText("Silahkan pilih salah 1 rekening giro yang sesuai dengan kebutuhan bisnis Anda", 10);
    I.see("Pilih Rekening Giro");

    // CHECKING ADMIN FEE
    I.see("Biaya Admin");

    const actualAdminFee = await onboardingAccOpeningPage.getAdminFeeMsme();
    I.assertEqual(actualAdminFee, "FREE");

    // CHECKING MIN BALANCE
    I.see("Saldo Minimum");

    const actualMinBalance = await onboardingAccOpeningPage.getMinBalanceMsme();
    I.assertEqual(actualMinBalance, "FREE");

    // CHECKING MIN BALANCE FEE
    I.see("Biaya Saldo "+"\n"+"Minimum");

    const actualMinBalanceFee = await onboardingAccOpeningPage.getMinCostMsme();
    I.assertEqual(actualMinBalanceFee, "FREE");

    // CHECKING DORMANT FEE
    I.see("Biaya Dorman");

    const actualDormantFee = await onboardingAccOpeningPage.getDormantFeeMsme();
    I.assertEqual(actualDormantFee, "FREE");

    // CHECKING CHECK BOOK FEE
    I.see("Biaya Cetak Cek /"+"\n"+"Bilyet Giro");

    const actualCheckBookFee = await onboardingAccOpeningPage.getCheckBookFeeMsme();
    I.assertEqual(actualCheckBookFee, "Rp290rb");

    // CHECKING LOAN LIMIT
    I.see("Dapatkan Limit "+"\n"+"Pinjaman");

    const actualLoanLimit = await onboardingAccOpeningPage.getLoanLimitMsme();
    I.assertEqual(actualLoanLimit, "Sampai "+"\n"+"Rp 5 Milyar");

    I.see("Buka Giro");
    I.seeElement(onboardingAccOpeningPage.buttons.giroAccountMsme);
    I.see("*Biaya dapat berubah sewaktu-waktu sesuai ketentuan Bank")

});

Then("I will see details info of giro account Corporate", async () => {

    // CHECKING ADMIN FEE
    I.see("Biaya Admin");

    const actualAdminFee = await onboardingAccOpeningPage.getAdminFeeCorporate();
    I.assertEqual(actualAdminFee, "FREE");

    // CHECKING MIN BALANCE
    I.see("Saldo Minimum");

    const actualMinBalance = await onboardingAccOpeningPage.getMinBalanceCorporate();
    I.assertEqual(actualMinBalance, "Rp500rb - Rp1jt");

    // CHECKING MIN BALANCE FEE
    I.see("Biaya Saldo "+"\n"+"Minimum");

    const actualMinBalanceFee = await onboardingAccOpeningPage.getMinCostCorporate();
    I.assertEqual(actualMinBalanceFee, "Rp1.000");

    // CHECKING DORMANT FEE
    I.see("Biaya Dorman");

    const actualDormantFee = await onboardingAccOpeningPage.getDormantFeeCorporate();
    I.assertEqual(actualDormantFee, "Rp500");

    // CHECKING CHECK BOOK FEE
    I.see("Biaya Cetak Cek /"+"\n"+"Bilyet Giro");

    const actualCheckBookFee = await onboardingAccOpeningPage.getCheckBookFeeCorporate();
    I.assertEqual(actualCheckBookFee, "Rp290rb");

    // CHECKING LOAN LIMIT
    I.see("Dapatkan Limit "+"\n"+"Pinjaman");

    const actualLoanLimit = await onboardingAccOpeningPage.getLoanLimitCorporate();
    I.assertEqual(actualLoanLimit, "Diatas "+"\n"+"Rp 5 Milyar");

    I.see("Buka Giro");
    I.seeElement(onboardingAccOpeningPage.buttons.giroAccountCorporate);
});