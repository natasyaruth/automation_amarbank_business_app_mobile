const {
    I,
    formEmploymentDataPage,
    formBusinessProfilePage,
    resetStateDao,
    uploadDao,
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

When("I fill my employment details as followings:", async (table) => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);

    const employmentData = table.parse().rowsHash();
    await formEmploymentDataPage.fillEmploymentData(employmentData);

    if (globalVariable.onBoarding.legality === "individual") {
        I.swipeUp(
            formEmploymentDataPage.checkBox.rights,
            500,
            1000);
    }
});

When("I fill my company name with {string}", (companyName) => {
    I.swipeUp(formEmploymentDataPage.dropDowns.industry, 500, 500);
    formEmploymentDataPage.fillFieldCompany(companyName);
});

When("I fill form Data Employment except field {string}", async (fieldName) => {
    const account = {
        workType: "Pegawai Negeri Sipil",
        sourceIncome: "Gaji Bulanan",
        monthlyIncome: "5 - 10 juta",
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
        I.swipeDown(formEmploymentDataPage.dropDowns.industry, 500, 1000);
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

Then("I will notify that I already fill my personal details data", async () => {
    I.waitForText("Terima kasih telah melengkapi Data Diri", 10);
    I.see("Mohon melengkapi Data Bisnis Anda untuk melanjutkan proses pembentukan rekening");
    I.see("Perbankan Bisnis Premium");
    I.see("Dengan melengkapi Data Bisnis, Anda akan mendapatkan fitur perbankan bisnis premium (rekening giro) dari Bank Amar");
    I.see("Gratis Biaya Admin");
    I.see("Transaksi Real-Time");
    I.see("Semua Proses dari Hp Anda");
    I.see("Multiple User");
    I.see("Debit Card");
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.see("Lanjut Lengkapi Data Bisnis");
    I.seeElement(formEmploymentDataPage.buttons.continue);
});

Then("I will notify that my personal data details needs to be verified first", async () => {
    I.waitForText("Terimakasih telah melengkapi semua data", 10);
    I.see("Kami akan melalukan verifikasi ulang data Anda dalam waktu kurang-lebih 2 hari kerja.");
    I.see("Lanjut ke Dashboard");
    formEmploymentDataPage.continueToDashboard();
});

Then("I shouldn't see message error in the below of field company name in form Data Employment", async () => {
    let infoCompanyName = "Isi \"Tidak Ada\" jika kamu bekerja sendiri";

    let messageField = await formEmploymentDataPage.getMessageError("companyName");
    I.assertEqual(messageField, infoCompanyName);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I should see message error {string} in the below of field {string} in form Data Employment", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formEmploymentDataPage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();
    I.assertEqual(actualMsgError, expectedMsgError);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will see checkbox Rights & Policy, T&C about loan and Privy", async () => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
    I.swipeUp(
        formEmploymentDataPage.dropDowns.monthlyIncome,
        1000,
        1000
    );

    I.seeElement(formEmploymentDataPage.checkBox.rights);
    I.seeElement(formEmploymentDataPage.checkBox.termsAndCondition);
    I.seeElement(formEmploymentDataPage.checkBox.privy);
    I.see("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
    I.see("Saya mengizinkan Amar Bank untuk menyimpan dan memproses data pribadi saya untuk pembuatan rekening dan peningkatan kualitas serta layanan dari aplikasi.");
    I.see("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat. ");
    
    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then("I will see checkbox Rights & Policy and T&C about loan", async () => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
    I.swipeUp(
        formEmploymentDataPage.dropDowns.monthlyIncome,
        1000,
        1000
    );

    I.seeElement(formEmploymentDataPage.checkBox.rights);
    I.seeElement(formEmploymentDataPage.checkBox.termsAndCondition);
    I.dontSeeElement(formEmploymentDataPage.checkBox.privy);
    I.see("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
    I.see("Saya mengizinkan Amar Bank untuk menyimpan dan memproses data pribadi saya untuk pembuatan rekening dan peningkatan kualitas serta layanan dari aplikasi.");
    I.dontSee("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat. ");

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});