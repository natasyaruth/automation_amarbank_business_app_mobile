const { I, uploadDocLoanPage} = inject();

Given(/user click view required documents button/, () => {
});
When(/user validate text prepare the following documents/, () => {
});
Then(/user validate description prepare the following documents/, () => {
});
Given(/user close button prepare doc bottom sheet/, () => {
});
When(/user click button upload documents/, () => {
});
// section upload document
Given(/user on upload document page/, () => {
});
When(/user upload document nib/, () => {
});
When(/user upload document deed of company/, () => {
});
When(/user upload document sk kemenkumham/, () => {
});
When(/user upload document npwp of company/, () => {
});
When(/user upload document proof of purchase with the buyer/, () => {
});
When(/user upload document payment mutation for the last 6 months/, () => {
});
When(/user upload document financial reports in the last 1 year/, () => {
});
Then(/user click button refresh/, () => {
});
Then(/user click back button to loan processing/, () => {
});
// section trigered status loan
Then(/user trigered api change status loan is rejected/, () => {
    uploadDocLoanPage.changeStatusVPBusinessRejected();
});
Then(/user validate status is rejected/, () => {
    uploadDocLoanPage.getStatusLimitRejected();
});
Then(/user validate content limit rejected page/, () => {
    uploadDocLoanPage.validateContentRejectedPage();
});