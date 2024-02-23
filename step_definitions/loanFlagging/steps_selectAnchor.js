const {I, selectAnchorPage} = inject();

// Feature(/Select the Anchor/)

// Scenario(/user search anchor is not found/)
    Given(/I on the anchor page/,()=>{
        selectAnchorPage.viewAnchorPage();        
    });
    When(/I fill search anchor \"([^\"]*)\"/,(txtValue)=>{
        selectAnchorPage.fillFieldSearch(txtValue);
    });
    Then(/I validate anchor is not found/,()=>{
        selectAnchorPage.validateAnchorNotFound();
    });


// Scenario(/User can select anchor on the list/)
    When(/I select result of search/,()=>{
        selectAnchorPage.selectAnchorList();
    });
    When(/I on anchor cooperating page/,()=>{
        selectAnchorPage.viewAnchorCooperatingPage();
    });
    Then(/I select the date cooperating/,()=>{
        selectAnchorPage.selectDateCooperating();
    });
    Then(/I am  back to list anchor page/,()=>{
        selectAnchorPage.clickBackButtonToListAcnhor();
    });


// Scenario(/User validate error field on form another anchor/, () =>{
    When(/I click icon other anchor/,()=>{
        selectAnchorPage.clickIconOtherAnchor();
    });
    // When(/user on anchor cooperating page/,()=>{
        // selectAnchorPage.viewAnchorCooperatingPage();
    // });
    Then(/I click button next/,()=>{
        selectAnchorPage.clickNextBtnOnAnchorPage();
    });
    Then(/I should see error \"([^\"]*)\" in the below of field \"([^\"]*)\"/,async(expectedValue, fieldName)=>{
        let actualValue = await selectAnchorPage.getMessageErrorFieldOnOtherAnchor(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    Then(/I scroll to view eror pic number/,()=>{
        selectAnchorPage.scrollToViewTextError();
    }); 

// Scenario(/User success fill data other anchor/)
    // Given(/user on anchor cooperating page/,()=>{
        // selectAnchorPage.viewAnchorCooperatingPage();
    // });
    Given(/I fill a field \"([^\"]*)\" with \"([^\"]*)\"/,(fieldName, actualValue)=>{
        selectAnchorPage.fillFieldAnchorName(fieldName, actualValue);
    });
    When(/I select industry type/,()=>{
        selectAnchorPage.selectIndustryType();
    });
    When(/I select the date cooperating/,()=>{
        selectAnchorPage.selectDateCooperating();
    });
    Then(/I click button next/,()=>{
        selectAnchorPage.clickNextBtnOnAnchorPage();
    });

// Scenario(/User success fill data buyer and submit the loan/)
    Given(/I on buyer cooperating page/,()=>{
        selectAnchorPage.viewBuyerPage();
    });
    Given(/I on bowheer cooperating page/,()=>{
        selectAnchorPage.viewBowheerPage();
    });