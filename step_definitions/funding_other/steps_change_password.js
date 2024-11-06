const {
    I,
    resetStateDao,
    headerPage,
    changePasswordPage,
    otherPage,
    otpDao,
    loginPage,
    onboardingAccOpeningPage,
    globalVariable,
} = inject();

When("I click menu change password", () => {
    otherPage.clickChangePassword();
});

When("I close page input old password", () => {
    headerPage.closePageChangePass();
});

When("I click button cancel change password", () => {
    changePasswordPage.clickCancel();
});

When("I input my old password", () => {
    changePasswordPage.inputOldPassword(globalVariable.login.password);
    globalVariable.changePassword.oldPassword = globalVariable.login.password;
});

When("I input my old password with space in the back", () => {
    changePasswordPage.inputOldPassword(globalVariable.login.password + " ");
});

When("I input my old password with space in front", () => {
    changePasswordPage.inputOldPassword(" ");
    changePasswordPage.inputOldPassword(globalVariable.login.password);
});

When("I input my old password with whitespace", () => {
    changePasswordPage.inputOldPassword(" ");
});

When("I input my old password with space in the middle", () => {
    changePasswordPage.inputOldPassword("1234 Test");
});

When("I click next to input new password", () => {
    changePasswordPage.clickNext();
});

When("I close page input new password", () => {
    headerPage.closePage();
});

When("I click button back to change password", () => {
    changePasswordPage.clickBackToChangePassword();
});

When("I unmask my old password", () => {
    changePasswordPage.clickEyeOldPassword();
});

When("I mask my old password", () => {
    changePasswordPage.clickEyeOldPassword();
});

When("I unmask my new password", () => {
    changePasswordPage.clickEyeNewPassword();
});

When("I mask my new password", () => {
    changePasswordPage.clickEyeNewPassword();
});

When("I unmask confirmation password", () => {
    changePasswordPage.clickEyeConfirmPassword();
});

When("I mask confirmation password", () => {
    changePasswordPage.clickEyeConfirmPassword();
});

When("I clear my old password", () => {
    changePasswordPage.clearOldPassword();
});

When("I clear my new password", () => {
    changePasswordPage.clearNewPassword();
});

When("I clear confirm password", () => {
    changePasswordPage.clearConfirmPassword();
});

When("I input incorrect old password", () => {
    changePasswordPage.inputOldPassword("Duysfg332876498");
});

When("I input field {string} with value {string}", (field, password) => {
    if (
        field === "newPassword"
    ) {
        changePasswordPage.inputNewPassword(password);
        globalVariable.changePassword.newPassword = password;

    } else if (
        field === "confirmPassword"
    ) {
        changePasswordPage.inputConfirmPassword(password);
        globalVariable.changePassword.confirmPassword = password;
    }
});

When("I confirm my new password", () => {
    changePasswordPage.clickChangePassword();
});

When("I wait for 1 minutes", () => {
    I.wait(62);
});

When("I click link resend OTP change password", () => {
    changePasswordPage.clickResendOTP();
});

When("I input wrong OTP code", () => {
    changePasswordPage.clearOTP();
    changePasswordPage.inputOTP("000000");
});

When("I input OTP change password", async () => {
    const phoneNumber = (await changePasswordPage.getPhoneNumber()).replace(/ /g, '').replace(/\+/g, '');
    const otp = (await otpDao.getOTPUsingToken(globalVariable.login.userID, globalVariable.login.password)).otp;

    changePasswordPage.inputOTP(otp);
});

When("I click button direct to page login", () => {
    changePasswordPage.clickUnderstand();
});

When("I login again with my new password", () => {
    const newLogin = {
        userID: globalVariable.login.userID,
        password: globalVariable.changePassword.newPassword
    };

    loginPage.fillInAccountInformation(newLogin);
    loginPage.clickLoginButton();
    globalVariable.login.password = newLogin.password;
});

When("I login again with my old password", () => {
    const newLogin = {
        userID: globalVariable.login.userID,
        password: globalVariable.changePassword.oldPassword
    };

    loginPage.fillInAccountInformation(newLogin);
});

When("I fill form login with incorrect password", () => {
    const incorrectLogin = {
        userID: globalVariable.login.userID,
        password: globalVariable.login.dummyPassword,
    };

    loginPage.fillInAccountInformation(incorrectLogin);
});

Then("I will direct to page input old password", () => {
    I.waitForElement(headerPage.buttons.closePageChangePass, 10);
    I.dontSee(headerPage.icon.callCenter);
    I.see("Ubah Password");
    I.see("Password Lama");
    I.see("Masukkan password lama");
    I.waitForElement(changePasswordPage.fields.oldPassword, 10);
    I.waitForElement(changePasswordPage.icons.eyeOldPassword, 10);
    I.see("Selanjutnya");
    I.waitForElement(changePasswordPage.buttons.next, 10);
});

Then("I will see pop up cancel change password", () => {
    I.waitForText("Anda yakin ingin membatalkan proses?", 10);
    I.see("Jika ya, Anda akan mengulang proses dari awal.");

    I.see("Ya, Batalkan");
    I.waitForElement(changePasswordPage.buttons.cancel, 10);

    I.see("Tidak Jadi");
    I.waitForElement(changePasswordPage.buttons.backToChangePassword, 10);
});

Then("I will direct to page form input new password", () => {
    I.waitForText("Password Baru", 10);
    I.see("Masukkan password baru");
    I.see("Min. 8 karakter dari huruf besar, kecil & angka");
    I.waitForElement(changePasswordPage.fields.newPassword, 10);
    I.waitForElement(changePasswordPage.icons.eyeNewPassword, 10);

    I.see("Konfirmasi Password Baru");
    I.see("Masukkan konfirmasi password baru");
    I.see("Min. 8 karakter dari huruf besar, kecil & angka");
    I.waitForElement(changePasswordPage.fields.confirmPassword, 10);
    I.waitForElement(changePasswordPage.icons.eyeConfirmPassword, 10);

    I.see("Ubah Password");
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.dontSee(headerPage.icon.callCenter);

    I.see("Ubah Password");
    I.waitForElement(changePasswordPage.buttons.changePassword, 10);
});

Then("I will notify by message error {string} in field {string}", async (msgError, field) => {
    if (
        field === "newPassword" ||
        field === "confirmPassword"
    ) {
        I.wait(2);
    }

    const actualMsgError = await changePasswordPage.getMessageErrorFields(field);

    I.assertEqual(actualMsgError, msgError);
});

Then("I will not see message error {string} in field {string}", async (msgError, field) => {
    if (
        field === "newPassword" ||
        field === "confirmPassword"
    ) {
        const actualMsg = await changePasswordPage.getMessageErrorFields(field);
        I.assertEqual(actualMsg, "Min. 8 karakter dari huruf besar, kecil & angka");
        I.dontSee(msgError);

    } else {
        I.wait(1);
        I.dontSeeElement(changePasswordPage.msgErrorFields[field]);
        I.dontSee(msgError);
    }
});

Then("I will see my new password", () => {
    I.waitForText(globalVariable.changePassword.newPassword, 10);
});

Then("I will see my confirmation password", () => {
    I.waitForText(globalVariable.changePassword.confirmPassword, 10);
});

Then("I will not see my new password", () => {
    I.dontSee(globalVariable.changePassword.newPassword);
});

Then("I will not see my confirmation password", () => {
    I.dontSee(globalVariable.changePassword.confirmPassword);
});

Then("I will direct to page input OTP change password", async () => {
    I.waitForText("Kode OTP berhasil dikirim.", 20);
    I.see("Kode OTP");
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);
    I.dontSeeElement(headerPage.icon.callCenter);

    I.see("Masukkan Kode OTP");
    I.see("Kode OTP telah dikirim ke nomor");

    const phoneNumber = (await resetStateDao.getPhoneNumber(globalVariable.login.userID, globalVariable.login.password)).phoneNumber;
    I.dontSee(phoneNumber);
    
    I.waitForElement(changePasswordPage.fields.otp, 10);
});

Then("I will see snackbar OTP successfully sent", () => {
    I.waitForText("Kode OTP berhasil dikirim.", 20);
});

Then("I will direct to page success change password", () => {
    I.waitForText("Selamat, Password Berhasil " + "\n" + "Diubah!", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);
    I.dontSeeElement(headerPage.icon.callCenter);

    I.see("Mengerti");
    I.waitForElement(changePasswordPage.buttons.understand, 10);
});

Then("I reset back my password", async () => {
    onboardingAccOpeningPage.goToTabOthers();
    otherPage.clickChangePassword();

    changePasswordPage.inputOldPassword(globalVariable.changePassword.newPassword);
    changePasswordPage.clickNext();

    changePasswordPage.inputNewPassword(globalVariable.changePassword.oldPassword);
    changePasswordPage.inputConfirmPassword(globalVariable.changePassword.oldPassword);
    changePasswordPage.clickChangePassword();

    const phoneNumber = (await changePasswordPage.getPhoneNumber()).replace(/ /g, '').replace(/\+/g, '');
    const otp = (await otpDao.getOTPWithoutToken()).otp;

    changePasswordPage.inputOTP(otp);

    changePasswordPage.clickUnderstand();
});

Then("I reset attempt otp after login", async () => {

    await
        otpDao.resetLimitRequestOtpUsingToken(globalVariable.login.userID, globalVariable.login.password);
});

Then("I notified that I can verify the OTP tomorrow", async () => {

    const currentDate = new Date();
    const tomorrowDate = new Date(currentDate);
    tomorrowDate.setDate(currentDate.getDate() + 1);

    const day = tomorrowDate.getDate();
    const formattedDay = (day < 10 ? '0' : '') + day;
    const month = tomorrowDate.getMonth();
    const year = tomorrowDate.getFullYear();
    const months = [
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    ];

    const hours = currentDate.getHours();
    const minutes = currentDate.getMinutes();
    const currentTime = hours.toString().padStart(2, '0') + ":" + minutes.toString().padStart(2, '0');

    const actualMsgError = await changePasswordPage.getMessageErrorFields("otp");

    I.assertEqual(actualMsgError, "Kode OTP dapat dikirim kembali pada: tanggal " + formattedDay +
        " " + months[month] + " " + year + ", pukul " + currentTime);

    I.dontSeeElement(changePasswordPage.link.resendOtp);
    await
        otpDao.resetLimitRequestOtpUsingToken(globalVariable.login.userID, globalVariable.login.password);
});