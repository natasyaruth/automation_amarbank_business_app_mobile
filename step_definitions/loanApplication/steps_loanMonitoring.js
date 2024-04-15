const loanMonitoringProcess = require("../../pages/loanApplication/loanMonitoringProcess");

const { I, loanMonitoringProcessPage } = inject();

// Feature(/Checking Monitoring Process/)

// Scenario(/validate success complete the data page/)
Given(/user validate title \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await loanMonitoringProcessPage.getTextFieldSuccessCompleteData(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Given(/user validate subtitle \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await loanMonitoringProcessPage.getTextFieldSuccessCompleteData(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
When(/user validate header content perbankan premium bisnis/,()=>{
    loanMonitoringProcessPage.validateHeaderContent();
});
Then(/user validate body content perbankan premium bisnis/,()=>{
    loanMonitoringProcessPage.validateHeaderContent();
});

// Scenario(/validate success complete the data page/)
Given(/user click button next completed data/,()=>{
    loanMonitoringProcessPage.clickBtnNextCompletedData();
});
When(/user should see text bottom sheet \"([^\"]*)\" in field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(40);
    let actualValue = await loanMonitoringProcessPage.getTextFieldBottomSheet(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
When(/user close the bottom sheet/,()=>{
    loanMonitoringProcessPage.clickCloseBtnBottomSheet();
});
Then(/user on monitoring loan process page/,()=>{
    loanMonitoringProcessPage.viewLoanProcessPage();
});
When(/user validate section checking document \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName) => {
    I.wait(2);
    let actualValue = await loanMonitoringProcessPage.getTextFieldSuccessCompleteData(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Then(/user on monitoring \"([^\"]*)\" loan process page/, (stepType) => {
    I.wait(2);
    loanMonitoringProcessPage.validateLoanProcess(stepType);
});