const {
    I,
    formEmploymentDataPage,
    formBusinessProfilePage,
    formBusinessOwnerPage,
    headerPage,
    resetStateDao,
    globalVariable
} = inject();

Given("I am a customer who has completed my KYC process", () => {
});

When("I continue to process KYB", () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.waitForElement(formEmploymentDataPage.buttons.continue, 10);
    formEmploymentDataPage.continueToKYB();
});

When("I fill my business profile as followings:", (table) => {
    I.waitForElement(formBusinessProfilePage.fields.businessName, 10);

    const businessProfile = table.parse().rowsHash();
    formBusinessProfilePage.fillBusinessProfile(businessProfile);
});

When("I submit my business profile", () => {
    formBusinessProfilePage.saveBusinessProfile();
});

Then("I will notify my business profile has successfully submitted", () => {
    I.waitForText("Profil bisnis berhasil disimpan", 10)
});

Then("I will directing to page business owner", async () => {
    I.waitForText("Pemilik bisnis", 10);
    I.dontSee("Anda wajib menambah direktur sesuai akta");

    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.see(globalVariable.registration.email);
    I.dontSeeElement(formBusinessOwnerPage.buttons.addListDirector);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will directing to page director list", async () => {
    I.waitForText("Daftar Direktur sesuai akta", 10);
    I.see("Anda wajib menambah direktur sesuai akta");

    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.see(globalVariable.registration.email);
    I.seeElement(formBusinessOwnerPage.buttons.addListDirector);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});