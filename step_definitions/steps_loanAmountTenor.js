const {I, selectLoanAmountPage} = inject();

// Feature(/Select the Loan Amount and Tenor/)
// 
// Scenario(/Validate Error Field on Select Loan Amount and Tenor Form/)
    Given(/user on select loan amount page/,()=>{
        selectLoanAmountPage.viewLoanAmountPage();
    });
    When(/user click button next on select loan amount page/,()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    Then(/user should see error \"([^\"]*)\" in the field \"([^\"]*)\"/, async(expectedValue, fieldName)=>{
        I.wait(2);
        let actualValue = await selectLoanAmountPage.getMessageErrorFieldOnLoanAmount(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    Then(/user filling field \"([^\"]*)\" with \"([^\"]*)\"/,(fieldName, actualValue)=>{
        I.wait(2);
        selectLoanAmountPage.fillFieldLoanAmount(fieldName, actualValue);
    });

// Scenario(/Success Select Loan Amount and Tenor/)
    Then(/user select the tenor \"([^\"]*)\"/,(tenorLength)=>{
        selectLoanAmountPage.selectTenorLoan(tenorLength);
    });
    Then(/user on legality business page/, ()=>{
        selectLoanAmountPage.viewLegalityBussPage();
    });
 
// Scenario(/Validate Error Field on legality business form/)
    When(/user click button next on legality business page/,()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
 
// Scenario(/User success fill legality business form/, () =>{
    Given(/user select legality business type/,()=>{
        selectLoanAmountPage.selectLegalityBussType();
    });
    When(/user select business establishment date/,()=>{
       selectLoanAmountPage.selectCompanyFoundingDate();
    });
    When(/user select the day date \"([^\"]*)\"/,(dayDate)=>{
        selectLoanAmountPage.selectDayDate(dayDate);
    });
    When(/user select the month date \"([^\"]*)\"/,(monthDate)=>{
        selectLoanAmountPage.selectMonthDate(monthDate);
    });
    When(/user select the year date \"([^\"]*)\"/,(yearDate)=>{
        selectLoanAmountPage.selectYearDate(yearDate);
    });
    Then(/user choose the date/,()=>{
        selectLoanAmountPage.chooseTheDate();
    });

// Scenario(/Validate Error Field on head office location/)
    Given(/user on head office location page/,()=>{
        selectLoanAmountPage.viewHeadOfficeLocationPage();
    });
    Given(/user select location others/,()=>{
       selectLoanAmountPage.selectLocationOthers();
    });


// Scenario(/Validate Loan Not available on business location/)
    Then(/user should see new page head office location not provided/, ()=>{
        selectLoanAmountPage.validateHeadOfficeLocationNotFound();
    });
    Then(/user click close button/,()=>{
        selectLoanAmountPage.clickCloseBtn();
    });


// Scenario(/User Success Select Head Office Location/)
    When(/user select location jabodetabek/,()=>{
        selectLoanAmountPage.selectJabodetabekLocation();
     });
    Then(/user click button next on head office location page/,()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });


// Scenario(/Validate Wording on Success Apply Loan Page/)
    Given(/user on success apply loan page/,()=>{
        selectLoanAmountPage.viewSuccessApplyLoanPage();
    });
    When(/user validate text success apply loan \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName)=>{
        I.wait(2);
        let actualValue = await selectLoanAmountPage.getTextFieldSuccessApplyLoan(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    // When(/user validate subtitle \"([^\"]*)\" on field \"([^\"]*)\"/, async(expectedValue, fieldName)=>{
        // I.wait(5);
        // let actualValue = await selectLoanAmountPage.getTextFieldSuccessApplyLoan(fieldName);
        // I.assertEqual(actualValue, expectedValue);
    // });
    Then(/user validate information business need done/,()=>{
        selectLoanAmountPage.validateBussNeedDoneSection();
    });
    Then(/user validate information loan need done/,()=>{
        selectLoanAmountPage.validateLoanNeedDoneSection();
    });
    Then(/user validate complete the data section/,()=>{
        selectLoanAmountPage.validateCompletedDataSection();
    });
    Then(/user click button continue complete the data/,()=>{
        selectLoanAmountPage.clickBtnNextOnLoanAmountPage();
    });
    Then(/user on success complete the data page/,()=>{
        selectLoanAmountPage.viewSuccessCompleteDataPage();
    });