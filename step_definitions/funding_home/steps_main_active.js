const {I, mainActivePage} = inject();

Then(/user should see company name on card saldo/, () => {
    mainActivePage.viewCardBalance();
});
Then(/user should see individu name on card saldo/, () => {
    mainActivePage.viewCardBalanceIndividu();
});