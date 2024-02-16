const { I, uploadDocLoanPage} = inject();

When(/I click button upload documents/, () => {
    uploadDocLoanPage.clickBtnUploadDoc();
});

Given(/I on upload document page/, () => {
    uploadDocLoanPage.viewUploadDocPage();
});

When(/I upload document \"([^\"]*)\"/,(docType)=>{
    uploadDocLoanPage.validateBottomSheetDocNeededContent(docType);
});

Then(/I click button refresh/, () => {
    uploadDocLoanPage.clickBtnRefresh();
});

Then(/I click back button to loan processing/, () => {
    uploadDocLoanPage.clickBtnBackToLoanProcessing();
});

Given(/I trigered api change status loan is approved/, () => {
    uploadDocLoanPage.changeStatusVPBusinessApproved();
});