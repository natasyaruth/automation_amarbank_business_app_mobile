const {
  I,
  registrationPage,
  otpConfirmationPage,
  welcomePage,
  loginPage,
  headerPage,
  verificationEmailPage,
  whitelistDao,
  otpDao,
  getDataDao,
  firstRegistrationDao,
  changePhoneNumberPage,
  onboardingAccOpeningPage,
  globalVariable,
  resetStateDao,
  uploadDao,
} = inject();

Given("I am a customer open app amarbank business", () => { });

Given("I am a customer lead wanting to open a new account", () => { });

Given("I am a customer want to access menu registration", () => {
  welcomePage.clickButtonRegister();
});

Given("My company name is {string}", (companyName) => {
  globalVariable.registration.companyName = companyName;
});

Given(
  "I am a customer lead wanting to register account business from invitation",
  async () => { }
);

Given(
  "I am a customer that recently registered to amarbank business with data as below",
  async (registration) => {
    const account = registration.parse().rowsHash();

    await whitelistDao.whitelistPhoneNumber(
      "+62" + account["phoneNumber"]
    );

    await whitelistDao.whitelistEmail(
      account["email"]
    );

    await
      resetStateDao.resetEmailFromRegisterInvitee(account["email"]);

    globalVariable.registration.phoneNumber = "62" + account["phoneNumber"];
    globalVariable.registration.email = account["email"];
    globalVariable.login.password = account["password"];

    await otpDao.requestOTP("+" + globalVariable.registration.phoneNumber);

    const otpCode = (
      await otpDao.getOTP(globalVariable.registration.phoneNumber)
    ).otp;
    account.otp = otpCode;

    await
      firstRegistrationDao.firstRegistration(account);

    globalVariable.login.userID = (await otpDao.getUserID(account["email"])).userID;

    await
      resetStateDao.submitPDP(globalVariable.login.userID, globalVariable.login.password);

    globalVariable.login.userIDInitiator = globalVariable.login.userID;
  });

Given("I've requested OTP {string} times", (timesAttempt) => {
  I.wait(3)
  for (let i = 0; i < timesAttempt; i++) {
    I.waitForElement(otpConfirmationPage.links.resendOTP, 70);
    otpConfirmationPage.resendOTP();
    I.waitForInvisible(otpConfirmationPage.links.resendOTP, 5);
  }
});

Given("still not agree with PDP concern", async () => {
  // API to update status PDP
});

Given(
  "I am a customer had been registering the account with the following details:",
  async (table) => {
    const account = table.parse().rowsHash();
    globalVariable.registration.phoneNumber = "62" + account["mobileNumber"];
    globalVariable.registration.email = account["email"];

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumber
    );

    await whitelistDao.whitelistEmail(globalVariable.registration.email);

    await otpDao.resetLimitRequestOtp(globalVariable.registration.phoneNumber);

    welcomePage.clickButtonRegister();
    registrationPage.fillInAccountInformation(account);
    registrationPage.clickCreateAccountButton();
  }
);

Given("I've requested OTP {string} times", (timesAttempt) => {
  I.wait(3);
  for (let i = 0; i < timesAttempt; i++) {
    I.waitForElement(otpConfirmationPage.links.resendOTP, 70);
    otpConfirmationPage.resendOTP();
    I.waitForInvisible(otpConfirmationPage.links.resendOTP, 5);
  }
});

Given(
  "I register customer {string} times",
  async (count) => {
    const account = {
      fullName: "Testing",
      email: "testing@email.co.id",
      phoneNumber: "8129797809",
      password: "1234Test",
      confirmPassword: "1234Test",
      otp: ""
    }

    const countNumber = parseInt(count);

    for (let i = 0; i < countNumber; i++) {
      await whitelistDao.whitelistPhoneNumber(
        "+62" + account.phoneNumber
      );

      await whitelistDao.whitelistEmail(
        account.email
      );

      await
        resetStateDao.resetEmailFromRegisterInvitee(account.email);

      await otpDao.requestOTP("+62" + account.phoneNumber);

      const otpCode = (
        await otpDao.getOTP("62" + account.phoneNumber)
      ).otp;
      account.otp = otpCode;

      await
        firstRegistrationDao.firstRegistration(account);

      const userID = (await otpDao.getUserID(account.email)).userID

      globalVariable.login.listUserID.unshift(userID);
    }
  });

When("I choose menu registration", () => {
  welcomePage.clickButtonRegister();
});

When("I see carousel onboarding", () => {
  I.waitForElement(welcomePage.buttons.login, 10);
});

When("I swipe to next carousel", () => {
  I.swipeLeft(welcomePage.image.onboarding, 800, 800);
  I.wait(1);
});

When("I validate wording funding business", () => {
  I.see("Dapatkan Pendanaan untuk Bisnis Anda");
  I.see(
    "Menyediakan fasilitas pinjaman untuk mendapatkan modal usaha dan pengembangan bisnis Anda"
  );
});

When("I validate wording financial management", () => {
  I.see("Kelola Keuangan Bisnis Anda");
  I.see(
    "Menyediakan rekening bisnis dengan fitur pemrosesan transaksi, pengelolaan kas, dan laporan keuangan khusus."
  );
});

When("I validate wording financial and data privacy", () => {
  I.see("Kami menjaga keamanan data & finansial Anda");
  I.see(
    "Kami berkomitmen untuk menjaga keamanan data dan finansial Anda yang menjadi prioritas utama."
  );
});

When(
  "I filling in my account information with the following details:",
  async (table) => {
    const account = table.parse().rowsHash();
    globalVariable.registration.phoneNumber = "62" + account["mobileNumber"];
    globalVariable.registration.email = account["email"];
    const password = account["password"];
    globalVariable.registration.password = password;

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumber
    );

    await whitelistDao.whitelistEmail(globalVariable.registration.email);

    await
      resetStateDao.resetEmailFromRegisterInvitee(globalVariable.registration.email);

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

When("I verifying my phone number by entering the code sent to me", async () => {
  let actualPhoneNumber = await otpConfirmationPage.getPhoneNumber();
  let expectedPhoneNumber = globalVariable.registration.phoneNumber.substring(2);

  I.see("Verifikasi Nomor HP");
  I.see("Kode OTP telah dikirim ke nomor");
  I.assertEqual(actualPhoneNumber, "+62 " + expectedPhoneNumber);

  I.wait(3);

  globalVariable.registration.otpCode = (
    await otpDao.getOTP(globalVariable.registration.phoneNumber)
  ).otp;
  otpConfirmationPage.fillInOtpCode(globalVariable.registration.otpCode);
}
);

When("I verifying phone number invitee by entering the code", async () => {
  let actualPhoneNumber = await otpConfirmationPage.getPhoneNumber();
  let expectedPhoneNumber = globalVariable.registration.phoneNumberPartner;

  I.see("Verifikasi Nomor HP");
  I.see("Kode OTP telah dikirim ke nomor");
  I.assertEqual(actualPhoneNumber, "+62 " + expectedPhoneNumber);

  I.wait(3);

  globalVariable.registration.otpCode = (
    await otpDao.getOTP("62" + globalVariable.registration.phoneNumberPartner)
  ).otp;

  otpConfirmationPage.fillInOtpCode(globalVariable.registration.otpCode);
}
);

When("I verifying phone number new user by entering the code", async () => {
  let actualPhoneNumber = await otpConfirmationPage.getPhoneNumber();
  let expectedPhoneNumber = globalVariable.userManagement.phoneNumber;

  I.see("Verifikasi Nomor HP");
  I.see("Kode OTP telah dikirim ke nomor");
  I.assertEqual(actualPhoneNumber, "+62 " + expectedPhoneNumber);

  I.wait(3);

  globalVariable.registration.otpCode = (
    await otpDao.getOTP("62" + expectedPhoneNumber)
  ).otp;

  otpConfirmationPage.fillInOtpCode(globalVariable.registration.otpCode);
}
);

When("I click icon info business code", () => {
  registrationPage.openInfoBusinessCode();
});

When("I verifying my phone number by entering the wrong code", async () => {
  otpConfirmationPage.isOpen();
  otpConfirmationPage.fillInOtpCode("000000");
});

When("I verifying my email by login by user id", async () => {
  verificationEmailPage.isOpen();

  I.see("Segera Cek E-mail");
  I.see("Kami telah mengirim User ID ke e-mail:");

  let actualEmail = await verificationEmailPage.getEmailValue();
  I.assertEqual(actualEmail, globalVariable.registration.email);

  verificationEmailPage.loginWithUserId(globalVariable.registration.userID, globalVariable.registration.password, globalVariable.registration.email);
});

When("I verifying email invitee through login with user id invitee", async () => {
  verificationEmailPage.isOpen();

  I.see("Segera Cek E-mail");
  I.see("Kami telah mengirim User ID ke e-mail:");

  let actualEmail = await verificationEmailPage.getEmailValue();
  I.assertEqual(actualEmail, globalVariable.registration.emailPartner);

  const userID = (await otpDao.getUserID(globalVariable.registration.emailPartner)).userID;

  verificationEmailPage.loginWithUserId(userID, globalVariable.registration.passwordPartner, globalVariable.registration.emailPartner);

  globalVariable.login.userIDPartner = userID;
});

When("I verifying new email invitee through login with user id invitee", async () => {
  verificationEmailPage.isOpen();

  I.see("Segera Cek E-mail");
  I.see("Kami telah mengirim User ID ke e-mail:");

  let actualEmail = await verificationEmailPage.getEmailValue();
  I.assertEqual(actualEmail, globalVariable.registration.newEmailPartner);

  const userID = (await otpDao.getUserID(globalVariable.registration.newEmailPartner)).userID;

  verificationEmailPage.loginWithUserId(userID, globalVariable.registration.passwordPartner, globalVariable.registration.newEmailPartner);

  globalVariable.login.userIDPartner = userID;
});

When("I verifying email new user through login with user id", async () => {
  verificationEmailPage.isOpen();

  I.see("Segera Cek E-mail");
  I.see("Kami telah mengirim User ID ke e-mail:");

  let actualEmail = await verificationEmailPage.getEmailValue();
  I.assertEqual(actualEmail, globalVariable.userManagement.email);

  const userID = (await otpDao.getUserID(globalVariable.userManagement.email)).userID;

  verificationEmailPage.loginWithUserId(userID, globalVariable.login.password, globalVariable.userManagement.email);

  globalVariable.login.userIDPartner = userID;
});

When("I resend email verification", () => {
  verificationEmailPage.clickResendEmailLink();
});

When("I will notify that resend email is successfully", () => {
  I.waitForText("E-mail berhasil dikirim.", 10);
});

When("I check option already and read the condition PDP", () => {
  registrationPage.clickCheckboxPDPMandatory();
});

When("I check option I agree Amarbank send me new information and innovation from the bank", () => {
  registrationPage.clickCheckboxPDPOptional();
});

When("I uncheck option already and read the condition PDP", () => {
  I.wait(1);
  registrationPage.clickCheckboxPDPMandatory();
});

When("I uncheck option I agree Amarbank send me new information and innovation from the bank", () => {
  I.wait(1);
  registrationPage.clickCheckboxPDPOptional();
});

When("I click button {string}", (buttonName) => {
  registrationPage.clickButtonCreateAccountPdp(buttonName);
});

When("I am filling field {string} with {string}", (fieldName, actualValue) => {
  registrationPage.fillFieldRegistration(fieldName, actualValue);
});

When("I fill form registration except field {string}", async (fieldName) => {
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
  "I filling in my account business information",
  async () => {

    const account = {
      fullName: globalVariable.registration.fullNamePartner,
      email: globalVariable.registration.emailPartner,
      mobileNumber: globalVariable.registration.phoneNumberPartner,
      password: globalVariable.registration.passwordPartner,
      confirmPassword: globalVariable.registration.passwordPartner,
      businessCode: globalVariable.registration.businessCode,
    }

    globalVariable.registration.businessCode = (await getDataDao.getBusinessCode(globalVariable.registration.emailPartner)).businessCode;

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumberPartner
    );

    await whitelistDao.whitelistEmail(
      globalVariable.registration.emailPartner
    );

    registrationPage.fillInAccountInformation(account);
  }
);

When(
  "I filling in my account business information with old email and business code from new email",
  async () => {

    const account = {
      fullName: globalVariable.registration.fullNamePartner,
      email: globalVariable.registration.emailPartner,
      mobileNumber: globalVariable.registration.phoneNumberPartner,
      password: globalVariable.registration.passwordPartner,
      confirmPassword: globalVariable.registration.passwordPartner,
      businessCode: globalVariable.registration.businessCode,
    }

    globalVariable.registration.businessCode = (await getDataDao.getBusinessCode(globalVariable.registration.newEmailPartner)).businessCode;

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumberPartner
    );

    await whitelistDao.whitelistEmail(
      globalVariable.registration.emailPartner
    );

    registrationPage.fillInAccountInformation(account);
  }
);

When(
  "I filling in my account business information without business code",
  async () => {

    const account = {
      fullName: globalVariable.registration.fullNamePartner,
      email: globalVariable.registration.emailPartner,
      mobileNumber: globalVariable.registration.phoneNumberPartner,
      password: globalVariable.registration.passwordPartner,
      confirmPassword: globalVariable.registration.passwordPartner
    }

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumberPartner
    );

    await whitelistDao.whitelistEmail(
      globalVariable.registration.emailPartner
    );

    registrationPage.fillInAccountInformation(account);
  }
);

When(
  "I filling in my account business information with new email",
  async () => {

    const account = {
      fullName: globalVariable.registration.fullNamePartner,
      email: globalVariable.registration.newEmailPartner,
      mobileNumber: globalVariable.registration.phoneNumberPartner,
      password: globalVariable.registration.passwordPartner,
      confirmPassword: globalVariable.registration.passwordPartner,
      businessCode: globalVariable.registration.businessCode,
    }

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumberPartner
    );

    await whitelistDao.whitelistEmail(
      globalVariable.registration.emailPartner
    );

    registrationPage.fillInAccountInformation(account);
  }
);

When(
  "I filling in my account business information with different email",
  async () => {

    const account = {
      fullName: globalVariable.registration.fullNamePartner,
      email: "bhdsfb7567@gmail.com",
      mobileNumber: globalVariable.registration.phoneNumberPartner,
      password: globalVariable.registration.passwordPartner,
      confirmPassword: globalVariable.registration.passwordPartner,
      businessCode: globalVariable.registration.businessCode,
    }

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumberPartner
    );

    await whitelistDao.whitelistEmail(
      account.email
    );

    registrationPage.fillInAccountInformation(account);
  }
);

When(
  "I filling in new user account business information",
  async () => {

    const account = {
      fullName: globalVariable.userManagement.fullName,
      email: globalVariable.userManagement.email,
      mobileNumber: globalVariable.userManagement.phoneNumber,
      password: globalVariable.login.password,
      confirmPassword: globalVariable.login.password,
      businessCode: globalVariable.registration.businessCode,
    }

    await whitelistDao.whitelistPhoneNumber(
      "+62" + account.mobileNumber
    );

    await whitelistDao.whitelistEmail(
      account.email
    );

    registrationPage.fillInAccountInformation(account);
  }
);

When("I click icon eye in {string} field", (fieldName) => {
  if (fieldName === "password") {
    registrationPage.clickIconEyePassword();
  } else if (fieldName === "confirmPassword") {
    registrationPage.clickIconEyeConfirmPassword();
  }
});

When("I click link registration", () => {
  registrationPage.goToLoginPage();
});

When("I click button agree with terms and condition", () => {
  registrationPage.agreeWithTermsAndCondition();
});

When("I will directing to page terms and condition", () => {
  I.wait(3);
  I.waitForText("Syarat dan Ketentuan", 10);
  I.waitForElement(headerPage.buttons.back, 10);

  registrationPage.clickScrollToEndOfPage();

  I.waitForElement(registrationPage.buttons.acceptWebView, 10);
  I.see("Setujui Syarat dan Ketentuan");
});

When("I click button agree with privacy and policy", () => {
  registrationPage.agreeWithPrivacyAndPolicy();
});

When("I click button agree to PDP", () => {
  registrationPage.agreeWithPDP();
});

When("I will directing to page privacy and policy", () => {
  I.wait(3);
  I.waitForText("Kebijakan Privasi", 10);
  I.waitForElement(headerPage.buttons.back, 10);

  registrationPage.clickScrollToEndOfPage();

  I.waitForElement(registrationPage.buttons.acceptWebView, 10);
  I.see("Setujui Kebijakan Privasi");
});

When("I click call center", () => {
  headerPage.goToCallCenter();
});

When("I click button back to page registration", () => {
  registrationPage.clickButtonBackToPageRegistration();
});

When("I click button back in the header page", () => {
  headerPage.clickButtonBack();
});

When("I let the otp code expire", () => {
  I.wait(63);
  I.waitForElement(otpConfirmationPage.links.resendOTP, 10);
});

When("I verifying my phone number by entering the wrong code four times", () => {
  otpConfirmationPage.isOpen();
  for (let attempts = 1; attempts < 5; attempts++) {
    otpConfirmationPage.fillInOtpCode("123456");
    otpConfirmationPage.clearFieldOTP();
    I.wait(1);
  }
});

When("I choose change phonenumber", () => {
  otpConfirmationPage.isOpen();
  otpConfirmationPage.clickChangePhoneNumber();
  I.waitForText("Ubah Nomor HP", 5);
  I.seeElement(headerPage.buttons.back);
});

When("I change my phonenumber into {string}", async (newPhoneNumber) => {
  globalVariable.registration.phoneNumber = "62" + newPhoneNumber
  await whitelistDao.whitelistPhoneNumber(
    "+" + globalVariable.registration.phoneNumber
  );

  changePhoneNumberPage.fillFieldNewPhoneNumber(newPhoneNumber);
  changePhoneNumberPage.clickChangePhoneNumberBtn();
  I.waitForText("Verifikasi Nomor HP", 10);
});

When("I resend the OTP", () => {
  I.waitForElement(otpConfirmationPage.links.resendOTP, 63);
  otpConfirmationPage.resendOTP();
  I.waitForInvisible(otpConfirmationPage.links.resendOTP, 5);
});

When("I will directing to page verification email", async () => {
  I.waitForText("Verifikasi Email", 10);
  I.see("Segera Cek E-mail");
  I.see("Kami telah mengirim User ID ke e-mail:");

  let actualEmail = await verificationEmailPage.getEmailValue();
  I.assertEqual(actualEmail, globalVariable.registration.email);
});

When("I filling new phonenumber with my old phonenumber", async () => {
  let oldPhoneNumber = (await changePhoneNumberPage.getOldPhoneNumber()).substring(4);

  changePhoneNumberPage.fillFieldNewPhoneNumber(oldPhoneNumber);
});

When("I filling new phonenumber with {string}", (phoneNumber) => {
  changePhoneNumberPage.fillFieldNewPhoneNumber(phoneNumber);
});

When("I get my first OTP", async () => {
  globalVariable.registration.otpCode = (await otpDao.getOTP(globalVariable.registration.phoneNumber)).otp
});

When("I submit the PDP registration", () => {
  registrationPage.submitPDPRegist();
});

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
    globalVariable.registration.phoneNumber = "62" + account["mobileNumber"];
    globalVariable.registration.email = account["email"];
    globalVariable.registration.password = account["password"];
    globalVariable.registration.businessCode = (
      await getDataDao.getBusinessCode(account["email"])
    ).businessCode;

    await whitelistDao.whitelistPhoneNumber(
      "+" + globalVariable.registration.phoneNumber
    );

    await whitelistDao.whitelistEmail(globalVariable.registration.email);

    registrationPage.fillInAccountInformation(account);
    registrationPage.fillFieldRegistration(
      "businessCode",
      globalVariable.registration.businessCode
    );
    globalVariable.registration.phoneNumber = "62" + account["mobileNumber"];
    globalVariable.registration.password = account["password"];

    registrationPage.clickCreateAccountButton();

    let actualPhoneNumber = await registrationPage.getValueInformation(
      "mobileNumber"
    );
    let actualCompanyName = await registrationPage.getValueInformation(
      "companyName"
    );

    I.assertEqual(actualPhoneNumber, "+62 " + account["mobileNumber"]);
    I.assertEqual(actualCompanyName, globalVariable.registration.companyName);
  }
);

When("I click icon eye in {string} field", (fieldName) => {
  if (fieldName === "password") {
    registrationPage.clickIconEyePassword();
  } else if (fieldName === "confirmPassword") {
    registrationPage.clickIconEyeConfirmPassword();
  }
});

When("I click link registration", () => {
  registrationPage.goToLoginPage();
});

When("I click button agree with terms and condition", () => {
  registrationPage.agreeWithTermsAndCondition();
});

When("I will directing to page terms and condition", () => {
  I.wait(3);
  I.waitForText("Syarat dan Ketentuan", 10);
  I.waitForElement(headerPage.buttons.back, 10);

  registrationPage.clickScrollToEndOfPage();

  I.waitForElement(registrationPage.buttons.acceptWebView, 10);
  I.see("Setujui Syarat dan Ketentuan");
});

When("I click button agree with privacy and policy", () => {
  registrationPage.agreeWithPrivacyAndPolicy();
});

When("I will directing to page privacy and policy", () => {
  I.wait(3);
  I.waitForText("Kebijakan Privasi", 10);
  I.waitForElement(headerPage.buttons.back, 10);

  registrationPage.clickScrollToEndOfPage();

  I.waitForElement(registrationPage.buttons.acceptWebView, 10);
  I.see("Setujui Kebijakan Privasi");
});

When("I will directing to page PDP", () => {
  I.waitForText("Persetujuan Penggunaan Data dan Informasi Pribadi", 10);
  I.see("Buat Akun");
  I.see("Wajib dicentang");

  I.waitForElement(registrationPage.checkButton.firstPdp, 10);
  I.see(
    "Membagikan data dan/atau informasi pribadi secara benar, lengkap, asli, sah dan sesuai peraturan perundang-undangan yang berlaku kepada  Bank sebagai syarat penggunaan produk atau layanan Bank.".trim()
  );

  I.waitForElement(registrationPage.checkButton.secondPdp, 10);
  I.see(
    "Membagikan penggunaan data dan/atau informasi pribadi oleh/kepada pihak ketiga untuk tujuan penggunaan produk atau layanan Bank.".trim()
  );

  I.waitForElement(registrationPage.checkButton.thirdPdp, 10);
  I.see(
    "Menerima penawaran produk dan/atau layanan melalui sarana komunikasi pribadi nasabah sebagai syarat penggunaan produk atau layanan Bank.".trim()
  );
});

When("I click call center", () => {
  headerPage.goToCallCenter();
});

When("I click button back in the header page", () => {
  headerPage.clickButtonBack();
});

When("I let the otp code expire", () => {
  I.wait(63);
  I.waitForElement(otpConfirmationPage.links.resendOTP, 10);
});

When(
  "I verifying my phone number by entering the wrong code five times",
  () => {
    otpConfirmationPage.isOpen();
    for (let attempts = 1; attempts < 6; attempts++) {
      otpConfirmationPage.fillInOtpCode("123456");
      if (attempts !== 5) {
        I.wait(2);
      }
    }
  }
);

When(
  "I verifying my phone number by entering the wrong code four times",
  () => {
    otpConfirmationPage.isOpen();
    for (let attempts = 1; attempts < 5; attempts++) {
      otpConfirmationPage.fillInOtpCode("123456");
      otpConfirmationPage.clearFieldOTP();
      I.wait(1);
    }
  }
);

When("I close bottom sheet info business code", () => {
  registrationPage.closeBottomSheet();
  I.wait(2);
  I.dontSeeElement(registrationPage.buttons.closeBottomSheet);
});

When("I click button back to page registration", () => {
  registrationPage.clickButtonBackToPageRegistration();
});

When("I choose change phonenumber", () => {
  otpConfirmationPage.isOpen();
  otpConfirmationPage.clickChangePhoneNumber();
  I.waitForText("Ubah Nomor HP", 5);
  I.seeElement(headerPage.buttons.back);
});

When("I change my phonenumber into {string}", async (newPhoneNumber) => {
  globalVariable.registration.phoneNumber = "62" + newPhoneNumber;
  await whitelistDao.whitelistPhoneNumber(
    "+" + globalVariable.registration.phoneNumber
  );

  changePhoneNumberPage.fillFieldNewPhoneNumber(newPhoneNumber);
  changePhoneNumberPage.clickChangePhoneNumberBtn();
  I.waitForText("Verifikasi Nomor HP", 10);
});

When("I resend the OTP", () => {
  I.waitForElement(otpConfirmationPage.links.resendOTP, 63);
  otpConfirmationPage.resendOTP();
  I.waitForInvisible(otpConfirmationPage.links.resendOTP, 5);
});

When("I will directing to page verification email", async () => {
  I.waitForText("Verifikasi Email", 10);
  I.see("Segera Cek E-mail");
  I.see("Kami telah mengirim User ID ke e-mail:");

  let actualEmail = await verificationEmailPage.getEmailValue();
  I.assertEqual(actualEmail, globalVariable.registration.email);
});

When("I filling new phonenumber with my old phonenumber", async () => {
  let oldPhoneNumber = (
    await changePhoneNumberPage.getOldPhoneNumber()
  ).substring(4);

  changePhoneNumberPage.fillFieldNewPhoneNumber(oldPhoneNumber);
});

When("I filling new phonenumber with {string}", (phoneNumber) => {
  changePhoneNumberPage.fillFieldNewPhoneNumber(phoneNumber);
});

When("I get my first OTP", async () => {
  globalVariable.registration.otpCode = (
    await otpDao.getOTP(globalVariable.registration.phoneNumber)
  ).otp;
});

When("I resend email verification", () => {
  verificationEmailPage.clickResendEmailLink();
});

When("I checked the 2 mandatory PDP checklists", () => {
  registrationPage.clickCheckboxPDPMandatory();
});

When("I unchecked the 2 mandatory PDP checklists", () => { });

When("I checked the optional PDP checklist", () => {
  registrationPage.clickCheckboxPDPOptional();
});

When("I click button {string}", (buttonName) => {
  registrationPage.clickButtonCreateAccountPdp(buttonName);
});

When("I am on page PDP consent", () => {
  I.see("Persetujuan Penggunaan Data dan Informasi Pribadi");
});

When("I click button first login", () => {
  verificationEmailPage.clickButtonFirstLogin();
});

When("I edit field email with old email invitee", () => {
  registrationPage.fillFieldRegistration("email", globalVariable.registration.emailPartner);
});

When("I receive all the user id's", () => { })

Then("I will see my password {string} in the field", (actualPassword) => {
  I.waitForText(actualPassword);
});

Then("I will not see my password {string} in the field", (actualPassword) => {
  I.dontSee(actualPassword);
});

Then("my account business should be created", () => {
  I.waitForText("Lanjutkan proses registrasi", 10);
  I.see("Anda hanya perlu melakukan:");
  I.see("Foto eKTP");
  I.see("Selfie");
  I.seeElement(registrationPage.buttons.continueRegist);
});

Then("I will see helping center via email", () => {
  I.waitForText("Hubungi Tim Kami", 10);
  I.see("Kami akan membantu Anda dalam" + "\n" + "pembentukan rekening ataupun pinjaman");
  I.see("support.bisnis@amarbank.co.id");
  I.waitForElement(headerPage.cards.whatsApp, 10);

  headerPage.closeCallCenter();
});

Then("I will directing to page login", async () => {
  I.waitForText("Masuk Akun", 20);
  I.waitForElement(headerPage.buttons.back, 10);
  I.waitForElement(headerPage.icon.callCenter, 10);

  I.see("User ID");
  I.see("Masukkan user ID");
  I.waitForElement(loginPage.fields.userID, 10);

  I.see("Password");
  I.see("Masukkan password");
  I.waitForElement(loginPage.fields.password, 10);
  I.waitForElement(loginPage.icon.eyePassword, 10);

  I.see("Ingat saya");
  I.waitForElement(loginPage.checkbox.rememberMe, 10);

  I.see("Lupa Password?");
  I.waitForElement(loginPage.link.forgotPassword, 10);

  I.see("Masuk Akun");
  I.waitForElement(loginPage.buttons.login, 10);

  I.see("Atau");
  I.see("Masuk dengan Biometrik");
  I.waitForElement(loginPage.buttons.biometric, 10);

  I.see("Belum memiliki akun?");
  I.see("Daftar");
  I.waitForElement(loginPage.link.registration, 10);

  await resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
});

Then("I will directing to web view terms and condition", () => {
  I.waitForText("Syarat dan Ketentuan");
  // rest the assertion of the text
});

Then("I will directing to web view privacy and policy", () => {
  I.waitForText("Kebijakan Privasi");
  // rest the assertion of the text
});

Then(
  "I will direct to page registration with each fields still has values as following:",
  async (table) => {
    I.swipeDown(registrationPage.fields.email, 1000, 1000);
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

Then("I will direct to page onboarding", () => {
  I.waitForElement(welcomePage.buttons.registration, 10);
});

Then("I cannot change my phonenumber", () => {
  I.dontSee("Salah input Nomor HP?");
  I.dontSeeElement(otpConfirmationPage.links.changePhoneNumber);
});

Then("I should be notified that I can reverify the phone number tomorrow", async () => {
  const currentDate = new Date();
  const tomorrowDate = new Date(currentDate);
  tomorrowDate.setDate(currentDate.getDate() + 1);

  const day = tomorrowDate.getDate();
  const formattedDay = (day < 10 ? '0' : '') + day;
  const month = tomorrowDate.getMonth();
  const year = tomorrowDate.getFullYear();
  const months = [
    "Jan", "Feb", "Mar", "Apr",
    "Mei", "Jun", "Jul", "Aug",
    "Sep", "Okt", "Nov", "Des"
  ];

  const hours = tomorrowDate.getHours();
  const minutes = tomorrowDate.getMinutes();
  const currentTime = hours.toString().padStart(2, '0') + ":" + minutes.toString().padStart(2, '0');

  let actualMsgError = await otpConfirmationPage.getMessageError();

  I.assertEqual(actualMsgError, "Kode OTP dikirim kembali pada: tanggal " + formattedDay +
    " " + months[month] + " " + year + ", pukul " + currentTime);

  I.dontSeeElement(otpConfirmationPage.links.resendOTP);
  await otpDao.resetLimitRequestOtp(globalVariable.registration.phoneNumber);
});

Then("I should see message error {string} in the below of field new phonenumber", async (expectedMsgError) => {
  I.wait(1);
  let actualMsgError = await changePhoneNumberPage.getMessageErrorNewPassword();
  I.assertEqual(actualMsgError, expectedMsgError);
});

Then("I should see message error register code business first with the email", async () => {
  I.wait(1);

  let actualMsgError = await registrationPage.getMessageErrorFieldRegistration("businessCode");
  I.assertEqual(actualMsgError, "Masukkan kode bisnis yang kami kirim ke e-mail: " + globalVariable.registration.emailPartner);
});

Then("I will direct to page verification phonenumber", () => {
  I.waitForText("Verifikasi Nomor HP", 5);
  I.see("Kode OTP telah dikirim ke nomor");
});

Then("I will get new OTP different with my first OTP", async () => {
  let newOtp = (await otpDao.getOTP(globalVariable.registration.phoneNumber)).otp

  I.assertNotEqual(newOtp, globalVariable.registration.otpCode);
  globalVariable.registration.otpCode = newOtp;
});

Then("I will see attempts left {string}", (leftAttempt) => {
  I.waitForText(leftAttempt, 10);
});

Then("I should see button Buat Akun will enable", async () => {
  I.wait(1);

  I.waitForText("Buat Akun", 10);
  const isEnabled = await I.grabAttributeFrom(registrationPage.statusElement.buttonRegist, 'enabled');
  I.assertEqual(isEnabled, 'true');

});

Then("I should see button Buat Akun will disable", async () => {
  I.wait(1);

  I.waitForText("Buat Akun", 10);
  const isEnabled = await I.grabAttributeFrom(registrationPage.statusElement.buttonRegist, 'enabled');
  I.assertEqual(isEnabled, 'false');

});

Then("my account should be created", () => {
  I.waitForElement(loginPage.buttons.laterBiometric, 20);
});

Then("account invitee should be created", () => {
  I.waitForText("Lanjutkan proses registrasi", 20);
});

Then("account new user should be created", () => {
  I.waitForText("Lanjutkan proses registrasi", 20);
});

Then("my account business should be created", () => {
  I.waitForText("Lanjutkan proses registrasi", 10);
  I.see("Anda hanya perlu melakukan:");
  I.see("Foto eKTP");
  I.see("Selfie");
  I.seeElement(registrationPage.buttons.continueRegist);
});

Then(
  "I should be notified in the below of field OTP that {string}",
  async (expectedMsgError) => {
    let actualMsgError = await otpConfirmationPage.getMessageError();
    I.assertEqual(actualMsgError, expectedMsgError);
  }
);

Then(
  "I should see message error {string} in the below of field {string}",
  async (expectedMsgError, fieldName) => {
    I.wait(2);
    let actualMessage = await registrationPage.getMessageErrorFieldRegistration(
      fieldName
    );
    I.assertEqual(actualMessage, expectedMsgError);
  }
);

Then(
  "I shouldn't see message error in the below of field {string}",
  async (fieldName) => {
    let infoFieldPassword = "Min. 8 karakter dari huruf besar, kecil & angka";
    let infoFieldBusinessCode = "Jika tidak ada, kosongkan kode bisnis.";

    if (fieldName === "password") {
      let messageField =
        await registrationPage.getMessageErrorFieldRegistration(fieldName);
      I.assertEqual(messageField, infoFieldPassword);
    } else if (fieldName === "businessCode") {
      I.swipeUp(registrationPage.fields.businessCode, 500, 1000);
      let messageField =
        await registrationPage.getMessageErrorFieldRegistration(fieldName);
      I.assertEqual(messageField, infoFieldBusinessCode);
    } else {
      I.waitForInvisible(registrationPage.messageErrorFields[fieldName], 10);
    }
  }
);

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

Then("I will see helping center via email", () => {
  I.waitForText("Hubungi Tim Kami", 10);
  I.see(
    "Kami akan membantu Anda dalam" +
    "\n" +
    "pembentukan rekening ataupun pinjaman"
  );
  I.see("support.bisnis@amarbank.co.id");
  I.waitForElement(headerPage.cards.whatsApp, 10);

  headerPage.closeCallCenter();
});

Then("I will directing to web view terms and condition", () => {
  I.waitForText("Syarat dan Ketentuan");
  // rest the assertion of the text
});

Then("I will directing to web view privacy and policy", () => {
  I.waitForText("Kebijakan Privasi");
  // rest the assertion of the text
});

Then(
  "I will direct to page registration with each fields still has values as following:",
  async (table) => {
    I.swipeDown(registrationPage.fields.email, 1000, 1000);
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

Then("I will direct to page onboarding", () => {
  I.waitForElement(welcomePage.buttons.registration, 10);
});

Then("I cannot change my phonenumber", () => {
  I.dontSee("Salah input Nomor HP?");
  I.dontSeeElement(otpConfirmationPage.links.changePhoneNumber);
});

Then(
  "I should see message error {string} in the below of field new phonenumber",
  async (expectedMsgError) => {
    I.wait(1);
    let actualMsgError =
      await changePhoneNumberPage.getMessageErrorNewPassword();
    I.assertEqual(actualMsgError, expectedMsgError);
  }
);

Then("I will direct to page verification phonenumber", () => {
  I.waitForText("Verifikasi Nomor HP", 5);
  I.see("Kode OTP telah dikirim ke nomor");
});

Then("I will get new OTP different with my first OTP", async () => {
  let newOtp = (await otpDao.getOTP(globalVariable.registration.phoneNumber))
    .otp;

  I.assertNotEqual(newOtp, globalVariable.registration.otpCode);
  globalVariable.registration.otpCode = newOtp;
});

Then("I will see attempts left {string}", (leftAttempt) => {
  I.waitForText(leftAttempt, 10);
});

Then("I should go to Verifikasi No. HP page", () => {
  I.wait(10);
  I.see("Verifikasi Nomor HP");
  I.see("Masukkan Kode OTP");
});

Then(
  "I get email including the information about PDP that i checked before",
  () => { }
);

Then("I see text consent PDP", () => {
  I.wait(3);
  I.seeElement(registrationPage.text.firstPdpText);
  I.seeElement(registrationPage.text.secondPdpText);
  I.seeElement(registrationPage.text.thirdPdpText);
});
Then("I will direct to Registration page", () => {
  I.waitForText("Buat Akun", 10);
});

Then("I will directing to page PDP", () => {
  I.waitForText("Pelindungan Data Pribadi", 10);

  I.waitForElement(registrationPage.scroll.scrollToButton, 10);

  registrationPage.clickScrollToEndOfPage();

  I.waitForElement(registrationPage.buttons.acceptPDP, 10);
  I.see("Setujui Pelindungan Data Pribadi");
});

Then("I will back to page PDP", () => {
  I.waitForText("Pelindungan Data Pribadi", 10);
});

Then("I will see pop up option PDP registration", async () => {
  I.waitForText("Persetujuan Penggunaan Data dan Informasi Pribadi", 10);
  I.see("Wajib dicentang");

  I.see("Saya telah membaca dan memberikan persetujuan kepada PT Bank Amar Indonesia, Tbk untuk keperluan yang telah disampaikan.".trimEnd());
  I.waitForElement(registrationPage.checkButton.firstPdp, 10);

  I.see("Saya menyetujui PT Bank Amar Indonesia, Tbk untuk mengirimkan informasi pemasaran, termasuk produk, promosi, dan penawaran khusus.".trimEnd());
  I.waitForElement(registrationPage.checkButton.secondPdp, 10);

  I.see("Buat Akun");
  I.waitForElement(registrationPage.statusElement.buttonRegist, 10);
  const isEnabled = await I.grabAttributeFrom(registrationPage.statusElement.buttonRegist, 'enabled');
  I.assertEqual(isEnabled, 'false');
});

Then("I will see pop up confirmation registration with company name", async () => {

  I.waitForText("Konfirmasi Data Anda", 20);
  I.see("Pastikan kembali e-mail dan nomor HP Anda sudah benar dan aktif");

  I.see("Nomor Handphone");
  let actualPhoneNumber = await registrationPage.getValueInformation(
    "mobileNumber"
  );
  I.assertEqual(actualPhoneNumber, "+62 " + globalVariable.registration.phoneNumberPartner);

  I.see("Anda akan registrasi sebagai bagian dari:");
  let actualCompanyName = await registrationPage.getValueInformation("companyName");
  const companyName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
  I.dontSeeElement(registrationPage.label.email);
  I.assertEqual(actualCompanyName, companyName);

  I.see("Konfirmasi");
  I.waitForElement(registrationPage.buttons.confirm, 10);

  I.see("Kembali");
  I.waitForElement(registrationPage.buttons.backRegist, 10);
});

Then("I will see information of business code", () => {
  I.waitForElement(registrationPage.buttons.closeBottomSheet, 10);
  I.see("Apa Itu Kode Bisnis?");

  I.see("Kode Bisnis adalah kode yang diberikan kepada pendaftar rekening giro setelah menginput nama-nama direksi lainnya.");
  I.see("Direksi yang diundang menggunakan kode ini untuk mendaftar di aplikasi.");
  I.see("Rekening giro akan aktif setelah semua direksi mendaftar dengan kode tersebut.");
});

Then("I will get my user id with format combination from number and alphabeth lower case without special char", async () => {
  I.wait(3);

  const userID = (await otpDao.getUserID(globalVariable.registration.email)).userID;

  // checking user id length is 8
  I.assertEqual(userID.length, 8);

  // checking there is number in user id
  const filterNumber = /\d/.test(userID);
  I.assertTrue(filterNumber);

  // checking there is lower case alphabeth in user id
  const filterLowerCaseAlpha = /[a-z]/g.test(userID);
  I.assertTrue(filterLowerCaseAlpha);

  // checking there is no special char in user id
  const filterSpeChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(userID);
  I.assertFalse(filterSpeChar);

  // checking there is no upper case in user id
  const filterUpperCase = /[A-Z]/g.test(userID);
  I.assertFalse(filterUpperCase);

  // checking there is no space in user id
  const filterSpace = / /.test(userID);
  I.assertFalse(filterSpace);

  globalVariable.registration.userID = userID;
});

Then("All user id's using format combination from number and alphabeth lower case without special char", async () => {

  const listUserID = globalVariable.login.listUserID;

  for (let i = 0; i < listUserID.length; i++) {

    console.log(listUserID[i]);

    // checking user id length is 8
    I.assertEqual(listUserID[i].length, 8);

    // checking there is number in user id
    const filterNumber = /\d/.test(listUserID[i]);
    I.assertTrue(filterNumber);

    // checking there is number in user id
    const filterLowerCaseAlpha = /[a-z]/g.test(listUserID[i]);
    I.assertTrue(filterLowerCaseAlpha);

    // checking there is no special char in user id
    const filterSpeChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(listUserID[i]);
    I.assertFalse(filterSpeChar);

    // checking there is no upper case in user id
    const filterUpperCase = /[A-Z]/g.test(listUserID[i]);
    I.assertFalse(filterUpperCase);

    // checking there is no space in user id
    const filterSpace = / /.test(listUserID[i]);
    I.assertFalse(filterSpace);
  }
});

Then("I will see pop up confirmation registration new user", async () => {

  I.waitForText("Konfirmasi Data Anda", 20);
  I.see("Pastikan kembali e-mail dan nomor HP Anda sudah benar dan aktif");

  I.see("Nomor Handphone");
  let actualPhoneNumber = await registrationPage.getValueInformation(
    "mobileNumber"
  );
  I.assertEqual(actualPhoneNumber, globalVariable.userManagement.phoneNumber);

  I.see("Anda akan registrasi sebagai bagian dari:");
  let actualCompanyName = await registrationPage.getValueInformation("companyName");
  const companyName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
  I.dontSeeElement(registrationPage.label.email);
  I.assertEqual(actualCompanyName, companyName);

  I.see("Konfirmasi");
  I.waitForElement(registrationPage.buttons.confirm, 10);

  I.see("Kembali");
  I.waitForElement(registrationPage.buttons.backRegist, 10);
});