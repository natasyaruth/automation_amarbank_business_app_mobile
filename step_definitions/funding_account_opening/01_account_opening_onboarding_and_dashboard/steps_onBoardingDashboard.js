const {
    I,
    onboardingAccOpeningPage,
    uploadKtpPage,
    formBusinessProfilePage,
    resetStateDao,
    headerPage,
    getDataDao,
    hookOnBoardingPage,
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
        onboardingAccOpeningPage.updateStep(stepName, );

    const isInvitee = (await getDataDao.isPartner()).data;

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

When("I clear field feedback exit survey", ()=>{
    I.wait(1);
    onboardingAccOpeningPage.clearFieldFeedback();
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
    I.waitForText("Silakan pilih salah 1 rekening giro yang sesuai dengan kebutuhan bisnis Anda", 10);
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

    const actualProductType = (await resetStateDao.getProductType()).productType;

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

    const listBusinessPartner = (await getDataDao.getListBusineePartners()).listBusinessPartners;

    if(
        listBusinessPartner !== null
    ){

        const businessID = (await getDataDao.getBusinessId()).id;

        await
            resetStateDao.deletePartner(businessID);

    } 

    if (
        globalVariable.dashboard.lastPage === ""
    ) {
        await
            resetStateDao.resetStateFlow(0);
    }
});

Then("I reset my state journey invitee", async () => {

    await
        resetStateDao.resetStateFlow(2);
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

Then("after 3-4 seconds, snackbar thank you and reason feedback is disappear", ()=>{

    I.wait(4);
    I.dontSee("Terima kasih. Alasan Anda sudah terkirim.");
});

Then("I will not see the feedback anymore", ()=>{
    I.wait(1);
    I.dontSee(globalVariable.survey.feedBack);
});