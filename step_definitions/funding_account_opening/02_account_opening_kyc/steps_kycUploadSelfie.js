const {
    I,
    formKtpPage,
    resetStateDao,
    uploadDao,
    formPersonalDataPage,
    uploadSelfiePage,
    globalVariable } = inject();

Given("I am a customer who has submitted my information identity details", () => { });

Given("my information about my account opening is {string}", async (expectedInfo)=>{
    I.waitForText("Ambil Foto Diri Anda", 20);
    let actualInfo = await uploadSelfiePage.getInformationAccount();
    I.assertEqual(actualInfo, expectedInfo);
});

When("I click take my photo selfie", ()=>{
    uploadSelfiePage.directToTakePhoto();
});

When("I upload my selfie photo", async () => {
    await 
        uploadDao.uploadSelfie(globalVariable.login.userID, globalVariable.login.password);
});

When("I retake picture selfie", ()=>{
    uploadSelfiePage.reTakePhoto();
});

When("I upload invited user selfie photo", async () => {
    I.wait(7);
    await 
    uploadDao.uploadSelfie(globalVariable.login.userID, globalVariable.login.password);
    headerPage.clickButtonBack();
    onboardingAccOpeningPage.chooseLater()
});

Then("I will notify my photo selfie has successfully submitted", () =>{
    I.waitForText("Foto diri berhasil dikirim", 30);
});

Then("I will directing to page submit Data Personal", async () => {

    I.waitForText("Wajib Diisi", 10);
    I.waitForElement(formPersonalDataPage.buttons.savePersonalData, 10);
    I.seeElement(formPersonalDataPage.dropDowns.lastEducation);
    I.seeElement(formPersonalDataPage.fields.motherName);
    I.seeElement(formPersonalDataPage.buttons.uploadNpwp);
    I.dontSeeElement(formPersonalDataPage.dropDowns.purposeAccount);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will directing to page submit Data Personal individual", async () => {
    I.waitForElement(formPersonalDataPage.buttons.savePersonalData, 10);
    I.seeElement(formPersonalDataPage.dropDowns.lastEducation);
    I.seeElement(formPersonalDataPage.fields.motherName);
    I.seeElement(formPersonalDataPage.dropDowns.purposeAccount);
    I.seeElement(formPersonalDataPage.buttons.uploadNpwp);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});