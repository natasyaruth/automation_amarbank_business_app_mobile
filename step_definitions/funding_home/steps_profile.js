const { I,
    homePage,
    globalVariable,
    profilePage,
    headerPage,
} = inject();

When("I will see card account {string}", (typeAccount) => {
    if(
        typeAccount === "active"
    ){
        I.waitForElement(homePage.buttons.historyBtn, 10);

    } else if (
        typeAccount === "on verification"
    ){
        I.waitForText("Menunggu verifikasi data selesai", 10);

    } else if (
        typeAccount === "complete document"
    ){
        I.waitForText("Mohon lengkapi Dokumen yang dibutuhkan", 10);

    } 
    globalVariable.onBoarding.status = typeAccount;
});

When("I click tab profile", () => {
    profilePage.clickTabProfile();
});

When("I see my profile company data", () => {
    I.waitForText("Direktur", 10);
    I.see(globalVariable.login.userID.toUpperCase());

    if(
        globalVariable.onBoarding.status === "active"
    ){
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

When("I see my profile individual company data", () => {
    I.waitForText("Pemilik Bisnis", 10);
    I.see(globalVariable.login.userID.toUpperCase());

    if(
        globalVariable.onBoarding.status === "active"
    ){
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
    profilePage.clickDocumentGiro();
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
    
    if(
        globalVariable.onBoarding.status === "active"
    ){
        I.seeElement(profilePage.buttons.copyAccNumber); 

    } else {
        I.dontSeeElement(profilePage.buttons.copyAccNumber); 
    }

    I.dontSee("Tipe Industri");
    I.dontSee("Jenis Bisnis");
    I.dontSee("Tanggal Berdiri");
    I.dontSee("Alamat Bisnis");
    I.seeElement(profilePage.buttons.documentProcuration);
});

Then("I will not see button document business", () => {
    I.swipeUp(profilePage.buttons.documentProcuration, 500, 800);
    I.dontSeeElement(profilePage.buttons.documentBusiness);
});

Then("I will see document business for type company", () => {
    I.waitForElement(profilePage.buttons.downloadNib, 10);
    I.see("NIB Berbasis Resiko");
    I.see("NIB Berbasis Resiko.pdf");

    I.seeElement(profilePage.buttons.downloadDeed);
    I.see("Akta Perusahaan");
    I.see("Akta Perusahaan.pdf");

    I.seeElement(profilePage.buttons.downloadSk);
    I.see("SK Kemenkumham");
    I.see("SK Kemenkumham.pdf");

    I.seeElement(profilePage.buttons.downloadNpwp);
    I.see("NPWP Perusahaan");
    I.see("NPWP Perusahaan.pdf");

    I.see("Dokumen Giro");
});

Then("I will see document business for type individual company", () => {
    I.waitForElement(profilePage.buttons.downloadNib, 10);
    I.see("NIB Berbasis Resiko");
    I.see("NIB Berbasis Resiko.pdf");

    I.seeElement(profilePage.buttons.downloadDeed);
    I.see("Akta Perusahaan");
    I.see("Akta Perusahaan.pdf");

    I.dontSeeElement(profilePage.buttons.downloadSk);
    I.dontSee("SK Kemenkumham");
    I.dontSee("SK Kemenkumham.pdf");

    I.dontSeeElement(profilePage.buttons.downloadNpwp);
    I.dontSee("NPWP Perusahaan");
    I.dontSee("NPWP Perusahaan.pdf");

    I.see("Dokumen Giro");
});

Then("I will see one document giro", () => {
    I.waitForElement(profilePage.buttons.downloadNib, 10);
    I.see("NIB Berbasis Resiko");
    I.see("NIB Berbasis Resiko.pdf");

    I.see("Dokumen Giro");
});

Then("I will direct to page document business", () => {
    I.waitForText("Dokumen Giro", 10);
});
