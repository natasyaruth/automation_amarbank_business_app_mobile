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

When("I fill field {string} with {string} in form Business Profile", (fieldName, valueField) => {
    if (fieldName === "npwp") {
        I.swipeUp(formBusinessProfilePage.fields[fieldName], 500, 1000);
    }
    formBusinessProfilePage.fillField(fieldName, valueField);
});

When("I fill form Business Profile except field {string}", (fieldName) => {
    const account = {
        businessName: "PT. ABCD",
        industry: "Jasa",
        businessField: "Restoran",
        monthlyIncome: "30 - 50 juta",
        npwp: "906283213036000",
        nib: "9129106701234",
        businessDateStart: "10/10/2010",
    };

    delete account[fieldName];

    formBusinessProfilePage.fillBusinessProfile(account);
});

When("I clear the field {string} in form Business Profile", (fieldName) => {
    formBusinessProfilePage.clearField(fieldName);
});

When("I swipe to field {string} in form Business Profile", (fieldName) => {
    if (
        fieldName === "businessName"
    ) {
        I.performSwipe({ y: 500 }, { y: -10 });
    }
});

Then("I shouldn't see message error in the below of field {string} in form Business Profile", async (fieldName) => {
    let infoBusinessName = "Nama bisnis sesuai dengan dokumen legalitas";

    if (fieldName === "businessName") {

        let messageField = await formBusinessProfilePage.getMessageError(fieldName);
        I.assertEqual(messageField, infoBusinessName);

    } else {

        I.waitForInvisible(formBusinessProfilePage.messageErrorFields[fieldName]);
    }

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form Business Profile", async (fieldName, expectedMsgError) => {
    I.wait(1);
    let actualMsgError = await formBusinessProfile.getMessageError(fieldName);
    I.assertEqual(actualMsgError, expectedMsgError);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
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