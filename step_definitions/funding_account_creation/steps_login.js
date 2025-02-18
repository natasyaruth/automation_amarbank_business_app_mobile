const {
  I,
  welcomePage,
  headerPage,
  registrationPage,
  loginPage,
  onboardingAccOpeningPage,
  globalVariable,
  resetStateDao,
  otpConfirmationPage
} = inject();

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

Given("I am an unregistered customer trying to login", () => {
  welcomePage.clickButtonLogin();
});

Given("I am customer that already on page login", () => {
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

When("I click logout", () => {
  loginPage.clickLogout();
});

When("I click try again to login", () => {
  I.wait(1);
  loginPage.tryToLogin();
});

Then("I should see pop up with text {string} displayed", (actualMessage) => {
  I.waitForText(actualMessage, 10);
});

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

Then("I should see new page with text {string} displayed", (actualMessage) => {
  I.waitForText(actualMessage, 10);
});

Then("I should see field {string} on page Registration", (fieldName) => {
  I.waitForElement(registrationPage.fields[fieldName], 10);
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

Then("I will direct to dashboard", async () => {
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

    if (
      numberMinutes > 60
    ) {

      diffMinutes = numberMinutes - 60;
      numberHours = numberHours + 1;
      currentTime = numberHours + ":" + diffMinutes;

    } else if (

      numberMinutes = 60
    ) {

      numberHours = numberHours + 1;
      currentTime = numberHours + ":00"

    } else {

    }

    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.see(
      "Tiga kali salah memasukkan data. Silahkan coba lagi pada pukul " +
      currentTime
    );
  }
);

Then("I should see my password", () => {
  I.waitForText(globalVariable.login.password, 10);
});

Then("I should not see my password", () => {
  I.dontSee(globalVariable.login.password);
});