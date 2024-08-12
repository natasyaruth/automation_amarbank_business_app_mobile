const { upload } = require("../../pages/uploadBusinessDoc");

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
    uploadDocLoanPage.uploadDocuments(docType);
});

When(/user upload document \"([^\"]*)\"/,(docType)=>{
    uploadDocLoanPage.uploadDocuments(docType);

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
// Given(/I select first list card loan approved/, () => {
//     uploadDocLoanPage.clickListCardApproved();
// });
When(/user validate status is approved/, () => {
    uploadDocLoanPage.getStatusLimitApproved();
});
When(/user validate content limit approved page/, () => {
    uploadDocLoanPage.validateContentApprovedPage();
});


When(/user verify upload all document KTP /, () => {
    I.see('KTP-A.jpg');
    I.seeElement('KTP-A.jpg . delete-icon');
    I.see('KTP-B.pdf');
    I.seeElement('KTP-B.pdf . delete-icon');
    I.see('KTP-C.png');
    I.seeElement('KTP-C.png . delete-icon');
   
});
When(/user verify upload all document NPWP /, () => {
    I.see('NPWP-A.jpg');
    I.seeElement('NPWP-A.jpg . delete-icon');
    I.see('NPWP-B.pdf');
    I.seeElement('NPWP-B.pdf . delete-icon');
    I.see('NPWP-C.png');
    I.seeElement('NPWP-C.png . delete-icon');
  
});
When(/user verify upload all document Invoice /, () => {
    I.see('Invoice-A.jpg');
    I.seeElement('Invoice-A.jpg . delete-icon');
    I.see('Invoice-B.pdf');
    I.seeElement('Invoice-B.pdf . delete-icon');
    I.see('Invoice-C.png');
    I.seeElement('Invoice-C.png . delete-icon');
   
});
When(/user verify upload all document Mutasi /, () => {
    I.see('Mutasi-A.jpg');
    I.seeElement('Mutasi-A.jpg . delete-icon');
    I.see('Mutasi-B.pdf');
    I.seeElement('Mutasi-B.pdf . delete-icon');
    I.see('Mutasi-C.png');
    I.seeElement('Mutasi-C.png . delete-icon');
    I.see('Mutasi-D.jpeg');
    I.seeElement('Mutasi-D.jpeg . delete-icon');
    I.see('Mutasi-E.pdf');
    I.seeElement('Mutasi-E.pdf . delete-icon');
    I.see('Mutasi-F.png');
    I.seeElement('Mutasi-F.png . delete-icon');
    
});
When(/user verify upload all document Finance Report/, () => {
    I.see('Finance Report-A.jpg');
    I.seeElement('Finance Report-A.jpg . delete-icon');
    I.see('Finance Report-B.pdf');
    I.seeElement('Finance Report-B.pdf . delete-icon');
    I.see('Finance Report-C.png');
    I.seeElement('Finance Report-C.png . delete-icon');
    I.see('Finance Report-D.jpeg');
    I.seeElement('Finance Report-D.jpeg . delete-icon');
});
When(/user click button X to stop uploading/, () =>{
    uploadDocLoanPage.ClickBtnStopUploadingDokumen();
});
When(/user click button retry/, () =>{
    uploadDocLoanPage.ClickbuttonRetry();
    I.seeElement(uploadDocLoanPage.ClickbuttonAcceptLimitOffer);
    I.seeElementDisabled(uploadDocLoanPage.ClickbuttonAcceptLimitOffer);
});
When(/user click button delete file uploaded/, () =>{
   uploadDocLoanPage.ClickBtndeleteFileUploaded();
});
When(/user should see pop up message to delete file {string}/, async (MsgError) => {        
    I.waitForText("Data Yang Dimasukkan Salah", 10);
    I.waitForText(MsgError, 10);
    I.seeElement(uploadDocLoanPage.buttons.btnConfirmdelete);
    I.seeElement(uploadDocLoanPage.buttons.btnBacktoUpload);
    I.see("Kembali");
    I.see("Hapus");
});
When(/user upload multiple document more than 15 MB \"([^\"]*)\"/,(docType)=>{
    uploadDocLoanPage.uploadDocumentsMoreThan15MB(docType);
});
When(/user will not see button Kirim Pengajuan Limit Kredit/, () =>{
    I.seeElementDisabled(uploadDocLoanPage.buttons.btnAcceptLimitOffer);
});

