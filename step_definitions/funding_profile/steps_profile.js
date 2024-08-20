const { I,
    transactionHistoryPage,
    globalVariable,
    profilePage,
    resetStateDao,
    headerPage,
    getDataDao,
    onboardingAccOpeningPage,
    documentPage,
} = inject();

When("I will see card account {string}", async (typeAccount) => {
    if (
        typeAccount === "active"
    ) {
        I.waitForElement(transactionHistoryPage.buttons.historyBtn, 30);

    } else if (
        typeAccount === "on verification"
    ) {
        I.waitForText("Menunggu verifikasi data selesai", 30);
        I.see("Proses pembuatan rekening giro maksimal dalam waktu 2 hari kerja");

        const isPartner = (await getDataDao.isPartner(globalVariable.login.userID, globalVariable.login.password)).data;
        const isIndividual = (await resetStateDao.getAccountType(globalVariable.login.userID, globalVariable.login.password)).accountType;

        if(
            isPartner === true ||
            isIndividual === 1
        ){
            I.dontSee(onboardingAccOpeningPage.buttons.openProgressAccount);
            I.dontSee("Progres Pembukaan Rekening");

        } else{

            I.waitForElement(onboardingAccOpeningPage.buttons.openProgressAccount, 10);
            I.see("Progres Pembukaan Rekening");
        }

    } else if (
        typeAccount === "complete document"
    ) {
        I.waitForText("Mohon lengkapi Dokumen yang dibutuhkan", 30);

    } else if (
        typeAccount === "on process"
    ) {
        I.waitForText("Lanjutkan Pembuatan Rekening Giro", 30);

    } else if (
        typeAccount === "account opening"
    ) {
        I.waitForText("Perbankan Bisnis Premium", 30);
        I.waitForText("Buka Rekening Giro", 10);
    }

    globalVariable.onBoarding.status = typeAccount;
});

When("I click tab profile", () => {
    profilePage.clickTabProfile();
});

When("I see my profile company data", () => {
    I.waitForText("Direktur", 10);
    I.waitForText(globalVariable.login.userID.toUpperCase(), 10);

    if (
        globalVariable.onBoarding.status === "active"
    ) {
        I.seeElement(profilePage.buttons.copyAccNumber);

    } else {
        I.dontSeeElement(profilePage.buttons.copyAccNumber);
    }

    I.waitForText("Tipe Industri", 10);
    I.waitForText("Jenis Bisnis", 10);
    I.waitForText("Tanggal Berdiri", 10);
    I.waitForText("Alamat Bisnis", 10);
    I.waitForElement(profilePage.buttons.transactionApprovalDetail, 10);
    I.swipeUp(profilePage.buttons.transactionApprovalDetail, 800, 800);
});

When("I see my profile individual company data", () => {
    I.waitForText("Pemilik Bisnis", 10);
    I.see(globalVariable.login.userID.toUpperCase());

    if (
        globalVariable.onBoarding.status === "active"
    ) {
        I.seeElement(profilePage.buttons.copyAccNumber);

    } else {
        I.dontSeeElement(profilePage.buttons.copyAccNumber);
    }

    I.see("Tipe Industri");
    I.see("Jenis Bisnis");
    I.see("Tanggal Berdiri");
    I.see("Alamat Bisnis");
    I.seeElement(profilePage.buttons.documentProcuration);
    I.swipeUp(profilePage.buttons.documentProcuration, 500, 800);
});

When("I click document business", () => {
    profilePage.clickDocumentBusiness();
});

When("I click document giro", () => {
    documentPage.clickDocumentGiro();
});

When("I back to page profile business", () => {
    I.wait(2);
    headerPage.clickButtonBack();
});

When("I back to page document business", () => {
    I.wait(2);
    headerPage.clickButtonBack();
});

Then("I will see my profile individual data", () => {
    I.waitForText("Individu", 10);
    I.see(globalVariable.login.userID.toUpperCase());

    if (
        globalVariable.onBoarding.status === "active"
    ) {
        I.seeElement(profilePage.buttons.copyAccNumber);

    } else {
        I.dontSeeElement(profilePage.buttons.copyAccNumber);
    }

    I.dontSee("Tipe Industri");
    I.dontSee("Jenis Bisnis");
    I.dontSee("Tanggal Berdiri");
    I.dontSee("Alamat Bisnis");
    I.dontSeeElement(profilePage.buttons.documentProcuration);
    I.dontSeeElement(profilePage.buttons.documentBusiness);
});

Then("I will not see button document business", () => {
    I.dontSeeElement(profilePage.buttons.documentBusiness);
});