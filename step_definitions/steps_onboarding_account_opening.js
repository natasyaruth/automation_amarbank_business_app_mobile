const {
    I,
    onboardingAccOpeningPage,
    uploadKtpPage} = inject();

Given ("I am a customer want to open Giro Account", () =>{
});

Given ("I see information and benefit of Giro Account", () =>{
    // I.waitForText("Apa kebutuhan Anda saat ini?", 10);
    // I.see("Dapatkan Rekening Giro");
    // I.see("Layanan perbankan bisnis premium untuk memantau usaha Anda.");

    // I.see("Benefit");
    // I.see("Gratis Biaya Admin");
    // I.see("Transaksi Real-Time");
    // I.see("Semua Proses dari Hp Anda");
    // I.see("Multiple User");
    // I.see("Debit Card");
});

When("I choose legality business type {string}", (businessType)=>{
    onboardingAccOpeningPage.chooseLegalityBusinessType(businessType);
});

When ("I submit my legality type", () =>{
    onboardingAccOpeningPage.continueToKYC();
    I.wait(3);
});

When ("I choose Giro Account", () =>{
    // onboardingAccOpeningPage.openGiroAccount();
    I.click("Go To KYC");
});

Then ("I will directing to page legality business", () =>{
    I.waitForText("Pilih salah satu tipe bisnis Anda", 10);
    I.wait(2);
});

Then("I will directing to page capture eKTP with information {string}", async (expectedInfo)=>{
    let actualInfo = await uploadKtpPage.getTextInformationType();

    I.assertEqual(actualInfo, expectedInfo);
});

Then ("I will directing to page onboarding account opening", () =>{
    I.waitForText("Dasboard Screen", 10);
});
