const { I, limitActivePage} = inject();


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