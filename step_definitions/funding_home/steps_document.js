const { I,
    documentPage,
    profilePage,
    otherPage,
    globalVariable,
    resetStateDao,
} = inject();

When("I click document giro", () => {
    documentPage.clickDocumentGiro();
});

When("I click tab document", () => {
    documentPage.clickTabDocument();
});

When("I click button document loan", () => {
    documentPage.clickDocumentLoan();
});

When("I click top list of my loan", () => {
    documentPage.clickItemLoan();
});

When("I click direct to input password document", () => {
    documentPage.clickLinkUsePassword();
});

When("I input password document", () => {
    documentPage.inputPassword(globalVariable.login.password);
});

When("I input wrong password document", () => {
    documentPage.inputPassword("qwer490754395");
});

When("I clear my password", () => {
    documentPage.clearPassword();
});

When("I click see my document", () => {
    documentPage.clickSeeDocument();
});

When("I will see pop up biometric is inactive", () => {
    I.waitForElement(documentPage.buttons.closePopUp, 10);
    I.see("Untuk melihat dokumen, Anda bisa mengaktifkan fitur Biometrik melalui Menu Lainnya");

    I.see("Aktifkan Sekarang");
    I.waitForElement(documentPage.buttons.activatedNow, 10);

    I.see("Atau Gunakan Password");
    I.waitForElement(documentPage.links.usePassword, 10);
});

When("I close activated my biometric via document", () => {
    documentPage.closePopUpBiometricInactive();
});

When("I click activated my biometric via document", () => {
    documentPage.clickActivatedBiometric();
});

When("I close bottom sheet password", () => {
    documentPage.closeBottomSheetPassword();
});

When("I unmask my password document", () => {
    documentPage.clickIconEyePassword();
});

When("I mask my password document", () => {
    documentPage.clickIconEyePassword();
});

Then("I will direct to page document business", () => {
    I.waitForText("Dokumen", 20);
    I.dontSee("Dokumen Bisnis");
});

Then("I will see message error password incorrect", async() => {
    const actualMsgError = await documentPage.getMessageErrorPassword();

    I.assertEqual(actualMsgError, "Password yang dimasukkan salah");
});

Then("I will see bottom sheet input password document", () => {
    I.waitForText("Untuk melihat dokumen masukkan password Anda", 10);
    I.waitForElement(documentPage.fields.password, 10);
    I.waitForElement(documentPage.buttons.closePopUp, 10);

    I.see("Password");
    I.see("Masukkan password");
    I.waitForElement(documentPage.buttons.eyePassword, 10);

    I.see("Lihat Dokumen");
    I.waitForElement(documentPage.buttons.seeDocument, 10);
});

Then("I will see button see document is enabled", async() => {
    const isEnabled = await I.grabAttributeFrom(documentPage.buttons.seeDocument, 'disabled');

    I.assertEqual(isEnabled, 'false');
});

Then("I will see button see document is disabled", async() => {
    const isEnabled = await I.grabAttributeFrom(documentPage.buttons.seeDocument, 'disabled');

    I.assertEqual(isEnabled, 'true');

});

Then("I will not see button document giro", () => {
    I.dontSeeElement(documentPage.buttons.documentGiro);
});

Then("I will see button document giro", () => {
    I.waitForElement(documentPage.buttons.documentGiro, 10);
});

Then("I will see button document loan", ()=>{
    I.waitForElement(documentPage.buttons.documentLoan, 10);
});

Then("I will not see button document loan", ()=>{
    I.dontSeeElement(documentPage.buttons.documentLoan);
});

Then("I will see list of my loan", ()=>{
    I.waitForText("Pilih Nomor Pinjaman", 10)
    I.waitForElement(documentPage.buttons.itemLoan, 10);
});

Then("I will see page document loan is empty", ()=>{
    I.waitForText("Pilih Nomor Pinjaman", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
});

Then("I will see list of document loan", ()=>{
    I.waitForText("Dokumen Pinjaman", 10)
    I.waitForElement(documentPage.buttons.itemDocumentLoan, 10);
});

Then("I will see document page is empty", ()=>{
    I.waitForText("Dokumen", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Belum ada dokumen yang tersedia untuk ditampilkan.");
    I.dontSeeElement(documentPage.buttons.documentGiro);
    I.dontSeeElement(documentPage.buttons.documentLoan);
});

Then("I will see document loan is empty", ()=>{
    I.waitForText("Pilih Nomor Pinjaman", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
});

Then("I will see button document giro and document loan", ()=>{
    I.waitForElement(documentPage.buttons.documentGiro, 10);
    I.waitForElement(documentPage.buttons.documentLoan, 10);
});

Then("I will see document business for type company", () => {
    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");
    I.see("NIB.pdf");

    I.seeElement(documentPage.buttons.downloadDeed);
    I.see("Akta Perusahaan");
    I.see("Akta Perusahaan.pdf");

    I.seeElement(documentPage.buttons.downloadSk);
    I.see("SK Kemenkumham");
    I.see("SK Kemenkumham.pdf");

    I.seeElement(documentPage.buttons.downloadNpwp);
    I.see("NPWP Perusahaan");
    I.see("NPWP Perusahaan.pdf");

    I.see("Dokumen Giro");
});

Then("I will see document business for type individual company", () => {
    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");
    I.see("NIB.pdf");

    I.seeElement(documentPage.buttons.downloadDeed);
    I.see("Akta Perusahaan");
    I.see("Akta Perusahaan.pdf");

    I.dontSeeElement(documentPage.buttons.downloadSk);
    I.dontSee("SK Kemenkumham");
    I.dontSee("SK Kemenkumham.pdf");

    I.dontSeeElement(documentPage.buttons.downloadNpwp);
    I.dontSee("NPWP Perusahaan");
    I.dontSee("NPWP Perusahaan.pdf");

    I.see("Dokumen Giro");
});

Then("I will see one document giro", () => {
    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");
    I.see("NIB.pdf");

    I.see("Dokumen Giro");
});

Then("I will see toogle biometric is off", () => {
    I.waitForElement(otherPage.buttons.toogleBiometric, 10);
});

Then("I reset attempt failed password", async() => {
    await
        resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
});

Then("I will direct to Tab Other", () => {

    I.waitForText("Keamanan", 10);
    I.see("Ubah Password");
    I.waitForElement(otherPage.buttons.changePassword, 10);
    I.see("Lainnya");

    I.see("Ubah PIN");
    I.waitForElement(otherPage.buttons.changePin, 10);

    I.see("Hapus Akun");
    I.waitForElement(otherPage.buttons.deleteAccount, 10);

    I.see("Aktifkan Biometrik");
    I.waitForElement(otherPage.buttons.activatedBiometric, 10);
    I.waitForElement(otherPage.buttons.toogleBiometric, 10);

    I.see("Permintaan");
    I.see("Buku Cek / Bilyet Giro");
    I.waitForElement(otherPage.buttons.checkBook, 10);

    I.see("Bantuan");
    I.see("Kami akan membantu Anda dalam pembentukan rekening ataupun pinjaman");
    I.waitForElement(otherPage.buttons.email, 10);
    I.see("support.bisnis@amarbank.co.id");

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForText("Keluar", 20);
    I.waitForElement(otherPage.buttons.btnLogout, 10);
});