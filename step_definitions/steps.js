const { fields } = require("../pages/registration");

const { I, registrationPage, optConfirmationPage, loginPage, welcomePage} = inject();

Given("I am a customer lead wanting to open a new account", () => {});

Given("I am a customer want to access menu registration", () => {});

Given("I am a customer want to access menu login from page registration", () => {});

When ( "I choose menu registration", () => {
  welcomePage.clickButtonRegister();
});

When(
  "filling in my account information with the following details:",
  (table) => {
    const account = table.parse().rowsHash();
    registrationPage.fillInAccountInformation(account);
  }
);

When("registering the account", () => {
  registrationPage.clickCreateAccountButton();
  registrationPage.clickButtonConfirm();
});

Then("I should see the account created successfully", () => {});

Then("my account should be created", () => {
  loginPage.native();
  loginPage.login();
  loginPage.shouldBeSuucess();
});

When("verifying my phone number by entering the code sent to me", () => {
  optConfirmationPage.isOpen();
  optConfirmationPage.fillInOptCode("123456");
  optConfirmationPage.sendOtp();
});

When(" verifying my email by login by user id", () =>{
  I.waitForText("Verifikasi Email");
  

});

Given("had been registering the account with the following details:", () => {
  const account = {
    fullName: "John Doe",
    email: "fakemail@email.com",
    mobileNumber: "081234567890",
    password: "123456",
    confirmPassword: "123456",
  };
  registrationPage.fillInAccountInformation(account);
  registrationPage.clickCreateAccountButton();
});

Given("The verification code sent to me is {string}", (expectedCode) => {});

When("I am verifying my phone number with the code {string}", (actualCode) => {
  optConfirmationPage.isOpen();
  optConfirmationPage.fillInOptCode(actualCode);
  optConfirmationPage.sendOtp();
});

Then("I should be notified that the code is invalid", () => {
  optConfirmationPage.getErrorMessage();
});

When( "I am filling field {string} with {string}", (fieldName, actualValue) => {
  registrationPage.fillFieldRegistration(fieldName, actualValue);
});

Then( "I should see message error {string} in the below of field {string}", async (expectedMsgError, fieldName) => {
  let actualMessage = await registrationPage.getMessageErrorFieldRegistration(fieldName);
  I.assertEqual(actualMessage, expectedMsgError);
});

Then ("I shouldn't see message error in the below of field fullname", () => {
  I.waitForInvisible(registrationPage.messageErrorFields.fullName);
});

Then ("I am clearing the field {string}", (fieldName)=> {
  registrationPage.clearFieldsRegistration(fieldName); 
});

Then ("I should see message error should be filled in all fields with following details:", async (table) => {
  const listMessageField = table.parse().rowsHash();

  Object.keys(listMessageField).forEach((key) => {
    let actualValue = registrationPage.getMessageErrorFieldRegistration(listMessageField[key]);
    I.assertEqual(actualValue, listMessageField[key]+" wajib diisi")
  })
});

Then ("I submit form without fill the fields", () =>{
  I.click(registrationPage.buttons.createAccount);
});

Then ( "I should see {string} in field {string} with whitespace in the front is trimmed", async (expectedValue, fieldName) =>{
  let actualValue = await registrationPage.getValueFromFieldRegistration(fieldName);
  I.assertEqual(actualValue,expectedValue);
});

When ("I click link registration", ()=>{
  registrationPage.goToLoginPage();
});

When ("I click link terms and condition", ()=>{
  registrationPage.goToTermsAndConditionPage();
});

When ("I click link privacy and policy", ()=>{
  registrationPage.goToPrivacyPolicyPage();
});

Then ("I will directing to page login", ()=>{
  I.waitForText("Masuk Akun")
  I.seeElement(loginPage) // field user id
  I.seeElement(loginPage) // field password
  I.seeElement(loginPage) // button login
});

Then ("I will directing to web view terms and condition", ()=>{
  I.waitForText("Syarat dan Ketentuan")
});

Then ("I will directing to web view privacy and policy", ()=>{
  I.waitForText("Kebijakan Privasi")
});