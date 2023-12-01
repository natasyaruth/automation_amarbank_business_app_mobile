const { I, limitActivePage} = inject();

Then(/I should see the wording dan card design of "Loan AP"/,()=>{
});
// screen active limit
Then(/user click button back/, () =>{
    limitActivePage.clickBtnBack();
});
Then(/user click button copy/, () =>{
    limitActivePage.clickBtnCopy();
});
Then(/user click button lihat pinjaman/, () =>{
    limitActivePage.clickBtnBackToDashboard();
});