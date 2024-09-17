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

When("I see fields that available in Business Profile", async () => {
    I.waitForText("Wajib Diisi", 10);

    I.waitForElement(formBusinessProfilePage.fields.businessName, 10);
    I.see("Nama Bisnis");
    I.see("Tulis nama bisnis");
    I.see("Nama bisnis sesuai dengan dokumen legalitas");

    I.waitForElement(formBusinessProfilePage.dropDowns.industry, 10);
    I.see("Tipe Industri");
    I.see("Pilih tipe industri");

    I.waitForElement(formBusinessProfilePage.fields.businessField, 10);
    I.see("Jenis Bisnis");
    I.see("Tulis jenis bisnis");
    I.see("Contoh: Salon, Restoran dll");

    I.waitForElement(formBusinessProfilePage.dropDowns.monthlyIncome, 10);
    I.see("Penghasilan Bisnis per Bulan");
    I.see("Pilih pendapatan bisnis per bulan");

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForElement(formBusinessProfilePage.fields.averageTransaction, 10);
    I.see("Rata-rata Transaksi");
    I.see("Rata-rata transaksi per bulan");

    I.waitForElement(formBusinessProfilePage.fields.npwp, 10);
    // checking field npwp is disabled
    I.see("Nomor NPWP Bisnis");
    I.see(globalVariable.registration.npwpBusiness);

    I.waitForElement(formBusinessProfilePage.fields.nib, 10);
    I.see("NIB Berbasis Resiko");
    I.see("Tulis nomor NIB berbasis resiko");

    I.waitForElement(formBusinessProfilePage.datePicker.businessDateStart, 10);
    I.see("Tanggal Bisnis Berdiri");
    I.see("Tanggal/Bulan/Tahun");

    I.see("Simpan Profil Bisnis");

    I.swipeDown(formBusinessProfilePage.dropDowns.monthlyIncome, 1000, 1000);
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

    delete businessProfile["businessDateStart"];

    Object.keys(businessProfile).forEach((key) => {
        globalVariable.formBusinessProfile[key] = businessProfile[key];
    });
});

When("I submit my business profile", () => {
    formBusinessProfilePage.saveBusinessProfile();
});

When("I fill field {string} with {string} in form Business Profile", (fieldName, valueField) => {
    if (fieldName === "npwp" ||
        fieldName === "nib") {
        I.swipeUp(formBusinessProfilePage.fields.averageTransaction, 1000, 1000);
    }

    formBusinessProfilePage.fillField(fieldName, valueField);
    
    if (
        fieldName === "averageTransaction"
    ) {
        I.dontSee(valueField);
    }
});

When("I fill form Business Profile except field {string}", (fieldName) => {
    const account = {
        businessName: "PT. ABCD",
        industry: "Jasa",
        businessField: "Restoran",
        monthlyIncome: "30 - 50 juta",
        averageTransaction: 200000,
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
        I.swipeDown(formBusinessProfilePage.fields.businessField, 1000, 1500);
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
    const fullName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    const eKTPNumber = await (await resetStateDao.getKTPNumber(globalVariable.login.userID, globalVariable.login.password)).ktpNumber;

    I.see(fullName);
    I.see(eKTPNumber);
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