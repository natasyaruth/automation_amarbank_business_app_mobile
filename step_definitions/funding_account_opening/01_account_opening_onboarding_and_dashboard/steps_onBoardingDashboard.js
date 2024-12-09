const {
    I,
    onboardingAccOpeningPage,
    uploadKtpPage,
    formBusinessProfilePage,
    notificationCenterPage,
    whitelistDao,
    resetStateDao,
    headerPage,
    getDataDao,
    hookOnBoardingPage,
    uploadDao,
    globalVariable } = inject();

Given("I am a customer want to open Giro Account", () => {
});

Given("I am a invited customer wants to complete my KYC data", () => {
});

Given("I am a customer want to open Giro Account later", () => {
});

Given("I am a customer want choose product type MSME", () => {
    onboardingAccOpeningPage.openGiroAccountMsme();
    headerPage.clickButtonBack();
    I.wait(2);
    headerPage.clickButtonBack();
    onboardingAccOpeningPage.chooseLater();
    I.waitForElement(onboardingAccOpeningPage.buttons.openAccount, 10);
});

Given("I am a customer want choose product type BB", () => {
    onboardingAccOpeningPage.openGiroAccountCorporate();
    headerPage.clickButtonBack();
    headerPage.clickButtonBack();
    onboardingAccOpeningPage.chooseLater();
    I.waitForElement(onboardingAccOpeningPage.buttons.openAccount, 10)
});

Given("I see information and benefit of Giro Account", () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
    I.see("Dapatkan Rekening Giro");
    I.see("Layanan Digital Banking untuk mengelola bisnis Anda.");

    I.see("Benefit");
    I.see("Bebas Biaya Admin Bulanan");
    I.see("Transaksi Real-Time");
    I.see("Semua Proses dari Hp Anda");
    I.see("e-Statement");
    I.dontSee("Multiple User");
    I.dontSee("Debit Card");
    I.see("Pilih Rekening Giro");
});

Given("I am on main dashboard", () => { });

When("I swipe to card Giro Account", () => {
    onboardingAccOpeningPage.swipeToCardGiroAccount();
});

When("I click back in header page", () => {
    headerPage.clickButtonBack();
});

When("I click close in header page", () => {
    headerPage.closePage();
});

When("I choose legality business type {string}", (businessType) => {
    onboardingAccOpeningPage.chooseLegalityBusinessType(businessType);
    globalVariable.onBoarding.legality = businessType;
});

When("I submit my legality type", () => {
    onboardingAccOpeningPage.continueToKYC();
});

When("I choose Giro Account", () => {
    onboardingAccOpeningPage.openGiroAccount();
});

When("I choose Giro Account from dashboard", () => {
    onboardingAccOpeningPage.openGiroAccountFromDashboard();
});

When("I click later", () => {
    onboardingAccOpeningPage.chooseLater();
});

When("I choose Giro Account Corporate", async () => {
    I.wait(2);
    onboardingAccOpeningPage.openGiroAccountCorporate();

    const isEnabled = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonChooseTypeGiro, 'enabled');
    I.assertEqual(isEnabled, "true");

    I.waitForElement(onboardingAccOpeningPage.buttons.giroAccountMsme, 10);
    I.dontSeeElement(onboardingAccOpeningPage.buttons.giroAccountCorporate);
    globalVariable.onBoarding.productType = "CORP";
});

When("I choose Giro Account MSME", async () => {
    I.wait(2);
    onboardingAccOpeningPage.openGiroAccountMsme();

    const isEnabled = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonChooseTypeGiro, 'enabled');
    I.assertEqual(isEnabled, "true");

    I.waitForElement(onboardingAccOpeningPage.buttons.giroAccountCorporate, 10);
    I.dontSeeElement(onboardingAccOpeningPage.buttons.giroAccountMsme);

    globalVariable.onBoarding.productType = "MSME";
});

When("I submit my giro type", () => {
    onboardingAccOpeningPage.submitTypeGiro();
});

When("I see page {string}", (pageName) => {
    onboardingAccOpeningPage.validatePage(pageName);

    globalVariable.dashboard.lastPage = pageName;
});

When("I continue to complete my data", () => {
    onboardingAccOpeningPage.continueCompleteData();
});

When("I close page upload document", () => {
    headerPage.closePage();
});

When("I continue to register my KYC data", () => {
    onboardingAccOpeningPage.continueToKYC();
    I.waitForElement(uploadKtpPage.buttons.takePhoto, 10);
});

When("I update my last journey step to {string}", async (stepName) => {
    await
        onboardingAccOpeningPage.updateStep(globalVariable.login.userID, globalVariable.login.password, stepName);

    const isInvitee = (await getDataDao.isPartner(globalVariable.login.userID, globalVariable.login.password)).data;

    if (
        isInvitee === false
    ) {
        resetStateDao.reloadPageAfterResetState();
    } else {
        resetStateDao.reloadPageAfterResetStateInvitee();
    }

});

When("I close bottom sheet NPWP Business", () => {
    onboardingAccOpeningPage.closeBottomSheet();
});

When("I fill NPWP Business", () => {
    onboardingAccOpeningPage.fillFieldNPWPBusiness(globalVariable.registration.npwpBusinessDefault);
});

When("I fill NPWP business with {string}", (npwpBusiness) => {
    onboardingAccOpeningPage.fillFieldNPWPBusiness(npwpBusiness);
    globalVariable.registration.npwpBusiness = npwpBusiness;
});

When("I fill NPWP Business with NPWP has been registered", () => {
    let npwpBusiness;

    if (process.env.ENVIRONMENT == "staging") {
        if (
            globalVariable.onBoarding.productType === "MSME"
        ) {
            npwpBusiness = "669819161017000";

        } else if (
            globalVariable.onBoarding.productType === "CORP"
        ) {
            npwpBusiness = "133779944856458";

        }

    } else {
        if (
            globalVariable.onBoarding.productType === "MSME"
        ) {
            npwpBusiness = "737849499494838";

        } else if (
            globalVariable.onBoarding.productType === "CORP"
        ) {
            npwpBusiness = "644411118990077";
        }
    }

    onboardingAccOpeningPage.fillFieldNPWPBusiness(npwpBusiness);
});

When("I clear NPWP Business", () => {
    onboardingAccOpeningPage.clearFieldNPWPBusiness();
});

When("I click continue to data personal", () => {
    onboardingAccOpeningPage.continueToDataPersonal();
});

When("I click confirm NPWP Business", () => {
    onboardingAccOpeningPage.confirmNPWP();
});

When("I click back from confirm NPWP Business", () => {
    onboardingAccOpeningPage.clickBackPopUp();
});

When("I back to continue process account opening", () => {
    onboardingAccOpeningPage.backToProcessAcc();
});

When("I submit my exit survey", () => {
    onboardingAccOpeningPage.sendExitSurvey();
});

When("I click option exit survey {string}", (option) => {
    onboardingAccOpeningPage.clickOptionExitSurvey(option);
});

When("I fill feedback exit survey with {string}", (feedback) => {
    onboardingAccOpeningPage.fillFeedBack(feedback);

    globalVariable.survey.feedBack = feedback;

    const lengthFeedback = globalVariable.survey.feedBack.length;

    if (
        lengthFeedback < 60
    ) {

        I.waitForText(lengthFeedback + "/60", 10);

    } else {

        I.waitForText("60/60", 10);

    }
});

When("I clear field feedback exit survey", () => {
    I.wait(1);
    onboardingAccOpeningPage.clearFieldFeedback();
});

When("I click button resend business code", () => {
    onboardingAccOpeningPage.clickResendBusinessCode();
});

When("I click button change email partner", () => {
    onboardingAccOpeningPage.clickChangeEmailInvitee();
});

When("I click back to list directors", () => {
    onboardingAccOpeningPage.backToListDirectors();
});

When("I click back to bottom sheet change email invitee", () => {
    onboardingAccOpeningPage.backToBottomSheet();
});

When("I confirm resend business code", () => {
    onboardingAccOpeningPage.sendBusinessCode();
});

When("I close bottom sheet change email invitee", () => {
    onboardingAccOpeningPage.closeBottomSheet();
});

When("I clear email via keyboard", () => {
    onboardingAccOpeningPage.clearEmailViaKeyboard();
});

When("I clear email via icon clear", () => {
    onboardingAccOpeningPage.clickIconClear();
});

When("I input incorrect format email", () => {
    const emailInvitee = globalVariable.registration.emailPartner.replace(/@/g, '');

    onboardingAccOpeningPage.fillEmailInvitee(emailInvitee);
});

When("I save and resend business code", () => {
    onboardingAccOpeningPage.saveEmailAndSendBusinessCode();
});

When("I change the email invitee", () => {
    onboardingAccOpeningPage.confirmEmailAndSendBusinessCode();
});

When("I input new email invitee with {string}", async (emailInvitee) => {
    await
        whitelistDao.whitelistEmail(
            emailInvitee
        );

    onboardingAccOpeningPage.fillEmailInvitee(emailInvitee);
    globalVariable.registration.newEmailPartner = emailInvitee;
});

When("I register initiator with partner more than 1", async () => {
    const legality = "CV";
    const prodType = "CORP";
    const npwpBusiness = globalVariable.registration.npwpBusinessDefault;

    const dataInviteeOne = {
        fullName: "Testing Satu",
        email: "bintang.timur.official.01@gmail.com",
        phoneNumber: "899960054041",
        password: "1234Test"
    };

    const dataInviteeTwo = {
        fullName: "Testing Dua",
        email: "bintang.timur.official.02@gmail.com",
        phoneNumber: "899960054088",
        password: "1234Test"
    };

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
        businessName: "CV BINTANG KEJORA",
        businessEmail: "bintang.timur.official@gmail.com",
        businessType: "Tambang",
        industryType: "Jasa",
        monthlyIncome: "30 - 50 juta",
        averageTransaction: "20000000",
        annualEarnings: "500 juta",
        businessNPWP: npwpBusiness,
        nib: "3337798233333",
        foundedAt: "01-01-1991",
    };

    // WHITELIST EMAIL AND PHONENUMBER INVITEES
    await
        whitelistDao.whitelistEmail(dataInviteeOne.email);

    await
        whitelistDao.whitelistEmail(dataInviteeTwo.email);

    await
        whitelistDao.whitelistPhoneNumber("+62" + dataInviteeOne.phoneNumber);

    await
        whitelistDao.whitelistPhoneNumber("+62" + dataInviteeTwo.phoneNumber);

    // add API to reset email from business code    

    // HIT PRODUCT TYPE
    await
        uploadDao.submitProductType(globalVariable.login.userID, globalVariable.login.password, prodType);

    // CHECKING NPWP
    // await 
    //     uploadDao.checkEligibilityNPWPBusiness(globalVariable.login.userID, globalVariable.login.password, npwpBusiness);

    // HIT LEGALITY TYPE
    await
        uploadDao.submitLegalityType(globalVariable.login.userID, globalVariable.login.password, legality, npwpBusiness);

    // JUMP TO FORM KTP
    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 3);

    // HIT FORM KTP
    await
        uploadDao.submitIdentityDetails(globalVariable.login.userID, globalVariable.login.password, ktpInitiator);

    // JUMP TO BUSINESS PROFILE
    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 9);

    // HIT BUSINESS PROFILE
    await
        uploadDao.submitBusinessProfile(globalVariable.login.userID, globalVariable.login.password, businessProfile, legality);

    // ADD PARTNERS
    await
        uploadDao.submitOnePartner(globalVariable.login.userID, globalVariable.login.password, dataInviteeOne);

    await
        uploadDao.submitOnePartner(globalVariable.login.userID, globalVariable.login.password, dataInviteeTwo);

    // GET BUSINESS CODE
    I.wait(2);
    globalVariable.registration.businessCode = (await getDataDao.getBusinessCode(dataInviteeOne.email)).businessCode;

    // STORE INVITEE DATA
    globalVariable.registration.emailPartner = dataInviteeOne.email;
    globalVariable.registration.passwordPartner = dataInviteeOne.password;
    globalVariable.registration.phoneNumberPartner = dataInviteeOne.phoneNumber;
    globalVariable.registration.fullNamePartner = dataInviteeOne.fullName
    globalVariable.registration.companyName = businessProfile.businessName;
});

Then("I will directing to page legality business", () => {
    I.waitForText("Pilih salah satu tipe bisnis Anda", 10);
    I.waitForElement(headerPage.buttons.back, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);

    I.see("PT Perusahaan");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.company, 10);

    I.see("CV");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.cv, 10);

    I.see("PT Perorangan");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.individualBusiness, 10);

    I.see("UD (Usaha Dagang)");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.ud, 10);

    I.see("Individu");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.individual, 10);

    I.see("Selanjutnya");
    I.waitForElement(onboardingAccOpeningPage.buttons.next, 10);
});

Then("I can choose type account giro", () => {
    onboardingAccOpeningPage.openGiroAccountFromDashboard();
});

Then("I will directing to page capture eKTP with information {string}", async (expectedInfo) => {
    let actualInfo = await uploadKtpPage.getTextInformationType();

    I.assertEqual(actualInfo, expectedInfo);
});

Then("I will directing to Hook 1 Onboarding Account Opening", async () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 20);
});

Then("I will directing to page type giro account", async () => {
    I.waitForText("Pilih Rekening Giro", 10);
});

Then("I will directing to main dashboard with card loan application and account opening", async () => {

    I.waitForText("Apa kebutuhan Anda saat ini?", 10);
    I.see("Pinjaman Untuk Bisnis");
    I.see("Kredit Bisnis untuk berbagai kebutuhan usaha");
    I.see("Benefit");
    I.see("Bunga Kompetitif");
    I.see("Proses Cepat dan Mudah");
    I.see("Digital Banking untuk Bisnis");
    I.see("Hanya dengan:");
    I.see("Ajukan Limit Kredit");
    I.waitForElement(hookOnBoardingPage.buttons.bTnStartLoan, 10);

    onboardingAccOpeningPage.swipeToCardGiroAccount();

    I.waitForText("Rekening Untuk Bisnis", 10);
    I.see("Dapatkan Rekening Giro");
    I.see("Layanan Digital Banking untuk mengelola bisnis Anda.");

    I.see("Benefit");
    I.see("Bebas Biaya Admin Bulanan");
    I.see("Transaksi Real-Time");
    I.see("Semua Proses dari Hp Anda");
    I.see("e-Statement");
    I.dontSee("Multiple User");
    I.dontSee("Debit Card");
    I.see("Pilih Rekening Giro");
    I.waitForElement(onboardingAccOpeningPage.buttons.giroAccount, 10);
});

Then("I will see card continue to data personal", () => {
    I.waitForText("Lengkapi Data Personal", 30);
    I.see("Lanjutkan Pembuatan Rekening Giro");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
    onboardingAccOpeningPage.continueCompleteData();
});

Then("I will see card continue to data business", () => {
    I.waitForText("Lengkapi Data Bisnis", 30);
    I.see("Lanjutkan Pembuatan Rekening Giro");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.waitForElement(onboardingAccOpeningPage.buttons.completeData, 10);
    onboardingAccOpeningPage.continueCompleteData();
});

Then("I can continue to page {string}", (pageName) => {
    onboardingAccOpeningPage.validatePage(pageName);
    globalVariable.dashboard.lastPage = pageName;
});

Then("I will see card continue to complete upload document business", () => {
    I.waitForText("Lihat Semua Dokumen", 10);
    I.see("Mohon lengkapi Dokumen yang dibutuhkan");
    I.waitForElement(onboardingAccOpeningPage.buttons.completeDoc, 10);
    onboardingAccOpeningPage.continueCompleteDoc();
});

Then("I will see card continue to see progress verification", () => {
    I.waitForText("Menunggu verifikasi data selesai", 10);
    I.see("Proses pembuatan rekening giro maksimal dalam waktu 2 hari kerja");
    I.waitForElement(onboardingAccOpeningPage.buttons.openProgressAccount, 10);
    onboardingAccOpeningPage.continueToProgressVerification();
});

Then("I will see card continue to complete upload document business and registration director list", () => {
    I.waitForText("Lihat Semua Dokumen", 10);
    I.see("Mohon lengkapi Dokumen yang dibutuhkan");
    I.see("Lihat Daftar Direksi");
    I.see("Menunggu proses registrasi Daftar Direksi lainnya");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.waitForElement(onboardingAccOpeningPage.buttons.completeDoc, 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.invitedDirectors, 10);
    onboardingAccOpeningPage.continueCompleteRegistrationDirectors();
});

Then("I will see card continue to complete registration director list", () => {
    I.waitForText("Lihat Daftar Direksi", 20);
    I.see("Menunggu proses registrasi Daftar Direksi lainnya");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.waitForElement(onboardingAccOpeningPage.buttons.invitedDirectors, 10);
    onboardingAccOpeningPage.continueCompleteRegistrationDirectors();
});

Then("I will not see card continue to complete registration director list", () => {
    I.waitForElement(notificationCenterPage.buttons.notifCenter, 10);
    I.wait(2);

    I.dontSee("Menunggu proses registrasi Daftar Direksi lainnya");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.invitedDirectors);
});

Then("I can see details registration director", async () => {
    I.waitForText("Proses pengajuan pinjaman atau pembentukan rekening akan dilanjutkan setelah seluruh direktur teregistrasi.", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.refresh, 10);
    I.waitForElement(headerPage.buttons.back, 10);

    I.see(globalVariable.registration.fullNamePartner);
    I.see(globalVariable.registration.emailPartner);

    I.see("Kirim Ulang");
    I.waitForElement(onboardingAccOpeningPage.buttons.resendCode, 10);

    I.see("Ubah E-mail");
    I.waitForElement(onboardingAccOpeningPage.buttons.changeEmail, 10);

    onboardingAccOpeningPage.openDetailRegistrationDirector();

    const actualStatus = await onboardingAccOpeningPage.getStatus();
    const actualProgress = (await onboardingAccOpeningPage.getProgress()).replace(/\s+/g, '');
    const actualTextKtp = await onboardingAccOpeningPage.getTextDetail("ktp");
    const actualTextVerif = await onboardingAccOpeningPage.getTextDetail("verification");
    const actualTextSelfie = await onboardingAccOpeningPage.getTextDetail("selfie");
    const actualTextSelfieWithKtp = await onboardingAccOpeningPage.getTextDetail("selfieKtp");

    I.see("Belum melakukan proses sebagai berikut:");
    I.assertEqual(actualStatus, "Belum registrasi");
    I.assertEqual(actualProgress, "0/4");
    I.assertEqual(actualTextKtp, "Foto eKTP");
    I.assertEqual(actualTextVerif, "Verifikasi Data eKTP");
    I.assertEqual(actualTextSelfie, "Selfie");
    I.assertEqual(actualTextSelfieWithKtp, "Selfie dengan KTP");
});

Then("I can see details registration director with status still on process KYC with last step {string}", async (pageName) => {
    I.waitForText("Proses pengajuan pinjaman atau pembentukan rekening akan dilanjutkan setelah seluruh direktur teregistrasi.", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.refresh, 10);
    I.waitForElement(headerPage.buttons.back, 10);

    I.see(globalVariable.registration.fullNamePartner);
    I.see(globalVariable.registration.emailPartner);

    I.dontSee("Kirim Ulang");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.resendCode);

    I.dontSee("Ubah E-mail");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.changeEmail);

    onboardingAccOpeningPage.openDetailRegistrationDirector();

    const actualStatus = await onboardingAccOpeningPage.getStatus();
    const actualProgress = (await onboardingAccOpeningPage.getProgress()).replace(/\s+/g, '');
    const actualTextKtp = await onboardingAccOpeningPage.getTextDetail("ktp");
    const actualTextVerif = await onboardingAccOpeningPage.getTextDetail("verification");
    const actualTextSelfie = await onboardingAccOpeningPage.getTextDetail("selfie");
    const actualTextSelfieWithKtp = await onboardingAccOpeningPage.getTextDetail("selfieKtp");

    I.see("Belum melakukan proses sebagai berikut:");
    I.assertEqual(actualStatus, "Belum selesai registrasi");

    switch (pageName) {
        case "Upload eKTP":
            I.assertEqual(actualProgress, "1/4");
            break;
        case "Data KTP":
            I.assertEqual(actualProgress, "2/4");
            break;
        case "Upload Selfie":
            I.assertEqual(actualProgress, "3/4");
            break;
        default:
            throw new Error("Page name is not recognize");
    }

    I.assertEqual(actualTextKtp, "Foto eKTP");
    I.assertEqual(actualTextVerif, "Verifikasi Data eKTP");
    I.assertEqual(actualTextSelfie, "Selfie");
    I.assertEqual(actualTextSelfieWithKtp, "Selfie dengan KTP");
});

Then("I can see details registration director with status complete KYC", async () => {
    I.waitForText("Proses pengajuan pinjaman atau pembentukan rekening akan dilanjutkan setelah seluruh direktur teregistrasi.", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.refresh, 10);
    I.waitForElement(headerPage.buttons.back, 10);

    I.see(globalVariable.registration.fullNamePartner);
    I.see(globalVariable.registration.emailPartner);

    I.dontSee("Kirim Ulang");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.resendCode);

    I.dontSee("Ubah E-mail");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.changeEmail);

    onboardingAccOpeningPage.openDetailRegistrationDirector();

    const actualStatus = await onboardingAccOpeningPage.getStatus();
    const actualProgress = (await onboardingAccOpeningPage.getProgress()).replace(/\s+/g, '');
    const actualTextKtp = await onboardingAccOpeningPage.getTextDetail("ktp");
    const actualTextVerif = await onboardingAccOpeningPage.getTextDetail("verification");
    const actualTextSelfie = await onboardingAccOpeningPage.getTextDetail("selfie");
    const actualTextSelfieWithKtp = await onboardingAccOpeningPage.getTextDetail("selfieKtp");

    I.see("Belum melakukan proses sebagai berikut:");
    I.assertEqual(actualStatus, "Selesai registrasi");
    I.assertEqual(actualProgress, "4/4");
    I.assertEqual(actualTextKtp, "Foto eKTP");
    I.assertEqual(actualTextVerif, "Verifikasi Data eKTP");
    I.assertEqual(actualTextSelfie, "Selfie");
    I.assertEqual(actualTextSelfieWithKtp, "Selfie dengan KTP");
});

Then("I will notify that my personal data details needs to be verified in main dashboard", () => {
    I.waitForText("Perbankan Giro", 10);
    I.see("Menunggu verifikasi data selesai");
    I.see("Proses pembuatan rekening giro maksimal dalam waktu 2 hari kerja");
});

Then("I will see card continue to complete registration user invited", () => {
    onboardingAccOpeningPage.continueToKYC();
});

Then("I can click widget account rejected", () => {
    onboardingAccOpeningPage.openCardReject();
});

Then("I will see information that I can try to register after 7 days", () => {
    I.waitForElement(headerPage.buttons.back, 10);

    I.see("Pembuatan Rekening Ditolak");
    I.see("Mohon maaf, Amar Bank belum dapat melayani Anda.");
    I.see("Tapi jangan khawatir, Anda dapat mengulang proses registrasi kembali setelah 7 hari.");
});

Then("I will see details info of giro account Corporate and MSME", async () => {

    I.waitForElement(headerPage.buttons.closePage, 30);
    I.see("Pilih Rekening Giro");
    I.see("Silakan pilih salah satu rekening giro yang sesuai dengan kebutuhan bisnis Anda");

    // CHECKING LOAN LIMIT
    I.see("Limit Pinjaman");
    I.see("Hingga" + "\n" + "5 Miliar");
    I.see("Lebih dari" + "\n" + "5 Miliar");

    // CHECKING MIN BALANCE
    I.see("Saldo Minimum");
    I.see("Rp0");
    I.see("Rp500rb -" + "\n" + " Rp1jt*");

    // CHECKING ADMIN FEE
    I.see("Biaya Admin");
    I.see("GRATIS");
    I.see("GRATIS");

    // CHECKING MIN BALANCE FEE
    I.see("Biaya Saldo Minimum");
    I.see("GRATIS");
    I.see("Rp1.000");

    // CHECKING DORMANT FEE
    I.see("Biaya Dorman");
    I.see("GRATIS");
    I.see("Rp500");

    // CHECKING CHECK BOOK FEE
    I.see("Biaya Cetak" + "\n" + "Cek/Bilyet Giro");
    I.see("Rp290rb");
    I.see("Rp290rb");

    I.see("Pilih");
    I.waitForElement(onboardingAccOpeningPage.buttons.giroAccountMsme);
    I.waitForElement(onboardingAccOpeningPage.buttons.giroAccountCorporate);

    I.see("*Perorangan Rp500rb, Non-Perorangan Rp1jt " + "\n"
        + "**Biaya dapat berubah sewaktu-waktu sesuai ketentuan Bank");

    I.see("Lanjut Proses Pembukaan Giro");  
    I.waitForElement(onboardingAccOpeningPage.buttons.submitTypeGiro, 10);

    const isEnabled = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonChooseTypeGiro, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("product type same with I choose before", async () => {

    const actualProductType = (await resetStateDao.getProductType(globalVariable.login.userID, globalVariable.login.password)).productType;

    I.assertEqual(actualProductType, globalVariable.onBoarding.productType);
});

Then("I will direct to page continue to register KYC Invitee", () => {
    I.waitForText("Lanjutkan proses registrasi", 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.dontSee(headerPage.buttons.closePage);
    I.dontSee(headerPage.buttons.back);

    I.see("Anda hanya perlu melakukan:");
    I.see("Foto eKTP");
    I.see("Selfie");
    I.see("Selfie dengan KTP");

    I.see("Selanjutnya");
    I.waitForElement(onboardingAccOpeningPage.buttons.next, 10);
});

Then("I reset my state journey", async () => {

    const listBusinessPartner = (await getDataDao.getListBusineePartners(globalVariable.login.userID, globalVariable.login.password)).listBusinessPartners;

    if (
        listBusinessPartner !== null
    ) {

        const businessID = (await getDataDao.getBusinessId(globalVariable.login.userID, globalVariable.login.password)).id;

        await
            resetStateDao.deletePartner(businessID);

    }

    if (
        globalVariable.dashboard.lastPage === ""
    ) {
        await
            resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 0);
    }
});

Then("I reset my state journey invitee", async () => {

    await
        resetStateDao.resetStateFlow(globalVariable.login.userID, globalVariable.login.password, 2);
});

Then("I will see bottom sheet NPWP Business", () => {
    I.waitForText("NPWP Bisnis", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.closeBottomSheet, 10);
    I.see("Wajib Diisi");

    I.see("Nomor NPWP Bisnis");
    I.see("Tulis nomor NPWP bisnis");
    I.waitForElement(onboardingAccOpeningPage.fields.npwpBusiness, 10);

    I.waitForText("Lanjut Isi Data Personal", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.submitNPWP, 10);
    // checking button submit npwp is disabled
});

Then("I will see bottom sheet NPWP Business with NPWP still there", () => {
    I.waitForText("NPWP Bisnis", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.closeBottomSheet, 10);
    I.see("Wajib Diisi");

    I.see("Nomor NPWP Bisnis");
    I.dontSee("Tulis nomor NPWP bisnis");
    I.waitForElement(onboardingAccOpeningPage.fields.npwpBusiness, 10);
    I.see(globalVariable.registration.npwpBusiness);

    I.see("Lanjut Isi Data Personal");
    I.waitForElement(onboardingAccOpeningPage.buttons.submitNPWP, 10);
    // checking button submit npwp is disabled
});

Then("I see button submit NPWP is enabled", () => {
    // add checking button submit npwp enabled
});

Then("I see button submit NPWP is disabled", () => {
    // add checking button submit npwp disabled
});

Then("I don't see the NPWP business", () => {
    I.wait(1);
    I.dontSee(globalVariable.registration.npwpBusiness);
});

Then("I see my NPWP business 15 digit and auto format", () => {

    let npwpBusiness;

    if (
        globalVariable.registration.npwpBusiness !== ""
    ) {
        npwpBusiness = globalVariable.registration.npwpBusiness;

    } else {

        npwpBusiness = globalVariable.registration.npwpBusinessDefault;
    }

    const numberNpwp = npwpBusiness.substring(0, 15);

    const formattedNpwp = npwpBusiness.replace(/(\d{2})(\d{3})(\d{3})(\d{1})(\d{3})(\d{3})/, '$1.$2.$3.$4-$5.$6');

    I.waitForText(formattedNpwp, 10);
    globalVariable.registration.npwpBusiness = formattedNpwp;
});

Then("I will see pop up confirm NPWP Business", async () => {
    I.waitForText("Konfirmasi NPWP Bisnis Anda", 20);
    I.see("Nomor NPWP Anda akan kami daftarkan pada aplikasi Amar Bank Bisnis.");

    I.see("Nomor NPWP:");
    const npwpBusiness = await onboardingAccOpeningPage.getNPWPBusiness();
    I.assertEqual(npwpBusiness, globalVariable.registration.npwpBusiness);

    I.see("Kembali");
    I.waitForElement(onboardingAccOpeningPage.buttons.backNpwp, 10);

    I.see("Konfirmasi");
    I.waitForElement(onboardingAccOpeningPage.buttons.confirmNpwp, 10);
});

Then("I will see error NPWP business has been registered", async () => {
    const actualMsgError = await onboardingAccOpeningPage.getMessageErrorNPWP();
    const expectedMsgError = "Nomor NPWP sudah terdaftar di Amar Bank Bisnis";

    I.assertEqual(actualMsgError, expectedMsgError);
});

Then("I see field NPWP business is empty", () => {
    I.wait(1);
    I.waitForText("Tulis nomor NPWP bisnis", 10);
});

Then("I see message error NPWP should 15 digits", async () => {
    const actualMsgError = await onboardingAccOpeningPage.getMessageErrorNPWP();
    const expectedMsgError = "NPWP harus 15 digit";

    I.assertEqual(actualMsgError, expectedMsgError);
});

Then("I see NPWP business only number and formatted", () => {

    let npwpBusiness;

    if (
        globalVariable.registration.npwpBusiness !== ""
    ) {
        npwpBusiness = globalVariable.registration.npwpBusiness;

    } else {

        npwpBusiness = globalVariable.registration.npwpBusinessDefault;
    }

    const numberNpwp = npwpBusiness.replace(/\D/g, '');

    const formattedNpwp = [];
    const npwpChar = numberNpwp.split("");

    for (let i = 0; i < npwpChar.length; i++) {
        formattedNpwp.push(npwpChar[i]);

        if (formattedNpwp.length === 2 ||
            formattedNpwp.length === 6 ||
            formattedNpwp.length === 10 ||
            formattedNpwp.length === 16) {
            formattedNpwp.push(".");
        } else if (formattedNpwp.length === 12) {
            formattedNpwp.push("-");
        }
    }

    I.waitForText(formattedNpwp.join(''), 10);
});

Then("I will see pop up confirm close page process account opening", () => {
    I.waitForText("Ingin Keluar Dari Halaman Ini?", 10);
    I.see("Jika meninggalkan halaman ini, Anda akan diminta mengulangi proses.");

    I.see("Ya, Keluar");
    I.waitForElement(onboardingAccOpeningPage.buttons.confirmBackToDashboard, 10);

    I.see("Batalkan");
    I.waitForElement(onboardingAccOpeningPage.buttons.backToCurrentPage, 10);
});

Then("I will see form {string} is filled", async (formName) => {

    if (
        formName === "Data Business Profile"
    ) {
        const formattedNpwp = globalVariable.registration.npwpBusinessDefault.replace(/(\d{2})(\d{3})(\d{3})(\d{1})(\d{3})(\d{3})/, '$1.$2.$3.$4-$5.$6');

        globalVariable.formBusinessProfile.npwp = formattedNpwp;

        const tableForm = Object.keys(globalVariable.formBusinessProfile);

        for (let i = 0; i < tableForm.length; i++) {
            const fieldName = tableForm[i];
            const expectedValue = globalVariable.formBusinessProfile[fieldName];

            if (
                fieldName === "averageTransaction"
            ) {
                I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

                const splitAvg = globalVariable.formBusinessProfile.averageTransaction.split('');

                for (let i = splitAvg.length - 3; i > 0; i -= 3) {
                    splitAvg.splice(i, 0, '.');
                }

                const expectedAvg = splitAvg.join('');

                I.waitForText(expectedAvg, 10);

            } else {

                I.waitForText(expectedValue, 10);
            }

        }
    }

});

Then("I will see pop up exit survey", async () => {
    I.waitForText("Ingin Keluar Dari Halaman Ini?", 10);
    I.see("Jika meninggalkan halaman ini, Anda akan diminta mengulangi proses.");
    I.see("Pilih alasan dibawah ini agar kami bisa melayani Anda lebih baik lagi");

    I.waitForText("Proses akan dilanjutkan nanti", 10);
    I.waitForElement(onboardingAccOpeningPage.radioButtons.rbProcessLater, 10);

    I.see("Sedang membandingkan dengan aplikasi lain");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.rbComparingApp, 10);

    I.see("Tidak paham dengan keuntungan yang ditawarkan");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.rbNotSure, 10);

    I.see("Sudah memiliki aplikasi menawarkan keuntungan yang serupa");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.rbHasOtherApp, 10);

    I.see("Lainnya");
    I.waitForElement(onboardingAccOpeningPage.radioButtons.rbOther, 10);

    I.see("Ya, Keluar");
    I.waitForElement(onboardingAccOpeningPage.buttons.sentFeedBack, 10);

    const isEnabledSentFeedback = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonSendFeedback, 'enabled');
    I.assertEqual(isEnabledSentFeedback, "false");

    I.see("Batalkan");
    I.waitForElement(onboardingAccOpeningPage.buttons.cancelFeedBack, 10);

    const isEnabledCancel = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonCancelProcess, 'enabled');
    I.assertEqual(isEnabledCancel, "true");
});

Then("I will see button sent feedback and back is enabled", async () => {
    I.waitForElement(onboardingAccOpeningPage.buttons.sentFeedBack, 10);

    I.wait(1);
    const isEnabledSentFeedback = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonSendFeedback, 'enabled');
    I.assertEqual(isEnabledSentFeedback, "true");

    I.waitForElement(onboardingAccOpeningPage.buttons.cancelFeedBack, 10);

    I.wait(1);
    const isEnabledCancel = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonCancelProcess, 'enabled');
    I.assertEqual(isEnabledCancel, "true");
});

Then("I will see button sent feedback is disabled", async () => {
    I.waitForElement(onboardingAccOpeningPage.buttons.sentFeedBack, 10);

    I.wait(1);
    const isEnabledSentFeedback = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonSendFeedback, 'enabled');
    I.assertEqual(isEnabledSentFeedback, "false");
});

Then("I will see button back is enabled", async () => {
    I.waitForElement(onboardingAccOpeningPage.buttons.cancelFeedBack, 10);

    I.wait(1);
    const isEnabledCancel = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonCancelProcess, 'enabled');
    I.assertEqual(isEnabledCancel, "true");
});

Then("I will see field feedback exit survey", () => {
    I.waitForText("Tulis alasan lainnya", 10);
    I.waitForElement(onboardingAccOpeningPage.fields.fieldFeedback, 10);

    I.see("0/60");
});

Then("I will not see field feedback exit survey", () => {
    I.wait(1);

    I.dontSee("Tulis alasan lainnya");
    I.dontSeeElement(onboardingAccOpeningPage.fields.fieldFeedback);

    I.dontSee("0/60");
});

Then("I will see feedback filled with character only 60 char", () => {

    const trimmedWords = globalVariable.survey.feedBack.substring(0, 60);

    I.waitForText(trimmedWords, 10);
    I.see("60/60");
});

Then("I will see snackbar thank you and reason feedback is successfully sent", () => {

    I.waitForText("Terima kasih. Alasan Anda sudah terkirim.", 10);

});

Then("after 3-4 seconds, snackbar thank you and reason feedback is disappear", () => {

    I.wait(4);
    I.dontSee("Terima kasih. Alasan Anda sudah terkirim.");
});

Then("I will not see the feedback anymore", () => {
    I.wait(1);
    I.dontSee(globalVariable.survey.feedBack);
});

Then("I will see pop up confirm resend business code contain with email invitee", async () => {
    I.waitForText("Kirim Ulang Undangan", 10);
    I.see("Pastikan email tujuan sudah sesuai. Anda hanya dapat mengirim ulang undangan 1x dalam 1 hari (24 jam).");

    I.see("E-mail tujuan:");
    const destinationEmail = await onboardingAccOpeningPage.getEmailReceiver();
    I.assertEqual(destinationEmail, globalVariable.registration.emailPartner);

    I.see("Kembali");
    I.waitForElement(onboardingAccOpeningPage.buttons.backToListDirector, 10);

    I.see("Kirim");
    I.waitForElement(onboardingAccOpeningPage.buttons.confirmResendCode, 10);
});

Then("I will see snackbar success resend business code", () => {
    I.waitForText("Undangan berhasil dikirim ulang", 20);
});

Then("I will see snackbar success change new email invitee and resend business code", () => {
    I.waitForText("Email berhasil diubah dan undangan berhasil dikirim ke email baru", 20);
});

Then("I will not see button resend business code", () => {
    I.waitForElement(onboardingAccOpeningPage.buttons.refresh, 10);
    I.dontSeeElement(onboardingAccOpeningPage.buttons.resendCode);
});

Then("I back to list director", () => {
    I.waitForText(globalVariable.registration.fullNamePartner, 10);
});

Then("I will see bottom sheet change email invitee with default email", async () => {
    I.waitForElement(onboardingAccOpeningPage.buttons.closeBottomSheet, 10);
    I.see("Ubah Email Undangan");

    I.see("Email");
    I.see(globalVariable.registration.emailPartner);
    I.waitForElement(onboardingAccOpeningPage.fields.emailInvitee, 10);
    I.waitForElement(onboardingAccOpeningPage.icons.clearEmail, 10);

    I.see("Simpan dan Kirim Ulang Undangan");
    I.waitForElement(onboardingAccOpeningPage.buttons.saveAndResend, 10);

    const isEnabled = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonSaveAndResend, 'enabled');
    I.assertEqual(isEnabled, "true");

});

Then("I will see button save and resend business code is disabled", async () => {

    I.waitForElement(onboardingAccOpeningPage.statusEnabled.buttonSaveAndResend, 10);

    const isEnabled = await I.grabAttributeFrom(onboardingAccOpeningPage.statusEnabled.buttonSaveAndResend, 'enabled');
    I.assertEqual(isEnabled, "false");

});

Then("I will see message error email not in true format", async () => {

    const actualMsgError = await onboardingAccOpeningPage.getMessageErrorEmail();
    I.assertEqual(actualMsgError, "E-mail tidak sesuai format");

});

Then("I will see pop up contain with old email and new email invitee", async () => {
    I.waitForText("Ubah Email Undangan", 10);

    I.see("E-mail sebelumnya:");
    const actualOldEmail = await onboardingAccOpeningPage.getOldEmail();
    I.assertEqual(actualOldEmail, globalVariable.registration.emailPartner);

    I.see("E-mail baru:");
    const actualNewEmail = await onboardingAccOpeningPage.getNewEmail();
    if (
        globalVariable.registration.newEmailPartner === ""
    ) {
        I.assertEqual(actualNewEmail, globalVariable.registration.emailPartner);

    } else {

        I.assertEqual(actualNewEmail, globalVariable.registration.newEmailPartner);
    }

    I.see("Kirim");
    I.waitForElement(onboardingAccOpeningPage.buttons.confirmChangeEmailInvitee, 10);

    I.see("Kembali");
    I.waitForElement(onboardingAccOpeningPage.buttons.backToBottomSheetEmail, 10);

});

Then("I will see email invitee is update with new email", () => {

    I.waitForText(globalVariable.registration.newEmailPartner, 10);

});

Then("I will see email invitee is not change", () => {

    I.waitForText(globalVariable.registration.emailPartner, 10);

});

Then("I will not see button resend business code and change email invitee", async () => {

    I.waitForElement(onboardingAccOpeningPage.buttons.refresh, 10);
    I.waitForElement(headerPage.buttons.back, 10);

    I.dontSee("Kirim Ulang");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.resendCode);

    I.dontSee("Ubah E-mail");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.changeEmail);

});

Then("I see button change email invitee", async () => {

    I.waitForElement(onboardingAccOpeningPage.buttons.refresh, 10);
    I.waitForElement(headerPage.buttons.back, 10);

    I.dontSee("Kirim Ulang");
    I.dontSeeElement(onboardingAccOpeningPage.buttons.resendCode);

    I.see("Ubah E-mail");
    I.waitForElement(onboardingAccOpeningPage.buttons.changeEmail, 10);

});

Then("I get same business code with the first one", async () => {

    let emailInvitee;

    if (
        globalVariable.registration.newEmailPartner === ""
    ) {
        emailInvitee = globalVariable.registration.emailPartner;

    } else {

        emailInvitee = globalVariable.registration.newEmailPartner;
    }

    const currentBusinessCode = (await getDataDao.getBusinessCode(emailInvitee)).businessCode;
    I.assertEqual(currentBusinessCode, globalVariable.registration.businessCode);

});

Then("I will get same business code in my new email", async () => {

    const newEmailInvitee = globalVariable.registration.newEmailPartner;
    const newBusinessCode = (await getDataDao.getBusinessCode(newEmailInvitee)).businessCode;
    I.assertEqual(newBusinessCode, globalVariable.registration.businessCode);

});