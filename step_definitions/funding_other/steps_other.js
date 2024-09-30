const { I,
    homePage,
    globalVariable,
    accountDeletionPage,
    onboardingAccOpeningPage,
    headerPage,
    resetStateDao,
} = inject();

When("I choose other", () =>{
    onboardingAccOpeningPage.goToTabOthers();
});

When("I click menu delete account", () => {
    accountDeletionPage.clickMenuAccountDelete();
});

When("I see page information account deletion", () => {
    I.waitForText("Permintaan Hapus Akun", 10);
    I.see("Bagaimana cara menghapus akun saya?");
    I.see("Sebelum menghapus akun, pastikan Anda melakukan hal-hal berikut ini:");
    I.see("1. Pahami secara menyeluruh bagaimana data Anda diatur pada Kebijakan Privasi Amar Bank.");
    I.see("2. Nasabah menyatakan tidak ada bilyet/cek yang masih beredar jika memang ada Buku Cek");
    I.see("3. Mengisi Aplikasi Penutupan (Form) yang akan dikirimkan via email ketika request penutupan akun sudah di submit via aplikasi");
    I.see("4. Pastikan email yang terdaftar aktif untuk menerima email dari customer service kami.");

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForText("Penting!", 10);
    I.see("1. Hapus akun berarti akan menghapus akun Amar Bank Bisnis dan tidak dapat diakses kembali.");
    I.see("2. Permintaan hapus akun Anda akan diproses oleh Customer Service kami.");
    I.see("3. Nasabah mengembalikan bilyet/cek jika memang dia ambil cheque book saat pembukaan rekening (jika ada).");

    I.seeElement(accountDeletionPage.buttons.continue);
    I.see("Lanjut Hapus Akun");
});

When("I see my user id and field password", () => {
    I.waitForText("Untuk keamanan, pastikan ini adalah akun Anda.", 10);
    I.see("Permintaan Hapus Akun");

    I.see(globalVariable.login.userID.toUpperCase());
    I.seeElement(accountDeletionPage.fields.password);
    I.seeElement(accountDeletionPage.buttons.iconEye);

    I.seeElement(accountDeletionPage.buttons.verify);
    I.see("Verifikasi");
});

When("I see field reason and my email", async() => {
    I.waitForText("Beritahu mengapa Anda ingin menghapus akun ?", 10);
    I.see("Permintaan Hapus Akun");

    const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;

    I.see("Informasi proses hapus akun akan dikirim ke email Anda: " + globalVariable.registration.email);
    I.seeElement(accountDeletionPage.fields.reason);

    I.seeElement(accountDeletionPage.buttons.submit);
    I.see("Kirim Permintaan Hapus Akun");
});

When("I fill my password account deletion", () => {
    accountDeletionPage.fillPassword(globalVariable.login.password);
});

When("I fill incorrect password account deletion", () => {
    accountDeletionPage.fillPassword("fgjd1234");
});

When("I fill my reason account deletion with {string}", (reason) => {
    accountDeletionPage.fillReason(reason);
});

When("I delete my reason", () => {
    accountDeletionPage.clearFieldReason();
});

When("I delete my password", () => {
    accountDeletionPage.clearFieldPassword();
});

When("I can click button try again", () => {
    accountDeletionPage.tryAgainPassword();
});

When("I unmask my password", () => {
    accountDeletionPage.clickEyePassword();
});

When("I mask my password", () => {
    accountDeletionPage.clickEyePassword();
});

When("I verify my data account deletion", () => {
    accountDeletionPage.verifyPassword();
});

When("I continue to verification delete account", () => {
    accountDeletionPage.continueDeleteAccount();
});

When("I submit my request account deletion", () => {
    accountDeletionPage.submitRequestAccDeletion();
});

When("I let field reason empty", () => {});

Then("I will see my password", () => {
    I.wait(1);
    I.see(globalVariable.login.password);
});

Then("I will not see my password", () => {
    I.wait(1);
    I.dontSee(globalVariable.login.password);
});

Then("I will back to menu other", () => {
    I.waitForElement(accountDeletionPage.buttons.deleteAccount, 10);
});

Then("I will see message error {string} in the below of field reason", async (expectedMessageError) => {
    let actualMessageError = await accountDeletionPage.getMessageErrorReason();
    I.assertEqual(actualMessageError, expectedMessageError);
});

Then("I will not see message error in the below of field reason", () => {
    I.wait(1);
    I.dontSee(accountDeletionPage.messageErrorField.reason);
});

Then("I see button verify is disable", async () => {
    I.wait(1);
    let stateButton = await I.grabAttributeFrom(accountDeletionPage.buttons.verify, 'enabled');
    I.assertEqual(stateButton, "false");
});

Then("I see button request delete account is disable", async () => {
    I.wait(1);
    let stateButton = await I.grabAttributeFrom(accountDeletionPage.buttons.submit, 'enabled');
    I.assertEqual(stateButton, "false");
});

Then("I will see message waiting to send the request", () => {
    I.waitForText("Mengirim Permintaan Hapus Akun", 10);
});

Then("I will direct to page my request account deletion still on process", () => {
    I.waitForText("Permintaan hapus akun Anda sedang diproses", 10);
    
    I.see("Proses hapus akun membutuhkan maksimal 10 hari kerja. Informasi selanjutnya akan dikirim ke email Anda.");
    I.see("Permintaan Hapus Akun");
});

