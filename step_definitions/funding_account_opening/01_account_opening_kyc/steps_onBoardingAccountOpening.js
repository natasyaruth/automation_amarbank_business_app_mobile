const {
    I,
    onboardingAccOpeningPage,
    uploadKtpPage,
    resetStateDao,
    globalVariable } = inject();

Given("I am a customer want to open Giro Account", () => {
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
    I.click("Onboarding page");
    onboardingAccOpeningPage.swipeToCardGiroAccount();
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

Then("I will directing to page legality business", () => {
    I.waitForText("Pilih salah satu tipe bisnis Anda", 10);
    I.wait(2);
});

Then("I will directing to page capture eKTP with information {string}", async (expectedInfo) => {
    let actualInfo = await uploadKtpPage.getTextInformationType();
    await resetStateDao.resetStateFlow(0,globalVariable.login.userID, globalVariable.login.password);
    I.assertEqual(actualInfo, expectedInfo);
    
});

Then("I will directing to Hook 1 Onboarding Account Opening", () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
});
