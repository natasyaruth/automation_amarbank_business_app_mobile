const {
    I,
    headerPage,
    globalVariable,
    otpDao,
    resetStateDao,
    createPINPage
} = inject();

const dummyPIN = "121212";

Given("I am a customer who wants to create PIN", () => { });

Given("I am a customer who wants to create PIN from menu other", () => { });

Given("I am a customer who wants to change PIN from menu other", () => { });

Given("has friendlist with following details:", (table) => {

    const account = table.parse().rowsHash();

    if (process.env.ENVIRONMENT == "staging") {
        globalVariable.login.passwordFriendlist = account["passwordStg"];
        globalVariable.login.userIDFriendlist = account["userIDstg"];
    } else {
        globalVariable.login.passwordFriendlist = account["password"];
        globalVariable.login.userIDFriendlist = account["userID"];
    }

    // add API automation delete all notif
});

When("I don't have a PIN", () => { });

Then("I can see change password and create transaction pin", () => { 
    I.waitForElement(createPINPage.buttons.changePassword, 5);
    I.waitForElement(createPINPage.buttons.createPIN, 5);
});

When("I click create transaction pin", () => {
    createPINPage.goToCreatePIN();
});

When("I click change transaction pin", () => {
    createPINPage.goToChangePIN();
});

When("I click link forgot pin", () => {
    createPINPage.clickButtonForgotPIN();
});

Then("I will see bottom sheet call our team", () => {
    I.waitForText('Kami Akan membantu Anda dalam pembentukan rekening ataupun pinjaman', 5);
    I.see(createPINPage.buttons.whatsapp);
    I.see(createPINPage.buttons.emailSupport);
    createPINPage.closeBottomSheet();
});

When("I click button Create PIN", () => {
    createPINPage.clickPopUpCreatePIN();
});

When("I see pop up Create PIN", () => {
    I.waitForText("Buat PIN transaksi terlebih dahulu sebelum melakukan transfer", 20);
    createPINPage.popupCreatePIN();
});

When("I click button Back ke Dashboard", () => {
    createPINPage.clickButtonBackToDashboard();
});

Then("I will directly to Create New Transaction PIN page", () => {
    I.waitForText("Buat PIN", 10);
    // I.see("Silahkan masukkan password Amar Bank Bisnis Anda");
    I.waitForElement(createPINPage.icon, 10);
    I.waitForElement(createPINPage.fields.password, 10);
    I.waitForElement(createPINPage.buttons.nextpagetransfer, 10);
});

Then("I will directly to Create New PIN page", () => {
    I.waitForText("Buat PIN", 10);
    // I.see("Silahkan masukkan password Amar Bank Bisnis Anda");
    I.waitForElement(createPINPage.icon, 10);
    I.waitForElement(createPINPage.fields.password, 10);
    I.waitForElement(createPINPage.buttons.nextpagetransfer, 10);
});

Then("I will directly to Forgot PIN page", () => {
    I.waitForText("Lupa PIN", 10);
    I.see("Silahkan masukkan password Amar Bank Bisnis Anda");
    I.waitForElement(createPINPage.icon, 10);
    I.waitForElement(createPINPage.fields.password, 10);
    I.waitForElement(createPINPage.buttons.nextpagetransfer, 10);
});

Then("I will directly to Change PIN page", () => {
    I.waitForText("Ubah PIN", 10);
    I.see("Masukkan PIN Lama");
});

When("I input incorrect password", () => {
    createPINPage.inputPassword(globalVariable.login.dummyPassword);
});

When("I input incorrect old pin", () => {
    createPINPage.inputPIN(dummyPIN);
});

When("I submit my password", () => {
    createPINPage.submitPassword();
});

When("I submit my old pin", () => {

});

Then("I should see pop up message {string}", async (expectedMsgError) => {
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText(expectedMsgError, 10);
});

Then("I can click try again", () => {
    createPINPage.tryAgain();

    createPINPage.inputPassword(globalVariable.login.password);
    createPINPage.submitPassword();
    I.waitForElement(createPINPage.fields.newPIN, 10);
});

When("I input password", () => {
    createPINPage.inputPassword(globalVariable.login.password);
});

When("I submit incorrect password twice", () => {
    createPINPage.inputPassword(globalVariable.login.dummyPassword);
    createPINPage.submitPassword();
    createPINPage.tryAgain();
    createPINPage.inputPassword(globalVariable.login.dummyPassword);
    createPINPage.submitPassword();
});

When("I submit my old pin twice", () => {
    createPINPage.inputPIN(dummyPIN);
    createPINPage.tryAgain();
    I.wait(5);
    createPINPage.inputPIN(dummyPIN);
    createPINPage.tryAgain();
});

When("I submit my old pin three times", () => {
    createPINPage.inputPIN(dummyPIN);
    createPINPage.tryAgain();
    I.wait(5);
    createPINPage.inputPIN(dummyPIN);
    createPINPage.tryAgain();
    I.wait(5);
    createPINPage.inputPIN(dummyPIN);
});


When("I submit incorrect password three times", () => {
    createPINPage.inputPassword(globalVariable.login.dummyPassword);
    createPINPage.submitPassword();
    createPINPage.tryAgain();
    createPINPage.inputPassword(globalVariable.login.dummyPassword);
    createPINPage.submitPassword();
    createPINPage.tryAgain();
    createPINPage.inputPassword(globalVariable.login.dummyPassword);
    createPINPage.submitPassword();
});

When("I click icon eye", () => {
    createPINPage.clickEyePassword();
});

When("I click icon eye twice", () => {
    createPINPage.clickEyePassword();
    I.wait(5);
    createPINPage.clickEyePassword();
});

Then("I should direct to Dashboard", () => {
    I.waitForElement(createPINPage.buttons.btnTransfer, 10);
});

When("I reset my PIN", () => {

});

When("I click understand", () => {

    createPINPage.nexttoTransferPage();

});

When("I input old PIN with {string}", async (pin) => {
    I.waitForText("Masukkan PIN Lama", 10);
    createPINPage.inputPIN(pin);
});

When("I input new PIN with {string}", async (pin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN(pin);
    globalVariable.createPin.newPin = pin;
});

When("I confirm my new PIN", () => {
    I.waitForText("Konfirmasi PIN Baru", 10);
    createPINPage.inputConfirmationPIN(globalVariable.createPin.newPin);
});

When("I create PIN with {string}", async (newPin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN(newPin);
    globalVariable.createPin.newPin = newPin;
});

When("I confirm create PIN", () => {
    I.waitForText("Konfirmasi PIN Baru", 10);
    createPINPage.inputConfirmationPIN(globalVariable.createPin.newPin);
});

Then("I will see message error {string} in the below of field confirmation pin", async (expectedMessageError) => {
    let actualMessageError = await createPINPage.getMessageErrorPIN();
    I.assertEqual(actualMessageError, expectedMessageError);
});

Then("I will see message error {string} in the below of field otp code", async (expectedMessageError) => {
    let actualMessageError = await createPINPage.getMessageErrorOTP();
    I.assertEqual(actualMessageError, expectedMessageError);
});

When("I input incorrect OTP", async () => {
    createPINPage.fillInOtpCode("111111");
});

When("I input expired OTP", () => {
    I.wait(65);
    createPINPage.fillInOtpCode(globalVariable.createPin.otp);
});

When("I will receive email contain with OTP", async () => {
    const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;
    I.waitForText("Verifikasi E-mail", 10);
    I.see(email);
    I.see("Masukkan Kode Verifikasi");
    I.see("Kode verifikasi telah dikirim ke e-mail");
    I.wait(3);

    globalVariable.createPin.otp = (await otpDao.getOTPCreatePIN(globalVariable.login.userID, globalVariable.login.password)).otp;
});

When("I input OTP", async () => {

    I.waitForText("Verifikasi E-mail", 20);
    I.see("Masukkan Kode Verifikasi");
    I.see("Kode verifikasi telah dikirim ke e-mail");
    
    const otpCode = (await otpDao.getOTPCreatePIN(globalVariable.login.userID, globalVariable.login.password)).otp;

    createPINPage.fillInOtpCode(otpCode);
});

When("I input old PIN", () => {

});

When("I click button Close", () => {
    I.wait(2);
    createPINPage.clickButtonClose();
});

When("I click button cancel create PIN", () => {
    createPINPage.clickButtonCancel();
});

When("I click button back to fill password", () => {
    createPINPage.clickButtonBack();
});

When("I click back button to PIN", () => {
    createPINPage.clickButtonBackPinConfirm();
});

When("I should see close confirmation pop up", () => {
    I.waitForText("Anda yakin ingin membatalkan proses?", 10);
    I.see("Jika ya, Anda akan mengulang proses dari awal.");
    createPINPage.popupCancelCreatePIN();
});

When("I click button Cancel", () => {
    createPINPage.clickButtonCancelNo();
});

When("I click button yes, cancel it", () => {
    createPINPage.clickButtonCancel();
});

When("I click button back", () => {
    createPINPage.clickButtonBack();
});

Then("I should back to page fill PIN", () => {
    I.waitForText("Selamat, PIN Berhasil Dibuat!", 10);
});

Then("I should See Success Change PIN", () => {
    I.waitForText("Selamat, PIN Berhasil Diubah!", 10);
    createPINPage.clickBtnNext();
});

Then("I should stay on page fill PIN", () => {
    I.waitForText("Buat PIN Baru", 10);
});

Then("I should stay on page fill password", () => {
    I.waitForElement(createPINPage.fields.password, 10);
});

Then("My PIN successfully created", () => {
    I.waitForText("Selamat, PIN Berhasil Dibuat!", 10);
});

Then("I will directly go to Friend list page", () => {
    createPINPage.continueAfterCreatePin();
    // add waiting button friendlist
});

Then("I will go back to other page", () => {
    I.waitForElement(createPINPage.buttons.changePassword, 10);
    I.waitForElement(createPINPage.buttons.changePIN, 10);
});

Then("I will see toastbar {string}", (successPINMessage) => {
    I.see(successPINMessage);
});

Then("I can directly go to page login", () => {
    I.waitForText("Mengerti", 10);
    createPINPage.clickButtonUnderstand();
    createPINPage.goToLoginPage();
});

Then("I will direct to page PIN has been successfully changes", () => {

    I.waitForText("Selamat, PIN Berhasil Diubah!", 10);
    I.waitForText("Mengerti", 10);

    I.waitForElement(createPINPage.buttons.nextpagetransfer, 10);
});