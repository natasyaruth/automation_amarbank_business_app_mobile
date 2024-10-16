const { I,
    transactionHistoryPage,
    globalVariable,
    profilePage,
    resetStateDao,
    headerPage,
    getDataDao,
    onboardingAccOpeningPage,
    documentPage,
} = inject();

When("I will see card account {string}", async (typeAccount) => {

    if (
        typeAccount === "active"
    ) {

        const sourceType = (await getDataDao.getSourceType(globalVariable.login.userID, globalVariable.login.password)).sourceType;

        if (
            sourceType === "lending"
        ) {
            I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
        }

        I.waitForElement(transactionHistoryPage.buttons.historyBtn, 30);

    } else if (
        typeAccount === "on verification"
    ) {
        I.waitForText("Menunggu verifikasi data selesai", 30);
        I.see("Proses pembuatan rekening giro maksimal dalam waktu 2 hari kerja");

        const isPartner = (await getDataDao.isPartner(globalVariable.login.userID, globalVariable.login.password)).data;
        const isIndividual = (await resetStateDao.getAccountType(globalVariable.login.userID, globalVariable.login.password)).accountType;

        if (
            isPartner === true ||
            isIndividual === 1
        ) {
            I.dontSee(onboardingAccOpeningPage.buttons.openProgressAccount);
            I.dontSee("Progres Pembukaan Rekening");

        } else {

            I.waitForElement(onboardingAccOpeningPage.buttons.openProgressAccount, 10);
            I.see("Progres Pembukaan Rekening");
        }

    } else if (
        typeAccount === "complete document"
    ) {
        I.waitForText("Mohon lengkapi Dokumen yang dibutuhkan", 30);

    } else if (
        typeAccount === "on process"
    ) {
        I.waitForText("Lanjutkan Pembuatan Rekening Giro", 30);

    } else if (
        typeAccount === "account opening"
    ) {
        I.waitForText("Perbankan Bisnis Premium", 30);
        I.waitForText("Pilih Rekening Giro", 10);
    }

    globalVariable.onBoarding.status = typeAccount;
});

When("I click tab profile", () => {
    profilePage.clickTabProfile();
});

When("I click document business", () => {
    profilePage.clickDocumentBusiness();
});

When("I click document giro", () => {
    documentPage.clickDocumentGiro();
});

When("I back to page profile business", () => {
    I.wait(2);
    headerPage.clickButtonBack();
});

When("I back to page document business", () => {
    I.wait(2);
    headerPage.clickButtonBack();
});

When("I click unhide the information", () => {
    profilePage.clickEyeInfoProfile();
});

When("I click hide the information", () => {
    profilePage.clickEyeInfoProfile();
});

When("I click detail business profile", () => {
    profilePage.openMenuBusinessProfile();
});

When("I close bottom sheet input password profile", () => {
    profilePage.closeBottomSheet();
});

When("I input my password", () => {
    documentPage.inputPassword(globalVariable.login.password);
});

When("I input wrong password", () => {
    documentPage.inputPassword(globalVariable.login.dummyPassword);
});

When("I want to see my password", () => {
    documentPage.clickIconEyePassword();
});

When("I don't want to see my password", () => {
    documentPage.clickIconEyePassword();
    I.wait(1);
    documentPage.clickIconEyePassword();
});

When("I click to see my profile data", () => {
    documentPage.clickSeeDocument();
});

Then("I see my profile company data", async () => {
    I.waitForText("Direktur", 10);

    I.see("Profil");

    I.dontSee(globalVariable.login.userID.toUpperCase());

    const actualName = await profilePage.getName();
    const expectedName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualName, "Hi, " + expectedName);

    I.dontSee("Nomor Rekening Giro");
    I.dontSeeElement(profilePage.buttons.copyAccNumber);

    I.waitForElement(profilePage.buttons.showHide, 10);

    I.see("E-mail");
    const actualEmail = await profilePage.getEmail();
    const expectedEmail = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;
    I.assertNotEqual(actualEmail, expectedEmail);
    globalVariable.profile.email = expectedEmail;

    I.see("Nomor Handphone");
    const actualPhonenumber = await profilePage.getPhonenumber();
    const phonenumber = (await resetStateDao.getPhoneNumber(globalVariable.login.userID, globalVariable.login.password)).phoneNumber;
    const expectedPhonenumber = "+62 " + phonenumber.substring(3);
    I.assertNotEqual(actualPhonenumber, expectedPhonenumber);
    globalVariable.profile.phoneNumber = expectedPhonenumber;

    I.see("Alamat Tempat Tinggal");
    const actualAddress = await profilePage.getDomicileAddress();
    const address = (await getDataDao.getFullAddress(globalVariable.login.userID, globalVariable.login.password)).address;
    const fullAddress = (await getDataDao.getFullAddress(globalVariable.login.userID, globalVariable.login.password)).fullAddress;
    const expectedAddress = address + ", " + fullAddress
    I.assertNotEqual(actualAddress, expectedAddress);
    globalVariable.profile.domicileAddress = expectedAddress;

    I.see("Nama Bisnis");
    const actualCompanyName = await profilePage.getCompanyName();
    const expectedCompanyName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
    I.assertEqual(actualCompanyName, expectedCompanyName);
    globalVariable.profile.companyName = expectedCompanyName;

    I.see("Profil Bisnis");
    I.waitForElement(profilePage.buttons.businessProfile, 10);

    I.see("Persetujuan Transaksi Bisnis");
    I.waitForElement(profilePage.buttons.transactionApprovalDetail, 10);

    I.dontSee("Tipe Industri");
    I.dontSee("Jenis Bisnis");
    I.dontSee("Tanggal Berdiri");
    I.dontSee("Alamat Bisnis");
    I.dontSeeElement(profilePage.buttons.documentProcuration);
    I.dontSeeElement(profilePage.buttons.documentBusiness);
});

Then("I see my profile individual company data", async () => {
    I.waitForText("Pemilik Bisnis", 10);

    I.see("Profil");

    I.dontSee(globalVariable.login.userID.toUpperCase());

    const actualName = await profilePage.getName();
    const expectedName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualName, "Hi, " + expectedName);

    I.dontSee("Nomor Rekening Giro");
    I.dontSeeElement(profilePage.buttons.copyAccNumber);

    I.waitForElement(profilePage.buttons.showHide, 10);

    I.see("E-mail");
    const actualEmail = await profilePage.getEmail();
    const expectedEmail = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;
    I.assertNotEqual(actualEmail, expectedEmail);
    globalVariable.profile.email = expectedEmail;

    I.see("Nomor Handphone");
    const actualPhonenumber = await profilePage.getPhonenumber();
    const phonenumber = (await resetStateDao.getPhoneNumber(globalVariable.login.userID, globalVariable.login.password)).phoneNumber;
    const expectedPhonenumber = "+62 " + phonenumber.substring(3);
    I.assertNotEqual(actualPhonenumber, expectedPhonenumber);
    globalVariable.profile.phoneNumber = expectedPhonenumber;

    I.see("Alamat Tempat Tinggal");
    const actualAddress = await profilePage.getDomicileAddress();
    const address = (await getDataDao.getFullAddress(globalVariable.login.userID, globalVariable.login.password)).address;
    const fullAddress = (await getDataDao.getFullAddress(globalVariable.login.userID, globalVariable.login.password)).fullAddress;
    const expectedAddress = address + ", " + fullAddress
    I.assertNotEqual(actualAddress, expectedAddress);
    globalVariable.profile.domicileAddress = expectedAddress;

    I.see("Nama Bisnis");
    const actualCompanyName = await profilePage.getCompanyName();
    const expectedCompanyName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
    I.assertEqual(actualCompanyName, expectedCompanyName);
    globalVariable.profile.companyName = expectedCompanyName;

    I.see("Profil Bisnis");
    I.waitForElement(profilePage.buttons.businessProfile, 10);

    I.dontSee("Persetujuan Transaksi Bisnis");
    I.dontSeeElement(profilePage.buttons.transactionApprovalDetail);

    I.dontSee("Tipe Industri");
    I.dontSee("Jenis Bisnis");
    I.dontSee("Tanggal Berdiri");
    I.dontSee("Alamat Bisnis");
    I.dontSeeElement(profilePage.buttons.documentProcuration);
    I.dontSeeElement(profilePage.buttons.documentBusiness);
});

Then("I will see my profile individual data", async () => {
    I.waitForText("Individu", 10);
    I.see("Profil");

    I.dontSee(globalVariable.login.userID.toUpperCase());

    const actualName = await profilePage.getName();
    const expectedName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualName, "Hi, " + expectedName);

    I.see("Nomor Rekening Giro");
    if (
        globalVariable.onBoarding.status === "active"
    ) {
        I.waitForElement(profilePage.buttons.copyAccNumber, 10);
        const actualAccNumber = await profilePage.getAccNumber();
        const expectedAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
        const format1 = expectedAccNumber.substring(0, 4);
        const format2 = expectedAccNumber.substring(4, 8);
        const format3 = expectedAccNumber.substring(8, 10);
        I.assertEqual(actualAccNumber, format1 + " " + format2 + " " + format3);
    } else {
        I.dontSeeElement(profilePage.buttons.copyAccNumber);
        const actualAccNumber = await profilePage.getAccNumber();
        I.assertEqual(actualAccNumber, "-");
    }

    I.waitForElement(profilePage.buttons.showHide, 10);

    I.see("E-mail");
    const actualEmail = await profilePage.getEmail();
    const expectedEmail = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;
    I.assertNotEqual(actualEmail, expectedEmail);
    globalVariable.profile.email = expectedEmail;

    I.see("Nomor Handphone");
    const actualPhonenumber = await profilePage.getPhonenumber();
    const phonenumber = (await resetStateDao.getPhoneNumber(globalVariable.login.userID, globalVariable.login.password)).phoneNumber;
    const expectedPhonenumber = "+62 " + phonenumber.substring(3);
    I.assertNotEqual(actualPhonenumber, expectedPhonenumber);
    globalVariable.profile.phoneNumber = expectedPhonenumber;

    I.see("Alamat Tempat Tinggal");
    const actualAddress = await profilePage.getDomicileAddress();
    const address = (await getDataDao.getFullAddress(globalVariable.login.userID, globalVariable.login.password)).address;
    const fullAddress = (await getDataDao.getFullAddress(globalVariable.login.userID, globalVariable.login.password)).fullAddress;
    const expectedAddress = address + ", " + fullAddress;
    I.assertNotEqual(actualAddress, expectedAddress);
    globalVariable.profile.domicileAddress = expectedAddress;

    I.dontSee("Nama Bisnis");
    I.dontSeeElement(profilePage.texts.businessName);

    I.dontSee("Profil Bisnis");
    I.dontSeeElement(profilePage.buttons.businessProfile);

    I.dontSee("Tipe Industri");
    I.dontSee("Jenis Bisnis");
    I.dontSee("Tanggal Berdiri");
    I.dontSee("Alamat Bisnis");
    I.dontSeeElement(profilePage.buttons.documentProcuration);
    I.dontSeeElement(profilePage.buttons.documentBusiness);
});

Then("I will not see button document business", () => {
    I.dontSeeElement(profilePage.buttons.documentBusiness);
});

Then("I will see my profile data is blank", () => {
    I.waitForText("Profil", 10);

    I.waitForText("Data Bisnis Masih Kosong", 10);
    I.waitForText("Anda harus menyelesaikan proses registrasi terlebih dahulu", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);
});

Then("I will direct to detail business profile", async () => {
    I.waitForElement(headerPage.buttons.back, 10);
    I.see("Profil Bisnis")

    I.see("Profil");

    const actualCompanyName = await profilePage.getCompanyName();
    I.assertEqual(actualCompanyName, globalVariable.profile.companyName);

    I.see("Nomor Rekening Giro");
    if (
        globalVariable.onBoarding.status === "active"
    ) {
        I.waitForElement(profilePage.buttons.copyAccNumber, 10);
        const actualAccNumber = await profilePage.getAccNumber();
        const expectedAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
        const format1 = expectedAccNumber.substring(0, 4);
        const format2 = expectedAccNumber.substring(4, 8);
        const format3 = expectedAccNumber.substring(8, 10);
        I.assertEqual(actualAccNumber, format1 + " " + format2 + " " + format3);
    } else {
        I.dontSeeElement(profilePage.buttons.copyAccNumber);
        const actualAccNumber = await profilePage.getAccNumber();
        I.assertEqual(actualAccNumber, "-");
    }

    I.see("Tipe Industri");
    const actualIndustryType = await profilePage.getIndustry();
    const expectedIndustryType = (await getDataDao.getIndustryType(globalVariable.login.userID, globalVariable.login.password)).industryType;
    I.assertEqual(actualIndustryType, expectedIndustryType);

    I.see("Jenis Bisnis");
    const actualBusinessType = await profilePage.getBusinessType();
    const expectedBusinessType = (await getDataDao.getBusinessType(globalVariable.login.userID, globalVariable.login.password)).businessType;
    I.assertEqual(actualBusinessType, expectedBusinessType);

    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    I.see("Tanggal Berdiri");
    let foundedDate = "";
    const actualFoundedDate = await profilePage.getFoundedDate();
    foundedDate = (await getDataDao.getFoundedDate(globalVariable.login.userID, globalVariable.login.password)).foundedAt;
    const dates = foundedDate.replace(/-/g, '');
    const date = dates.substring(0, 2);
    let month = dates.substring(2, 4);
    const year = dates.substring(4, 8);

    if (
        month.substring(0, 1) === "0"
    ) {
        month = month.substring(0, 1);
    }

    I.assertEqual(actualFoundedDate, date + " " + months[month-1] + " " + year);

    I.see("Alamat Bisnis");
    const actualBusinessAddress = await profilePage.getBusinessAddress();
    const expectedBusinessAddress = (await getDataDao.getBusinessAddress(globalVariable.login.userID, globalVariable.login.password)).fullAddress;
    I.assertEqual(actualBusinessAddress, expectedBusinessAddress);
});

Then("I will see bottom sheet input password profile", async () => {
    I.waitForElement(profilePage.buttons.close, 10);

    I.see("Untuk membuka data masukkan password Anda");
    I.see("Password");
    I.see("Masukkan password");
    I.waitForElement(documentPage.fields.password, 10);
    I.waitForElement(documentPage.buttons.eyePassword, 10);

    I.see("Lihat Data");
    I.waitForElement(documentPage.buttons.seeDocument, 10);

    const isDisabled = await I.grabAttributeFrom(profilePage.statusElement.buttonSeeData, 'enabled');
    I.assertEqual(isDisabled, 'false');
});

Then("I will see email, phonenumber and domicile address is unmasked", async () => {

    I.wait(2);

    const actualEmail = await profilePage.getEmail();
    I.assertEqual(actualEmail, globalVariable.profile.email);

    const actualPhonenumber = await profilePage.getPhonenumber();
    I.assertEqual(actualPhonenumber, globalVariable.profile.phoneNumber);

    const actualAddress = await profilePage.getDomicileAddress();
    I.assertEqual(actualAddress.trim(), globalVariable.profile.domicileAddress);

});

Then("I will see email, phonenumber and domicile address is masked", () => {

    I.wait(2);

    I.waitForElement(profilePage.buttons.showHide, 10);

    I.dontSee(globalVariable.profile.email);
    I.dontSee(globalVariable.profile.phoneNumber);
    I.dontSee(globalVariable.profile.domicileAddress);

});

Then("I will see button to see my data is disabled", async () => {

    I.wait(1);
    const isDisabled = await I.grabAttributeFrom(profilePage.statusElement.buttonSeeData, 'enabled');
    I.assertEqual(isDisabled, 'false');

});

Then("I will see button to see my data is enabled", async () => {

    I.wait(1);
    const isDisabled = await I.grabAttributeFrom(profilePage.statusElement.buttonSeeData, 'enabled');
    I.assertEqual(isDisabled, 'true');

});

Then("I will direct to page Business profile", () => {
    I.waitForText("Profil Bisnis", 10);
    I.waitForElement(profilePage.texts.businessName, 10)
});

Then("I will direct to page Profile", () => {
    I.waitForText("Profil", 10);
    I.waitForElement(profilePage.texts.name, 10)
});