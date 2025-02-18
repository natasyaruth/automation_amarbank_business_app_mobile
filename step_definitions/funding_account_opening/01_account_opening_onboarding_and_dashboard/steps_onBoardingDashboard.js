const {
    I,
    onboardingAccOpeningPage,
    headerPage,
    globalVariable } = inject();

When("I swipe to card Giro Account", () => {
    onboardingAccOpeningPage.swipeToCardGiroAccount();
});

When("I click back in header page", () => {
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

When("I fill NPWP Business", () => {
    onboardingAccOpeningPage.fillFieldNPWPBusiness(globalVariable.registration.npwpBusinessDefault);
});

When("I click continue to data personal", () => {
    onboardingAccOpeningPage.continueToDataPersonal();
});

When("I click confirm NPWP Business", () => {
    onboardingAccOpeningPage.confirmNPWP();
});

Then("I will directing to Hook 1 Onboarding Account Opening", async () => {
    I.waitForText("Apa kebutuhan Anda saat ini?", 20);
});

Then("I can continue to page {string}", (pageName) => {
    onboardingAccOpeningPage.validatePage(pageName);
    globalVariable.dashboard.lastPage = pageName;
});