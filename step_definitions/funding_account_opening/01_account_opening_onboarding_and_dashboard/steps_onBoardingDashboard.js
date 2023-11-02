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

Given("I see information and benefit of Giro Account", () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
    I.see("Dapatkan Rekening Giro");
    I.see("Layanan perbankan bisnis premium untuk memantau usaha Anda.");

    I.see("Benefit");
    I.see("Gratis Biaya Admin");
    I.see("Transaksi Real-Time");
    I.see("Semua Proses dari Hp Anda");
    I.see("Multiple User");
    I.see("Debit Card");
});

When("I swipe to card Giro Account", () => {
    onboardingAccOpeningPage.swipeToCardGiroAccount();
});

When("I back to dashboard",()=>{
    headerPage.clickButtonBack();
});

When("I choose legality business type {string}", (businessType) => {
    onboardingAccOpeningPage.chooseLegalityBusinessType(businessType);
});

When("I submit my legality type", () => {
    onboardingAccOpeningPage.continueToKYC();
    I.wait(3);
});

When("I choose Giro Account", () => {
    onboardingAccOpeningPage.openGiroAccount();
});

When("I click later", () => {
    onboardingAccOpeningPage.chooseLater();
});

Then("I will directing to page legality business", () => {
    I.waitForText("Pilih salah satu tipe bisnis Anda", 10);
    I.wait(2);
});

Then("I will directing to page capture eKTP with information {string}", async (expectedInfo) => {
    let actualInfo = await uploadKtpPage.getTextInformationType();
    await resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
    I.assertEqual(actualInfo, expectedInfo);

});

Then("I will directing to Hook 1 Onboarding Account Opening", async () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
});

Then("I will directing to main dashboard with card loan application and account opening", async () => {
    I.waitForElement(onboardingAccOpeningPage.buttons.openLoan, 10);
    I.see("Pilihan Produk");
    I.see("Dapatkan Limit hingga");
    I.see("Rp 5 Milyar");
    I.see("Pinjaman untuk Bisnis dari Amar Bank");
    I.see("Dapatkan pinjaman untuk pembiayaan transaksi bisnis Anda.");

    I.see("Perbankan Bisnis Premium");
    I.see("Dapatkan benefit seperti Gratis Biaya Admin, Transaksi Real-Time, dan keuntungan lainnya");
    I.seeElement(onboardingAccOpeningPage.buttons.openAccount);
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

Then("I will notify that my personal data details needs to be verified in main dashboard", ()=>{
    I.waitForText("Perbankan Giro", 10);
    I.see("Menunggu verifikasi data selesai");
    I.see("Proses pembuatan rekening giro maksimal dalam waktu 3x24 jam");
});

Then("I will see card continue to complete registration user invited", ()=>{
    onboardingAccOpeningPage.continueToKYC();
});