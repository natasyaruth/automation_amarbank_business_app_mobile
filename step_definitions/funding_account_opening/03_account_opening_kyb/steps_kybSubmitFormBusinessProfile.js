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

    I.waitForElement(formBusinessProfilePage.dropDowns.businessField, 10);
    I.see("Jenis Bisnis");
    I.see("Pilih jenis bisnis");
    I.dontSee("Contoh: Salon, Restoran dll");

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

When("I click dropdown {string} in form Business Profile", (dropdownName) => {
    formBusinessProfilePage.clickDropDown(dropdownName);
});

When("I fill form Business Profile except field {string}", (fieldName) => {
    const account = {
        businessName: "PT. ABCD",
        industry: "Jasa",
        businessField: "Operator tur",
        monthlyIncome: "30 - 50 juta",
        averageTransaction: 200000,
        nib: "9129106701234",
        businessDateStart: "10/10/2010",
    };

    if (
        fieldName === "industry"
    ) {
        delete account["businessField"];
    }

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
        I.swipeDown(formBusinessProfilePage.dropDowns.businessField, 1000, 1500);
    }
});

When("I submit my industry type", () => {
    formBusinessProfilePage.submitIndustry();
});

When("I submit my business field", () => {
    formBusinessProfilePage.submitBusinessField();
});

When("I choose option {string}", (option) => {

    I.wait(3);

    if (
        option === "Restoran, Kafe dan Hotel" ||
        option === "Rumah Sakit, Apotik dan Industri Kesehatan" ||
        option === "Teknologi Informasi" ||
        option === "Transportasi" ||
        option === "Lainnya"

    ) {
        I.performSwipe({ x: 1016, y: 1648 }, { x: 1016, y: 1116 });
        I.wait(2);
    }

    I.waitForText(option, 20);
    I.click(option);

    globalVariable.formBusinessProfile.optionChoose = option;
});

When("I fill field other industry type with {string}", (industryType) => {
    formBusinessProfilePage.fillFieldOtherType(industryType);

    globalVariable.formBusinessProfile.optionChoose = industryType;
});

When("I fill field other business field with {string}", (businessField) => {
    formBusinessProfilePage.fillFieldOtherType(businessField);

    globalVariable.formBusinessProfile.optionChoose = businessField;
});

When("I clear field other industry type", () => {
    formBusinessProfilePage.clearField("otherType");
});

When("I clear field other business field", () => {
    formBusinessProfilePage.clearField("otherType");
});

When("I close bottom sheet business field", () => {
    formBusinessProfilePage.closeBottomSheet();
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
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I should see message error {string} in the below of field {string} in form Business Profile", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formBusinessProfilePage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();
    I.assertEqual(actualMsgError, expectedMsgError);

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
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
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I will directing to page director list", async () => {
    I.waitForText("Daftar Direktur sesuai akta", 10);
    I.see("Anda wajib menambah direktur sesuai akta");

    const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;
    const fullName = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    const eKTPNumber = await (await resetStateDao.getKTPNumber()).ktpNumber;

    I.see(fullName);
    I.see(eKTPNumber);
    I.see(email);
    I.seeElement(formBusinessOwnerPage.buttons.addListDirector);

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I will direct to page notifying me that I can't continue to next process KYB because my data is indicated as DHN", async () => {
    const actualTitle = await formBusinessProfilePage.getTitleValidationBlocker();
    I.assertEqual(actualTitle, "Amar Bank belum bisa melayani Anda.");

    const actualContent = await formBusinessProfilePage.getContentValidationBlocker();
    I.assertEqual(actualContent.trim(), "Anda / Bisnis Anda terdaftar dalam DHN (Daftar Hitam Nasional) sehingga tidak dapat melanjutkan proses saat ini. Silahkan mencoba lagi dalam 7 hari.");

    I.see("Untuk informasi lebih lanjut, silakan");
    I.see("Hubungi Kami");
    I.waitForElement(formBusinessProfilePage.buttons.helpDHN, 10);
});

Then("I will see content of dropdown industry", async () => {
    I.waitForText("Tipe Industri", 10);

    const listIndustryType = Object.values(globalVariable.constant.industryType);

    for (let i = 0; i < listIndustryType.length; i++) {
        I.waitForText(listIndustryType[i], 10);

        if (
            listIndustryType[i] === "Perdagangan Besar & Eceran"
        ) {
            I.performSwipe({ x: 1016, y: 1648 }, { x: 1016, y: 1116 });
            I.wait(2);
        }
    }

    I.see("Pilih Tipe Industri");
    I.waitForElement(formBusinessProfilePage.buttons.submitIndustry, 10);

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitIndustryType, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("I will see dropdown {string} is filled with the option choosen", async (dropdown) => {
    I.waitForElement(formBusinessProfilePage.dropDowns[dropdown], 20);

    if (
        dropdown === "industry"
    ) {
        const actValue = await I.grabTextFrom(formBusinessProfilePage.statusElement.valueFieldIndustryType);
        I.assertEqual(actValue, globalVariable.formBusinessProfile.optionChoose);
    } else {
        const actValue = await I.grabTextFrom(formBusinessProfilePage.statusElement.valueFieldBusinessField);
        I.assertEqual(actValue, globalVariable.formBusinessProfile.optionChoose);
    }
});

Then("I will see content of dropdown business field with type {string}", async (type) => {
    I.waitForText("Jenis Bisnis", 20);

    const businessFieldIT = [
        "Pengembangan perangkat lunak",
        "Produsen perangkat keras",
        "Perusahaan konsultan TI",
        "Perusahaan keamanan siber",
        "Platform e-commerce",
        "Lainnya"
    ].sort();

    const businessFieldHealthService = [
        "Rumah Sakit",
        "Klinik",
        "Perusahaan Farmasi",
        "Produsen Alat Kesehatan",
        "Penyedia Telemedisin",
        "Lainnya"
    ].sort();

    const businessFinance = [
        "Bank komersial",
        "Perusahaan asuransi",
        "Akuntan publik",
        "Konsultan keuangan",
        "Startup fintech",
        "Lainnya"
    ].sort();

    const businessRetail = [
        "Toko kelontong",
        "Toko serba ada",
        "Peritel online",
        "Toko Pakaian dan Mode",
        "Peritel elektronik",
        "Toko swalayan",
        "Lainnya"
    ].sort();

    const businessProcessing = [
        "Produsen otomotif",
        "Produsen aerospace",
        "Produsen elektronik",
        "Pengolahan makanan",
        "Produsen Tekstil",
        "Produsen furnitur",
        "Manufaktur"
    ].sort();

    const businessConstruct = [
        "Kontraktor umum",
        "Perusahaan konstruksi",
        "Perusahaan teknik sipil",
        "Biro arsitek",
        "Properti",
        "Firma desain interior",
        "Pengembang",
        "Lainnya"
    ].sort();

    const businessEducation = [
        "Sekolah",
        "Universitas",
        "Platform pembelajaran online",
        "Perusahaan penerbitan fasilitas pendidikan",
        "Jasa bimbingan belajar",
        "Lainnya"
    ].sort();

    const businessService = [
        "Operator tur",
        "Agen perjalanan",
        "Perusahaan perencana acara",
        "Perusahaan penyewaan liburan",
        "Lainnya"
    ].sort();

    const businessTransportation = [
        "Moda Laut",
        "Moda Darat",
        "Moda Udara",
        "Lainnya"
    ].sort();

    const businessWarehouse = [
        "Perusahaan Ekspedisi & Logistik",
        "Perusahaan penyedia layanan pergudangan",
        "Lainnya"
    ].sort();

    const businessMining = [
        "Perusahaan minyak dan gas",
        "Perusahaan energi terbarukan",
        "Perusahaan Listrik dan Air",
        "Pertambangan Sumber Daya Alam Mineral",
        "Lainnya"
    ].sort();

    const businessIndustryCreative = [
        "Studio film",
        "Jaringan televisi",
        "Label musik",
        "Penerbit",
        "Agen periklanan",
        "Desain Produk",
        "Seni Rupa",
        "Lainnya"
    ].sort();

    const businessHospitality = [
        "Restoran Cepat Saji",
        "Cloud Kitchen (Dapur Virtual)",
        "Food Truck",
        "Restoran",
        "Kafe",
        "Catering Event dan Meeting",
        "Motel",
        "Hotel",
        "Villa",
        "Lainnya"
    ].sort();

    const businessFood = [
        "Produksi Makanan & Minuman",
        "Produksi Bahan Baku Makanan & Minuman",
        "Pengemasan Makanan & Minuman",
        "Pengolahan Buah dan Sayuran",
        "Lainnya"
    ].sort();

    const listBusinessField = globalVariable.constant.industryType;

    switch (type) {
        case listBusinessField.IT:
            for (let i = 0; i < businessFieldIT.length; i++) {
                I.waitForText(businessFieldIT[i], 10);
            }
            break;
        case listBusinessField.healthService:
            for (let i = 0; i < businessFieldHealthService.length; i++) {
                I.waitForText(businessFieldHealthService[i], 10);
            }
            break;
        case listBusinessField.finance:
            for (let i = 0; i < businessFinance.length; i++) {
                I.waitForText(businessFinance[i], 10);
            }
            break;
        case listBusinessField.retail:
            for (let i = 0; i < businessRetail.length; i++) {
                I.waitForText(businessRetail[i], 10);
            }
            break;
        case listBusinessField.processing:
            for (let i = 0; i < businessProcessing.length; i++) {
                I.waitForText(businessProcessing[i], 10);
            }
            break;
        case listBusinessField.contruction:
            for (let i = 0; i < businessConstruct.length; i++) {
                I.waitForText(businessConstruct[i], 10);
            }
            break;
        case listBusinessField.education:
            for (let i = 0; i < businessEducation.length; i++) {
                I.waitForText(businessEducation[i], 10);
            }
            break;
        case listBusinessField.service:
            for (let i = 0; i < businessService.length; i++) {
                I.waitForText(businessService[i], 10);
            }
            break;
        case listBusinessField.transportation:
            for (let i = 0; i < businessTransportation.length; i++) {
                I.waitForText(businessTransportation[i], 10);
            }
            break;
        case listBusinessField.warehouse:
            for (let i = 0; i < businessWarehouse.length; i++) {
                I.waitForText(businessWarehouse[i], 10);
            }
            break;
        case listBusinessField.mining:
            for (let i = 0; i < businessMining.length; i++) {
                I.waitForText(businessMining[i], 10);
            }
            break;
        case listBusinessField.industryCreative:
            for (let i = 0; i < businessIndustryCreative.length; i++) {
                I.waitForText(businessIndustryCreative[i], 10);
            }
            break;
        case listBusinessField.hospitality:
            for (let i = 0; i < businessHospitality.length; i++) {
                I.waitForText(businessHospitality[i], 10);
            }
            break;
        case listBusinessField.food:
            for (let i = 0; i < businessFood.length; i++) {
                I.waitForText(businessFood[i], 10);
            }
            break;
        default:
            throw new Error("Industry type " + type + " is not recognize");
    };

    I.waitForText("Lainnya", 10);

    I.see("Pilih Jenis Bisnis");
    I.waitForElement(formBusinessProfilePage.buttons.submitBusinessField, 10);

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitBusinessField, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("I will see text field to fill my industry type", async () => {

    I.wait(3);
    I.hideDeviceKeyboard();

    I.waitForElement(formBusinessProfilePage.fields.otherType, 20);

    I.see("Tulis tipe industri lainnya disini...");
    I.see("0/50");

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitIndustryType, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("I will see text field to fill my business field", async () => {
    I.wait(3);
    I.hideDeviceKeyboard();

    I.waitForElement(formBusinessProfilePage.fields.otherType, 20);

    I.see("0/50");

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitBusinessField, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("I will see information I need to choose industry type first", async () => {
    I.waitForElement(formBusinessProfilePage.buttons.closeBottomSheet, 20);
    I.waitForText("Jenis Bisnis", 10);

    // checking image

    I.see("Silakan pilih Tipe Industri terlebih dahulu");
});

Then("I will see button submit industry type is disabled", async () => {

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitIndustryType, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("I will see button submit industry type is enabled", async () => {

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitIndustryType, 'enabled');
    I.assertEqual(isEnabled, "true");
});

Then("I will see button submit business field is disabled", async () => {

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitBusinessField, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("I will see button submit business field is enabled", async () => {

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitBusinessField, 'enabled');
    I.assertEqual(isEnabled, "true");
});

Then("I will see field other industry type is limited 50 character", async () => {

    I.wait(3);

    const expValue = globalVariable.formBusinessProfile.optionChoose;

    I.see(expValue.substring(0, 50));

    I.see("50/50");

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitIndustryType, 'enabled');
    I.assertEqual(isEnabled, "true");
});

Then("I will see field other business field is limited 50 character", async () => {

    I.wait(3);

    const expValue = globalVariable.formBusinessProfile.optionChoose;

    I.see(expValue.substring(0, 50));

    I.see("50/50");

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitBusinessField, 'enabled');
    I.assertEqual(isEnabled, "true");
});

Then("I will not see text field to fill my industry type", async () => {

    I.wait(2);

    I.dontSeeElement(formBusinessProfilePage.fields.otherType);

    I.dontSee("Tulis tipe industri lainnya disini...");
    I.dontSee("0/50");

    const isEnabled = await I.grabAttributeFrom(formBusinessProfilePage.statusElement.buttonSubmitIndustryType, 'enabled');
    I.assertEqual(isEnabled, "true");

    I.see("Lainnya");
});

Then("I will see dropdown {string} is empty", async (dropdown) => {
    I.wait(3);

    I.waitForElement(formBusinessProfilePage.dropDowns[dropdown], 20);
});