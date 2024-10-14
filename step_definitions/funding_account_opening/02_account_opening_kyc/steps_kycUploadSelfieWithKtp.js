const {
    I,
    resetStateDao,
    formPersonalDataPage,
    uploadSelfieKtpPage,
    getDataDao,
    globalVariable } = inject();

When("I click take photo selfie with KTP", ()=>{
    uploadSelfieKtpPage.directToPhoto();
}); 

When("I click take photo", ()=>{
    uploadSelfieKtpPage.takePhoto();
});

When("I retake the photo", ()=>{
    uploadSelfieKtpPage.reTakePhoto();
});

When("I submit my selfie with KTP", ()=>{
    uploadSelfieKtpPage.submitPhotoSelfieWithKTP();
});

Then("I will direct to page preview selfie picture with KTP", ()=>{
    I.waitForElement(uploadSelfieKtpPage.buttons.reTakePhoto, 10);
    I.waitForElement(uploadSelfieKtpPage.buttons.upload, 10);
    I.dontSee(uploadSelfieKtpPage.buttons.takePhoto);

    I.see("Ulangi");
    I.see("Kirim Foto");
});

Then("I will directing to page take selfie with KTP", ()=>{
    I.wait(3);
    I.waitForText("Selfie dengan KTP", 10);
    I.see("Pastikan foto tidak buram, tidak terkena pantulan cahaya dan tidak terpotong");

    I.see("Ambil Selfie dengan KTP");
    I.waitForElement(uploadSelfieKtpPage.buttons.takePhoto, 10);
});

Then("I will notify my selfie with KTP is successfully submitted", ()=>{
    I.waitForText("Foto diri dengan KTP berhasil dikirim", 10);
});

Then("I will direct to page take a selfie with KTP", async()=>{
    I.waitForText("Ambil Foto Diri Anda dengan KTP", 10);

    const businessType = globalVariable.onBoarding.legality;
    const isInvitee = (await getDataDao.isPartner(globalVariable.login.userID, globalVariable.login.password)).data;

    if(
        isInvitee === false
    ){
        if(
            businessType === "company" ||
            businessType === "cv"
        ) {
            I.see("Pembentukan rekening memerlukan foto diri dengan KTP salah satu direktur");
        
        } else{
        
            I.see("Pembentukan rekening memerlukan foto diri dengan KTP pemilik bisnis");
        }

    } else {
        I.see("Data ini dibutuhkan sesuai ketentuan dari OJK dan Bank Indonesia.");
    }

    I.see("Ambil Foto Diri dengan KTP");
    I.waitForElement(uploadSelfieKtpPage.buttons.directToTakePhoto, 10);
});    