const {
    I,
    formPersonalDataPage,
    formDomicileAddressPage,
    resetStateDao,
    globalVariable } = inject();

Given ("I am a customer who has uploaded my selfie photo", () =>{});    

When("I fill my personal data details as followings:", 
    async (table) => { 
    const personalData = table.parse().rowsHash();
    I.waitForElement(formPersonalDataPage.dropDowns.lastEducation, 10);
    await formPersonalDataPage.fillPersonalData(personalData);
  }
);

When("I submit my personal data details", () =>{
    formPersonalDataPage.savePersonalData();
});

Then("I will direct to page domicile address", async () => {
    I.waitForText("Alamat Tempat Tinggal Sekarang", 10);
    I.seeElement(formDomicileAddressPage.radioButtons.ktpAddress);
    I.seeElement(formDomicileAddressPage.radioButtons.newAddress);
    
    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});
