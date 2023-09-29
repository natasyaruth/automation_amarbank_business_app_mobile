const { button } = require("../pages/changePhoneNumber");

const {
    I,
    formKtpPage,
    resetStateDao,
    formPersonalDataPage,
    uploadSelfiePage,
    globalVariable } = inject();

Given("I am a customer who has submitted my information identity details", () => { });

Given("my information about my account opening is {string}", async (expectedInfo)=>{
    I.waitForText("Ambil Foto Diri Anda", 10);
    let actualInfo = await uploadSelfiePage.getInformationAccount();
    I.assertEqual(actualInfo, expectedInfo);
});

When("I upload my selfie photo", async () => {
    I.waitForElement(uploadSelfiePage.buttons.takePhoto, 10)
    await 
    resetStateDao.resetStateFlow(5, globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

Then("I will directing to page submit Data Personal", () => {
    I.waitForElement(formPersonalDataPage.buttons.savePersonalData, 10);
    I.seeElement(formPersonalDataPage.dropdowns.lastEducation);
    I.seeElement(formPersonalDataPage.fields.motherName);
    I.seeElement(formPersonalDataPage.fields.npwp);
    I.dontSeeElement(formPersonalDataPage.dropdowns.purposeAccount);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});