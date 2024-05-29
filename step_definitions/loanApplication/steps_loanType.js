const {I, loanTypePage} = inject();
Before(() => {
    state = {};
  });

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

// Scenario(/user validate and select loan type AP)
    Given(/user on loan type page/,()=>{
        I.wait(2);
        loanTypePage.viewLoanTypePage();
            
    });

    Then(/user click button ajukan pinjaman/,()=>{
        loanTypePage.clickButtonStart();
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
        loanTypePage.clickBackButtonLoanTypePage
    });

// Apply Loan Journey Improvement
    Then(/User click button Pelajari Tipe Skema Kredit/,()=>{
        loanTypePage.clickButtonLearnSchema();
    });   

    Then(/user will see bottom sheet of Pelajari Tipe Skema Kredit/, () =>{
        I.waitForText("Pelajari Tipe Skema Kredit", 10);
        I.waitforText("Distributor Financing", 10);
        I.waitforText("Supplier Financing", 10);
        I.waitForText("Prject Financing", 10);        
   });

    Then(/user validate content of schema type loan  \"([^\"]*)\"/,(wordingLoanType)=>{
        I.wait(2);
        loanTypePage.validateTypeLoanWording();
   }); 
   
    Then(/User select loan type \"([^\"]*)\"/,(selectLoanType)=>{
        I.wait(5);
        loanTypePage.selectLoanTypeList(selectLoanType);

    });

    Given(/user on select loan Needs Page /,()=>{
        I.wait(2);
        loanTypePage.viewLoanTypePage();
    });
   
    Then(/User click button \"([^\"]*)\"/,(selectSchemaType)=>{
        I.wait(2);
        loanTypePage.selectSchemaLoanTypeList(selectSchemaType);
    });

    Then(/System will display Schema of Distributor Financing/, () =>{
        I.waitForText("Skema Distributor Financing");
    });

    Then(/User on Loan Needs Page/, () =>{
        I.wait(5);
        loanTypePage.validateTitleTopBarLoanNeeds();
        I.wait(5);
        loanTypePage.validateLoanAmountRequested();
        I.wait(2);
        loanTypePage.validateLoanTenor();
    });

    Then(/user click dropdown option/, ()=>{
        I.waitforText("Pilih Nominal Limit Kredit", 10);
        I.waitForElement(this.buttons.chooseOptionMSME,10); 
        I.waitForElement(this.buttons.chooseOptionCorp,10);
    });