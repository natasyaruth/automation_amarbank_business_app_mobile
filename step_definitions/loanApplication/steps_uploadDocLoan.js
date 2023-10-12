const { I, uploadDocLoanPage} = inject();

Given(/user click view required documents button/, () => {
    uploadDocLoanPage.clickBtnViewRequiredDoc();
});
Given(/user validate text prepare the following documents/, () => {
    uploadDocLoanPage.validateTextViewPrepareDocNeedTitle();
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
Given(/user trigered api change status loan is approved/, () => {
    uploadDocLoanPage.changeStatusVPBusinessApproved();
});

// validate limit loan activation expired
Given(/I select first list card loan expired/, () => {
    uploadDocLoanPage.clickListCardExpired();
});
When(/user validate status is expired/, () => {
    uploadDocLoanPage.getStatusLimitExpired();
});
When(/user validate content limit expired page/, () => {
    uploadDocLoanPage.validateContentExpiredPage();
});
Then(/user click button send reason/, () => {
    uploadDocLoanPage.clickBtnSendReason();
});
Given(/user should see error reason \"([^\"]*)\" in field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await uploadDocLoanPage.getErrorFieldReason(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Then(/user fill a field reason \"([^\"]*)\" with \"([^\"]*)\"/,(fieldName, actualValue)=>{
    I.wait(2);
    uploadDocLoanPage.fillFieldReason(fieldName, actualValue);
});

// validate limit loan activation rejected
Given(/I select first list card loan approved/, () => {
    uploadDocLoanPage.clickListCardApproved();
});
When(/user validate status is approved/, () => {
    uploadDocLoanPage.getStatusLimitApproved();
});
When(/user validate content limit approved page/, () => {
    uploadDocLoanPage.validateContentApprovedPage();
});

