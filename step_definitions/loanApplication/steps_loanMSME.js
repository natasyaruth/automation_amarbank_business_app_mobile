const loanType = require("../../pages/loanApplication/loanType");
const loanFlagging = require("../../pages/loanFlagging/loanFlagging");

const{
    I,
    globalVariable,    
    headerPage,
    onboardingAccOpeningPage,
    loanFlaggingPage,
    loanTypePage,
    selectLoanAmountPage,
    selectAnchorPage,
    uploadKtpPage,
    resetStateDao,
    formKtpPage,
    formPersonalDataPage,
    formDomicileAddressPage,
    loanMonitoringProcessPage,
    

} = inject();

// Feature for loan AP Direct AR Direct

Given('I am on onboarding loan', () => {
    loanTypePage.viewPageOnBoarding();    
});

When('I click button ajukan pinjaman', () => {
    I.wait(2);
    loanTypePage.validationTextTittleOnboarding();
});

When("I Input Nominal Pinjaman {string}", (nominalAP) => {
    loanFlaggingPage.fillNominalPinjaman(nominalAP);
});

When("I Input Tenor {string}", (tenor) => {
    loanFlaggingPage.fillTenor(tenor);
});

When('I select business location jabodetabek', () => {
    selectLoanAmountPage.selectJabodetabekLocation();
});

When ('I click on button Selanjutnya', () => {
    loanFlaggingPage.ClickNext();
});

When(/I select loan type \"([^\"]*)\"/,(selectLoanType)=>{
    I.wait(2);
    loanTypePage.selectLoanTypeList(selectLoanType);
});

When('I click on Lihat Skema Pinjaman', () => {
    loanTypePage.clickNextButton();
});

when('I click button select the schema', () => {
    loanTypePage.clickNextButton();
});

When('I click icon other anchor', () => {
    selectAnchorPage.clickIconOtherAnchor();
});

When(/I fill a field \"([^\"]*)\" with \"([^\"]*)\"/,(fieldName, actualValue)=>{
    selectAnchorPage.fillFieldAnchorName(fieldName, actualValue);
});

When('I select industry type', () => {
    selectAnchorPage.selectIndustryType();
});

when('I select the date cooperating', () => {
    selectAnchorPage.selectDateCooperating();
});

When('I click button next', () => {
    selectAnchorPage.clickNextBtnOnAnchorPage();
});

//When('I click button continue complete the data', () => {
    //selectLoanAmountPage.validateCompletedDataSection();
//});

When('I choose legality business type {string}', (businessType) => {
    onboardingAccOpeningPage.chooseLegalityBusinessType(businessType);
    globalVariable.onBoarding.legality = businessType;
});

When("I submit my legality type", () => {
    onboardingAccOpeningPage.continueToKYC();
    I.wait(3);
});

When("I update my last journey step to {string}", async (stepName) => {
    await onboardingAccOpeningPage.updateStep(stepName, globalVariable.login.userID, globalVariable.login.password);
});

When("I continue to process KYB", () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.waitForElement(formEmploymentDataPage.buttons.continue, 10);
    formEmploymentDataPage.continueToKYB();
});

When("I fill my business profile as followings:", (table) => {
    I.waitForElement(formBusinessProfilePage.fields.businessName, 10);

    const businessProfile = table.parse().rowsHash();
    formBusinessProfilePage.fillBusinessProfile(businessProfile);
});

When("I submit my business profile", () => {
    formBusinessProfilePage.saveBusinessProfile();
});

When("I submit business director list", () => {
    formBusinessOwnerPage.saveListDirectors();
});

Then("I will see checkbox Rights & Policy and T&C about loan", async () => {
    const legalityType = globalVariable.onBoarding.legality;

    if (
        legalityType === "individual"
    ) {
        I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
        I.swipeUp(
            formEmploymentDataPage.dropDowns.monthlyIncome,
            1000,
            1000
        );
    } else {
        I.waitForElement(formBusinessAddressPage.fields.address, 10);
    }

    I.seeElement(formEmploymentDataPage.checkBox.rights);
    I.seeElement(formEmploymentDataPage.checkBox.loan);
    I.dontSeeElement(formEmploymentDataPage.checkBox.privy);
    I.waitForText("Saya setuju untuk menjalankan hak dan kewajiban yang telah ditentukan dalam pembuatan rekening Amar Bank di PT Bank Amar Indonesia Tbk", 10);
    I.waitForText("Saya menyetujui Syarat & Ketentuan dalam pengajuan pinjaman dari PT. Bank Amar Indonesia Tbk .", 10);
    I.dontSee("Saya menyetujui menggunakan tanda tangan digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat. ");

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

When(/I should see text bottom sheet \"([^\"]*)\" in field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await loanMonitoringProcessPage.getTextFieldBottomSheet(fieldName);
    I.assertEqual(actualValue, expectedValue);
});

When(/user close the bottom sheet/,()=>{
    loanMonitoringProcessPage.clickCloseBtnBottomSheet();
});

//feature loan AP Anchor AR Anchor

When(/I fill search anchor \"([^\"]*)\"/,(txtValue)=>{
    selectAnchorPage.fillFieldSearch(txtValue);
});

When(/I select result of search/,()=>{
    selectAnchorPage.selectAnchorList();
});

