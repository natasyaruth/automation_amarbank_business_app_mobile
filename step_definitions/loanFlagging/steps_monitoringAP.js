const loanMonitoringProcess = require("../../pages/loanApplication/loanMonitoringProcess");

const { I, loanMonitoringProcessPage } = inject();


// Scenario(/validate success complete the data page/)
Given(/user click button next completed data/,()=>{
    loanMonitoringProcessPage.clickBtnNextCompletedData();
});
When(/I should see text bottom sheet \"([^\"]*)\" in field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await loanMonitoringProcessPage.getTextFieldBottomSheet(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
When(/I close the bottom sheet/,()=>{
    loanMonitoringProcessPage.clickCloseBtnBottomSheet();
});
Then(/I am on monitoring loan process page/,()=>{
    loanMonitoringProcessPage.viewLoanProcessPage();
});
When(/I validate section checking document \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await loanMonitoringProcessPage.getTextFieldSuccessCompleteData(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Then(/I am on monitoring \"([^\"]*)\" loan process page/, (stepType) => {
    I.wait(2);
    loanMonitoringProcessPage.validateLoanProcess(stepType);
});