const {
    I,
    formBusinessAddressPage,
    onboardingAccOpeningPage,
    resetStateDao,
    uploadBusinessDocPage,
    headerPage,
    getDataDao,
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

Then("I will directing to page upload require documents for business", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.waitForText("Pengajuan Pembukaan Rekening", 10);

    I.see("Mohon persiapkan dokumen-dokumen berikut:");
    I.see("NIB");
    I.see("Akta Pendirian");
    I.see("SK Kemenkumham Pendirian");
    I.see("NPWP Bisnis");
    I.see("Akta Perubahan Terakhir (jika ada)");
    I.see("SK Kemenkumham Perubahan Terakhir (jika ada)");

    I.waitForElement(uploadBusinessDocPage.buttons.chooseMethodUpload, 10);
    I.see("Pilih Metode Upload Dokumen");
});

Then("I will directing to page upload require documents for business individual", async () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.waitForText("Pengajuan Pembukaan Rekening", 10);

    I.see("Mohon persiapkan dokumen-dokumen berikut:");

    const legalityType = (await getDataDao.getLegalityType(globalVariable.login.userID, globalVariable.login.password)).legalityType;

    if(
        legalityType === "UD"
    ){

        I.see("NIB");
        I.see("NPWP Bisnis");
        I.dontSee("Sertifikat Pendaftaran");
        I.dontSee("Surat Pernyataan Pendirian");
        I.dontSee("Sertifikat Perubahan Terakhir (jika ada)");
        I.dontSee("Surat Pernyataan Perubahan Terakhir (jika ada)");

    } else if (
        legalityType === "PT Perorangan"
    ) {

        I.see("NIB");
        I.see("NPWP Bisnis");
        I.see("Sertifikat Pendaftaran");
        I.see("Surat Pernyataan Pendirian");
        I.see("Sertifikat Perubahan Terakhir (jika ada)");
        I.see("Surat Pernyataan Perubahan Terakhir (jika ada)");

    } else {

        throw new Error("Please check legality type of user. Only works if user id is from UD or PT Perorangan");
    }

    I.waitForElement(uploadBusinessDocPage.buttons.chooseMethodUpload, 10);
    I.see("Pilih Metode Upload Dokumen");

});

Then("I can close the page so that I can back to main dashboard", () => {
    formBusinessAddressPage.closePageUploadDoc();
    I.waitForElement(onboardingAccOpeningPage.tabs.home, 10);
});