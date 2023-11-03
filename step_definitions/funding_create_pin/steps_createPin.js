const { messageErrorField } = require("../../pages/changePhoneNumber");
const { button } = require("../../pages/otpConfirmation");
const { messageErrorFields } = require("../../pages/registration");

const {
    I,
    createPINPage,
    headerPage,
    globalVariable,
} = inject();

const dummyPswrd = "Ruth!@#$$";


Given("I am a customer who wants to create PIN", () => { });

Given("I am a customer who wants to create PIN from menu other", () => { });

When("I don't have a PIN", () => { });

When("I choose other", () => {
    createPINPage.goToOtherMenu();
});

Then("I go to page other ", () => {
    Then("I can see change password and create transaction pin", () => { });
    I.waitForElement(createPINPage.buttons.changepPassword, 5);
    I.waitForElement(createPINPage.buttons.createPIN, 5);
});

When("I click create transaction pin", () => {
    createPINPage.goToCreatePIN();
});

Then("I will see bottom sheet call our team", () => {
    I.waitForText('Kami Akan membantu Anda dalam pembentukan rekening ataupun pinjaman', 5);
    I.see(createPINPage.buttons.whatsapp);
    I.see(createPINPage.buttons.emailSupport);
    createPINPage.closeBottomSheet();
});

When("I choose menu Transfer from main dashboard", () => {
    I.click("Transfer");
});

Then("I will directly to Create New PIN page", () => {
    I.waitForText("Buat PIN Transaksi", 10);
    I.see("Sebelum buat PIN Transaksi, masukkan password Amar Bank kamu");
    I.waitForElement(createPINPage.icon, 10);
    I.waitForElement(createPINPage.fields.password, 10);
    I.waitForElement(createPINPage.buttons.nextpagetransfer, 10);
});

When("I input incorrect password", () => {
    createPINPage.inputPassword(dummyPswrd);
});

When("I submit my password", () => {
    I.wait(5);
    createPINPage.submitPassword();
});

Then("I should see pop up message {string}", async (expectedMsgError) => {     
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText("Jika 3 kali salah akun Anda akan terblokir.", 10);
    createPINPage.tryAgain();
    createPINPage.inputPassword(globalVariable.login.password);
    createPINPage.submitPassword();
    I.waitForElement(createPINPage.fields.newPIN, 10);
});

When("I input password", () => {
    createPINPage.inputPassword(globalVariable.login.password);
});

When("I submit incorrect password twice", () => {
    createPINPage.inputPassword(dummyPswrd);
    createPINPage.submitPassword();
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText("Jika 3 kali salah akun Anda akan terblokir.", 10);
    createPINPage.tryAgain();


    createPINPage.inputPassword(dummyPswrd);
    createPINPage.submitPassword();
});


When("I submit incorrect password three times", () => {

    for (let loop = 0; loop < 2; loop++) {
        createPINPage.inputPassword(dummyPswrd);
        createPINPage.submitPassword();


        I.waitForText("Data Yang Dimasukkan Salah", 10);
        I.waitForText("Jika 3 kali salah akun Anda akan terblokir.", 10);
        createPINPage.tryAgain();
    }
    createPINPage.inputPassword(dummyPswrd);
    createPINPage.submitPassword();
});

Then("My account should be temporary blocked for 30 minutes", () => {
    I.waitForText("Akun Anda Terblokir", 10);
    I.waitForText("Silakan coba masuk kembali setelah 30 menit.",10);
    createPINPage.closeSheetBlocked();


    // createPINPage.inputPassword(globalVariable.login.password);
    // createPINPage.submitPassword();
    // I.waitForElement(createPINPage.fields.newPIN, 10);
})

When("I click icon eye", () => {
    createPINPage.clickEyePassword();
});

When("I click icon eye twice", () => {
    createPINPage.clickEyePassword();
    I.wait(1);
    createPINPage.clickEyePassword();
});

Then("I will see my password", () => {
    I.see(globalVariable.login.password);
});

Then("I will not see my password", () => {
    I.dontSee(globalVariable.login.password);
});

When("I input new PIN with {string}", async (newPin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN1(newPin);
    globalVariable.createPin.newPin = newPin;
});

When("I input new PIN with {string}", async (newPin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN2(newPin);
    globalVariable.createPin.newPin = newPin;
});

When("I input new PIN with {string}", async (newPin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN3(newPin);
    globalVariable.createPin.newPin = newPin;
});

When("I input new PIN with {string}", async (newPin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN(newPin);
    globalVariable.createPin.newPin = newPin;
});

When("I input new PIN with {string}", async (newPin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN(newPin);
    globalVariable.createPin.newPin = newPin;
});

When("I input new PIN with {string}", async (newPin) => {
    I.waitForText("Buat PIN Baru", 10);
    createPINPage.inputPIN(newPin);
    globalVariable.createPin.newPin = newPin;
});


When("I input incorrect confirmation new PIN", () => {
    I.waitForText("Konfirmasi PIN Baru", 10);


    const randomPin = createPINPage.getRandomNumberPin();
    createPINPage.inputPIN(randomPin);
});

When("I input confirmation new PIN", () => {
    I.waitForText("Konfirmasi PIN Baru", 10);
    createPINPage.inputPIN(globalVariable.createPin.newPin);
});

Then("I will see message error {string} in the below of field confirmation pin", async (expectedMessageError) => {
    let actualMessageError = await createPINPage.getMessageErrorPIN();
    I.assertEqual(actualMessageError, expectedMessageError);
    I.assertEqual(actualMessageError, expectedMessageError);
});

Then("I will see message error {string} in the below of field otp code", async (expectedMessageError) => {
    let actualMessageError = await createPINPage.getMessageErrorOTP();
    I.assertEqual(actualMessageError, expectedMessageError);
});

When("I input incorrect OTP", () => {
    I.waitForText("Verifikasi E-mail", 10);
    I.see("Masukkan Kode OTP");


    createPINPage.inputOTP("111111");
});

When("I input OTP", () => {
    // step to get OTP code from email using API
    createPINPage.inputOTP();
});

Then("My PIN successfully created", () => {
    I.waitForText("Selamat, PIN Berhasil Dibuat!", 10);
});

Then("I will directly go to Friend list page", () => {
    createPINPage.continueAfterCreatePin();
    // add waiting button friendlist
});

Then("I will go back to page other", () => {
    I.see(createPINPage.buttons.changepPassword);
    I.see(createPINPage.buttons.changePIN);

});
Then("I will see toastbar {string}", (successPINMessage) => {
    I.see(successPINMessage);
});