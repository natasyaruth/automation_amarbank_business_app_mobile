const {
    I,
    onboardingAccOpeningPage} = inject();

Given ("I am a customer want to open Giro Account", () =>{
    I.click("Go To KYC");
    
});

Given ("I see information and benefit of Giro Account", () =>{
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

When ("I choose Giro Account", () =>{
    onboardingAccOpeningPage.openGiroAccount()
});

Then ("I will directing to page legality business", () =>{
    I.waitForText();
});
