const {
      I, 
      mainActivePage,
      loanDashboardPage,
    
    
      } = inject();

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
Then(/user see button Lihat Detail Pinjaman/, () => {
    mainActivePage.shouldseeDetailLoan();
});
Then(/user see button Gunakan Limit/, () =>{
    mainActivePage.shouldseeGunakanLimit();
});
Then(/user on Aktvitas Pinjaman page with status "Dalam Proses"/, () => {
    loanDashboardPage.goToStatusInProcessLimitHistory();
});
Then(/user go to Loan Dashboard pag/, () => {
    loanDashboardPage.goToLoanDashboard();
});    
Then(/user click button Aktivitas Pinjaman/, () => {
    mainActivePage.clickBTnDirecttoHistory();
});