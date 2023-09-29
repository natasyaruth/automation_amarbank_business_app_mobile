const {
    I,
    formEmploymentDataPage,
    formBusinessProfilePage,
    headerPage,
    globalVariable
} = inject();

Given("I am a customer who has completed my KYC process", ()=>{
   headerPage.clickButtonBack();
   I.waitForText("Dashboard Screen") 
});

When("I continue to process KYB", ()=>{
    // I.waitForElement(formEmploymentDataPage.buttons.continueToKYB, 10);
    // formEmploymentDataPage.continueToKYB();
    I.click("Go To KYB")
});

When("I fill my business profile as followings:", (table)=>{
    I.waitForElement(formBusinessProfilePage.fields.businessName, 10);
    
    const businessProfile = table.parse().rowsHash();
    formBusinessProfilePage.fillBusinessProfile(businessProfile);
});

When("I submit my business profile", ()=>{
    formBusinessProfilePage.saveBusinessProfile();
});

Then("I will notify my business profile has successfully submitted", ()=>{
    I.waitForText("Profil bisnis berhasil disimpan", 10)
});

Then ("I will directing to page business owner", async ()=>{
    I.waitForText("Pemilik bisnis", 10);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});