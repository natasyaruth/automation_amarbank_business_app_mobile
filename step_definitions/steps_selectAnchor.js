const {I, selectAnchorPage} = inject();

// Feature(/Select the Anchor/)

// Scenario(/user search anchor is not found/)
    Given(/user on the anchor page/,()=>{
        selectAnchorPage.viewAnchorPage();
    });
    When(/user fill search anchor \"([^\"]*)\"/,(txtValue)=>{
        selectAnchorPage.fillFieldSearch(txtValue);
    });
    Then(/user validate anchor is not found/,()=>{
        selectAnchorPage.validateAnchorNotFound();
    });


// Scenario(/User can select anchor on the list/)
    When(/user select result of search/,()=>{
        selectAnchorPage.selectAnchorList();
    });
    When(/user on anchor cooperating page/,()=>{
        selectAnchorPage.viewAnchorCooperatingPage();
    });
    Then(/user select the date cooperating/,()=>{
        selectAnchorPage.selectDateCooperating();
    });
    Then(/user should see the date \"([^\"]*)\"/, (txtValue) =>{
        I.see(txtValue)
    });
    Then(/user back to list anchor page/,()=>{
        selectAnchorPage.clickBackButtonToListAcnhor();
    });


// Scenario(/User validate error field on form another anchor/, () =>{
    When(/user click icon other anchor/,()=>{
        selectAnchorPage.clickIconOtherAnchor();
    });
    // When(/user on anchor cooperating page/,()=>{
        // selectAnchorPage.viewAnchorCooperatingPage();
    // });
    Then(/user click button next/,()=>{
        selectAnchorPage.clickNextBtnOnAnchorPage();
    });
    Then(/user should see error \"([^\"]*)\" in the below of field \"([^\"]*)\"/,async(expectedValue, fieldName)=>{
        let actualValue = await selectAnchorPage.getMessageErrorFieldOnOtherAnchor(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    // Then(/user should see error {string} in the below of field {string}/,async(expectedValue, fieldName)=>{
        // let actualValue = await selectAnchorPage.getMessageErrorFieldOnOtherAnchor(fieldName);
        // I.assertEqual(actualValue, expectedValue);
    // });
    // Then(/user should see error {string} in the below of field {string}/,async(expectedValue, fieldName)=>{
        // let actualValue = await selectAnchorPage.getMessageErrorFieldOnOtherAnchor(fieldName);
        // I.assertEqual(actualValue, expectedValue);
    // });

// Scenario(/User success fill data other anchor/)
    Given(/user on anchor cooperating page/,()=>{
        selectAnchorPage.viewAnchorCooperatingPage();
    });
    Given(/user filling field \"([^\"]*)\" with \"([^\"]*)\"/,(fieldName, actualValue)=>{
        selectAnchorPage.fillFieldAnchorName(fieldName, actualValue);
    });
    When(/user select industry type/,()=>{
        selectAnchorPage.selectIndustryType();
    });
    When(/user select the date cooperating/,()=>{
        selectAnchorPage.selectDateCooperating();
    });
    Then(/user click button next/,()=>{
        selectAnchorPage.clickNextBtnOnAnchorPage();
    });
    Then(/user on select loan amount/,()=>{
        selectAnchorPage.viewLoanAmountPage();
    });