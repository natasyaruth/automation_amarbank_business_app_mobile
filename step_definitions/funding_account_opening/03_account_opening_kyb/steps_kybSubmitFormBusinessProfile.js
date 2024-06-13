const {
    I,
    formEmploymentDataPage,
    formBusinessProfilePage,
    formBusinessOwnerPage,
    headerPage,
    resetStateDao,
    globalVariable,
    mockingDao
} = inject();

Given("I am a customer who has completed my KYC process", () => {
});

Given("I mock feature submit form Business Profile into enabled", async () => {
    await
        mockingDao.enabledCheckDHNNPWP();
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
    if (fieldName === "npwp" ||
        fieldName === "nib") {
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
        fieldName === "businessName" ||
        fieldName === "industry"
    ) {
        I.swipeDown(formBusinessProfilePage.fields.businessField, 600, 900);
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

Then("I should see message error {string} in the below of field {string} in form Business Profile", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formBusinessProfilePage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();
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

    const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;

    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.see(email);
    I.dontSeeElement(formBusinessOwnerPage.buttons.addListDirector);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will directing to page director list", async () => {
    I.waitForText("Daftar Direktur sesuai akta", 10);
    I.see("Anda wajib menambah direktur sesuai akta");

    const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;

    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.see(email);
    I.seeElement(formBusinessOwnerPage.buttons.addListDirector);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will direct to page notifying me that I can't continue to next process KYB because my data indicated as DHN", async () => {
    const actualTitle = await formBusinessProfilePage.getTitleValidationBlocker();
    I.assertEqual(actualTitle, "Amar Bank belum bisa melayani Anda.");

    const actualContent = await formBusinessProfilePage.getContentValidationBlocker();
    I.assertEqual(actualContent.trim(), "Anda / Bisnis Anda terdaftar dalam DHN (Daftar Hitam Nasional) sehingga tidak dapat melanjutkan proses saat ini. Silahkan mencoba lagi dalam 7 hari.");

    I.see("Untuk informasi lebih lanjut, silakan");
    I.see("Hubungi Kami");
    I.waitForElement(formBusinessProfilePage.buttons.helpDHN, 10);
});