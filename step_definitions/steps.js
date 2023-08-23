const { fields } = require("../pages/registration");

const {
  I,
  registrationPage,
  otpConfirmationPage,
  loginPage,
  welcomePage,
  headerPage,
  verificationEmailPage,
  whitelistDao,
  otpDao,
} = inject();

const globalVar = {
  phoneNumber: "",
  otpCode: "",
  email: "",
  password: "",
  companyName: "",
  businessCode: "",
}

Given("I am a customer lead wanting to open a new account", () => {});

Given("I am a customer want to access menu registration", () => {
  welcomePage.clickButtonRegister();
});

Given ("I am a customer lead wanting to register account business from invitation", () => {
  // step to get business code from email
  // step to get company name from email
});

When("I choose menu registration", () => {
  welcomePage.clickButtonRegister();
});

When(
  "I filling in my account information with the following details:",
  async (table) => {
    const account = table.parse().rowsHash();
    globalVar.phoneNumber = "62"+account["mobileNumber"];
    globalVar.email = account["email"];
    globalVar.password = account["password"];

    await whitelistDao.whitelistPhoneNumber(
      "+"+globalVar.phoneNumber
    );

    await whitelistDao.whitelistEmail(
      globalVar.email
    );

    registrationPage.fillInAccountInformation(account);
    registrationPage.clickCreateAccountButton();

    let actualPhoneNumber = await registrationPage.getValueInformation(
      "mobileNumber"
    );
    let actualEmail = await registrationPage.getValueInformation("email");

    I.assertEqual(actualPhoneNumber, "+62 " + account["mobileNumber"]);
    I.assertEqual(actualEmail, account["email"]);
  }
);

When("I registering the account", () => {
  registrationPage.clickButtonConfirm();
});

Then("my account should be created", () => {
  loginPage.native();
  loginPage.login();
  loginPage.shouldBeSuucess();
});

When("I verifying my phone number by entering the code sent to me", async () => {
  otpConfirmationPage.isOpen();
  let actualPhoneNumber = await otpConfirmationPage.getPhoneNumber();
  let expectedPhoneNumber = globalVar.phoneNumber.substring(2);

  I.see("Verifikasi Nomor HP");
  I.see("Kode OTP telah dikirim ke nomor");
  I.assertEqual(actualPhoneNumber, "+62 "+expectedPhoneNumber);

  globalVar.otpCode = (await otpDao.getOTP(globalVar.phoneNumber)).otp
  otpConfirmationPage.fillInOtpCode(globalVar.otpCode);
});

When ("I verifying my phone number by entering the wrong code", async () =>{
  otpConfirmationPage.isOpen();
  otpConfirmationPage.fillInOtpCode("000000");
});

When("I verifying my email by login by user id", async () => {
  I.waitForText("Verifikasi Email", 10);
  I.see("Segera Cek E-mail");
  I.see("Kami telah mengirim User ID ke e-mail:");

  let actualEmail = await verificationEmailPage.getEmailValue();
  I.assertEqual(actualEmail, globalVar.email);

  // step to get user id from email

  verificationEmailPage.loginWithUserId(userID, globalVar.password);
});

Given ("I am a customer had been registering the account with the following details:", async (table) => {
  const account = {
    fullName: "Ruth Natasya",
    email: "fakemail@email.com",
    mobileNumber: "81234567890",
    password: "Test1234",
    confirmPassword: "Test1234",
  };
  globalVar.phoneNumber = "62"+account["mobileNumber"];

  await whitelistDao.whitelistPhoneNumber(
    "+"+globalVar.phoneNumber
  );

  await whitelistDao.whitelistEmail(
    globalVar.email
  );

  welcomePage.clickButtonRegister();
  registrationPage.fillInAccountInformation(account);
  registrationPage.clickCreateAccountButton();
  registrationPage.clickButtonConfirm();
});

Then("I should be notified in the below of field OTP that {string}", async (expectedMsgError) => {
  let actualMsgError = await otpConfirmationPage.getMessageError();
  I.assertEqual(actualMsgError, expectedMsgError);
});

When("I am filling field {string} with {string}", (fieldName, actualValue) => {
  registrationPage.fillFieldRegistration(fieldName, actualValue);
});

Then(
  "I should see message error {string} in the below of field {string}",
  async (expectedMsgError, fieldName) => {
    let actualMessage = await registrationPage.getMessageErrorFieldRegistration(
      fieldName
    );
    I.assertEqual(actualMessage, expectedMsgError);
  }
);

Then ("I shouldn't see message error in the below of field {string}", async (fieldName) => {
  let infoFieldPassword = "Min. 8 karakter dari huruf besar, kecil & angka";
  let infoFieldBusinessCode = "Jika tidak ada, kosongkan kode bisnis.";

  if(fieldName === "password"){

    let messageField = await registrationPage.getMessageErrorFieldRegistration(fieldName);
    I.assertEqual(messageField, infoFieldPassword);

  } else if (fieldName === "businessCode") {

    let messageField = await registrationPage.getMessageErrorFieldRegistration(fieldName);
    I.assertEqual(messageField, infoFieldBusinessCode);

  } else {

    I.waitForInvisible(registrationPage.messageErrorFields[fieldName]);
  }

});

Then("I am clearing the field {string}", (fieldName) => {
  registrationPage.clearFieldsRegistration(fieldName);
});

Then("I submit form registration", () => {
  registrationPage.clickCreateAccountButton();
});

Then(
  "I should see {string} in field {string} with whitespace in the front is trimmed",
  async (expectedValue, fieldName) => {
    let actualValue = await registrationPage.getValueFromFieldRegistration(
      fieldName
    );
    I.assertEqual(actualValue, expectedValue);
  }
);

Then(
  "I will see {string} in field {string}",
  async (expectedValue, fieldName) => {
    let actualValue = await registrationPage.getValueFromFieldRegistration(
      fieldName
    );
    I.assertEqual(actualValue, expectedValue);
  }
);

When("I fill form registration except field {string}", (fieldName) => {
  const account = {
    fullName: "John Doe",
    email: "fakemail@email.com",
    mobileNumber: "81234567890",
    password: "Test1234",
    confirmPassword: "Test1234",
  };

  delete account[fieldName];
  registrationPage.fillInAccountInformation(account);
});

When(
  "I filling in my account business information with the following details:",
  async (table) => {
    const account = table.parse().rowsHash();
    globalVar.phoneNumber = "62"+account["mobileNumber"];
    globalVar.email = account["email"];
    globalVar.password = account["password"];

    await whitelistDao.whitelistPhoneNumber(
      "+"+globalVar.phoneNumber
    );

    await whitelistDao.whitelistEmail(
      globalVar.email
    );

    registrationPage.fillInAccountInformation(account);
    registrationPage.fillFieldRegistration("businessCode", globalVar.businessCode);
    globalVar.phoneNumber = "62"+account["mobileNumber"];  
    globalVar.password = account["password"];

    registrationPage.clickCreateAccountButton();

    let actualPhoneNumber = await registrationPage.getValueInformation('mobileNumber');
    let actualCompanyName = await registrationPage.getValueInformation('companyName');
    
    I.assertEqual(actualPhoneNumber, "+62 "+account['mobileNumber']);
    I.assertEqual(actualCompanyName, globalVar.companyName);
  }
);

When ("I click icon eye in {string} field", (fieldName) => {
  if(fieldName === "password"){
    registrationPage.clickIconEyePassword();
  } else if (fieldName === "confirmPassword") {
    registrationPage.clickIconEyeConfirmPassword();
  }
});

Then("I will see my password {string} in the field", (actualPassword) => {
  I.waitForText(actualPassword);
});

Then("I will not see my password {string} in the field", (actualPassword) => {
  I.dontSee(actualPassword);
});

When("I click link registration", () => {
  registrationPage.goToLoginPage();
});

When("I click link terms and condition", () => {
  registrationPage.goToTermsAndConditionPage();
});

When("I click link privacy and policy", () => {
  registrationPage.goToPrivacyPolicyPage();
});

When ("I click call center", () => {
  headerPage.goToCallCenter();
});

Then ("I will see helping center via whatsapp and email", () => {
  
});

Then ("I will directing to page login", ()=>{
  I.waitForText("Masuk Akun");
  I.seeElement(headerPage.buttons.back);
  // I.seeElement(loginPage) // field user id
  // I.seeElement(loginPage) // field password
  // I.seeElement(loginPage) // button login
});

Then("I will directing to web view terms and condition", () => {
  I.waitForText("Syarat dan Ketentuan");
  // rest the assertion of the text
});

Then("I will directing to web view privacy and policy", () => {
  I.waitForText("Kebijakan Privasi");
  // rest the assertion of the text
});

When("I click button back to page registration", () => {
  registrationPage.clickButtonBackToPageRegistration();
});

Then(
  "I will direct to page registration with each fields still has values as following:",
  async (table) => {
    registrationPage.clickIconEyePassword();
    registrationPage.clickIconEyeConfirmPassword();

    for (const id in table.rows) {
      const cells = table.rows[id].cells;

      let actualValue = await registrationPage.getValueFromFieldRegistration(
        cells[0].value
      );

      I.assertEqual(actualValue, cells[1].value);
    }
  }
);

When("I click button back in the page registration", () => {
  headerPage.clickButtonBack();
});

Then("I will direct to page onboarding", () => {
  I.seeElement(welcomePage.buttons.registration);
});

When ("I let the otp code expire", ()=>{
  I.wait(60);
  I.seeElement(otpConfirmationPage.links.resendOTP);
});

When("I verifying my phone number by entering the wrong code more than five times", () =>{
  otpConfirmationPage.isOpen();
  for(let attempts=0;attempts<5;attempts++){
    otpConfirmationPage.fillInOtpCode("123456");
    otpConfirmationPage.clearFieldOTP();
    I.wait(1);
  }
});

Then ("I can't filled the OTP field", () => {
  I.seeAttributesOnElements(otpConfirmationPage.fields.otp, { 
    enabled: "false"});
  I.seeAttributesOnElements(otpConfirmationPage.button.verifyPhoneNumber, { 
    enabled: "false"});  
});

Then ("I should be notified that I can reverify the phone number tomorrow", async () => {
  const currentDate = new Date();
  const tomorrowDate = new Date(currentDate);
  tomorrowDate.setDate(currentDate.getDate() + 1);

  const day = tomorrowDate.getDay();
  const month = tomorrowDate.getMonth();
  const year = tomorrowDate.getFullYear();
  const months = [
    "Jan", "Feb", "Mar", "Apr",
    "Mei", "Jun", "Jul", "Aug",
    "Sep", "Okt", "Nov", "Des"
  ];

  const hours = tomorrowDate.getHours();
  const minutes = tomorrowDate.getMinutes();
  const currentTime = hours.toString().padStart(2, '0')+":"+minutes.toString().padStart(2, '0');

  let actualMsgError = await otpConfirmationPage.getMessageError();

  I.assertEqual(actualMsgError, "Kode OTP dikirim kembali pada: tanggal "+day+
  " "+months[month]+" "+year+", pukul "+currentTime+" WIB");
});
