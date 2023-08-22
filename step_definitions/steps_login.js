const { fields } = require("../pages/login");

const { I, loginPage } = inject();

const globalVar = {
    password: "",
};

Given("I am registered customer with following details:", (table) => {
    loginPage.clickLoginButton();
});

When("I am filling in my account information with the following details:",
(table)=>{
    const account = table.parse().rowsHash();
    globalVar.password = account["password"];
    loginPage.fillInAccountInformation(account);
}
);

When("login with registered account",()=>{
    loginPage.clickLoginButton();
});

Then("I successed go to dashbord",()=>{
    I.see('Selamat, akun Anda berhasil dibuat')
});

Given("I am unregistered customer try to regist with unregistered account", () => {
    loginPage.clickLoginButton();
});

When("login with unregistered account",()=>{
    loginPage.clickLoginButton();
});

Then("I should see pop up with text {string} displayed",(actualMessage)=>{
    I.see(actualMessage);
});

Then("I should see pop up with text {string} and {string} displayed",(actualMessage,actualValue)=>{
    I.see(actualMessage);
});

Given("I am a customer lead want to login my account", () => {
    loginPage.clickLoginButton();
});

When("I am filling field {string} with {string}",(fieldName,actualValue)=>{
    loginPage.fillFieldLogin(fieldName, actualValue)
});

When("I login with password empty",()=>{
    loginPage.clickLoginButton();
});

When("I login with userID empty",()=>{
    loginPage.clickLoginButton();
});

When("I login with password and userID empty",()=>{
    loginPage.clickLoginButton();
})

Then("I should see message error {string} in the below of field {string}",async(expectedMsgError, fieldName)=>{
    actualMessage = await loginPage.getMessageErrorFieldLogin(fieldName);
    I.assertEqual(actualMessage, expectedMsgError);
  });

When("I am filling in my account information with wrong password with details:{string}]",(actualValue)=>{});

When("I login with wrong password",()=>{
    loginPage.clickLoginButton();
});

Then ("I should see pop up {string} with button {string}", (expectedValue, buttonName)=>{
    I.see(expectedValue);
    if(expectedValue !== "Silakan coba masuk kembali setelah 30 menit."){
      I.seeElement(loginPage.buttons[buttonName]);
      loginPage.clickBackToPageLogin;
    } 
  });

When('I click icon iconEyePassword',()=>{
    loginPage.clickIconEyePassword();
});

When('I click icon iconEyePassword for 2 times',()=>{
    loginPage.clickIconEyePassword();
    loginPage.clickIconEyePassword();
});

Then('I should see the password on field {string}',(fieldName)=>{
    I.see(globalVar.password);
});

Then('I should not see the password on field {string}',(fieldName)=>{
    I.dontSee(globalVar.password);
});

Given("I am customer that already on page login", () => {});

When("I click icon CallCenter",()=>{
    loginPage.clickIconCallCenter();
});

When("I click icon CallCenter",()=>{
    loginPage.clickGoToForgotPasswordPage();
});