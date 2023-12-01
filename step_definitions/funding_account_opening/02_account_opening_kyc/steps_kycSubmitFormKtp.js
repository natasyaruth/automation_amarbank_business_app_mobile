const {
    I,
    formKtpPage,
    resetStateDao,
    globalVariable } = inject();

Given("I am a customer want to fill my information identity details", async () => { 
    await
        resetStateDao.resetStateFlow(3, globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

Given("I am a customer who has uploaded my eKTP photo", async () => { 
    resetStateDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
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
