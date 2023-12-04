const {I, mainActivePage} = inject();

Then(/user should see company name on card saldo/, () => {
    mainActivePage.viewCardBalance();
});
Then(/user should see individu name on card saldo/, () => {
    mainActivePage.viewCardBalanceIndividu();
});
Then(/user should see acc creation name on card saldo/, () => {
    mainActivePage.viewCardRejectAccountCreation();
});
Then(/user should see loan application name on card saldo/, () => {
    mainActivePage.viewCardRejectLoanApplication();
});
Then(/user should see card balance/, () => {
    mainActivePage.viewCardBalanceAccoount();
});
Then(/user should see activity loan wording/, () => {
    mainActivePage.shouldSeeActivityLoan();
});
When(/user should see value limit active/, () => {
    mainActivePage.valueLimitActive();
});
Then(/user should see total loan process/, () => {
    mainActivePage.valueLoanProcess();
});
Then(/user should see button apply new limit loan/, () => {
    mainActivePage.shouldSeeBtnNewLimit();
});