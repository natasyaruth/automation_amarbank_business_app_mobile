const {
    I,
    uploadSelfiePage} = inject();

When("I click take my photo selfie", () => {
    uploadSelfiePage.directToTakePhoto();
});

When("I take selfie picture", () => {
    I.wait(3);
    uploadSelfiePage.takeSelfie();
});

When("I submit my selfie photo",() =>{
    uploadSelfiePage.uploadSelfie();
});