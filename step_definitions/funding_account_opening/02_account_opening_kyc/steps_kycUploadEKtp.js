const {
    I,
    uploadKtpPage,
    onboardingAccOpeningPage,
    headerPage,
    formKtpPage,
    resetStateDao,
    uploadDao,
    getDataDao,
    whitelistDao,
    otpDao,
    firstRegistrationDao,
    globalVariable } = inject();

Given("I am a customer who has selected the business type UD", () => { });

Given("I am a customer who has selected the business type Individual", () => { });

Given("I am a customer who has selected the business type PT Perorangan", () => { });

Given("I am a customer who has selected the business type PT Perusahaan", () => { });

Given("I am a customer who has selected the business type CV", () => { });

Given("My last flow kyc step is {string}", (stateName) => {
    let lastStateNumber = onboardingAccOpeningPage.getStateNumber(stateName);
    // step to hit API reset state
});

Given("I register initiator with partner as below", async (table) => {
    const legality = "CV";
    const prodType = "CORP";
    const userID = globalVariable.login.userID;
    const password = globalVariable.login.password;

    const ktpInitiator = {
        ktpnumber: "3171032905930006",
        ktpname: "I AM INITIATOR",
        birthplace: "JAKARTA",
        dateofbirth: "1981-03-30",
        gender: "Perempuan",
        bloodtype: "-",
        religion: "Kristen",
        maritalstatus: "KAWIN",
        province: "DKI JAKARTA",
        city: "KOTA ADM. JAKARTA UTARA",
        district: "PENJARINGAN",
        village: "PEJAGALAN",
        rt: "01",
        rw: "21",
        ktpaddress: "Jl. Asia Afrika No. 44, Kav.23",
        postalcode: "14450",
        job: "WIRASWASTA",
        nationality: "WNI",
        noWincoreProvince: "0300",
        noWincoreCity: "0392",
        noWincoreDistrict: "GA01",
        noWincoreVillage: "GA0104",
        expiryDate: "-",
    };

    const businessProfile = {
        legalityType: legality,
        businessName: "CV BINTANG TIMUR",
        businessEmail: "bintang.timur.official@gmail.com",
        businessType: "Tambang",
        industryType: "Jasa",
        monthlyIncome: "30 - 50 juta",
        averageTransaction: "20000000",
        businessNPWP: "997000411185779",
        annualEarnings: "500 juta",
        nib: "3337798233333",
        foundedAt: "01-01-1991",
    };

    const dataInvitee = table.parse().rowsHash();

    // HIT PRODUCT TYPE
    await
        uploadDao.submitProductType(prodType, userID, password);

    // HIT LEGALITY TYPE
    await
        uploadDao.submitLegalityType(legality, userID, password);

    // JUMP TO FORM KTP
    await
        resetStateDao.resetStateFlow(3, userID, password);

    // HIT FORM KTP
    await
        uploadDao.submitIdentityDetails(ktpInitiator, userID, password);

    // JUMP TO BUSINESS PROFILE
    await
        resetStateDao.resetStateFlow(9, userID, password);

    // HIT BUSINESS PROFILE
    await
        uploadDao.submitBusinessProfile(businessProfile, userID, password);

    // WHITELIST EMAIL AND PHONENUMBER INVITEE
    await
        whitelistDao.whitelistEmail(dataInvitee["email"]);

    await
        whitelistDao.whitelistPhoneNumber(dataInvitee["phoneNumber"]);

    // ADD PARTNER
    await
        uploadDao.submitOnePartner(dataInvitee, userID, password);
        
    // GET BUSINESS CODE
    globalVariable.registration.businessCode = (await getDataDao.getBusinessCode(dataInvitee["email"])).businessCode;

    // STORE INVITEE DATA
    globalVariable.registration.emailPartner = dataInvitee["email"];
    globalVariable.registration.passwordPartner = dataInvitee["password"];
    globalVariable.registration.phoneNumberPartner = dataInvitee["phoneNumber"];
    globalVariable.registration.fullName = dataInvitee["fullName"];
    
});

Given("I register invitee with business code", async() =>{
    // REQUEST OTP
    await
        otpDao.requestOTP("+62"+globalVariable.registration.phoneNumberPartner);
    
    // GET OTP
    const otp = (await otpDao.getOTP("62"+globalVariable.registration.phoneNumberPartner)).otp;

    // REGISTER INVITEE
    const inviteeRegister = {
        email: globalVariable.registration.emailPartner,
        phoneNumber: "+62"+globalVariable.registration.phoneNumberPartner,
        fullName: globalVariable.registration.fullName,
        password: globalVariable.registration.passwordPartner,
        confirmPassword: globalVariable.registration.passwordPartner,
        otp: otp,
        receivedInfoProduct: false,
        businessCode: globalVariable.registration.businessCode,
    };

    globalVariable.login.userIDPartner = (await firstRegistrationDao.firstRegistrationPartner(inviteeRegister)).userID;
});

When("I click take photo eKTP", () => {
    uploadKtpPage.directToTakePhoto();
});

When("I take photo eKTP", () => {
    uploadKtpPage.takePhoto();
});

When("I retake photo eKTP", () => {
    uploadKtpPage.retakePhoto();
});

When("I submit my eKTP photo", () => {
    uploadKtpPage.uploadPhoto();
});

When("I upload my eKTP photo", async () => {
    I.waitForText("Ambil Foto eKTP Anda", 10);
    await
        uploadDao.allowDeviceData(globalVariable.login.userID, globalVariable.login.password);
    await
        uploadDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});

When("I upload invited user eKTP photo", async () => {
    I.waitForText("Ambil Foto eKTP Anda", 10);
    await
        uploadDao.allowDeviceData(globalVariable.login.userID, globalVariable.login.password);
    await
        uploadDao.uploadKTP(globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageUserInvitedAfterResetState();
});

Then("I will direct to page preview eKTP picture", () => {
    I.waitForElement(uploadKtpPage.buttons.retake, 10);
    I.waitForElement(uploadKtpPage.buttons.upload, 10)

    I.see("Ulangi");
    I.see("Kirim Foto");
});

Then("I will directing to page take photo eKTP", () => {
    I.waitForText("Foto eKTP", 10);
    I.see("Pastikan foto eKTP tidak buram, tidak terkena pantulan cahaya dan tidak terpotong");
    I.see("Ambil Foto eKTP");

    I.waitForElement(uploadKtpPage.buttons.takePhoto, 10);

});

Then("I will directing to page submit form KTP", async () => {
    I.waitForText("Verifikasi Data eKTP", 10);
    I.see("Data Personal");
    I.waitForElement(headerPage.buttons.back, 10);

    I.see("Wajib Diisi");

    I.see("Nomor eKTP");
    I.waitForElement(formKtpPage.fields.eKtpNumber, 10);

    I.see("Nama sesuai eKTP");
    I.waitForElement(formKtpPage.fields.fullName, 10);

    I.see("Tempat Lahir");
    I.waitForElement(formKtpPage.fields.placeOfBirth, 10);

    I.see("Tanggal Lahir");
    I.waitForElement(formKtpPage.datePicker.dateOfBirth, 10);

    I.see("Jenis Kelamin");
    I.waitForElement(formKtpPage.dropDowns.gender, 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.wait(1);

    I.see("Alamat");
    I.waitForElement(formKtpPage.fields.address, 10);

    I.see("RT (tulis - jika tidak ada)");
    I.waitForElement(formKtpPage.fields.rt, 10);

    I.see("RW (tulis - jika tidak ada)");
    I.waitForElement(formKtpPage.fields.rw, 10);

    I.see("Provinsi");
    I.waitForElement(formKtpPage.dropDownsSearch.province, 10);

    I.see("Agama");
    I.waitForElement(formKtpPage.dropDowns.religion, 10);

    I.see("Status Perkawinan");
    I.waitForElement(formKtpPage.dropDowns.maritalStatus, 10);
});