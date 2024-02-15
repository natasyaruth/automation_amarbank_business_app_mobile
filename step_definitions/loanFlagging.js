const loanFlagging = require("../pages/loanFlagging");

const{
    I,
    globalVariable,
    friendListPage,
    headerPage,
    onboardingAccOpeningPage,
    loanFlaggingPage,
} = inject();

Given ("I am a customer who wants to open DSMB", () => {    });

Given(" I am on Onboarding Page", () => {});

Then("I can see update wording on Onboarding card lending", () => {
    I.waitforText("Apa kebutuhan Anda saat ini?", 10);
    I.see("Dapatkan Limit Tinggi");
    I.see("Solusi Finansial Bisnis Anda");
});

When("I see Benefit of Apply Loan", () => {
   I.see("Benefit");
   I.see("Bunga Kompetiti");
   I.see("Proses Cepat dan Mudah");
   I.see("Digital Banking untuk Biaya");   
});

When("I click Ajukan Pinjaman", () =>{
    loanFlagging.ClickAjukanLoan();
});

When("I Input Nominal Pinjaman {string}", (nominal1) => {
    loanFlagging.fillNominalPinjaman(nominal1);
});

When("I click button Selanjutnya", () => {
    loanFlagging.ClickNext();
});

Then("I see messege error for minimun input {string}", async(expectMessage) => {
    loanFlagging.getMessageErrorLoan(expectMessage);
});

When("I Input Tenor <30 hari {string}", (tenor) => {
    loanFlagging.getMessageErrorTenor();
});

Then("I see message error for tenor {string}", async(expectedTenor) => {
    loanFlagging.getMessageErrorTenor(expectedTenor);
});

When("I Input Nominal Pinjaman {string}", (nominal2) => {
    loanFlagging.fillNominalPinjaman(nominal2);
});

When("I Input Tenor {string}", (tenor2) => {
    loanFlagging.fillTenor(tenor2);
});

Then("I continue to Corporate Page", () => {
    I.see("Bagaimana gambaran masalah pendanaan Anda?");
}); 
