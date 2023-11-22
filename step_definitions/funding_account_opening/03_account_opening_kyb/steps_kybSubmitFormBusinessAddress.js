const {
    I,
    formBusinessAddressPage,
    onboardingAccOpeningPage,
    resetStateDao,
    globalVariable
} = inject();

Given("I am a customer who has submitted business owner list", () => { });

When("I fill my business address as followings:", (table) => {
    I.waitForElement(formBusinessAddressPage.fields.address, 10);

    const businessAddress = table.parse().rowsHash();
    formBusinessAddressPage.fillBusinessAddress(businessAddress);
});

When("I agree with the terms and condition", async () => {
    await formBusinessAddressPage.checkTnC();
});

When("I allow company to store my data", async () => {
    await formBusinessAddressPage.checkRights();
});

When("I fill field {string} with {string} in form Business Address", (fieldName, valueField) => {
    formBusinessAddressPage.fillField(fieldName, valueField);
});

When("I fill form Business Address except field {string}", (fieldName) => {
    const account = {
        address: "Jl. Durian Runtuh No. 13",
        rt: "01",
        rw: "05",
        province: "DKI JAKARTA",
        city: "KOTA ADM. JAKARTA SELATAN",
        district: "KEBAYORAN BARU",
        village: "SENAYAN",
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

    formBusinessAddressPage.fillBusinessAddress(account);
});

When("I clear the field {string} in form Business Address", (fieldName) => {
    formBusinessAddressPage.clearField(fieldName);
});

When("I swipe to field {string} in form Business Address", (fieldName) => {
    if (
        fieldName === "address" ||
        fieldName === "rt" ||
        fieldName === "rw" ||
        fieldName === "province" 
    ) {
        I.performSwipe({y:1000},{y:-10});
    }
});

Then("I shouldn't see message error in the below of field {string} in form Business Address", async (fieldName) => {
    I.dontSee(formBusinessAddressPage.messageErrorFields[fieldName]);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form Business Address", async (fieldName, expectedMsgError) => {
    I.wait(1);
    let actualMsgError = await formBusinessAddressPage.getMessageError(fieldName);
    I.assertEqual(actualMsgError, expectedMsgError);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

When("I submit my business address", () => {
    formBusinessAddressPage.openAccount();
})

Then("I will directing to page upload require documents for business", () => {
    I.waitForText("Pembentukan Rekening Sedang Diproses Tim Kami", 10);
    I.see("Pengecekan Dokumen");
    I.see("Proses saat ini");
    I.see("Untuk mempercepat pembentukan rekening, Anda bisa upload dokumen langsung.");
    I.see("NIB Berbasis Resiko");
    I.see("Akta Perusahaan");
    I.see("SK Kemenkumham");
    I.see("NPWP Perusahaan");
    I.see("upload dokumen melalui:");

    I.dontSeeElement("Upload Dokumen");
    I.see("support@amarbiz.co.id");
    I.see("Verifikasi Data dan Daftar Direktur");
});

Then("I will directing to page upload require documents for business individual", () => {
    I.waitForText("Pembentukan Rekening Sedang Diproses Tim Kami", 10);
    I.see("Pengecekan Dokumen");
    I.see("Proses saat ini");
    I.see("Untuk mempercepat pembentukan rekening, Anda bisa upload dokumen langsung.");
    I.see("NIB Berbasis Resiko");
    I.see("Akta Pendirian");
    I.dontSee("Akta Perusahaan");
    I.dontSee("SK Kemenkumham");
    I.dontSee("NPWP Perusahaan");
    I.see("upload dokumen melalui:");

    I.dontSeeElement("Upload Dokumen");
    I.see("support@amarbiz.co.id");
    I.see("Verifikasi Data");
});

Then("I can close the page so that I can back to main dashboard", async () => {
    formBusinessAddressPage.closePageUploadDoc();
    I.waitForElement(onboardingAccOpeningPage.tabs.business, 10);

    // await
    // resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});