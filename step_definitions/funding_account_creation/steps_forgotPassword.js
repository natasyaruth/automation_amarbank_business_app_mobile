const {
  I,
  loginPage,
  welcomePage,
  forgotPasswordPage } = inject();

const globalVar = {
  userID: "",
  companyName: "",
}

Given("I am a customer want to reset password", () => {
  welcomePage.clickButtonLogin();
  loginPage.goToForgotPasswordPage();
  forgotPasswordPage.isOpen();
});

Given("I leave field User ID empty", () => { });

Given("I am a customer has User ID {string} and company name {string}", (userID, companyName) => {
  globalVar.userID = userID;
  globalVar.companyName = companyName;
});

Given("I am a customer with User ID {string} has already requested a password reset", (userID) => {
  welcomePage.clickButtonLogin();
  loginPage.goToForgotPasswordPage();
  forgotPasswordPage.isOpen();

  forgotPasswordPage.fillUserID(userID);
  forgotPasswordPage.clickButtonResetPassword();

  I.waitForText("Segera Cek E-mail", 10);
});

Given("I am a customer with User ID {string} and obtained from registration by business code", (userID) => {
  welcomePage.clickButtonLogin();
  loginPage.goToForgotPasswordPage();
  forgotPasswordPage.isOpen();

  forgotPasswordPage.fillUserID(userID);
  forgotPasswordPage.clickButtonResetPassword();

  I.waitForText("Segera Cek E-mail", 10);
});

Given("who has not received the reset password email", () => { });

When("I am filling field User ID with {string}", (actualValue) => {
  forgotPasswordPage.fillUserID(actualValue);
});

When("I click button Reset Password", () => {
  forgotPasswordPage.clickButtonResetPassword();
});

When("I resend email reset password", () => {
  forgotPasswordPage.resendEmail();
});

When("I click button confirmation reset password", async () => {
  let actualUserID = await forgotPasswordPage.getUserID();
  let actualCompanyName = await forgotPasswordPage.getCompanyName();

  I.assertEqual(actualUserID, globalVar.userID);
  I.assertEqual(actualCompanyName, globalVar.companyName);

  forgotPasswordPage.clickButtonConfirm();
});

When("I click button back from pop up reset password", async () => {
  let actualUserID = await forgotPasswordPage.getUserID();
  let actualCompanyName = await forgotPasswordPage.getCompanyName();

  I.assertEqual(actualUserID, globalVar.userID);
  I.assertEqual(actualCompanyName, globalVar.companyName);

  forgotPasswordPage.backtoPageResetPassword()
});

Then("I should be notified {string}", async (expectedMsgError) => {
  let actualMsgError = await forgotPasswordPage.getMessageError();
  I.assertEqual(actualMsgError, expectedMsgError);
});

Then("I should be notified that email Reset Password successfully sent", () => {
  I.waitForText("Segera Cek E-mail", 10);
  I.see("Kami telah mengirim email konfirmasi untuk reset password ke:");
  I.see("Silakan klik verifikasi untuk mereset password Anda.");
  I.see("Belum menerima email?");
  I.seeElement(forgotPasswordPage.link.resendEmail);
  I.seeElement(forgotPasswordPage.buttons.checkEmail);
});

Then("I should be notified that email reset password has been successfully sent", () => {
  I.waitForText("E-mail berhasil dikirim.", 10);
});


Then("I should back to page reset password with field User ID still filled", () => {
  I.waitForText(globalVar.userID, 10);
});