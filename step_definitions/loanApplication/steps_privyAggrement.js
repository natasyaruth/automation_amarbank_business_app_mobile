const { I, privyAggrementPage} = inject();

Given(/user click accept the limit offer/, () => {
    privyAggrementPage.clickBtnAcceptLimitOffer();
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

// enhancement screen tnc sign privy
Then(/user should see step \"([^\"]*)\" download surat kuasa/, (stepType) => {
    I.wait(2);
    privyAggrementPage.validateStepDownloadSuratKuasa(stepType);
});
Then(/user click button Download Dokumen Surat Kuasa/, () => {
    privyAggrementPage.clickBtnDownload();
});
Then(/user click button Nanti Saja Dokumen Surat Kuasa/, () => {
    privyAggrementPage.clickBtnLater();
});
Then(/user click button close on bottom sheet /, () => {
    privyAggrementPage.clickBtnClose();
});
Then(/user click field Download Surat Kuasa/, () => {
    privyAggrementPage.clickBtnInfoDownload();
});
Then(/user click icon information Tanda Tangan Digital via Privy/, () => {
    privyAggrementPage.clickBtnInfoSignPrivy();
});
Then(/user validate text view prepare document/, () => {
    privyAggrementPage.clickDocumentRequirement();
});
Then(/user validate tosh message success download/, ()=>{
    privyAggrementPage.validateToshMessage();
});
Then(/user validate text view information privy/, ()=>{
    privyAggrementPage.validateInformationPrivy();
});
Then(/user validate text view prepare document/, ()=>{
    privyAggrementPage.validatePrepareDocument();
});
Then(/user click checkbox tnc /, () => {
    privyAggrementPage.clickcheckBox();
});