const {
    I,
    welcomePage,
    registrationPage,
    forgotPasswordPage,
    loginPage,} = inject();

const globalVar = {
    password: "",
    userID: "",
};

Given("I am a customer who has failed to login {string} times with following details:", (countValue, table) => {
    welcomePage.clickButtonLogin();

    for (let i=0;i<countValue;i++) {

        const account = table.parse().rowsHash();
        globalVar.password = account["password"];
        globalVar.userID = account["userID"];
    }
});

Then("I successed go to dashbord",()=>{
    ///dashboard still on development from mobile
    ///I.see('Selamat, akun Anda berhasil dibuat')
    I.wait(2);
        loginPage.fillInAccountInformation(account);
        loginPage.clickLoginButton();
        I.waitForText("Data Yang Dimasukkan Salah", 10);
        loginPage.tryToLogin();
    });

Given("I am a registered customer with following details:", (table) => {
    welcomePage.clickButtonLogin();
});

When("I filling in form login with the following details:",
    (table) => {
        const account = table.parse().rowsHash();
        globalVar.password = account["password"];
        globalVar.userID = account["userID"];
        loginPage.fillInAccountInformation(account);
    }
);

When("I click login", () => {
    loginPage.clickLoginButton();
});

Then("I will direct to dashboard", () => {
    I.waitForText("Dashboard Screen", 10);
});

Given("I am an unregistered customer trying to login", () => {
    welcomePage.clickButtonLogin();
});

Then("I should see pop up with text {string} displayed", (actualMessage) => {
    I.waitForText(actualMessage, 10);
});

Then("I should see pop up with text {string} and {string} displayed", (infoMessage1, infoMessage2) => {
    I.waitForText(infoMessage1);
    I.waitForText(infoMessage2);
});

Then("I should be notified {string} in the below of field {string}", async (expectedMsgError, fieldName) => {
    actualMessage = await loginPage.getMessageErrorFieldLogin(fieldName);
    I.assertEqual(actualMessage, expectedMsgError);
});

Then("I should see pop up {string} with button {string}", (expectedValue, buttonName) => {
    I.waitForText(expectedValue, 10);
    I.seeElement(loginPage.buttons[buttonName]);
});

When('I click icon eye password', () => {
    loginPage.clickIconEyePassword();
});

When('I click icon eye password twice', () => {
    loginPage.clickIconEyePassword();
    loginPage.clickIconEyePassword();
});

Then('I should see my password', () => {
    I.see(globalVar.password);
});

Then('I should not see my password', () => {
    I.dontSee(globalVar.password);
});

Given("I am customer that already on page login", () => {
    loginPage.clickLoginButton();
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

Then("I should see new page with text {string} displayed", (actualMessage) => {
    I.waitForText(actualMessage, 10);
});

Then("I should see field {string} on page Forgot Password", (fieldName) => {
    I.seeElement(forgotPasswordPage.fields[fieldName]);
});

Then("I should see field {string} on page Registration", (fieldName) => {
    I.seeElement(registrationPage.fields[fieldName])
});

When("I click checkbox remember me", () => {
    loginPage.checkRememberMe();
});

When("I click logout", () => {
    I.waitForText("Dashboard Screen", 10);
    I.click("LOGOUT") // this only temporary because dashboard still on development
});

Then("I click button loan dashboard",()=>{
    loginPage.clickBtnOnBoardingPage();
});
Then("I should see checkbox remember me is checked", () => {
    I.waitForText("Masuk Akun", 10);
    I.seeAttributesOnElements(
        loginPage.checkbox.rememberMe,
        {
          checked: "true"
        }
    );
});

Then("I should see field user ID is filled with the last user ID", async () => {
    let actualUserID = await loginPage.getValueUserID();
    I.assertEqual(actualUserID, globalVar.userID);
});