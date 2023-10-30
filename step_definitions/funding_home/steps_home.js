const {I, homePage} = inject();

Given(/I am on home page/, () => {
    homePage.viewUserName();
});
When(/I should see button history on saldo card/, () => {
    homePage.seeBtnHistory();
});
Then(/I want to click button history transaction/, () => {
    homePage.clickBtnHistory();
});
Then(/I will redirect to history transaction page/, () => {
    homePage.viewPageHistoryTransaction();
});


// hitory page
Given(/I want to click button filter history/, () => {
    homePage.clicBtnFilter();
});
When(/I should see buttom sheet filter history/, () => {
    homePage.viewBtmSheetFilterHistory();
});
Then(/I want to click button close/, () => {
    homePage.clicBtnClose();
});
Then(/I want to click button start date/, () => {
    homePage.clicFieldStartDate();
});
Then(/I should see form date displayed/, () => {
    homePage.viewFormDate();
});
Then(/I choose the start date \"([^\"]*)\"/, (Date) => {
    homePage.selectDayDate(Date);
    homePage.selectDayDate(Date);
    homePage.selectMonthDate(Date);
    homePage.selectMonthDate(Date);
    homePage.clickBtnChoose();
});
Then(/I want to click button end date/, () => {
    homePage.clicFieldEndDate();
});
Then(/I choose the end date/, () => {
    homePage.clickBtnChoose();
});
Then(/I want to click button ok/, () => {
    homePage.clickBtnOk();
});


//transaction detail
Given(/I want to click list transfer \"([^\"]*)\"/, (trfType) => {
    homePage.clickListTransfer(trfType);
});
When(/I should see text view transfer \"([^\"]*)\"/, (trfType) => {
    homePage.validateTextViewTransfer(trfType);
});
Then(/I should see reference number value \"([^\"]*)\"/, (trfType) => {
    homePage.shouldSeeTextViewRefNumber(trfType);
});
Then(/I want to copied reference number value/, () => {
    homePage.clickBtnCopied();
});
Then(/I should see text view value date transfer\"([^\"]*)\"/, (trfType) => {
    homePage.shouldSeeTextViewDate(trfType);
});
Then(/I should see text view value time transfer\"([^\"]*)\"/, (trfType) => {
    homePage.shouldSeeTextViewTime(trfType);
});
Then(/I should see text view value note transfer\"([^\"]*)\"/, (trfType) => {
    homePage.shouldSeeTextViewNoted(trfType);
});
Then(/I want to click button share/, () => {
    homePage.clickBtnShare();
});