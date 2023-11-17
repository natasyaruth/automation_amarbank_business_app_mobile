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

When("I fill field {string} with {string} in form Data Personal", (fieldName, valueField) => {
    formPersonalDataPage.fillField(fieldName, valueField);
});

When("I fill form Data Personal except field {string}", (fieldName) => {
    const account = {
        lastEducation: "SMA",
        motherName: "NADYA LAMUSU",
        purposeAccount: "Pinjaman",
    };

    delete account[fieldName];
    formPersonalDataPage.fillPersonalData(account);
});

When("I clear the field {string} in form Data Personal", (fieldName) => {
    formPersonalDataPage.clearField(fieldName);
});

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

Then("I shouldn't see message error in the below of field {string} in form Data Personal", async (fieldName) => {
    I.dontSee(formPersonalDataPage.messageErrorFields[fieldName]);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form Data Personal", async (fieldName, expectedMsgError) => {
    I.wait(1);
    let actualMsgError = await formPersonalDataPage.getMessageError(fieldName);
    I.assertEqual(actualMsgError, expectedMsgError);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});
