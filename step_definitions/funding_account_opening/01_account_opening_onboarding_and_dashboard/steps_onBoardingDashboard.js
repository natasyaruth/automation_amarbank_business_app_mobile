const {
    I,
    onboardingAccOpeningPage,
    uploadKtpPage,
    resetStateDao,
    headerPage,
    getDataDao,
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

When("I swipe to card Giro Account", () => {
    onboardingAccOpeningPage.swipeToCardGiroAccount();
});

When("I back to dashboard", () => {
    headerPage.clickButtonBack();
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

When("I choose Giro Account Corporate", () => {
    onboardingAccOpeningPage.openGiroAccountCorporate();
    globalVariable.onBoarding.productType = "CORP";
});

When("I choose Giro Account MSME", () => {
    onboardingAccOpeningPage.openGiroAccountMsme();
    globalVariable.onBoarding.productType = "MSME";
});

When("I see page {string}", (pageName) => {
    onboardingAccOpeningPage.validatePage(pageName);
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
        onboardingAccOpeningPage.updateStep(stepName, globalVariable.login.userID, globalVariable.login.password);

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
    I.waitForElement(onboardingAccOpeningPage.buttons.openLoan, 10);
    I.see("Pilihan Produk");
    I.see("Rp 5 Milyar");
    I.see("Pinjaman untuk Bisnis dari Amar Bank");
    I.see("Dapatkan pinjaman untuk pembiayaan transaksi bisnis Anda.");

    I.see("Perbankan Bisnis Premium");
    I.seeElement(onboardingAccOpeningPage.buttons.openAccount);
    I.see("Pilih Rekening Giro");
});

Then("I will see card continue to data personal", () => {
    I.waitForText("Lengkapi Data Personal", 10);
    I.see("Lanjutkan Pembuatan Rekening Giro");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
    onboardingAccOpeningPage.continueCompleteData();
});

Then("I will see card continue to data business", () => {
    I.waitForText("Lengkapi Data Bisnis", 10);
    I.see("Lanjutkan Pembuatan Rekening Giro");
    I.see("Perbankan Giro");
    I.see("Pinjaman");
    I.seeElement(onboardingAccOpeningPage.buttons.completeData);
    onboardingAccOpeningPage.continueCompleteData();
});

Then("I can continue to page {string}", async (pageName) => {
    onboardingAccOpeningPage.validatePage(pageName);
    globalVariable.dashboard.lastPage = pageName;

    if (pageName === "Registration Director") {
        const businessID = (await getDataDao.getBusinessId(globalVariable.login.userID, globalVariable.login.password)).id;

        await
            resetStateDao.deletePartner(businessID);

        await
            resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
    } else {

        await
            resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
    }
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
    I.seeElement(onboardingAccOpeningPage.buttons.completeDoc);
    I.seeElement(onboardingAccOpeningPage.buttons.invitedDirectors);
    onboardingAccOpeningPage.continueCompleteRegistrationDirectors();
});

Then("I can see details registration director", async () => {
    I.waitForText("Proses pengajuan pinjaman atau pembentukan rekening akan dilanjutkan setelah seluruh direktur teregistrasi.", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.refresh, 10);
    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);

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

Then("I will see details info of giro account MSME", async () => {
    I.waitForText("Silahkan pilih salah 1 rekening giro yang sesuai dengan kebutuhan bisnis Anda", 10);
    I.see("Pilih Rekening Giro");

    // CHECKING ADMIN FEE
    I.see("Biaya Admin");

    const actualAdminFee = await onboardingAccOpeningPage.getAdminFeeMsme();
    I.assertEqual(actualAdminFee, "FREE");

    // CHECKING MIN BALANCE
    I.see("Saldo Minimum");

    const actualMinBalance = await onboardingAccOpeningPage.getMinBalanceMsme();
    I.assertEqual(actualMinBalance, "FREE");

    // CHECKING MIN BALANCE FEE
    I.see("Biaya Saldo " + "\n" + "Minimum");

    const actualMinBalanceFee = await onboardingAccOpeningPage.getMinCostMsme();
    I.assertEqual(actualMinBalanceFee, "FREE");

    // CHECKING DORMANT FEE
    I.see("Biaya Dorman");

    const actualDormantFee = await onboardingAccOpeningPage.getDormantFeeMsme();
    I.assertEqual(actualDormantFee, "FREE");

    // CHECKING CHECK BOOK FEE
    I.see("Biaya Cetak Cek /" + "\n" + "Bilyet Giro");

    const actualCheckBookFee = await onboardingAccOpeningPage.getCheckBookFeeMsme();
    I.assertEqual(actualCheckBookFee, "Rp290rb");

    // CHECKING LOAN LIMIT
    I.see("Dapatkan Limit " + "\n" + "Pinjaman");

    const actualLoanLimit = await onboardingAccOpeningPage.getLoanLimitMsme();
    I.assertEqual(actualLoanLimit, "Sampai " + "\n" + "Rp 5 Milyar");

    I.see("Buka Giro");
    I.seeElement(onboardingAccOpeningPage.buttons.giroAccountMsme);
    I.see("*Biaya dapat berubah sewaktu-waktu sesuai ketentuan Bank")

});

Then("I will see details info of giro account Corporate", async () => {

    // CHECKING ADMIN FEE
    I.see("Biaya Admin");

    const actualAdminFee = await onboardingAccOpeningPage.getAdminFeeCorporate();
    I.assertEqual(actualAdminFee, "FREE");

    // CHECKING MIN BALANCE
    I.see("Saldo Minimum");

    const actualMinBalance = await onboardingAccOpeningPage.getMinBalanceCorporate();
    I.assertEqual(actualMinBalance, "Rp500rb - Rp1jt");

    // CHECKING MIN BALANCE FEE
    I.see("Biaya Saldo " + "\n" + "Minimum");

    const actualMinBalanceFee = await onboardingAccOpeningPage.getMinCostCorporate();
    I.assertEqual(actualMinBalanceFee, "Rp1.000");

    // CHECKING DORMANT FEE
    I.see("Biaya Dorman");

    const actualDormantFee = await onboardingAccOpeningPage.getDormantFeeCorporate();
    I.assertEqual(actualDormantFee, "Rp500");

    // CHECKING CHECK BOOK FEE
    I.see("Biaya Cetak Cek /" + "\n" + "Bilyet Giro");

    const actualCheckBookFee = await onboardingAccOpeningPage.getCheckBookFeeCorporate();
    I.assertEqual(actualCheckBookFee, "Rp290rb");

    // CHECKING LOAN LIMIT
    I.see("Dapatkan Limit " + "\n" + "Pinjaman");

    const actualLoanLimit = await onboardingAccOpeningPage.getLoanLimitCorporate();
    I.assertEqual(actualLoanLimit, "Diatas " + "\n" + "Rp 5 Milyar");

    I.see("Buka Giro");
    I.seeElement(onboardingAccOpeningPage.buttons.giroAccountCorporate);
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

    if (
        globalVariable.dashboard.lastPage === ""
    ) {
        await
            resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
    }
});

Then("I will see bottom sheet NPWP Business", () => {
    I.waitForText("NPWP Bisnis", 10);
    I.waitForElement(onboardingAccOpeningPage.buttons.closeBottomSheet, 10);
    I.see("Wajib Diisi");

    I.see("Nomor NPWP Bisnis");
    I.see("Tulis nomor NPWP bisnis");
    I.waitForElement(onboardingAccOpeningPage.fields.npwpBusiness, 10);

    I.see("Lanjut Isi Data personal");
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

    I.see("Lanjut Isi Data personal");
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

    const numberNpwp = npwpBusiness.substring(0,15);

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

Then("I see field NPWP business is empty", ()=>{
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