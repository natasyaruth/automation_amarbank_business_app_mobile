const { fields } = require("../pages/registration");

const { I, registrationPage, optConfirmationPage, loginPage, welcomePage, headerPage} = inject();

Given("I am a customer lead wanting to open a new account", () => {});

Given("I am a customer want to access menu registration", () => {
  welcomePage.clickButtonRegister();
});

When ( "I choose menu registration", () => {
  welcomePage.clickButtonRegister();
});

When(
  "I filling in my account information with the following details:",
  async (table) => {
    const account = table.parse().rowsHash();
    const element = {

    }
    registrationPage.fillInAccountInformation(account);
    registrationPage.clickCreateAccountButton();

    let actualPhoneNumber = await registrationPage.getValueInformation('mobileNumber');
    let actualEmail = await registrationPage.getValueInformation('email');

    I.assertEqual(actualPhoneNumber, "+62 "+account['mobileNumber'])
    I.assertEqual(actualEmail, account['email'])
  }
);

When("registering the account", () => {
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

When("verifying my email by login by user id", () =>{
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

Then ("I shouldn't see message error in the below of field password", async () => {
  let infoFieldPassword = "Min. 8 karakter dari huruf besar, kecil & angka";

  let messageField = await registrationPage.getMessageErrorFieldRegistration("password");
  
  I.assertEqual(messageField, infoFieldPassword);
});

Then ("I am clearing the field {string}", (fieldName)=> {
  registrationPage.clearFieldsRegistration(fieldName); 
});

Then ("I submit form registration", () =>{
  registrationPage.clickCreateAccountButton();
});

Then ( "I should see {string} in field {string} with whitespace in the front is trimmed", async (expectedValue, fieldName) =>{
  let actualValue = await registrationPage.getValueFromFieldRegistration(fieldName);
  I.assertEqual(actualValue,expectedValue);
});

Then ("I will see {string} in field {string}", async (expectedValue, fieldName) =>{
  let actualValue = await registrationPage.getValueFromFieldRegistration(fieldName);
  I.assertEqual(actualValue, expectedValue);
});

When ("I fill form registration except field {string}", (fieldName) =>{
  const account = {
    fullName: "John Doe",
    email: "fakemail@email.com",
    mobileNumber: "81234567890",
    password: "Test1234",
    confirmPassword: "Test1234",
  };

  delete account[fieldName];
  registrationPage.fillInAccountInformation(account);
})

When ("I click icon eye in {string} field", (fieldName) => {
  if(fieldName === "password"){
    registrationPage.clickIconEyePassword();
  } else if (fieldName === "confirmPassword"){
    registrationPage.clickIconEyeConfirmPassword();
  }
})

Then ("I will see my password {string} in the field", (actualPassword) => {
  I.waitForText(actualPassword);
})

Then ("I will not see my password {string} in the field", (actualPassword) => {
  I.dontSee(actualPassword);
})

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
  I.waitForText("Masuk Akun");
  I.seeElement(headerPage.buttons.back);
  // I.seeElement(loginPage) // field user id
  // I.seeElement(loginPage) // field password
  // I.seeElement(loginPage) // button login
});

Then ("I will directing to web view terms and condition", () => {
  I.waitForText("Syarat dan Ketentuan");
  // rest the assertion of the text
});

Then ("I will directing to web view privacy and policy", () => {
  I.waitForText("Kebijakan Privasi");
  // rest the assertion of the text
});

When ("I click button back to page registration", () => {
  registrationPage.clickButtonBackToPageRegistration();
});

Then ("I will direct to page registration with each fields still has values as following:", async (table) => {
  registrationPage.clickIconEyePassword();
  registrationPage.clickIconEyeConfirmPassword();

  for(const id in table.rows){

    const cells = table.rows[id].cells;

    let actualValue = await registrationPage.getValueFromFieldRegistration(cells[0].value);

    I.assertEqual(actualValue, cells[1].value);

  }
});

When ("I click button back in the page registration", () => {
  headerPage.clickButtonBack()
});

Then ("I will direct to page onboarding", () => {
  I.seeElement(welcomePage.buttons.registration);
});