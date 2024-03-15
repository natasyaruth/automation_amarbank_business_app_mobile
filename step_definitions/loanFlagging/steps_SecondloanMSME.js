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
    loginPage,
    loanDashboardPage,
    transactionHistoryPage,

} = inject();

// Feature for loan AP Direct AR Direct

Given('I click button loan dashboard', () => {
    loanDashboardPage.goToLoanDashboard();
});

Then(/I click menu tab testing/, () => {
    transactionHistoryPage.clickTabTesting();
});

Given('I am on onboarding loan', () => {
    loanTypePage.viewPageOnBoarding();    
});

When('user click button apply new limit', () => {
    I.wait(5);
    loanDashboardPage.applyNewLimitLoan();
});

When("user Input Nominal Pinjaman {string}", (nominal) => {
    loanFlaggingPage.fillNominalPinjaman(nominal);
});

When("user input loan tenor {string}", (tenor) => {
    loanFlaggingPage.fillTenor(tenor);
});

When('user select domicile office', () => {
    I.wait(50);
    selectLoanAmountPage.viewHeadOfficeLocationPage();
});

When('user click button Selanjutnya in page domicile office', () => {
    I.wait(5);
    selectLoanAmountPage.viewHeadOfficeLocationPage();
});

When('I select business location jabodetabek', () => {
    I.wait(5);
    selectLoanAmountPage.selectJabodetabekLocation();
});

When ('user click on button Selanjutnya', () => {
    loanFlaggingPage.ClickNext();
});

When(/I select loan type \"([^\"]*)\"/,(selectLoanType)=>{
    I.wait(5);
    loanTypePage.selectLoanTypeList(selectLoanType);
});

When('I click on Lihat Skema Pinjaman', () => {
    loanTypePage.clickNextButton();
});

When('I click button select the schema', () => {
    loanTypePage.clickNextButton();
});

When('I click icon other anchor', () => {
    selectAnchorPage.clickIconOtherAnchor();
});

When('user click another anchor', () => {
    selectAnchorPage.clickIconOtherAnchor();
});

When(/I fill a field \"([^\"]*)\" with \"([^\"]*)\"/,(fieldName, actualValue)=>{
    selectAnchorPage.fillFieldAnchorName(fieldName, actualValue);
});

When('I select industry type', () => {
    selectAnchorPage.selectIndustryType();
});


When('I select the date cooperating', () => {
    selectAnchorPage.selectDateCooperating();
});

When('user click button Kirim Pengajuan Pinjaman', () => {
    I.wait(5);
    loanFlaggingPage.ClickNext();
});

When('I click button continue complete the data', () => {
    selectLoanAmountPage.validateCompletedDataSection();
});

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

//feature loan AP Anchor AR Anchor

When(/I fill search anchor \"([^\"]*)\"/,(txtValue)=>{
    selectAnchorPage.fillFieldSearch(txtValue);
});

When(/I select result of search/,()=>{
    selectAnchorPage.selectAnchorList();
});

When("user swipe to supplier", () => {
    I.swipeUp(selectAnchorPage.fields.anchorAddress, 5000, 5000);
});

When("user agree with the terms and condition", async () => {
    await selectAnchorPage.termsAndCondition();
});

When("user allow to agree to use my digital signature through Privy.id", async () => {
    await selectAnchorPage.privyAggrementPage();
});

Given(/user on buyer cooperating page/,()=>{
    selectAnchorPage.viewBuyerPage();
});

Then(/user want to click button ok/, () => {
    transactionHistoryPage.clickBtnOk();
});