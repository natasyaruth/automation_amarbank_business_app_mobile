const {
    I,
    formPersonalDataPage,
    formDomicileAddressPage,
    uploadDao,
    resetStateDao,
    globalVariable } = inject();

Given("I am a customer who has uploaded my selfie photo", () => {
});

Given("I am a customer want to fill my personal details", async () => { });

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

When("I fill form Data Personal except field {string}", async (fieldName) => {
    const account = {
        lastEducation: "SMA",
        motherName: "NADYA LAMUSU",
        referenceName: "IBU SAYA",
        referencePhoneNumber: "812343455677",
        purposeAccount: "Pinjaman",
    };

    delete account[fieldName];
    await formPersonalDataPage.fillPersonalData(account);
});

When("I clear the field {string} in form Data Personal", (fieldName) => {
    formPersonalDataPage.clearField(fieldName);
});

When("I submit my personal data details", () => {
    formPersonalDataPage.savePersonalData();
    if(
        globalVariable.formPersonal.isUploadNpwp === false
    ){
        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    }
});

When("I submit my personal data details individual and upload my npwp as followings:", async (table) => {
    const personalData = table.parse().rowsHash();

    await uploadDao.submitDataPersonalIndividual(
        personalData["lastEducation"],
        personalData["motherName"],
        personalData["referenceName"],
        personalData["referencePhoneNumber"],
        personalData["purposeAccount"],
        globalVariable.login.userID,
        globalVariable.login.password
    );

    resetStateDao.reloadPageAfterResetState();
});

When("I submit my personal data details business and upload my npwp as followings:", async (table) => {
    const personalData = table.parse().rowsHash();

    await uploadDao.submitDataPersonalBusiness(
        personalData["lastEducation"],
        personalData["motherName"],
        personalData["referenceName"],
        personalData["referencePhoneNumber"],
        globalVariable.login.userID,
        globalVariable.login.password
    );

    resetStateDao.reloadPageAfterResetState();
});

When("I don't upload my NPWP photo", ()=>{
    globalVariable.formPersonal.isUploadNpwp = false;
});

When("I click button upload document NPWP", ()=>{
    I.waitForElement(formPersonalDataPage.dropDowns.lastEducation, 10);
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    formPersonalDataPage.clickUploadNPWP();
});

When("I click close bottom sheet upload NPWP", ()=>{
    formPersonalDataPage.closeBottomSheet();
});

Then("I will notify my personal details has successfully submitted", () => {
    I.waitForText("Data diri berhasil disimpan", 10);
});

Then("I will direct to page domicile address", async () => {
    I.waitForText("Alamat Tempat Tinggal Sekarang", 10);

    I.see("Alamat Sesuai eKTP");
    I.waitForElement(formDomicileAddressPage.radioButtons.ktpAddress, 10);

    I.see("Alamat Baru");
    I.waitForElement(formDomicileAddressPage.radioButtons.newAddress, 10);

    I.dontSeeElement(formDomicileAddressPage.dropDown.typeResidence);
});

Then("I shouldn't see message error in the below of field {string} in form Data Personal", async (fieldName) => {
    I.dontSee(formPersonalDataPage.messageErrorFields[fieldName]);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form Data Personal", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let actualMsgError = await formPersonalDataPage.getMessageError(fieldName);
    I.assertEqual(actualMsgError, expectedMsgError);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will see phonenumber {string} in field reference number", (phonenumber) => {
    I.waitForText(phonenumber, 5);
});

Then("I will see bottom sheet with option take NPWP using camera or upload from gallery", async ()=>{
    I.waitForText("Upload NPWP Individu", 10);
    I.waitForElement(formPersonalDataPage.buttons.closeBottomSheet, 10)

    I.see("Ambil dari Kamera");
    I.see("Ambil dari Galeri");
    I.seeElement(formPersonalDataPage.buttons.fromCamera);
    I.seeElement(formPersonalDataPage.buttons.fromGallery);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will not see the bottom sheet", async ()=>{
    I.wait(2);
    I.dontSee(formPersonalDataPage.buttons.closeBottomSheet);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});