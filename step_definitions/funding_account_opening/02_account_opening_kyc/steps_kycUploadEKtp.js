const {
    I,
    uploadKtpPage,
    onboardingAccOpeningPage,
    headerPage,
    formKtpPage,
    resetStateDao,
    uploadDao,
    globalVariable } = inject();

Given("I am a customer who has selected the business type UD", () => { });

Given("I am a customer who has selected the business type Individual", () => { });

Given("I am a customer who has selected the business type PT Perorangan", () => { });

Given("I am a customer who has selected the business type PT Perusahaan", () => { });

Given("I am a customer who has selected the business type CV", () => { });

Given("My last flow kyc step is {string}", (stateName) => {
    let lastStateNumber = onboardingAccOpeningPage.getStateNumber(stateName);
    // step to hit API reset state
});

When("I click take photo eKTP", ()=>{
    uploadKtpPage.directToTakePhoto();
});

When("I take photo eKTP", ()=>{
    uploadKtpPage.takePhoto();
});

When("I retake photo eKTP", ()=>{
    uploadKtpPage.retakePhoto();
});

When("I submit my eKTP photo", ()=>{
    uploadKtpPage.uploadPhoto();
});

When("I upload my eKTP photo", async () => {
    I.waitForText("Ambil Foto eKTP Anda", 10);
    await
        uploadDao.allowDeviceData(globalVariable.login.userID, globalVariable.login.password);
    await
        uploadDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

When("I upload invited user eKTP photo", async () => {
    I.waitForText("Ambil Foto eKTP Anda", 10);
    await
        uploadDao.allowDeviceData(globalVariable.login.userID, globalVariable.login.password);
    await
        uploadDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageUserInvitedAfterResetState();
});

Then("I will direct to page preview eKTP picture", () => {
    I.waitForElement(uploadKtpPage.buttons.retake, 10);
    I.waitForElement(uploadKtpPage.buttons.upload, 10)
    
    I.see("Ulangi");
    I.see("Kirim Foto");
});

Then("I will directing to page take photo eKTP", () => {
    I.waitForText("Foto eKTP", 10);
    I.see("Pastikan foto eKTP tidak buram, tidak terkena pantulan cahaya dan tidak terpotong");
    I.see("Ambil Foto eKTP");

    I.waitForElement(uploadKtpPage.buttons.takePhoto, 10);
    
});

Then("I will directing to page submit form KTP", async () => {
    I.waitForText("Verifikasi Data eKTP", 10);
    I.see("Data Personal");
    I.waitForElement(headerPage.buttons.back, 10);

    I.see("Wajib Diisi");

    I.see("Nomor eKTP");
    I.waitForElement(formKtpPage.fields.eKtpNumber, 10);

    I.see("Nama sesuai eKTP");
    I.waitForElement(formKtpPage.fields.fullName, 10);

    I.see("Tempat Lahir");
    I.waitForElement(formKtpPage.fields.placeOfBirth, 10);

    I.see("Tanggal Lahir");
    I.waitForElement(formKtpPage.datePicker.dateOfBirth, 10);

    I.see("Jenis Kelamin");
    I.waitForElement(formKtpPage.dropDowns.gender, 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.wait(1);

    I.see("Alamat");
    I.waitForElement(formKtpPage.fields.address, 10);

    I.see("RT (tulis - jika tidak ada)");
    I.waitForElement(formKtpPage.fields.rt, 10);

    I.see("RW (tulis - jika tidak ada)");
    I.waitForElement(formKtpPage.fields.rw, 10);

    I.see("Provinsi");
    I.waitForElement(formKtpPage.dropDownsSearch.province, 10);

    I.see("Agama");
    I.waitForElement(formKtpPage.dropDowns.religion, 10);

    I.see("Status Perkawinan");
    I.waitForElement(formKtpPage.dropDowns.maritalStatus, 10);
});