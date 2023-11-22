const { I, confirmInvoicePage} = inject();

Then(/user should see text view "Konfirmasi Invoice" on bottom sheet "titleKonfirmasiInvoice"/,()=>{
});
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