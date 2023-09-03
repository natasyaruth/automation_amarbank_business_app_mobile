const { isDisplayed, isEnabled } = require("wd/lib/commands");

const {I, loanTypePage} = inject();

Feature('Apply Either Loan and select the loan type')

Scenario('validate content on select either apply for loan', () => {
    Given('user on onboarding loan',()=>{
        loanTypePage.viewPageOnBoarding(isDisplayed);
    });
    And('user validate wording {string}',()=>{
        loanTypePage.validationTextTittleOnboarding();
    });
    When('user validate benefit {string}',()=>{
        loanTypePage.validationBenefitText();
    });
    And('user validate benefit {string}',()=>{
        loanTypePage.validationBenefitText();
    });
    And('user validate benefit {string}',()=>{
        loanTypePage.validationBenefitText();
    });
    And('user validate content hanya dengan',()=>{
        loanTypePage.validationTextOnlyWithFirst();
        I.wait(5);
        loanTypePage.validationTextOnlyWithTwo();
        I.wait(5);
        loanTypePage.validationTextOnlyWithThree();
    });
    Then('user click button ajukan pinjaman',()=>{
        loanTypePage.clickButtonStart();
    });
    And('user on loan type page',()=>{
        loanTypePage.viewLoanTypePage();
    });
});

Scenario('user validate and select loan type AR', () =>{
    Given('user on onboarding loan',()=>{
        loanTypePage.viewLoanTypePage();
    });
    And('user validate wording loan type {string}',()=>{
        loanTypePage.validateLoanTypeList();
    });
    When('user select loan type {string}',()=>{
        loanTypePage.selectLoanTypeList();
    });
    And('user validate button lihat skema pinjaman is enable true',()=>{
        loanTypePage.buttons.nextButton(isEnabled);
    });
    Then('user click button lihat skema pinjaman',()=>{
        loanTypePage.clickNextButton();
    });
    And('user on loan schema {string}',()=>{
        loanTypePage.validateLoanSchemPage();
    });
    And('user validate content loan schema {string}',()=>{
        loanTypePage.validateContentField();
    });
    And('user click back to loan type page',()=>{
        loanTypePage.clickBackButtonLoanTypePage();
    });
});

Scenario('user validate and select loan type PO', () =>{
    Given('user on loan type page',()=>{
        loanTypePage.viewLoanTypePage();
    });
    And('user validate wording loan type {string}',()=>{
        loanTypePage.validateLoanTypeList();
    });
    When('user select loan type {string}',()=>{
        loanTypePage.selectLoanTypeList();
    });
    And('user validate button lihat skema pinjaman is enable true',()=>{
        loanTypePage.buttons.nextButton(isEnabled);
    });
    Then('user click button lihat skema pinjaman',()=>{
        loanTypePage.clickNextButton();
    });
    And('user on loan schema {string}',()=>{
        loanTypePage.validateLoanSchemPage();
    });
    And('user validate content loan schema {string}',()=>{
        loanTypePage.validateContentField();
    });
    And('user click back to loan type page',()=>{
        loanTypePage.clickBackButtonLoanTypePage();
    });
});

Scenario('user validate and select loan type AP', () =>{
    Given('user on loan type page',()=>{
        loanTypePage.viewLoanTypePage();
    });
    And('user validate wording loan type {string}',()=>{
        loanTypePage.validateLoanTypeList();
    });
    When('user select loan type {string}',()=>{
        loanTypePage.selectLoanTypeList();
    });
    And('user validate button lihat skema pinjaman is enable true',()=>{
        loanTypePage.buttons.nextButton(isEnabled);
    });
    Then('user click button lihat skema pinjaman',()=>{
        loanTypePage.clickNextButton();
    });
    And('user on loan schema {string}',()=>{
        loanTypePage.validateLoanSchemPage();
    });
    And('user validate content loan schema {string}',()=>{
        loanTypePage.validateContentField();
    });
    And('user click button select the schema',()=>{
        loanTypePage.clickButtonStart();
    });
});