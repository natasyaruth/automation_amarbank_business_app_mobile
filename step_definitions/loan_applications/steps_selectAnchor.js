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
    And('user should see the date on field {string}',()=>{
        loanTypePage.validateLoanSchemPage();
    });
    And('user validate content loan schema {string}',()=>{
        loanTypePage.validateContentField();
    });
    And('user click button select the schema',()=>{
        loanTypePage.clickButtonStart();
    });
});