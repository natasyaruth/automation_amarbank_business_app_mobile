const {
    I,
    formDomicileAddressPage,
    formEmploymentDataPage,
    resetStateDao,
    uploadDao,
    globalVariable } = inject();

Given ("I am a customer who has submitted my personal data details", () =>{});

When("I fill new domicile details as followings:", 
    async (table) => { 
    const newDomicile = table.parse().rowsHash();
    formDomicileAddressPage.fillNewAddress(newDomicile);
  }
);

When("I choose my domicile address same with my identity information", () =>{
    I.waitForText("Alamat Tempat Tinggal Sekarang", 10);
    formDomicileAddressPage.chooseKtpDomicile();
});

When("I choose my new domicile address", () =>{
    I.waitForText("Alamat Tempat Tinggal Sekarang", 10);
    formDomicileAddressPage.chooseNewDomicile();
});

When("I submit my domicile address", () =>{
    formDomicileAddressPage.saveDomicileAddress();
});

When("I swipe to field {string} in form New Domicile Address",()=>{
    if (
        fieldName === "address"
    ) {
        I.swipeDown(formDomicileAddressPage.fields.rt, 500, 500);
    }
});

When("I fill field {string} with {string} in form New Domicile Address", (fieldName, valueField) => {
    I.swipeUp(formDomicileAddressPage.fields.address, 500, 500);
    formDomicileAddressPage.fillField(fieldName, valueField);
});

When("I fill form New Domicile Address except field {string}", (fieldName) => {
    const account = {
        address: "Jl. Durian Runtuh No. 13",
        rt: "01",
        rw: "05",
        province: "DKI JAKARTA",
        city: "KOTA ADM. JAKARTA SELATAN",
        district: "KEBAYORAN BARU",
        village: "S",
    };

    delete account[fieldName];
    
    formDomicileAddressPage.fillNewAddress(account);
});

When("I clear the field {string} in form New Domicile Address", (fieldName) => {
    formDomicileAddressPage.clearValue(fieldName);
});

Then("I shouldn't see message error in the below of field {string} in form New Domicile Address", async (fieldName) => {
    I.dontSee(formDomicileAddressPage.messageErrorFields[fieldName]);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form New Domicile Address", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formDomicileAddressPage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();
    I.assertEqual(actualMsgError, expectedMsgError);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will notify my domicile address has successfully submitted", () => {
    I.waitForText("Alamat tempat tinggal berhasil disimpan", 10);
});

Then("I will direct to page Data Employment", async () => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
    I.seeElement(formEmploymentDataPage.dropDowns.sourceIncome);
    I.dontSeeElement(formEmploymentDataPage.dropDowns.monthlyIncome);
    I.dontSeeElement(formEmploymentDataPage.dropDowns.industry);
    I.dontSeeElement(formEmploymentDataPage.field.companyName);
    I.dontSeeElement(formEmploymentDataPage.checkBox.rights);
    I.dontSeeElement(formEmploymentDataPage.checkBox.termsAndCondition);
    I.dontSeeElement(formEmploymentDataPage.checkBox.privy);
    
    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will direct to page Data Employment Individual", async () => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
    I.seeElement(formEmploymentDataPage.dropDowns.sourceIncome);
    I.seeElement(formEmploymentDataPage.dropDowns.monthlyIncome);
    I.swipeUp(
        formEmploymentDataPage.dropDowns.monthlyIncome,
        1000,
        1000
    );
    I.seeElement(formEmploymentDataPage.dropDowns.industry);
    I.seeElement(formEmploymentDataPage.field.companyName);
    I.seeElement(formEmploymentDataPage.checkBox.rights);
    I.dontSeeElement(formEmploymentDataPage.checkBox.termsAndCondition);
    I.dontSeeElement(formEmploymentDataPage.checkBox.privy);
    I.see("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
    I.dontSee("Saya mengizinkan Amar Bank untuk menyimpan dan memproses data pribadi saya untuk pembuatan rekening dan peningkatan kualitas serta layanan dari aplikasi.");
    I.dontSee("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat. ");
    
    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});