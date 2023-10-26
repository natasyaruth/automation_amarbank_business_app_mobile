const { I, limitActivePage} = inject();

Then(/user click button confirmation/, () =>{
    limitActivePage.clickBtnBack();
});
Then(/user click button confirmation/, () =>{
    limitActivePage.clickBtnCopy();
});
Then(/user click button confirmation/, () =>{
    limitActivePage.clickBtnBackToDashboard();
});