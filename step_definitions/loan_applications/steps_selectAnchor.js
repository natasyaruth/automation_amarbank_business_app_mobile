const { isDisplayed, isEnabled } = require("wd/lib/commands")

const {I, selectAnchorPage} = inject();

Feature('Select the Anchor')

Scenario('user search anchor is not found', () =>{
    Given('user on the anchor page',()=>{
        selectAnchorPage.viewAnchorPage();
    });
    When('user fill search anchor {string}',(txtValue)=>{
        selectAnchorPage.fillFieldSearch(txtValue);
    });
    When('user validate anchor is not found',()=>{
        selectAnchorPage.validateAnchorNotFound();
    });
});


Scenario('User can select anchor on the list', () =>{
    Given('user on the anchor page',()=>{
        selectAnchorPage.viewAnchorPage();
    });
    And('user fill search anchor {string}',(txtValue)=>{
        selectAnchorPage.fillFieldSearch(txtValue);
    });
    When('user select result of search',()=>{
        selectAnchorPage.selectAnchorList();
    });
    And('user on anchor cooperating page',()=>{
        selectAnchorPage.viewAnchorCooperatingPage();
    });
    Then('user select the date cooperating',()=>{
        selectAnchorPage.selectDateCooperating();
    });
    And('user should see {string} on field {string}',async(expectedValue, fieldName)=>{
        let actualValue = await selectAnchorPage.getValueFieldData(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    And('user back to list anchor page',()=>{
        selectAnchorPage.clickBackButtonToListAcnhor();
    });
});


Scenario('User validate error field on form another anchor', () =>{
    Given('user on the anchor page',()=>{
        selectAnchorPage.viewAnchorPage();
    });
    When('user click icon other anchor',()=>{
        selectAnchorPage.clickIconOtherAnchor();
    });
    And('user on anchor cooperating page',()=>{
        selectAnchorPage.viewAnchorCooperatingPage();
    });
    Then('user click button next',()=>{
        selectAnchorPage.clickNextBtnOnAnchorPage();
    });
    And('user should see error {string} in the below of field {string}',async(expectedValue, fieldName)=>{
        let actualValue = await selectAnchorPage.getMessageErrorFieldOnOtherAnchor(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    And('user should see error {string} in the below of field {string}',async(expectedValue, fieldName)=>{
        let actualValue = await selectAnchorPage.getMessageErrorFieldOnOtherAnchor(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
    And('user should see error {string} in the below of field {string}',async(expectedValue, fieldName)=>{
        let actualValue = await selectAnchorPage.getMessageErrorFieldOnOtherAnchor(fieldName);
        I.assertEqual(actualValue, expectedValue);
    });
});

Scenario('User success fill data other anchor', () =>{
    Given('user on anchor cooperating page',()=>{
        selectAnchorPage.viewAnchorCooperatingPage();
    });
    And('user filling field {string} with {string}',(fieldName, actualValue)=>{
        selectAnchorPage.fillFieldAnchorName(fieldName, actualValue);
    });
    When('user select industry type',()=>{
        selectAnchorPage.selectIndustryType();
    });
    And('user select the date cooperating',()=>{
        selectAnchorPage.selectDateCooperating();
    });
    Then('user click button next',()=>{
        selectAnchorPage.clickNextBtnOnAnchorPage();
    });
    And('user on select loan amount',()=>{
        selectAnchorPage.viewLoanAmountPage();
    });
});