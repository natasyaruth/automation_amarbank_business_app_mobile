const {
    I,
    formBusinessAddressPage,
    onboardingAccOpeningPage,
    resetStateDao,
    uploadBusinessDocPage,
    headerPage,
    globalVariable
} = inject();

Given("I am a customer who has submitted business owner list", () => { });

Given("has submitted business owner list", () => { });

When("I fill my business address as followings:", (table) => {
    I.waitForElement(formBusinessAddressPage.fields.address, 10);

    const businessAddress = table.parse().rowsHash();
    formBusinessAddressPage.fillBusinessAddress(businessAddress);
});

When("I agree with the terms and condition", async () => {
    await formBusinessAddressPage.checkTnC();
});

When("I agree to carry out the Rights and Obligations", async () => {
    await formBusinessAddressPage.checkRights();
});

When("I will directing to page Rights and Obligations", async () => {
    I.wait(3);
    I.waitForText("Hak dan Kewajiban", 10);
    I.waitForElement(headerPage.buttons.back);

    formBusinessAddressPage.clickScrollToEndOfPage();

    I.waitForElement(formBusinessAddressPage.buttons.acceptWebView, 10);
    I.see("Setujui Hak dan Kewajiban");
});

When("I click button agree with Rights and Obligations", () => {
    formBusinessAddressPage.agreeWithRightsAndObligations();
});

When("I will see checkbox Rights and Obligations is checked", async () => {
    I.waitForElement(formBusinessAddressPage.checkBox.rights,10);
    const isChecked = await I.grabAttributeFrom(formBusinessAddressPage.checkBox.rights, "checked");

    I.assertEqual(isChecked, "true");
});

When("I allow to agree to use my digital signature through Privy.id", async () => {
    await formBusinessAddressPage.checkPrivy();
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
        fieldName === "rw"
    ) {
        I.swipeDown(formBusinessAddressPage.dropDownsSearch.city, 800, 1000);
    }
});

Then("I shouldn't see message error in the below of field {string} in form Business Address", async (fieldName) => {
    I.dontSee(formBusinessAddressPage.messageErrorFields[fieldName]);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form Business Address", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formBusinessAddressPage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();
    I.assertEqual(actualMsgError, expectedMsgError);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

When("I submit my business address", () => {
    formBusinessAddressPage.openAccount();
});

Then("I will directing to page upload require documents for business", async () => {
    I.waitForText("Pembentukan Rekening Sedang Diproses Tim Kami", 10);
    I.see("Pengecekan Dokumen");
    I.see("Proses saat ini");
    I.see("Untuk mempercepat pembentukan rekening, Anda bisa upload dokumen langsung.");
    I.see("NIB");
    I.see("Akta Perusahaan");
    I.see("SK Kemenkumham");
    I.see("NPWP Perusahaan");
    // I.see("Atau upload dokumen melalui:");

    I.waitForElement(uploadBusinessDocPage.buttons.uploadDocument, 10);
    I.see("Upload Dokumen")
    I.see("support.bisnis@amarbank.co.id");
    I.see("Verifikasi Data dan Daftar Direktur");

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will directing to page upload require documents for business individual", async () => {
    I.waitForText("Pembentukan Rekening Sedang Diproses Tim Kami", 10);
    I.see("Pengecekan Dokumen");
    I.see("Proses saat ini");
    I.see("Untuk mempercepat pembentukan rekening, Anda bisa upload dokumen langsung.");
    I.see("NIB");
    I.see("Akta Pendirian");
    I.dontSee("Akta Perusahaan");
    I.dontSee("SK Kemenkumham");
    I.dontSee("NPWP Perusahaan");
    // I.see("Atau upload dokumen melalui:");

    I.waitForElement(uploadBusinessDocPage.buttons.uploadDocument, 10);
    I.see("Upload Dokumen")
    I.see("support.bisnis@amarbank.co.id");
    I.see("Verifikasi Data");

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I can close the page so that I can back to main dashboard", () => {
    formBusinessAddressPage.closePageUploadDoc();
    I.waitForElement(onboardingAccOpeningPage.tabs.home, 10);
});