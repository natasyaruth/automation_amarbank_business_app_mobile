const { I, pdcDeliveryPage} = inject();

// screen pdc delivery
Then(/user click button copy/, () =>{
    pdcDeliveryPage.clickBtnCopy();
});