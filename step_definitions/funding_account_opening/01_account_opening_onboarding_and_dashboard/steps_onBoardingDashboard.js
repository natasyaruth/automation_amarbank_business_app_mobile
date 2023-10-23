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
    I.click("Go To KYC");
    // onboardingAccOpeningPage.swipeToCardGiroAccount();
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
    await resetStateDao.resetStateFlow(0,globalVariable.login.userID, globalVariable.login.password);
    I.assertEqual(actualInfo, expectedInfo);
    
});

Then("I will directing to Hook 1 Onboarding Account Opening", async () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
});

Then("I will directing to main dashboard with card loan application and account opening", async ()=>{
    I.waitForElement(onboardingAccOpeningPage.buttons.openLoan, 10);
    I.see("Pilihan Produk");
    I.see("Dapatkan limit hingga");
    I.see("Rp 5 Milyar");
    I.see("Pinjaman untuk Bisnis dari Amar Bank");
    I.see("Dapatkan pinjaman untuk pembiayaan transaksi bisnis Anda.");

    const actualUserId = await onboardingAccOpeningPage.getUserId();
    I.assertEqual(actualUserId, globalVariable.login.userID);

    I.see("Perbankan Bisnis Premium");
    I.see("Dapatkan benefit seperti Gratis Biaya Admin, Transaksi Real-Time, dan keuntungan lainnya");
    I.seeElement(onboardingAccOpeningPage.buttons.openAccount); 
});

When ("I see page {string}", (pageName) =>{
    onboardingAccOpeningPage.validatePage(pageName);
});

Then("I will see card continue to data personal", () =>{
    I.waitForText("Lengkapi Data Personal", 10);
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
});

Then("I will see card continue to data personal", () =>{
    I.waitForText("Lengkapi Data Personal", 10);
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
});

Then("I will see card continue to data business", () =>{
    I.waitForText("Lengkapi Data Bisnis", 10);
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
});

Then ("I can continue to page {string}", (pageName) =>{
    onboardingAccOpeningPage.continueCompleteData();
    onboardingAccOpeningPage.validatePage(pageName);
});