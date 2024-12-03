const {
  I,
  welcomePage,
  headerPage,
  registrationPage,
  forgotPasswordPage,
  loginPage,
  transferPage,
  onboardingAccOpeningPage,
  globalVariable,
  getDataDao,
  resetStateDao,
  mockingDao,
} = inject();

Given(
  "I am a customer who has failed to login {string} times with following details:",
  (countValue, table) => {
    welcomePage.clickButtonLogin();

    for (let i = 0; i < countValue; i++) {
      const account = table.parse().rowsHash();

      if (process.env.ENVIRONMENT == "staging") {
        globalVariable.login.password = account["passwordStg"];
        globalVariable.login.userID = account["userIDstg"];
      } else {
        globalVariable.login.password = account["password"];
        globalVariable.login.userID = account["userID"];
      }
    }
    globalVariable.login.countValue = countValue;
  }
);

Given(
  "I login using my user id that I recently receive through email",
  async () => {
    welcomePage.clickButtonLogin();

    const account = {
      userID: globalVariable.login.userID,
      password: globalVariable.login.password,
    };

    loginPage.fillInAccountInformation(account);
    loginPage.clickLoginButton();
  }
);

Given("I login using user id partner", async () => {
  const account = {
    userID: globalVariable.login.userIDPartner,
    password: globalVariable.registration.passwordPartner,
  };

  globalVariable.login.userID = account.userID;
  globalVariable.login.password = account.password;
  loginPage.fillInAccountInformation(account);
  loginPage.clickLoginButton();
});

Given("I reset my device id to new device", async () => {
  await
    resetStateDao.resetDeviceId(globalVariable.login.userID, globalVariable.login.password, globalVariable.login.newDeviceID);
});

Given("I delete my new device id", async () => {
  await resetStateDao.deleteDeviceId(globalVariable.login.newDeviceID);
});

Given("I am a registered customer with following details:", (table) => {
  welcomePage.clickButtonLogin();

  const account = table.parse().rowsHash();

  if (process.env.ENVIRONMENT == "staging") {
    globalVariable.login.password = account["passwordStg"];
    globalVariable.login.userID = account["userIDstg"];
  } else {
    globalVariable.login.password = account["password"];
    globalVariable.login.userID = account["userID"];
  }
});

Given(
  "has partner with following details:",
  (table) => {

    const account = table.parse().rowsHash();

    if (process.env.ENVIRONMENT == "staging") {
      globalVariable.login.passwordPartner = account["passwordStg"];
      globalVariable.login.userIDPartner = account["userIDstg"];
    } else {
      globalVariable.login.passwordPartner = account["password"];
      globalVariable.login.userIDPartner = account["userID"];
    }
  }
);

Given(
  "has partner more than one, with partner one details as following:",
  (table) => {

    const account = table.parse().rowsHash();

    globalVariable.login.listUserID.unshift(globalVariable.login.userID);
    globalVariable.login.listPassword.unshift(globalVariable.login.password);

    if (process.env.ENVIRONMENT == "staging") {
      globalVariable.login.listUserID.unshift(account["userIDstg"]);
      globalVariable.login.listPassword.unshift(account["passwordStg"]);
    } else {
      globalVariable.login.listUserID.unshift(account["userID"]);
      globalVariable.login.listPassword.unshift(account["password"]);
    }
  }
);

Given(
  "other partner is:",
  (table) => {

    const account = table.parse().rowsHash();

    if (process.env.ENVIRONMENT == "staging") {
      globalVariable.login.listUserID.unshift(account["userIDstg"]);
      globalVariable.login.listPassword.unshift(account["passwordStg"]);
    } else {
      globalVariable.login.listUserID.unshift(account["userID"]);
      globalVariable.login.listPassword.unshift(account["password"]);
    }
  }
);

Given("I delete device id {string}", async (deviceId) => {
  await resetStateDao.deleteDeviceId(deviceId);
});

Given("I have new device id {string}", async (newDeviceId) => {
  globalVariable.login.newDeviceID = newDeviceId;
});

Given("I have last step journey before", async () => {
  globalVariable.login.lastStep = (await getDataDao.getLastStepJourney(globalVariable.login.userID, globalVariable.login.password)).step;
});

Given("I am an unregistered customer trying to login", () => {
  welcomePage.clickButtonLogin();
});

Given("I am customer that already on page login", () => {
  welcomePage.clickButtonLogin();
});

Given("I am an unregistered customer trying to login", () => {
  welcomePage.clickButtonLogin();
});

When("I filling in form login with the following details:", (table) => {
  const account = table.parse().rowsHash();

  if (process.env.ENVIRONMENT == "staging") {
    account["password"] = account["passwordStg"];
    account["userID"] = account["userIDstg"];
  }

  globalVariable.login.password = account["password"];
  globalVariable.login.userID = account["userID"];

  loginPage.fillInAccountInformation(account);
});

When("I login with account friendlist", () => {
  loginPage.fillFieldLogin("userID", globalVariable.login.userIDPartner);
  loginPage.fillFieldLogin("password", globalVariable.login.passwordPartner);

  loginPage.clickLoginButton();
});

When("I login using account initiator", () => {

  loginPage.fillFieldLogin("userID", globalVariable.login.userIDInitiator);
  loginPage.fillFieldLogin("password", globalVariable.login.password);

  loginPage.clickLoginButton();
});

When("I click login", () => {
  loginPage.clickLoginButton();
});

When("I click link registration", () => {
  loginPage.goToRegistrationPage();
});

When("I click icon eye password", () => {
  loginPage.clickIconEyePassword();
});

When("I click icon eye password twice", () => {
  loginPage.clickIconEyePassword();
  loginPage.clickIconEyePassword();
});

When("I click button login via biometric", () => {
  loginPage.clickBiometric();
});

When("I click call center", () => {
  loginPage.clickIconCallCenter();
});

When("I click forgot password", () => {
  loginPage.goToForgotPasswordPage();
});

When("I click registration", () => {
  loginPage.goToRegistrationPage();
});

When("I click later in pop up biometric", () => {
  loginPage.clickLaterBiometric();
  I.wait(1);
});

When("I close bottom sheet biometric", () => {
  loginPage.closeBottomSheet();
});

When("I will see bottom sheet register new device", () => {
  I.waitForElement(loginPage.buttons.close, 10);
  I.waitForText("Perangkat Baru Terdeteksi", 10);
  I.see(
    "Daftarkan perangkat ini untuk dapat mengakses akun Anda. Demi keamanan, Anda tidak dapat mengakses akun Amar Bank Bisnis melalui perangkat lama lagi."
  );

  I.see("Batal");
  I.waitForElement(loginPage.buttons.cancelNewDevice, 10);

  I.see("Daftarkan");
  I.waitForElement(loginPage.buttons.registerNewDevice, 10);
});

When("I click button register new device", () => {
  loginPage.clickRegisterNewDevice();
});

When("I will direct to page verification new device", () => {
  I.waitForElement(headerPage.buttons.closePage, 10);
  I.waitForElement(loginPage.buttons.callCenter, 10);

  I.waitForText("Verifikasi Data Anda Menggunakan Selfie", 10);
  I.see(
    "Untuk mengubah data, silakan lakukan selfie seperti pada saat Anda registrasi awal untuk memastikan data Anda benar."
  );

  I.see("Lanjut Ambil Selfie");
  I.waitForElement(loginPage.buttons.continueSelfie, 10);
});

When("I click button continue to take selfie", () => {
  loginPage.continueTakeSelfie();
});

When("I will see bottom sheet permission", () => {
  I.waitForElement(loginPage.buttons.close, 10);

  I.waitForText("Amar Bank membutuhkan izin perangkat", 10);
  I.see("Akses Kamera dibutuhkan untuk memverifikasi bahwa Anda adalah pemilik akun pada perangkat ini.");
  I.see("Akses Lokasi dibutuhkan untuk memverifikasi bahwa Anda adalah pemilik akun pada perangkat ini.");
  I.see("Kami memastikan data Anda tidak akan disalahgunakan.");

  I.see("Saya Mengerti");
  I.waitForElement(loginPage.buttons.understand, 10);
});

When("I understand about the permission", () => {
  loginPage.understandPermission();
});

When("I will direct to page take selfie", () => {
  I.waitForText("Selfie", 10);
  I.waitForText(
    "Pastikan foto selfie tidak buram, tidak terkena pantulan cahaya dan tidak terpotong",
    10
  );

  I.waitForElement(loginPage.buttons.takeSelfie, 10);
  I.dontSee(loginPage.buttons.reTakeSelfie);
  I.dontSee("Ulangi");
});

When("I take picture selfie for matching the face", () => {
  I.wait(3);
  loginPage.takePicture();
});

When("I take picture selfie with face is blur", async () => {
  I.wait(3);

  await mockingDao.livenessFaceBlur();

  loginPage.takePicture();
});

When("I will see pop up option PDP login", async () => {
  I.waitForText("Persetujuan Penggunaan Data dan Informasi Pribadi", 10);
  I.see("Wajib dicentang");

  I.see("Saya telah membaca dan memberikan persetujuan kepada PT Bank Amar Indonesia, Tbk untuk keperluan yang telah disampaikan.".trimEnd());
  I.waitForElement(registrationPage.checkButton.firstPdp, 10);

  I.see("Saya menyetujui PT Bank Amar Indonesia, Tbk untuk mengirimkan informasi pemasaran, termasuk produk, promosi, dan penawaran khusus.".trimEnd());
  I.waitForElement(registrationPage.checkButton.secondPdp, 10);

  I.see("Masuk Akun");
  I.waitForElement(registrationPage.statusElement.buttonLogin, 10);
  const isEnabled = await I.grabAttributeFrom(registrationPage.statusElement.buttonLogin, 'enabled');
  I.assertEqual(isEnabled, 'false');
});

When("I take picture selfie with face is dark", async () => {
  I.wait(3);

  await mockingDao.livenessFaceBlur();

  loginPage.takePicture();
});

When("I take picture selfie with no face", async () => {
  I.wait(3);

  await mockingDao.livenessFaceNotDetected();

  loginPage.takePicture();
});

When("I take picture selfie with face is blur and dark", async () => {
  I.wait(3);

  await mockingDao.livenessFaceBlurAndDark();

  loginPage.takePicture();
});

When("I take picture selfie with server is error", async () => {
  I.wait(3);

  await mockingDao.livenessError();

  loginPage.takePicture();
});

When("I will direct to page preview selfie picture", () => {
  I.waitForElement(loginPage.buttons.reTakeSelfie, 10);
  I.waitForText("Ulangi", 10);
});

When("I retake my picture selfie", () => {
  loginPage.retakePicture();
});

When("I submit my selfie photo", () => {
  loginPage.submitPhoto();
});

When("I will mock liveness to success", async () => {
  // API to disabled checking device id

  await mockingDao.livenessSuccess();
});

When("I will direct to page verification is failed", () => {
  I.waitForElement(headerPage.buttons.closePage, 10);

  const currentDate = new Date();
  const tomorrowDate = new Date(currentDate);
  tomorrowDate.setDate(currentDate.getDate() + 1);

  const hours = tomorrowDate.getHours();
  const minutes = tomorrowDate.getMinutes();
  const currentTime =
    hours.toString().padStart(2, "0") +
    ":" +
    minutes.toString().padStart(2, "0");

  const day = tomorrowDate.getDate();
  const formattedDay = (day < 10 ? "0" : "") + day;
  const month = tomorrowDate.getMonth();
  const year = tomorrowDate.getFullYear();
  const months = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  globalVariable.login.date = formattedDay + " " + months[month] + " " + year;
  globalVariable.login.time = currentTime;

  I.waitForElement(loginPage.buttons.callCenter, 10);

  I.waitForText("Verifikasi Data Gagal", 10);
  I.see(
    "Amar Bank belum bisa melayani Anda di perangkat baru. Saat ini akun Anda terblokir dalam 1x24 jam."
  );

  I.see("Saya Mengerti");
  I.waitForElement(loginPage.buttons.understand, 10);
});

When("I understand about the information", () => {
  loginPage.understandInformation();
});

When("I click cancel register new device", () => {
  loginPage.cancelNewDevice();
});

When("I click close bottom sheet register new device", () => {
  loginPage.closeBottomSheet();
});

When("I close page verification new device", () => {
  headerPage.closePage();
});

When("I click button continue to page login", () => {
  loginPage.continueToMainDashboard();
});

When("I click checkbox remember me", () => {
  loginPage.checkRememberMe();
});

When("I click logout", () => {
  I.wait(3);
  I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
  loginPage.clickLogout();
});

When("I click try again to login", () => {
  I.wait(1);
  loginPage.tryToLogin();
});

When("I click to see terms and conditions", () => {
  registrationPage.readTnC();
});

When("I want continue to see PDP", () => {
  registrationPage.backToPDP();
});

When("I cancel continue to see PDP", () => {
  registrationPage.cancelPDP();
});

When("I submit the PDP login", () => {
  loginPage.submitPDPLogin();
});

Then("I should see pop up with text {string} displayed", (actualMessage) => {
  I.waitForText(actualMessage, 10);
});

Then(
  "I should see pop up with text {string} and {string} displayed",
  (infoMessage1, infoMessage2) => {
    I.waitForText(infoMessage1);
    I.waitForText(infoMessage2);
  }
);

Then(
  "I should be notified {string} in the below of field {string}",
  async (expectedMsgError, fieldName) => {
    actualMessage = await loginPage.getMessageErrorFieldLogin(fieldName);
    I.assertEqual(actualMessage, expectedMsgError);
  }
);

Then(
  "I should see log in pop up {string} with button {string}",
  async (expectedValue, buttonName) => {
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText(expectedValue, 10);
    I.waitForElement(loginPage.buttons[buttonName], 10);
  }
);

Then(
  "I reset attempt failed login",
  async () => {
    await
      resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
  });

Then("I successed go to dashbord", () => {
  ///dashboard still on development from mobile
  ///I.see('Selamat, akun Anda berhasil dibuat')
  I.wait(10);
  // loginPage.fillInAccountInformation(account);
  // loginPage.clickLoginButton();
  // I.waitForText("Data Yang Dimasukkan Salah", 10);
  // loginPage.tryToLogin();
});

Then("I click menu loan dashboard", () => {
  I.click();
});

Then("I should see bottom sheet that biometric still not activated yet", () => {
  I.waitForElement(loginPage.buttons.close, 10);

  I.see("Masuk dengan Biometrik");
  I.see(
    "Fitur masuk dengan Biometrik belum aktif. Anda dapat mengaktifkan fitur ini melalui Menu Lainnya."
  );
});

Then("I should see new page with text {string} displayed", (actualMessage) => {
  I.waitForText(actualMessage, 10);
});

Then("I should see field {string} on page Forgot Password", (fieldName) => {
  I.seeElement(forgotPasswordPage.fields[fieldName]);
});

Then("I should see field {string} on page Registration", (fieldName) => {
  I.waitForElement(registrationPage.fields[fieldName], 10);
});

Then("I click button loan dashboard", () => {
  loginPage.clickBtnOnBoardingPage();
});

Then("I should see checkbox remember me is checked", () => {
  I.waitForText("Masuk Akun", 10);
  I.seeAttributesOnElements(loginPage.checkbox.rememberMe, {
    checked: "true",
  });
});

Then("I should see field user ID is filled with the last user ID", async () => {
  let actualUserID = await loginPage.getValueUserID();
  I.assertEqual(actualUserID, globalVariable.login.userID);
});

Then("I should see bottom sheet call center with email", () => {
  I.waitForElement(headerPage.buttons.close, 10);
  I.see("Hubungi Tim Kami");
  I.see(
    "Kami akan membantu Anda dalam" +
    "\n" +
    "pembentukan rekening ataupun pinjaman"
  );
  I.see("support.bisnis@amarbank.co.id");
});

Then("I will direct to page verification face is success", () => {
  I.waitForText("Verifikasi Data Berhasil", 20);
  I.see(
    "Anda dapat menggunakan kembali fitur Amar Bank Bisnis di perangkat ini."
  );

  I.dontSee(headerPage.buttons.back);
  I.dontSee(headerPage.buttons.close);
  I.dontSee(loginPage.buttons.callCenter);

  I.dontSee("Menuju Dashboard");
  I.see("Masuk Akun");
  I.waitForElement(loginPage.buttons.continueToMainDashboard, 10);
});

Then("I will see snackbar error upload photo {string}", (errorMsg) => {
  I.waitForText(errorMsg, 10);
  I.wait(2);
});

Then("I will reset my attempt failed face match", async () => {
  await
    resetStateDao.resetAttemptFailedFaceMatch(globalVariable.login.userID);
});

Then("I will direct to dashboard", async () => {
  if (await I.CheckIsElementVisible("~buttonStarFive", 5)) {
    I.seeElement("~buttonStarFive");
  } else {
    I.waitForElement(onboardingAccOpeningPage.tabs.business, 30);
  }
});

Then(
  "I will see information that my account can be opened tomorrow",
  async () => {
    I.waitForElement(loginPage.buttons.close, 10);

    I.see("Akun Anda Terblokir");
    I.see("Silakan coba lagi pada");

    const actualInfo = await loginPage.getInfoMessageBlocked();
    const expInfo =
      globalVariable.login.date + ", pukul " + globalVariable.login.time;
    I.assertEqual(actualInfo, expInfo);
  }
);

Then("my last journey step is not change", async () => {
  const actualLastStep = (await getDataDao.getLastStepJourney(globalVariable.login.userID, globalVariable.login.password)).step;
  I.assertEqual(actualLastStep, globalVariable.login.lastStep);
});

Then("I will back to page login", () => {
  I.waitForText("Masuk Akun", 10);

  I.see(globalVariable.login.userID);
  I.waitForElement(loginPage.fields.userID, 10);

  loginPage.clickIconEyePassword();
  I.see(globalVariable.login.password);
});

Then("I will see information my account has been blocked", () => {
  I.waitForElement(loginPage.buttons.close, 10);

  I.see("Akun Anda Terblokir");
});

Then("I successed go to dashbord", () => {
  I.wait(10);
});

Then("I click menu loan dashboard", () => {
  I.click()
});

Then("I will direct to dashboard", () => {
  I.waitForElement(onboardingAccOpeningPage.tabs.business, 30);
});

Then("I should see pop up with text {string} displayed", (actualMessage) => {
  I.waitForText(actualMessage, 10);
});

Then(
  "I should see pop up with text {string} and {string} displayed",
  (infoMessage1, infoMessage2) => {
    I.waitForText(infoMessage1);
    I.waitForText(infoMessage2);
  }
);

Then(
  "I should be notified {string} in the below of field {string}",
  async (expectedMsgError, fieldName) => {
    actualMessage = await loginPage.getMessageErrorFieldLogin(fieldName);
    I.assertEqual(actualMessage, expectedMsgError);
  }
);

Then(
  "I should see log in pop up {string} with button {string}",
  async (expectedValue, buttonName) => {
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText(expectedValue, 10);
    I.waitForElement(loginPage.buttons[buttonName], 10);
  });

Then(
  "I reset attempt failed login",
  async () => {
    await
      resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
  });

Then(
  "I should see pop up with information three times input incorrect data and can be tried in the next 10 minutes",
  () => {
    const currentDate = new Date();
    const hours = currentDate.getHours();
    const minutes = currentDate.getMinutes();
    const addMinutes = minutes + 10;
    let formattedHours = hours.toString().padStart(2, "0");
    let formattedMinutes = addMinutes.toString().padStart(2, "0");
    let diffMinutes;
    let currentTime;

    if (
      formattedHours.substring(0, 1) === "0"
    ) {
      formattedHours = formattedHours.substring(0, 1);
    }

    let numberHours = parseInt(formattedHours);
    let numberMinutes = parseInt(formattedMinutes);



    // if (
    //   numberMinutes > 60
    // ) {

    //   diffMinutes = numberMinutes - 60;
    //   numberHours = numberHours + 1;
    //   currentTime = numberHours + ":" + diffMinutes;

    // } else if (

    //   numberMinutes = 60
    // ) {

    //   numberHours = numberHours + 1;
    //   currentTime = numberHours + ":00"

    // } else {

    // }

    // I.waitForText("Data Yang Dimasukkan Salah", 10);
    // I.see(
    //   "Tiga kali salah memasukkan data. Silahkan coba lagi pada pukul " +
    //   currentTime
    // );
  }
);

Then("I should see my password", () => {
  I.waitForText(globalVariable.login.password, 10);
});

Then("I should not see my password", () => {
  I.dontSee(globalVariable.login.password);
});

Then("I see pop up Terms Updates", () => {
  I.waitForText("Pembaruan Ketentuan", 10);
  I.see("Demi keamanan dan kenyamanan data pribadi Anda, baca dan pahami ketentuan terbaru dari PT Amar Bank Indonesia Tbk.");

  I.see("Baca Syarat & Ketentuan");
  I.waitForElement(registrationPage.buttons.readTnC, 10);
});

Then("I see pop up confirm to exit", () => {
  I.waitForText("Persetujuan Dibutuhkan", 10);
  I.see("Anda harus menyetujui kebijakan pelindungan data pribadi untuk dapat terus menggunakan aplikasi ini.");

  I.see("Lanjutkan");
  I.waitForElement(registrationPage.buttons.backPDP, 10);

  I.see("Keluar");
  I.waitForElement(registrationPage.buttons.closePDP, 10);
});