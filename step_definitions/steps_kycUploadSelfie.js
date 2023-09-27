const {
    I,
    uploadKtpPage,
    onboardingAccOpeningPage,
    headerPage,
    formKtpPage,
    resetStateDao,
    globalVariable } = inject();


Given("I am a customer who has submitted my information identity details", () => { });

When("I upload my eKTP photo", async () => {
    await 
    resetStateDao.resetStateFlow(3, globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

Then("I will directing to page submit Data Personal", () => {
    I.waitForElement(formKtpPage.fields.eKtpNumber, 10);
    await 
    resetStateDao.resetStateFlow(3, globalVariable.login.userID, globalVariable.login.password);
});