const { I, privyAggrementPage} = inject();

Given(/user click accept the limit offer/, () => {
    privyAggrementPage.clickBtnAcceptLimitOffer();
});
Given(/user click button close on bottom sheet/, () => {
    privyAggrementPage.clickBtnClose();
});
Given(/user click button download dokumen surat kuasa/, () => {
    privyAggrementPage.clickBtnDownload();
});
Given(/user click button nanti saja dokumen surat kuasa/, () => {
    privyAggrementPage.clickBtnLater();
});
Given(/user on tnc sign digital with privy page/, () => {
    privyAggrementPage.viewTncWithPrivyPage();
});
When(/user validate anountion information about privy/, () => {
    privyAggrementPage.validateInfoAboutPrivy();
});
When(/user validate anountion prepare the documents/, () => {
    privyAggrementPage.validatePrepareDoc();
});
When(/user click button view additional document/, () => {
    privyAggrementPage.clickBtnViewAdditionDoc();
});
Then(/user validate bottom sheet anountion \"([^\"]*)\"/,(loanType)=>{
    privyAggrementPage.validateBottomSheetContent(loanType);
});
Then(/user should see digital signature privy aggrement page/, () => {
    privyAggrementPage.clickDigitalSign();
});
Then(/user should see tnc privy page/, () => {
    privyAggrementPage.clickTnC();
});
Then(/user click button read and sign/, () => {
    privyAggrementPage.clickBtnReadAndSign();
});

// section sign aggrement on privy //
Given(/user should see aggrement sign privy page/, () =>{
    privyAggrementPage.viewAggrementPrivyPage();
});
Given(/user click button sign on privy/, () =>{
    privyAggrementPage.clickBtnSignOnPrivy();
});
Given(/user click button next on privy/, () =>{
    privyAggrementPage.clickBtnNextOnPrivy();
});
When(/user should see otp dialog/, () =>{
    privyAggrementPage.notifSendOtpPrivy();
});
Then(/user click button confirmation/, () =>{
    privyAggrementPage.clickBtnConfirmOtp();
});
Then(/user should see notificaiton sign success/, () =>{
    privyAggrementPage.validationSignSuccess();
});

// section waiting activation limit //
Given(/user on waiting activation limit page/, () =>{
    privyAggrementPage.viewPageWaitingActivationLimit();
});
When(/user validate title waiting check status \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await privyAggrementPage.getTextViewWatingActivationLimit(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Then(/user validate subtitle waiting check status \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await privyAggrementPage.getTextViewWatingActivationLimit(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Then(/user click button check status/, () => {
    privyAggrementPage.clickBtnCheckStatus();
})