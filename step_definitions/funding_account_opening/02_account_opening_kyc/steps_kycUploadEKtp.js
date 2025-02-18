const {
    I,
    uploadKtpPage} = inject();

When("I click take photo eKTP", () => {
    uploadKtpPage.directToTakePhoto();
});

When("I take photo eKTP", () => {
    uploadKtpPage.takePhoto();
});

When("I retake photo eKTP", () => {
    uploadKtpPage.retakePhoto();
});

When("I submit my eKTP photo", () => {
    uploadKtpPage.uploadPhoto();
});

Then("I will directing to page take photo eKTP", () => {
    I.waitForText("Foto eKTP", 10);
    I.see("Pastikan foto eKTP tidak buram, tidak terkena pantulan cahaya dan tidak terpotong");
    I.see("Ambil Foto eKTP");

    I.waitForElement(uploadKtpPage.buttons.takePhoto, 10);

});