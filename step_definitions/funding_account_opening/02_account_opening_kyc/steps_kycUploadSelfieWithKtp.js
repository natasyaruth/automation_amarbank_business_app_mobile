const {
    I,
    uploadSelfieKtpPage,} = inject();

When("I click take photo selfie with KTP", ()=>{
    uploadSelfieKtpPage.directToPhoto();
}); 

When("I click take photo", ()=>{
    uploadSelfieKtpPage.takePhoto();
});

When("I submit my selfie with KTP", ()=>{
    uploadSelfieKtpPage.submitPhotoSelfieWithKTP();
});