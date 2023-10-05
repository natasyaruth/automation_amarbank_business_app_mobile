const { I, uploadDocLoanPage} = inject();

Given(/user click view required documents button/, () => {
    uploadDocLoanPage.clickBtnViewRequiredDoc();
});
Given(/user validate text prepare the following documents/, () => {
    uploadDocLoanPage.clickBtnViewRequiredDoc();
});
When(/user validate description prepare the following documents \"([^\"]*)\"/,(loanType)=>{
    uploadDocLoanPage.validateBottomSheetDocNeededContent(loanType);
});
Then(/user click button upload documents/, () => {
    uploadDocLoanPage.clickBtnUploadDoc();
});

// section upload document
Given(/user on upload document page/, () => {
    uploadDocLoanPage.viewUploadDocPage();
});
When(/user upload document \"([^\"]*)\"/,(docType)=>{
    uploadDocLoanPage.validateBottomSheetDocNeededContent(docType);
});
Then(/user click button refresh/, () => {
    uploadDocLoanPage.clickBtnRefresh();
});
Then(/user click back button to loan processing/, () => {
    uploadDocLoanPage.clickBtnBackToLoanProcessing();
});
// section trigered status loan
Given(/user trigered api change status loan is rejected/, () => {
    uploadDocLoanPage.changeStatusVPBusinessRejected();
});