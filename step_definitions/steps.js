const { fields } = require("../pages/registration");

const { I, registrationPage, optConfirmationPage, loginPage } = inject();

Given("I am a customer lead wanting to open a new account", () => {});

When(
  "I am filling in my account information with the following details:",
  (table) => {
    const account = table.parse().rowsHash();
    registrationPage.fillInAccountInformation(account);
  }
);

When("registering the account", () => {
  registrationPage.clickCreateAccountButton();
});

Then("I should see the account created successfully", () => {});

When("I am verifying my phone number with the following details:", () => {
  optConfirmationPage.isOpen();
  optConfirmationPage.fillInOptCode("123456");
  optConfirmationPage.sendOtp();
});

Then("my account should be created", () => {
  loginPage.native();
  loginPage.login();
  loginPage.shouldBeSuucess();
});

When("verifying my phone number by entering the code sent to me", () => {
  // From "features/account_registration.feature" {"line":15,"column":5}
  throw new Error("Not implemented yet");
});

Given("had been registering the account with the following details:", () => {
  const account = {
    fullName: "John Doe",
    email: "fakemail@email.com",
    mobileNumber: "081234567890",
    password: "123456",
    password: "123456",
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

When( "I am filling field {string} with {string}", (fieldName, actualFullName) => {
  registrationPage.fillFieldRegistration(fieldName, actualFullName);
});

Then( "I should see message error {string} in the below of field {string}", (expectedMsgError, fieldName) => {
  let actualMessage = registrationPage.getMessageErrorFieldRegistration(fieldName);
  I.assertEqual(actualMessage,expectedMsgError);
});