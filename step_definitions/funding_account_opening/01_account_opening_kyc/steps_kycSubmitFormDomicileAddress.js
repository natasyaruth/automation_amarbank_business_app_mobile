const {
    I,
    formDomicileAddressPage,
    formEmploymentDataPage,
    resetStateDao,
    globalVariable } = inject();

Given ("I am a customer who has submitted my personal data details", () =>{});    

When("I fill new domicile details as followings:", 
    async (table) => { 
    const newDomicile = table.parse().rowsHash();
    formDomicileAddressPage.fillNewAddress(newDomicile);
  }
);

When("I choose my domicile address same with my identity information", () =>{
    I.waitForText("Alamat Tempat Tinggal Sekarang", 10);
    formDomicileAddressPage.chooseKtpDomicile();
});

When("I choose my new domicile address", () =>{
    I.waitForText("Alamat Tempat Tinggal Sekarang", 10);
    formDomicileAddressPage.chooseNewDomicile();
});

When("I submit my domicile address", () =>{
    formDomicileAddressPage.saveDomicileAddress();
});

Then("I will notify my domicile address has successfully submitted", () => {
    I.waitForText("Alamat tempat tinggal berhasil disimpan", 10);
});

Then("I will direct to page Data Employment", async () => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
    I.seeElement(formEmploymentDataPage.dropDowns.sourceIncome);
    I.dontSeeElement(formEmploymentDataPage.dropDowns.monthlyIncome);
    I.dontSeeElement(formEmploymentDataPage.dropDowns.industry);
    I.dontSeeElement(formEmploymentDataPage.field.companyName);
    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});