const {
    I,
    formKtpPage,
    resetStateDao,
    uploadDao,
    formPersonalDataPage,
    uploadSelfiePage,
    globalVariable } = inject();

Given("I am a customer who has submitted my information identity details", () => { });

Given("my information about my account opening is {string}", async (expectedInfo) => {
    I.waitForText("Ambil Foto Diri Anda", 20);
    let actualInfo = await uploadSelfiePage.getInformationAccount();
    I.assertEqual(actualInfo, expectedInfo);
});

When("I click take my photo selfie", () => {
    uploadSelfiePage.directToTakePhoto();
});

When("I take selfie picture", () => {
    I.wait(3);
    uploadSelfiePage.takeSelfie();
});

When("I upload my selfie photo", async () => {
    await
        uploadDao.uploadSelfie(globalVariable.login.userID, globalVariable.login.password);
});

When("I retake picture selfie", () => {
    uploadSelfiePage.reTakePhoto();
});

When("I upload invited user selfie photo", async () => {
    I.wait(7);

    await
        uploadDao.uploadSelfie(globalVariable.login.userID, globalVariable.login.password);

    headerPage.clickButtonBack();
    onboardingAccOpeningPage.chooseLater()
});

When("I submit my selfie photo",() =>{
    uploadSelfiePage.uploadSelfie();
})

Then("I will direct to page preview selfie picture KYC", () => {
    I.waitForText("Foto Selfie", 10);
    I.waitForText("Pastikan foto selfie tidak buram, tidak terkena pantulan cahaya dan tidak terpotong", 10);

    I.waitForText("Ulangi", 10);
    I.waitForElement(uploadSelfiePage.buttons.reTakePhoto, 10);

    I.waitForText("Kirim Foto", 10);
    I.waitForElement(uploadSelfiePage.buttons.upload, 10);

    I.dontSee("Ambil Foto Selfie");
    I.dontSeeElement(uploadSelfiePage.buttons.takePhoto);
});

Then("I will direct to page take selfie picture KYC", () => {
    I.waitForText("Foto Selfie", 10);
    I.waitForText("Pastikan foto selfie tidak buram, tidak terkena pantulan cahaya dan tidak terpotong", 10);

    I.waitForElement(uploadSelfiePage.buttons.takePhoto, 10);
    I.dontSee(uploadSelfiePage.buttons.reTakePhoto);
    I.dontSee("Ulangi");
});

Then("I will notify my photo selfie has successfully submitted", () => {
    I.waitForText("Foto diri berhasil dikirim", 30);
});

Then("I will directing to page submit Data Personal", async () => {

    I.waitForText("Wajib Diisi", 10);

    I.see("Pendidikan Terakhir")
    I.see("Pilih pendidikan terakhir");
    I.waitForElement(formPersonalDataPage.dropDowns.lastEducation, 10);

    I.see("Nama Ibu Kandung");
    I.see("Tulis nama ibu kandung");
    I.waitForElement(formPersonalDataPage.fields.motherName, 10);

    I.see("Nama Kerabat");
    I.see("Tulis nama kerabat");
    I.waitForElement(formPersonalDataPage.fields.referenceName, 10);

    I.see("Nomor Handphone Kerabat");
    I.see("Tulis nomor handphone kerabat");
    I.waitForElement(formPersonalDataPage.fields.referencePhoneNumber, 10);

    I.see("NPWP Individu");
    I.see("Upload Foto");
    I.see("Format file jpeg, png maximal 10MB");
    I.waitForElement(formPersonalDataPage.buttons.uploadNpwp, 10);

    I.dontSee("Tujuan Pembuatan Rekening");
    I.dontSee("Pilih tujuan pembuatan rekening");
    I.dontSeeElement(formPersonalDataPage.dropDowns.purposeAccount);

    I.see("Simpan Data Diri");
    I.waitForElement(formPersonalDataPage.buttons.savePersonalData, 10);

});

Then("I will directing to page submit Data Personal individual", async () => {
    I.waitForText("Wajib Diisi", 10);

    I.see("Pendidikan Terakhir")
    I.see("Pilih pendidikan terakhir");
    I.waitForElement(formPersonalDataPage.dropDowns.lastEducation, 10);

    I.see("Nama Ibu Kandung");
    I.see("Tulis nama ibu kandung");
    I.waitForElement(formPersonalDataPage.fields.motherName, 10);

    I.see("Nama Kerabat");
    I.see("Tulis nama kerabat");
    I.waitForElement(formPersonalDataPage.fields.referenceName, 10);

    I.see("Nomor Handphone Kerabat");
    I.see("Tulis nomor handphone kerabat");
    I.waitForElement(formPersonalDataPage.fields.referencePhoneNumber, 10);

    I.waitForText("Tujuan Pembuatan Rekening", 10);
    I.waitForText("Pilih tujuan pembuatan rekening", 10);
    I.waitForElement(formPersonalDataPage.dropDowns.purposeAccount, 10);

    I.see("NPWP Individu");
    I.see("Upload Foto");
    I.see("Format file jpeg, png maximal 10MB");
    I.waitForElement(formPersonalDataPage.buttons.uploadNpwp, 10);

    I.see("Simpan Data Diri");
    I.waitForElement(formPersonalDataPage.buttons.savePersonalData, 10);
});