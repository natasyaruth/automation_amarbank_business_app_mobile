const {
    I,
    formDomicileAddressPage} = inject();

When("I choose my domicile address same with my identity information", () =>{
    I.waitForText("Alamat Tempat Tinggal Sekarang", 10);
    formDomicileAddressPage.chooseKtpDomicile();
});

When("I submit my domicile address", () =>{
    formDomicileAddressPage.saveDomicileAddress();
});