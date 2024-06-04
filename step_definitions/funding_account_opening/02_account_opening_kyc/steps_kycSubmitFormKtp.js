const {
    I,
    formKtpPage,
    resetStateDao,
    uploadDao,
    globalVariable,
    mockingDao } = inject();

Given("I am a customer want to fill my information identity details", async () => {
    await
        resetStateDao.resetStateFlow(3, globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

Given("I mock feature submit form KTP into enabled", async () => {
    await
        mockingDao.enabledCheckDHNKTP();
});

Given("I am a customer who has uploaded my eKTP photo", async () => {
    await
        uploadDao.allowDeviceData(globalVariable.login.userID, globalVariable.login.password);
    await
        uploadDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

When("I fill all information identity details as followings:",
    async (table) => {
        const ktpData = table.parse().rowsHash();
        I.waitForElement(formKtpPage.fields.eKtpNumber, 10);
        formKtpPage.fillInformation(ktpData);
        globalVariable.formKtp.eKTPNumber = ktpData["eKtpNumber"];
        globalVariable.formKtp.fullName = ktpData["fullName"];
    }
);

When("I submit my information identity details", () => {
    formKtpPage.saveKtpData();
});

When("I skip step upload eKTP photo", async () => {
    await
        resetStateDao.resetStateFlow(3, globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

When("I fill field {string} with {string} in form KTP", (fieldName, valueField) => {
    if (fieldName === "address" ||
        fieldName === "rt" ||
        fieldName === "rw") {
        I.swipeUp(formKtpPage.fields.address, 500, 1500);
    }
    formKtpPage.fillField(fieldName, valueField);
});

When("I fill form KTP except field {string}", (fieldName) => {
    const account = {
        eKtpNumber: "3173035601860007",
        fullName: "NADYA LAROSA",
        placeOfBirth: "MEDAN",
        dateOfBirth: "11/11/1995",
        gender: "Laki-laki",
        address: "Jl. Durian Runtuh No. 13",
        rt: "01",
        rw: "05",
        province: "DKI JAKARTA",
        city: "KOTA ADM. JAKARTA SELATAN",
        district: "KEBAYORAN BARU",
        village: "SENAYAN",
        religion: "Katolik",
        maritalStatus: "Belum Kawin",
    };

    delete account[fieldName];

    if (
        fieldName === "province"
    ) {

        delete account["city"];
        delete account["district"];
        delete account["village"];

    } else if (
        fieldName === "city"
    ) {

        delete account["district"];
        delete account["village"];

    } else if (
        fieldName === "district"
    ) {
        delete account["village"];
    }

    formKtpPage.fillInformation(account);
});

When("I clear the field {string} in form KTP", (fieldName) => {
    formKtpPage.clearField(fieldName);
});

When("I swipe to field {string} in form KTP", (fieldName) => {
    if (
        fieldName === "eKtpNumber" ||
        fieldName === "fullName" ||
        fieldName === "placeOfBirth" ||
        fieldName === "dateOfBirth" ||
        fieldName === "gender"
    ) {
        I.swipeDown(formKtpPage.dropDownsSearch.city, 1000, 1000);
        I.swipeDown(formKtpPage.datePicker.dateOfBirth, 1000, 1000);
    } else if (
        fieldName === "address" ||
        fieldName === "rt" ||
        fieldName === "rw"
    ) {
        I.swipeDown(formKtpPage.dropDownsSearch.city, 500, 1000);
    }
});

Then("I shouldn't see message error in the below of field {string} in form KTP", async (fieldName) => {
    I.dontSee(formKtpPage.messageErrorFields[fieldName]);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form KTP", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formKtpPage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();

    I.assertEqual(actualMsgError, expectedMsgError);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will notify my information identity details has successfully submitted", () => {
    I.waitForText("Data eKTP berhasil disimpan", 10);
});

Then("I will direct to page capture selfie", async () => {
    I.waitForText("Ambil Foto Diri Anda", 10);
    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will direct to page notifying me that I can't continue to next process KYC because my data indicated as DHN", async () => {
    const actualTitle = await formKtpPage.getTitleValidationBlocker();
    I.assertEqual(actualTitle, "Amar Bank belum bisa melayani Anda.");

    const actualContent = await formKtpPage.getContentValidationBlocker();
    I.assertEqual(actualContent, "Anda / Bisnis Anda terdaftar dalam DHN (Daftar Hitam Nasional) sehingga tidak dapat melanjutkan proses saat ini. Silahkan mencoba lagi dalam 7 hari.");

    I.see("Untuk informasi lebih lanjut, silakan");
    I.see("Hubungi Kami");
    I.waitForElement(formKtpPage.buttons.helpDHN, 10);
});

Then("I close page rejected account", async () => {
    formKtpPage.closePage();
});

Then("I will direct to dashboard with info my data indicated as DHN", async () => {
    I.waitForElement(onboardingAccOpeningPage.tabs.home, 10);
    I.waitForElement(onboardingAccOpeningPage.tabs.business, 10);
    I.waitForElement(onboardingAccOpeningPage.tabs.document, 10);
    I.waitForElement(onboardingAccOpeningPage.tabs.others, 10);

    I.see("Amar Bank belum bisa melayani Anda.");
    I.see("Anda / Bisnis Anda terdaftar dalam DHN (Daftar Hitam Nasional) sehingga tidak dapat melanjutkan proses saat ini. Silahkan mencoba lagi dalam 7 hari.");

    I.dontSee("Untuk informasi lebih lanjut, silakan");
    I.dontSee("Hubungi Kami");
    I.dontSeeElement(formKtpPage.buttons.helpDHN);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);

    await
        mockingDao.disabledCheckDHNKTP();

    await
        mockingDao.disabledCheckDHNNPWP();
});
