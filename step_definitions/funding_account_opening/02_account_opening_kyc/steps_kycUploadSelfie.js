const {
    I,
    formKtpPage,
    resetStateDao,
    formPersonalDataPage,
    uploadSelfiePage,
    globalVariable } = inject();

Given("I am a customer who has submitted my information identity details", () => { });

Given("my information about my account opening is {string}", async (expectedInfo)=>{
    I.waitForText("Ambil Foto Diri Anda", 20);
    let actualInfo = await uploadSelfiePage.getInformationAccount();
    I.assertEqual(actualInfo, expectedInfo);
});

When("I upload my selfie photo", async () => {
    I.wait(7);
    await 
    resetStateDao.uploadSelfie(globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

When("I skip flow upload selfie photo", async ()=>{
    I.wait(7);
    await
        resetStateDao.resetStateFlow(5, globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

When("I upload invited user selfie photo", async () => {
    I.wait(7);
    await 
    resetStateDao.uploadSelfie(globalVariable.login.userID, globalVariable.login.password);
    headerPage.clickButtonBack();
    onboardingAccOpeningPage.chooseLater()
});

Then("I will notify my photo selfie has successfully submitted", () =>{
    I.waitForText("Foto diri berhasil dikirim", 10);
});

Then("I will directing to page submit Data Personal", async () => {
    I.waitForElement(formPersonalDataPage.buttons.savePersonalData, 10);
    I.seeElement(formPersonalDataPage.dropDowns.lastEducation);
    I.seeElement(formPersonalDataPage.fields.motherName);
    I.seeElement(formPersonalDataPage.fields.npwp);
    I.dontSeeElement(formPersonalDataPage.dropDowns.purposeAccount);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will directing to page submit Data Personal individual", async () => {
    I.waitForElement(formPersonalDataPage.buttons.savePersonalData, 10);
    I.seeElement(formPersonalDataPage.dropDowns.lastEducation);
    I.seeElement(formPersonalDataPage.fields.motherName);
    I.seeElement(formPersonalDataPage.fields.npwp);
    I.seeElement(formPersonalDataPage.dropDowns.purposeAccount);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});