const loanType = require("../../pages/loanApplication/loanType");
const loanFlagging = require("../../pages/loanFlagging/loanFlagging");

const{
    I,
    globalVariable,    
    headerPage,
    onboardingAccOpeningPage,
    loanFlaggingPage,
    loanTypePage,
} = inject();

When("I am on Main Dashboard", () => {
    I.see("Dapatkan Limit Tinggi");
    I.see("Solusi Financial Bisnis Anda");  
    loanFlaggingPage.ClickAjukanLoan();
});

When("I click Ajukan Pinjaman", () => {
    loanFlaggingPage.ClickAjukanLoan
});

When("I Input Nominal Pinjaman {string}", (nominal1) => {
    loanFlaggingPage.fillNominalPinjaman(nominal1);
   
});

When("I click button Selanjutnya", () => {
    loanFlaggingPage.ClickNext();
});

Then("I see messege error for minimun input {string}", async(expectMessage) => {
    loanFlaggingPage.getMessageErrorLoan(expectMessage);
});

When("I Input Tenor <30 hari {string}", (tenor) => {
    loanFlaggingPage.getMessageErrorTenor();
});

Then("I see message error for tenor {string}", async(expectedTenor) => {
    loanFlaggingPage.getMessageErrorTenor(expectedTenor);
});

When("I Input Nominal Pinjaman {string}", (nominal2) => {
    loanFlaggingPage.fillNominalPinjaman(nominal2);
});

When("I Input Tenor {string}", (tenor2) => {
    loanFlaggingPage.fillTenor(tenor2);
});

Then("I continue to Corporate Page to select loan type", () => {
    loanTypePage.viewLoanTypePage();
});

When("I on loan type page", () => {
    loanTypePage.viewLoanTypePage();
});

When(/user validate wording loan type \"([^\"]*)\"/,(loanType)=>{
    I.wait(2);
    loanTypePage.validateLoanTypeList(loanType);
});

When(/I select loan type \"([^\"]*)\"/,(selectLoanType)=>{
    I.wait(2);
    loanTypePage.selectLoanTypeList(selectLoanType);
});

Then(" I click on Select the schema", () => {
    loanTypePage.clickNextButton();
});




