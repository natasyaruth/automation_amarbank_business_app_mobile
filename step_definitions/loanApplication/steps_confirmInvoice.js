const { I, confirmInvoicePage} = inject();


// screen confirm invoice
Then(/user click button back/, () =>{
    confirmInvoicePage.clickBtnPreview();
});
Then(/user click button copy/, () =>{
    confirmInvoicePage.clickBtnDisburse();
});
Then(/user click button lihat pinjaman/, () =>{
    confirmInvoicePage.clickBtnComplain();
});