const {I, hookOnBoardingPage} = inject();

When(/user validate content onboarding \"([^\"]*)\"/, (boardType) => {
    hookOnBoardingPage.validationTextViewOnboarding(boardType);
});
Then(/user swipe the card onboarding/, () => {
    hookOnBoardingPage.swipeToCardAccOpening();
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