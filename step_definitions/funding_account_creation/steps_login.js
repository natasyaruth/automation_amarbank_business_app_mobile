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

Given("I login using my user id that I recently receive through email", async () => {
  welcomePage.clickButtonLogin();

  const account = {
    userID: globalVariable.login.userID,
    password: globalVariable.login.password
  };

  loginPage.fillInAccountInformation(account);
  loginPage.clickLoginButton();
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
  I.click()
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
  "I am a registered customer invited business with following details:",
  (table) => {
    welcomePage.clickButtonLogin();

    const account = table.parse().rowsHash();

    if (process.env.ENVIRONMENT == "staging") {
      globalVariable.login.password = account["passwordStg"];
      globalVariable.login.userID = account["userIDstg"];
    } else {
      globalVariable.login.password = account["password"];
      globalVariable.login.userID = account["userID"];
    }
  }
);

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

When("I click login", () => {
  loginPage.clickLoginButton();
});

Then("I will direct to dashboard", () => {
  I.waitForElement(onboardingAccOpeningPage.tabs.business, 30);
});

Given("I am an unregistered customer trying to login", () => {
  welcomePage.clickButtonLogin();
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
  "I should see pop up {string} with button {string}",
  (expectedValue, buttonName) => {
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.see(expectedValue);
    I.waitForElement(loginPage.buttons[buttonName], 10);

    if (globalVariable.login.countValue === 2) {
      loginPage.closeBottomSheet();
    } else {
      loginPage.tryToLogin();
    }

    loginPage.fillFieldLogin("userID", globalVariable.login.userID);
    loginPage.fillFieldLogin("password", globalVariable.login.password);
    loginPage.clickLoginButton();
    I.waitForElement(transferPage.buttons.sectionBtnTrf, 10);
  }
);

Then(
  "I should see pop up with information three times input incorrect data and can be tried in the next 10 minutes",
  () => {
    const currentDate = new Date();
    const hours = currentDate.getHours();
    const minutes = currentDate.getMinutes();
    const addMinutes = minutes + 10;

    const currentTime =
      hours.toString().padStart(2, "0") +
      ":" +
      addMinutes.toString().padStart(2, "0");

    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.see(
      "Tiga kali salah memasukan data. Silahkan coba lagi pada pukul " +
      currentTime
    );
  }
);

When("I click icon eye password", () => {
  loginPage.clickIconEyePassword();
});

When("I click icon eye password twice", () => {
  loginPage.clickIconEyePassword();
  loginPage.clickIconEyePassword();
});

Then("I should see my password", () => {
  I.waitForText(globalVariable.login.password, 10);
});

Then("I should not see my password", () => {
  I.dontSee(globalVariable.login.password);
});

Given("I am customer that already on page login", () => {
  welcomePage.clickButtonLogin();
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
});

When("I close bottom sheet biometric", () => {
  loginPage.closeBottomSheet();
});

Then("I should see bottom sheet that biometric still not activated yet", () => {
  I.waitForElement(loginPage.buttons.close, 10);

  I.see("Masuk dengan Biometrik");
  I.see("Fitur masuk dengan Biometrik belum aktif. Anda dapat mengaktifkan fitur ini melalui Menu Lainnya.")
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
