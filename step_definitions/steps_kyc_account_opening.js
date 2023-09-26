const {
    I,
    uploadKtpPage,} = inject();

Given("I am a customer who has selected the business type UD", () =>{}); 

When("I continue to take eKTP photo", ()=>{
    uploadKtpPage.takePhoto();
});

When("I capture my eKTP photo", ()=>{
    I.waitForText("Foto eKTP", 10);
    I.see("Pastikan foto eKTP tidak buram, tidak terkena pantulan cahaya dan tidak terpotong");
    I.see("Ambil Foto eKTP");

    // step to bypass eKTP photo
});

When("I upload my eKTP photo", ()=>{
    uploadKtpPage.uploadPhoto();
});

Then("I will directing to page submit form KTP", () =>{
    // I.waitForText("Verifikasi Data eKTP", 10);
});