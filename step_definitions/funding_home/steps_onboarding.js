const hookOnboarding = require("../../pages/hookOnboarding/hookOnboarding");

const {I, hookOnBoardingPage} = inject();

When(/user validate content onboarding \"([^\"]*)\"/, (boardType) => {
    hookOnBoardingPage.validationTextViewOnboarding(boardType);
});
Then(/user swipe the card onboarding/, () => {
    hookOnBoardingPage.swipeToCardAccOpening();

    I.waitForElement(this.buttons.bTnStartLoan);
});
Then(/user should see onboarding account opening/, () => {
    hookOnBoardingPage.viewCardOnBoardingAccOpening();
});
Then(/user should see text button \"([^\"]*)\" on field \"([^\"]*)\"/,async(expectedValue, fieldName)=>{
    let actualValue = await hookOnBoardingPage.getWordingOnButtonMainDashboardDefault(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
When(/user on main dashboard default/, () => {
    hookOnBoardingPage.viewMainDashboardDefault();
});
When(/user on main dashboard/, () => {
    hookOnBoardingPage.viewMainDashboard();
});
Then(/user click button drop off/, () => {
    hookOnBoardingPage.clickBtnDropOff();
});
Then(/user should see business data page/, () => {
    hookOnBoardingPage.viewPageBusinessData();
});
Then(/user should see personal data page/, () => {
    hookOnBoardingPage.viewPagePersonalData();
});
Then(/user should see text card \"([^\"]*)\" on field \"([^\"]*)\"/,async(expectedValue, fieldName)=>{
    let actualValue = await hookOnBoardingPage.getWordingOnTextCard(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Then(/user should see upload doc account opening only page/, () => {
    hookOnBoardingPage.viewPageUploadDoc();
});
Then(/user back to main dashboard/, () => {
    hookOnBoardingPage.clickBackButton();
});
Then(/user click button open document/, () => {
    hookOnBoardingPage.clickBtnOpenDoc();
});
Then(/user click button invited user/, () => {
    hookOnBoardingPage.clickBtnInvitedUser();
});
Then(/user should see invited user account opening only page/, () => {
    hookOnBoardingPage.viewPageInvitedUser();
});
Then(/user click button direct history loan/, () => {
    hookOnBoardingPage.clickDirectButtonLoan();
});
Then(/user close form upload doc/, () => {
    hookOnBoardingPage.clickBtnClose();
});
Then("I will directing to main dashboard with card loan application and account opening", async () => {
    I.waitForElement(hookOnBoardingPage.buttons.bTnStartLoan, 10);
    I.see("Pilihan Produk");
    I.see("Kredit Bisnis untuk berbagai kebutuhan usaha");
   

    I.see("Perbankan Bisnis Premium");
    I.seeElement(onboardingAccOpeningPage.buttons.openAccount);
    I.see("Pilih Rekening Giro");    
});
Then(/user click button Aktivitas Pinjaman/, () => {
    hookOnBoardingPage.clickDirectHistory();

});
Then(/user on Aktvitas Pinjaman page/, () =>{
    hookOnBoardingPage.viewPageHistoryLoan();
});