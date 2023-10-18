const {
    I,
    uploadKtpPage,
    onboardingAccOpeningPage,
    headerPage,
    formKtpPage,
    resetStateDao,
    globalVariable } = inject();

Given("I am a customer who has selected the business type UD", () => { });

Given("I am a customer who has selected the business type Individual", () => { });

Given("I am a customer who has selected the business type PT Perorangan", () =>{});

Given("I am a customer who has selected the business type PT Perusahaan", () =>{});

Given("I am a customer who has selected the business type CV", () =>{});

Given("My last flow kyc step is {string}", (stateName) => {
    let lastStateNumber = onboardingAccOpeningPage.getStateNumber(stateName);
    // step to hit API reset state
});

When("I upload my eKTP photo", async () => {
    I.waitForText("Ambil Foto eKTP Anda", 10);
    await
    resetStateDao.allowDeviceData(globalVariable.login.userID, globalVariable.login.password);
    await 
    resetStateDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

Then("I will directing to page submit form KTP", async () => {
    I.waitForElement(formKtpPage.fields.eKtpNumber, 10);
    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});