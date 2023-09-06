const { isDisplayed, isEnabled } = require("wd/lib/commands")

const {I, selectLoanAmountPage} = inject();

Feature('Select the Loan Amount and Tenor')

Scenario('Validate Error Field on Select Loan Amount and Tenor Form', () =>{
    Given('user on select loan amount page',()=>{
        selectLoanAmountPage.viewLoanAmountPage();
    });
    And('user clear amount loan',()=>{
        selectLoanAmountPage.clearAmountLoan();
    });
    When('user click button next on select loan amount page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    Then('user should see error {string} in the below of field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getMessageErrorFieldOnLoanAmount(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    And('user should see error {string} in the below of field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getMessageErrorFieldOnLoanAmount(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    And('user clear amount loan',()=>{
        selectLoanAmountPage.clearAmountLoan();
    });
    And('user filling field {string} with {string}',(fieldName, actualValue)=>{
        selectLoanAmountPage.fillFieldLoanAmount(fieldName, actualValue);
    });
    And('user click button next on select loan amount page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    And('user should see error {string} in the below of field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getMessageErrorFieldOnLoanAmount(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
});

Scenario('Success Select Loan Amount and Tenor', () =>{
    Given('user on select loan amount page',()=>{
        selectLoanAmountPage.viewLoanAmountPage();
    });
    When('user filling field {string} with {string}',(fieldName, actualValue)=>{
        selectLoanAmountPage.fillFieldLoanAmount(fieldName, actualValue);
    });
    Then('user select the tenor',()=>{
        selectLoanAmountPage.selectTenorLoan();
    });
    And('user click button next on select loan amount page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    And('user on legality business page', ()=>{
        selectLoanAmountPage.viewLegalityBussPage();
    });
});

Scenario('Validate Error Field on legality business form', () =>{
    Given('user on legality business page',()=>{
        selectLoanAmountPage.viewLegalityBussPage();
    });
    When('user click button next on select loan amount page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    Then('user should see error {string} in the below of field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getMessageErrorFieldOnLoanAmount(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    And('user should see error {string} in the below of field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getMessageErrorFieldOnLoanAmount(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
});

Scenario('User success fill legality business form', () =>{
    Given('user select legality business type',()=>{
        selectLoanAmountPage.selectLegalityBussType();
    });
    When('user select business establishment date',()=>{
       selectLoanAmountPage.selectBussEstabilishmentDate();
    });
    And('user select the day date {string}',(dayDate)=>{
        selectLoanAmountPage.selectDayDate(dayDate);
    });
    And('user select the month date {string}',(monthDate)=>{
        selectLoanAmountPage.selectMonthDate(monthDate);
    });
    And('user select the year date {string}',(yearDate)=>{
        selectLoanAmountPage.selectYearDate(yearDate);
    });
    Then('user click button next on legality business page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    And('user on head office location page', ()=>{
        selectLoanAmountPage.viewHeadOfficeLocationPage();
    });
});


Scenario('Validate Error Field on head office location', () =>{
    Given('user on head office location page',()=>{
        selectLoanAmountPage.viewHeadOfficeLocationPage();
    });
    And('user select location others',()=>{
       selectLoanAmountPage.selectLocationOthers();
    });
    When('user click button next on head office location page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    Then('user should see error {string} in the below of field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getMessageErrorFieldOnLoanAmount(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
});

Scenario('Validate Loan Not available on business location', () =>{
    Given('user on head office location page',()=>{
        selectLoanAmountPage.viewHeadOfficeLocationPage();
    });
    When('user filling field {string} with {string}',(fieldName, actualValue)=>{
        selectLoanAmountPage.fillFieldLoanAmount(fieldName, actualValue);
    });
    Then('user click button next on head office location page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    And('user should see new page with text {string} displayed with button {string}', (actualMessage, buttonName)=>{
        I.see(actualMessage);
        I.seeElement(selectLoanAmountPage.buttons[buttonName]);
    });
    And('user click close button',()=>{
        selectLoanAmountPage.clickCloseBtn();
    });
});

Scenario('User Success Select Head Office Location', () =>{
    Given('user on head office location page',()=>{
        selectLoanAmountPage.viewHeadOfficeLocationPage();
    });
    When('user select location jabodetabek',()=>{
        selectLoanAmountPage.selectJabodetabekLocation();
     });
    Then('user click button next on head office location page',()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    And('user on success apply loan page',()=>{
        selectLoanAmountPage.viewSuccessApplyLoanPage();
    });
});

Scenario('Validate Wording on Success Apply Loan Page', () =>{
    Given('user on success apply loan page',()=>{
        selectLoanAmountPage.viewSuccessApplyLoanPage();
    });
    When('user validate title {string} on field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getTextFieldSuccessApplyLoan(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    And('user validate subtitle {string} on field {string}', async(expectedValue, fieldName)=>{
        let actualValue = await selectLoanAmountPage.getTextFieldSuccessApplyLoan(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    Then('user validate information business need done',()=>{
        selectLoanAmountPage.validateBussNeedDoneSection();
    });
    And('user validate information loan need done',()=>{
        selectLoanAmountPage.validateLoanNeedDoneSection();
    });
    And('user validate complete the data section',()=>{
        selectLoanAmountPage.validateCompletedDataSection();
    });
});