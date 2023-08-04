const { fields } = require("../pages/login");

const { I, registrationPage, optConfirmationPage, loginPage } = inject();

Given("I am registered customer with following details: userID is JOHN12j3 and password is Pass1234", () => {});

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
    //mungkin akan ditambahkan dashboardpage nanti,
    //karena setelah login masuk ke dashboard
});

Given("I am unregistered customer try to regist with unregistered account", () => {});

When("login with unregistered account",()=>{
    loginPage.clickLoginButton();
});

Then("I should see pop up with text {string} displayed",(actualMessage)=>{})

Given("I am a customer lead want to login my account", () => {});

When("I am filling field {string} with {string}",(fieldName,actualValue)=>{
    loginPage.fillFieldLogin(fieldName, actualValue)
});

Then("I should see message error {string} in the below of field {string}",async(actualMessage, fieldName)=>{
    let actualMessage = await loginPage.getMessageErrorFieldLogin(fieldName);
    I.assertEqual(actualMessage, expectedMsgError);
  });

