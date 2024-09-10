const { msgError } = require("../../pages/otpConfirmation");

const {
  I,
  loginPage,
  welcomePage,
  forgotPasswordPage,
  resetStateDao,
  globalVariable } = inject();

Given("I am a customer want to reset password", () => {
  welcomePage.clickButtonLogin();
  loginPage.goToForgotPasswordPage();
  forgotPasswordPage.isOpen();
});

Given("I leave field User ID empty", () => { });

Given("I am a customer with User ID and email has already requested a password reset", async() => {
  welcomePage.clickButtonLogin();
  loginPage.goToForgotPasswordPage();
  forgotPasswordPage.isOpen();

  const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;

  forgotPasswordPage.fillUserID(globalVariable.login.userID);
  forgotPasswordPage.fillEmail(email);
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

When("I input email for reset password with value {string}", (email) => {
  forgotPasswordPage.fillEmail(email);
});

When("I input email for reset password", async ()=>{
  const email = (await resetStateDao.getEmail(globalVariable.login.userID, globalVariable.login.password)).email;
  forgotPasswordPage.fillEmail(email);
});

When("I input wrong email for reset password", ()=>{
  forgotPasswordPage.fillEmail("randomABC123@test.mail.com");
});

When("I am filling field User ID", () => {
  forgotPasswordPage.fillUserID(globalVariable.login.userID);
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

  const companyName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;

  I.assertEqual(actualUserID, globalVariable.login.userID);
  I.assertEqual(actualCompanyName, companyName);

  forgotPasswordPage.clickButtonConfirm();
});

When("I click button back from pop up reset password", async () => {
  let actualUserID = await forgotPasswordPage.getUserID();
  let actualCompanyName = await forgotPasswordPage.getCompanyName();

  const companyName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;

  I.assertEqual(actualUserID, globalVariable.login.userID);
  I.assertEqual(actualCompanyName, companyName);

  forgotPasswordPage.backtoPageResetPassword();
});

When("I click try again to reset password", () => {
  forgotPasswordPage.clickTryAgain();
});

When("I click link forgot password", () => {
  loginPage.goToForgotPasswordPage();
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
  I.wait(1);
  I.waitForText(globalVariable.login.userID, 10);
});

Then("I will see pop up information reset password with text {string}", (wordingMsg) => {
  I.waitForText("Data Yang Dimasukkan Salah", 10);
  I.waitForText(wordingMsg, 10);
});

Then("I should be notified {string} in the below of field {string} forgot password", async (wordingMsg, field) => {
  const actualMsg = await forgotPasswordPage.getMessageError(field);

  I.assertEqual(actualMsg, wordingMsg);
});

Then("I will see information about the reset password can be done in the next 10 minutes", () => {
  const currentDate = new Date();
  const hours = currentDate.getHours();
  const minutes = currentDate.getMinutes();
  const addMinutes = minutes + 10;

  const currentTime = hours.toString().padStart(2, '0') + ":" + addMinutes.toString().padStart(2, '0');

  I.waitForText("Mohon menunggu", 10);
  I.see("Silahkan coba lagi pada pukul " + currentTime + " untuk melakukan Reset Password");

  forgotPasswordPage.clickUnderstand();
});

Then("I click button understand to direct to page login", () => {
  forgotPasswordPage.clickUnderstand();
});