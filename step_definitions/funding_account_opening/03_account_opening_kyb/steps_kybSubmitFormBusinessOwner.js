const {
    I,
    formBusinessOwnerPage,
    formBusinessAddressPage,
    resetStateDao,
    whitelistDao,
    globalVariable
} = inject();

Given("I am a customer who has submitted my business profile", () => { });

Given("I am the only one business owner", async () => {
    I.waitForText("Pemilik bisnis", 10);

    const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;

    I.see(globalVariable.formKtp.fullName);
    I.see(email);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.dontSee(formBusinessOwnerPage.buttons.addListDirector);
});

Given("I am the only one business director", async() => {
    I.waitForText("Daftar Direktur sesuai akta", 10);
    // I.see("Silahkan menambah Daftar Direktur sesuai akta");

    const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;

    I.see(globalVariable.formKtp.fullName);
    I.see(email);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.waitForElement(formBusinessOwnerPage.buttons.addListDirector, 10);
});

When("I submit business owner list", () => {
    formBusinessOwnerPage.saveBusinessOwner();
});

When("I submit business director list", () => {
    formBusinessOwnerPage.saveListDirectors();
});

When("I submit business director", () => {
    formBusinessOwnerPage.saveDirector();
});

When("I click add business director", () => {
    formBusinessOwnerPage.addListDirector();
});

When("I fill business director data as followings:", async (table) => {
    let counterDirector = globalVariable.formDirector.numberOfDirectors;
    const informationDirector = table.parse().rowsHash();
    globalVariable.formDirector.fullName = informationDirector["fullName"];
    globalVariable.formDirector.email = informationDirector["email"];
    globalVariable.formDirector.nik = informationDirector["nik"];

    await whitelistDao.whitelistEmail(
        globalVariable.formDirector.email
    );

    formBusinessOwnerPage.fillFormAddDirector(informationDirector);

    globalVariable.formDirector.numberOfDirectors = counterDirector++;
});

When("I fill field {string} with {string} in form Add Director", (fieldName, valueField) => {
    formBusinessOwnerPage.fillField(fieldName, valueField);
});

When("I fill form Add Director except field {string}", (fieldName) => {
    const account = {
        fullName: "Dhani Aditya",
        email: "dhani.aditya@trash-mail.com",
        nik: "6633021710820021",
    };

    delete account[fieldName];

    formBusinessOwnerPage.fillFormAddDirector(account);
});

When("I clear the field {string} in form Add Director", (fieldName) => {
    formBusinessOwnerPage.clearField(fieldName);
});

Then("I shouldn't see message error in the below of field {string} in form Add Director", async (fieldName) => {
    I.wait(1);
    let nikInformation = "Daftar Direktur lain akan menerima email registrasi";

    if (fieldName === "email") {

        let messageField = await formBusinessOwnerPage.getMessageError(fieldName);
        I.assertEqual(messageField, nikInformation);

    } else {

        I.dontSee(formBusinessOwnerPage.messageErrorFields[fieldName]);
    }

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I should see message error {string} in the below of field {string} in form Add Director", async (expectedMsgError, fieldName) => {
    I.wait(1);
    let textMsgError = await formBusinessOwnerPage.getMessageError(fieldName);
    let actualMsgError = textMsgError.trimEnd();

    I.assertEqual(actualMsgError, expectedMsgError);

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

When("I save data director", () => {
    formBusinessOwnerPage.addDirector();
});

When("I update data director", () => {
    formBusinessOwnerPage.chooseUpdateDirector();
    formBusinessOwnerPage.clearAllFieldDirector();
});

When("I delete the director", () => {
    formBusinessOwnerPage.chooseDeleteDirector();
});

When("I confirm to delete the director", () => {
    I.waitForText("Apakah Anda akan menghapus direktur?", 10);
    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);
    I.see(globalVariable.formDirector.nik);
    formBusinessOwnerPage.confirmDeleteDirector();
    globalVariable.formDirector.numberOfDirectors -= 1;
});

When("I confirm to update data director", () => {
    I.see("Simpan");
    formBusinessOwnerPage.saveUpdateDirector();
});

When("I validate my first director", () => {
    I.waitForText("Direktur berhasil ditambah", 10);
    I.wait(3);
    formBusinessOwnerPage.swipeToButtonSaveListDirectors();

    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);
    I.see(globalVariable.formDirector.nik);
});

When("I validate all the data in the confirmation page", () => {
    I.waitForText("Konfirmasi Daftar Direktur Sesuai Akta", 10);
    const expectedText = `Jumlah direktur ${globalVariable.formDirector.numberOfDirectors} orang`;
    I.see(expectedText);
    I.waitForElement(formBusinessOwnerPage.buttons.confirmation, 10);
    I.waitForElement(formBusinessOwnerPage.buttons.backconfirmation, 10);
});

When("I validate deleted data should be not in the confirmation page", () => {
    I.waitForText("Konfirmasi Daftar Direktur Sesuai Akta", 10);
    const expectedText = `Jumlah direktur ${globalVariable.formDirector.numberOfDirectors} orang`;
    I.see(expectedText);
    I.waitForElement(formBusinessOwnerPage.buttons.confirmation, 10);
    I.waitForElement(formBusinessOwnerPage.buttons.backconfirmation, 10);
});

When("I validate my second director", () => {
    I.waitForText("Direktur berhasil ditambah", 10);
    formBusinessOwnerPage.swipeToButtonSaveListDirectors();

    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);
    I.see(globalVariable.formDirector.nik);
});

When("I confirm my director lists", () => {
    formBusinessOwnerPage.confirmListDirectors();
});

Then("I will notify business owner list has successfully submitted", () => {
    I.waitForText("Pemilik bisnis berhasil disimpan", 10);
});

Then("I will notify director successfully deleted", () => {
    I.waitForText("Direktur berhasil dihapus", 10);
});

Then("I will notify director successfully updated", () => {
    I.waitForText("Direktur berhasil disimpan", 10);
});

Then("I will notify business director list has successfully submitted", () => {
    I.waitForText("Daftar Direktur berhasil disimpan", 10);
});

Then("I will directing to page business address", async () => {
    I.waitForElement(formBusinessAddressPage.fields.address, 10);
    I.seeElement(formBusinessAddressPage.checkBox.rights);
    I.dontSeeElement(formBusinessAddressPage.checkBox.termsAndCondition);
    I.dontSeeElement(formBusinessAddressPage.checkBox.privy);
    I.see("Lanjut Upload Dokumen");

    I.see("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk");
    I.dontSee("Saya mengizinkan Amar Bank untuk menyimpan dan memproses data pribadi saya untuk pembuatan rekening dan peningkatan kualitas serta layanan dari aplikasi.");
    I.dontSee("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat. ");

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I will not be able to see the deleted data director", async () => {
    I.waitForElement(formBusinessOwnerPage.buttons.saveListDirectors);
    I.dontSee(globalVariable.formDirector.fullName);
    I.dontSee(globalVariable.formDirector.email);
    I.dontSee(globalVariable.formDirector.nik);
    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});

Then("I will see the updated director", async () => {
    formBusinessOwnerPage.swipeToButtonSaveListDirectors();
    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);
    I.see(globalVariable.formDirector.nik);
    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
});