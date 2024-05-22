const {I, loanTypePage} = inject();


// Feature(/Apply Either Loan and select the loan type/)

// Scenario(/validate content on select either apply for loan/)
    Given(/user on onboarding loan/,()=>{
        loanTypePage.viewPageOnBoarding();
    });
    Given(/user should see field title onboarding/,()=>{
        I.wait(2);
        loanTypePage.validationTextTittleOnboarding();
    });
    When(/user validate benefit \"([^\"]*)\"/,(benefitText)=>{
        I.wait(2);
        loanTypePage.validationBenefitText(benefitText);
    });
    When(/user validate content loan requirement/,()=>{
        I.wait(2);
        loanTypePage.validateContentLoanRequirement();
    });
    Then(/user click button ajukan pinjaman/,()=>{
        loanTypePage.clickButtonStart();
    });

// Scenario(/user validate and select loan type AR/)
    Given(/user on loan type page/,()=>{
        I.wait(2);
        loanTypePage.viewLoanTypePage();
    });
    Given(/user validate wording loan type \"([^\"]*)\"/,(loanType)=>{
        I.wait(2);
        loanTypePage.validateLoanTypeList(loanType);
    });
    When(/user select loan type \"([^\"]*)\"/,(selectLoanType)=>{
        I.wait(2);
        loanTypePage.selectLoanTypeList(selectLoanType);
    });
    Then(/user click button lihat skema pinjaman/,()=>{
        loanTypePage.clickNextButton();
    });
    Then(/user on loan schema \"([^\"]*)\"/,()=>{
        I.wait(2);
        loanTypePage.validateLoanSchemPage();
    });
    Then(/user validate content loan schema \"([^\"]*)\"/,()=>{
        I.wait(2);
        loanTypePage.validateContentField();
    });
    Then(/user click back to loan type page/,()=>{
        loanTypePage.clickBackButtonLoanTypePage();
        I.wait(2);
    });

    Then(/user click button select the schema/,()=>{
        loanTypePage.clickNextButton();
    });

// Apply Loan Journey Improvement
    Then(/User click button Pelajari Tipe Skema Kredit/,()=>{
        loanTypePage.clickButtonSchema();
    });   
    Then(/User select loan type "AP"/,()=>{
        loanTypePage.clickButtonLoanAP();
    });
    Then(/User select loan type "AR"/,()=>{
        loanTypePage.clickButtonLoanAR();
    });
    Then(/User select loan type "PO"/,()=>{
        loanTypePage.clickButtonLoanPO();
    });
    Then(/User click button Pelajari Tipe Skema Kredit/,()=>{
        loanTypePage.clickButtonSchemaAP();
    });
    Then(/User click button Pelajari Tipe Skema Kredit/,()=>{
        loanTypePage.clickButtonSchemaAR();
    });
    Then(/User click button Pelajari Tipe Skema Kredit/,()=>{
        loanTypePage.clickButtonSchemaPO();
    });
    Then(/user can click close button and back to loan needs page/,()=>{
        loanTypePage.clickButtonClose();
    });
    Then(/user click button Lanjut isi data supplier/,()=>{
        loanTypePage.clickButtonNext();
    });
    Then(/user click back button to loan processing /,()=>{
        loanTypePage.clickButtonBack();
    });
    Then(/user click button Save/,()=>{
        loanTypePage.clickButtonSave();
    });
    Then(/user click button clear to delete all input nominal and back to zero/,()=>{
        loanTypePage.clickButtonClear();
    });