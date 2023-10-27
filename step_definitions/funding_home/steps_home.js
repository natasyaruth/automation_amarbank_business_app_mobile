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
