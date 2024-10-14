const {
    I,
    formEmploymentDataPage,
    formBusinessProfilePage,
    formBusinessAddressPage,
    resetStateDao,
    uploadDao,
    headerPage,
    globalVariable
} = inject();

Given("I am a customer who has submitted my domicile address", () => { });

Given("I am a customer who has uploaded my eKTP photo and selfie", async () => {
    await
        uploadDao.allowDeviceData(globalVariable.login.userID, globalVariable.login.password);
    await
        uploadDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
    I.wait(2);
    await
        uploadDao.uploadSelfie(globalVariable.login.userID, globalVariable.login.password);
});

Given("I want to submit my employment data", () => { });

Given("I see fields that available in Data Employment", async () => {
    I.waitForText("Wajib Diisi", 10);
    
    const legality = globalVariable.onBoarding.legality;

    if(
        legality === "individual"
    ){
        I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
        I.see("Jenis Pekerjaan");
        I.see("Pilih jenis pekerjaan");

        I.waitForElement(formEmploymentDataPage.dropDowns.sourceIncome, 10);
        I.see("Sumber pendapatan");
        I.see("Pilih sumber pendapatan");

        I.waitForElement(formEmploymentDataPage.dropDowns.monthlyIncome, 10);
        I.see("Pendapatan Bulanan (dalam Rp)");
        I.see("Pilih pendapatan bulanan");

        I.waitForElement(formEmploymentDataPage.field.averageTransaction, 10);
        I.see("Rata-rata Transaksi");
        I.see("Rata-rata transaksi per bulan");

        I.waitForElement(formEmploymentDataPage.dropDowns.industry, 10);
        I.see("Industri Perusahaan");
        I.see("Pilih industri perusahaan");

        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

        I.waitForElement(formEmploymentDataPage.field.companyName, 10);
        I.see("Nama Perusahaan");
        I.see("Tulis nama Perusahaan");
        I.see("Isi \"Tidak Ada\" jika kamu bekerja sendiri")
        
        I.see("Syarat dan Ketentuan");
        I.see("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
        I.waitForElement(formEmploymentDataPage.checkBox.rights, 10);

        I.see("Buka Rekening Sekarang");

        I.swipeDown(formEmploymentDataPage.field.averageTransaction, 1000, 500);

    } else{

        I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
        I.see("Jenis Pekerjaan");
        I.see("Pilih jenis pekerjaan");

        I.waitForElement(formEmploymentDataPage.dropDowns.sourceIncome, 10);
        I.see("Sumber pendapatan");
        I.see("Pilih sumber pendapatan");

        I.dontSee(formEmploymentDataPage.dropDowns.monthlyIncome);
        I.dontSee("Pendapatan Bulanan (dalam Rp)");
        I.dontSee("Pilih pendapatan bulanan");

        I.dontSee(formEmploymentDataPage.field.averageTransaction);
        I.dontSee("Rata-rata Transaksi");
        I.dontSee("Rata-rata transaksi per bulan");

        I.dontSee(formEmploymentDataPage.dropDowns.industry);
        I.dontSee("Industri Perusahaan");
        I.dontSee("Pilih industri perusahaan");

        I.dontSee(formEmploymentDataPage.field.companyName);
        I.dontSee("Nama Perusahaan");
        I.dontSee("Tulis nama Perusahaan");
        I.dontSee("Isi \"Tidak Ada\" jika kamu bekerja sendiri")
        
        I.dontSee("Syarat dan Ketentuan");
        I.dontSee("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
        I.dontSee(formEmploymentDataPage.checkBox.rights);

        I.see("Simpan Data Pekerjaan");
    }
});

When("I fill my employment details as followings:", async (table) => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);

    const employmentData = table.parse().rowsHash();
    await formEmploymentDataPage.fillEmploymentData(employmentData);
});

When("I fill my company name with {string}", (companyName) => {
    I.swipeUp(formEmploymentDataPage.dropDowns.industry, 500, 500);
    formEmploymentDataPage.fillFieldCompany(companyName);
});

When("I fill my average transaction with {string}", async (avgTransaction) => {
    formEmploymentDataPage.fillFieldAverageTransaction(avgTransaction);

    I.dontSee(avgTransaction);
});

When("I fill form Data Employment except field {string}", async (fieldName) => {
    const account = {
        workType: "Pegawai Negeri Sipil",
        sourceIncome: "Gaji Bulanan",
        monthlyIncome: "5 - 10 juta",
        averageTransaction: 200000,
        industry: "Pemerintahan",
        companyName: "KEMENDAGRI"
    };

    delete account[fieldName];

    await
        formEmploymentDataPage.fillEmploymentData(account);
    I.swipeUp(formEmploymentDataPage.field.companyName, 500, 1000);
});

When("I swipe to field {string} in form Data Employment", (fieldName) => {
    if (
        fieldName === "workType" ||
        fieldName === "sourceIncome"
    ) {
        I.swipeDown(formEmploymentDataPage.dropDowns.industry, 500, 1500);
    }
});

When("I submit my employment data", () => {
    formEmploymentDataPage.saveEmploymentData();
    I.wait(3);
});

When("I submit my employment data individual", () => {
    formEmploymentDataPage.saveEmploymentData();
    I.wait(3);
});

When("I clear field company name", () => {
    formEmploymentDataPage.clearFieldCompany();
})

When("I clear field average transaction", () => {
    formEmploymentDataPage.clearFieldAverageTransaction();
})

Then("I will notify that I already fill my personal details data", () => {
    I.waitForText("Terima kasih telah melengkapi Data Diri", 10);
    I.see("Mohon melengkapi Data Bisnis Anda untuk melanjutkan proses pembentukan rekening");
    I.see("Digital Banking untuk Bisnis");
    I.see("Dengan melengkapi Data Bisnis, Anda akan mendapatkan fitur Digital Banking (rekening giro) dari Bank Amar");
    I.see("Bebas Biaya Admin Bulanan");
    I.see("Transaksi Real-Time");
    I.see("Semua Proses dari Hp Anda");
    I.dontSee("Multiple User");
    I.dontSee("Debit Card");
    I.see("e-Statement");
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.see("Lanjut Lengkapi Data Bisnis");
    I.seeElement(formEmploymentDataPage.buttons.continue);
});

Then("I will notify that my personal data details needs to be verified first", () => {
    I.waitForText("Terimakasih telah melengkapi semua data", 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.dontSee(headerPage.buttons.back);

    I.see("Kami akan melakukan verifikasi data Anda dalam waktu kurang-lebih 2 hari kerja.");
    I.see("Lanjut ke Dashboard");
    formEmploymentDataPage.continueToDashboard();
});

Then("I shouldn't see message error in the below of field company name in form Data Employment", async () => {
    let infoCompanyName = "Isi \"Tidak Ada\" jika kamu bekerja sendiri";

    let messageField = await formEmploymentDataPage.getMessageError("companyName");
    I.assertEqual(messageField, infoCompanyName);

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I shouldn't see message error in the below of field average transaction in form Data Employment", async () => {
    I.dontSee(formEmploymentDataPage.messageErrorFields.averageTransaction);

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I should see message error {string} in the below of field {string} in form Data Employment", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formEmploymentDataPage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();
    I.assertEqual(actualMsgError, expectedMsgError);

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I will see checkbox Rights & Policy, T&C about loan and Privy", async () => {
    const legalityType = globalVariable.onBoarding.legality;

    if (
        legalityType === "individual"
    ) {
        I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
        I.swipeUp(
            formEmploymentDataPage.dropDowns.monthlyIncome,
            1000,
            1000
        );
    } else {
        I.waitForElement(formBusinessAddressPage.fields.address, 10);
    }

    I.seeElement(formEmploymentDataPage.checkBox.rights);
    I.seeElement(formEmploymentDataPage.checkBox.loan);
    I.seeElement(formEmploymentDataPage.checkBox.privy);
    I.waitForText("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk", 10);
    I.waitForText("Saya menyetujui Syarat & Ketentuan dalam pengajuan pinjaman dari PT. Bank Amar Indonesia Tbk.", 10);
    I.waitForText("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat. "), 10;

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I will see checkbox Rights & Policy and T&C about loan", async () => {
    const legalityType = globalVariable.onBoarding.legality;

    if (
        legalityType === "individual"
    ) {
        I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
        I.swipeUp(
            formEmploymentDataPage.dropDowns.monthlyIncome,
            1000,
            1000
        );
    } else {
        I.waitForElement(formBusinessAddressPage.fields.address, 10);
    }

    I.seeElement(formEmploymentDataPage.checkBox.rights);
    I.seeElement(formEmploymentDataPage.checkBox.loan);
    I.dontSeeElement(formEmploymentDataPage.checkBox.privy);
    I.waitForText("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk", 10);
    I.waitForText("Saya menyetujui Syarat & Ketentuan dalam pengajuan pinjaman dari PT. Bank Amar Indonesia Tbk .", 10);
    I.dontSee("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat. ");

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});