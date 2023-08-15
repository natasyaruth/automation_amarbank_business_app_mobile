const { fields } = require("../pages/login");

const { I, loginPage } = inject();

Given("I am registered customer with following details:", (table) => {
    loginPage.clickLoginButton();
});

When("I am filling in my account information with the following details:",
(table)=>{
    const account = table.parse().rowsHash();
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

Then("I should see pop up with text {string} and {string} displayed",(actualMessage,actualValue)=>{})

Given("I am a customer lead want to login my account", () => {});

When("I am filling field {string} with {string}",(fieldName,actualValue)=>{
    loginPage.fillFieldLogin(fieldName, actualValue)
});

Then("I should see message error {string} in the below of field {string}",async(actualMessage, fieldName)=>{
    actualMessage = await loginPage.getMessageErrorFieldLogin(fieldName);
    I.assertEqual(actualMessage, expectedMsgError);
  });

When("I am filling in my account information with wrong password with details:{string}]",(actualValue)=>{});

Then ("I should see pop up {string} with button {string}", (expectedValue, buttonName)=>{
    I.see(expectedValue);
    if(expectedValue !== "Silakan coba masuk kembali setelah 30 menit."){
      I.seeElement(loginPage.buttons[buttonName]);
      loginPage.clickBackToPageLogin;
    } 
  });

When('I click iconEyePassword',()=>{
    loginPage.clickIconEyePassword();
});