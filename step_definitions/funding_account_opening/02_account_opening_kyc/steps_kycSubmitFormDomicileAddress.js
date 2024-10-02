const {
    I,
    formDomicileAddressPage,
    formEmploymentDataPage,
    resetStateDao,
    uploadDao,
    globalVariable } = inject();

Given ("I am a customer who has submitted my personal data details", () =>{});

Given("I see my eKTP address", async () =>{
    const actualKtpAddress = await formDomicileAddressPage.getKtpAddress();

    const expectedKtpAddress = globalVariable.formKtp.address+"\n"+
                               globalVariable.formKtp.village+", "+
                               globalVariable.formKtp.district+", "+
                               globalVariable.formKtp.province+", "+
                               globalVariable.formKtp.city+" ";
    
    I.assertEqual(actualKtpAddress, expectedKtpAddress);
});

When("register my identity details as below",
    async (table) => {
        const ktpData = table.parse().rowsHash();
        uploadDao.submitIdentityDetails(ktpData);

        globalVariable.formKtp.address = ktpData["ktpaddress"];
        globalVariable.formKtp.province = ktpData["province"];
        globalVariable.formKtp.city = ktpData["city"];
        globalVariable.formKtp.district = ktpData["district"];
        globalVariable.formKtp.village = ktpData["village"];
    }
);

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
    resetStateDao.resetStateFlow(0, );
});

Then("I should see message error {string} in the below of field {string} in form New Domicile Address", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formDomicileAddressPage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();
    I.assertEqual(actualMsgError, expectedMsgError);

    await
    resetStateDao.resetStateFlow(0, );
});

Then("I will notify my domicile address has successfully submitted", () => {
    I.waitForText("Alamat tempat tinggal berhasil disimpan", 10);
});

Then("I will direct to page Data Employment", async () => {

    I.waitForText("Jenis Pekerjaan", 10);
    I.see("Pilih jenis pekerjaan");
    I.see("Wajib Diisi");
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);

    I.see("Sumber Pendapatan");
    I.see("Pilih sumber pendapatan");
    I.waitForElement(formEmploymentDataPage.dropDowns.sourceIncome, 10);

    I.dontSee("Pendapatan Bulanan (dalam Rp)");
    I.dontSee("Pilih pendapatan bulanan");
    I.dontSeeElement(formEmploymentDataPage.dropDowns.monthlyIncome);

    I.dontSee("Rata-rata Transaksi");
    I.dontSee("Rata-rata transaksi per bulan");
    I.dontSeeElement(formEmploymentDataPage.field.averageTransaction);

    I.dontSee("Industri Perusahaan");
    I.dontSee("Pilih industri perusahaan");
    I.dontSeeElement(formEmploymentDataPage.dropDowns.industry);

    I.dontSee("Nama Perusahaan");
    I.dontSee("Tulis nama perusahaan");
    I.dontSeeElement(formEmploymentDataPage.field.companyName);

    I.dontSee("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
    I.dontSeeElement(formEmploymentDataPage.checkBox.rights);

    I.dontSee("Saya menyetujui Syarat & Ketentuan dalam pengajuan pinjaman dari PT. Bank Amar Indonesia Tbk.")
    I.dontSeeElement(formEmploymentDataPage.checkBox.termsAndCondition);

    I.dontSee("Saya mengizinkan Amar Bank untuk menyimpan dan memproses data pribadi saya sesuai kebijakan privasi yang berlaku untuk pembuatan rekening dan peningkatan kualitas serta layanan dari aplikasi.");
    I.dontSeeElement(formEmploymentDataPage.checkBox.privy);
});

Then("I will direct to page Data Employment Individual", async () => {
    I.waitForText("Jenis Pekerjaan", 10);
    I.see("Pilih jenis pekerjaan");
    I.see("Wajib Diisi");
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);

    I.see("Sumber Pendapatan");
    I.see("Pilih sumber pendapatan");
    I.waitForElement(formEmploymentDataPage.dropDowns.sourceIncome, 10);

    I.see("Pendapatan Bulanan (dalam Rp)");
    I.see("Pilih pendapatan bulanan");
    I.waitForElement(formEmploymentDataPage.dropDowns.monthlyIncome, 10);

    I.see("Rata-rata Transaksi");
    I.see("Rata-rata transaksi per bulan");
    I.waitForElement(formEmploymentDataPage.field.averageTransaction, 10);

    I.swipeUp(
        formEmploymentDataPage.dropDowns.monthlyIncome,
        1000,
        1000
    );

    I.waitForText("Industri Perusahaan", 10);
    I.see("Pilih industri perusahaan");
    I.waitForElement(formEmploymentDataPage.dropDowns.industry, 10);

    I.see("Nama Perusahaan");
    I.see("Tulis nama perusahaan");
    I.see("Isi \"Tidak Ada\" jika kamu bekerja sendiri");
    I.waitForElement(formEmploymentDataPage.field.companyName, 10);

    I.see("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
    I.waitForElement(formEmploymentDataPage.checkBox.rights, 10);

    I.dontSee("Saya mengizinkan Amar Bank untuk menyimpan dan memproses data pribadi saya untuk pembuatan rekening dan peningkatan kualitas serta layanan dari aplikasi.");
    I.dontSeeElement(formEmploymentDataPage.checkBox.termsAndCondition);

    I.dontSee("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat.");
    I.dontSeeElement(formEmploymentDataPage.checkBox.privy); 
});