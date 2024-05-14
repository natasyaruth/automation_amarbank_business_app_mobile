const { I } = inject();

module.exports = {
    textField: {
        textTitleOnboardingLoan: {xpath: '(//android.widget.TextView[@content-desc="textTitleLoanOnBoardingPage1"])[1]'},
        textBenefit1: {xpath: '//android.widget.TextView[contains(@text, "Bunga Kompetitif")]'},
        textBenefit2: {xpath: '//android.widget.TextView[contains(@text, "Proses Cepat dan Mudah")]'},
        textBenefit3: {xpath: '//android.widget.TextView[contains(@text, "Perbankan Bisnis Premium")]'},
        textFieldLoanTypePage: "~textTitle",
        textFieldLoanAP: "~textFieldLoanAP",
        textFieldLoanAR: "~textFieldLoanAR",
        textFieldLoanPO: "~textFieldLoanPO",
        textLoanSchemaAP: "~textTitle",
        textLoanSchemaAR: "~textTitle",
        textLoanSchemaPO: "~textTitle"
    },
    buttons: {
        startButton: {xpath: '(//android.view.View[@content-desc="buttonStartLoan"])[1]'},
        backButtonLoanTypePage: {xpath: '(//android.view.View[@content-desc="buttonBack"])[1]'},
        nextButton: "~buttonNext",
        schemacreditButton: "~buttonSchema", 
        backButton:"~buttonClose",
        backSchemaButton: "~buttonBack",
        loanAPButton: "~cardAP",
        loanARButton: "~cardAR",
        loanPOButton: "~cardPO",
        schemaAPButton: "~buttonSchemaAP",
        schemaARButton: "~buttonSchemaAP",
        schemaPOButton: "~buttonSchemaAP",
    },
    radioButtons: {
        radioBtnAP: "~radioButtonAP",
        radioBtnAR: "~radioButtonAR",
        radioBtnPO: "~radioButtonPO",
    },
    contentFields: {
        viewPageAP: "~imageSchemaAP",
        viewPageAR: "~imageSchemaAR",
        viewPagePO: "~imageSchemaPO",
        loanRequirement: {xpath: '(//android.widget.ImageView[@content-desc="Loan requirement"])[1]'},
    },

// Function for call the id component
    validationTextTittleOnboarding(){
        I.seeElement(this.textField.textTitleOnboarding);
    },
    viewPageOnBoarding(){
        I.seeElement(this.textField.textTitleOnboardingLoan);
    },

    validateContentLoanRequirement(){
        I.seeElement(this.contentFields.loanRequirement);
    },
    clickButtonStart(){
        I.click(this.buttons.startButton);
    },
    clickNextButton(){
        I.click(this.buttons.nextButton);
    },
    viewLoanTypePage(){
        I.seeElement(this.textField.textFieldLoanTypePage);
    },
    async validationBenefitText(benefitText){
        switch (benefitText){
            case 'first':
                let hint = await I.grabAttributeFrom(this.textField.textBenefit1, 'text');
                I.assertEqual(hint, 'Bunga Kompetitif');
            break;
            case 'two':
                let actualValue = await I.grabAttributeFrom(this.textField.textBenefit2, 'text');
                I.assertEqual(actualValue, 'Proses Cepat dan Mudah');
            break;
            case 'three':
                let actual = await I.grabAttributeFrom(this.textField.textBenefit3, 'text');
                I.assertEqual(actual, 'Perbankan Bisnis Premium');
            break;
        }

    },

    validateLoanTypeList(loanType){
        switch (loanType){
            case 'AP':
                I.seeElement(this.textField.textFieldLoanAP);
            break;
            case 'AR':
                I.seeElement(this.textField.textFieldLoanAR);
            break;
            case 'PO':
                I.seeElement(this.textField.textFieldLoanPO);
            break;
        }
    },

    selectLoanTypeList(selectLoanType){
        switch (selectLoanType){
            case 'AP':
                I.click(this.buttons.loanAPButton);
            break;
            case 'AR':
                I.click(this.buttons.loanARButton);
            break;
            case "PO":
                I.click(this.buttons.loanPOButton);
                break;
        }
    },

    selectSchemaLoanList(selectSchemaType){
        switch (selectSchemaType){
            case 'AP':
                I.click(this.buttons.schemaAPButton);
            break;
            case 'AR':
                I.click.(this.buttons.schemaARButton);
            break;
            case 'PO':
                I.click(this.buttons.schemaPOButton);
                break;
        }
    },

    validateLoanSchemPage(loanSchema){
        switch (loanSchema){
            case 'AP':
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaAP);
                I.assertEqual(actualValue, 'Skema Pinjaman Distributor');
            break;
            case 'AR':
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaAR);
                I.assertEqual(actualValue, 'Skema Pinjaman Modal Proyek');
            break;
            case 'PO':
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaPO);
                I.assertEqual(actualValue, 'Skema Pinjaman Tagihan Faktur');
            break;
        }
    },
    validateContentField(contentFieldText){
        switch (contentFieldText){
            case 'AP':
                I.seeElement(this.contentFields.imageSchemaAP);
            break;
            case 'AR':
                I.seeElement(this.contentFields.imageSchemaAR);
            break;
            case 'PO':
                I.seeElement(this.contentFields.imageSchemaPO);
            break;
        }
    },

    clickBacktoAjukanPinjaman(){
        I.click(this.buttons.backButton);
    },

    clickBackSelectSchmea(){
        I.click(this.buttons.buttonClose);
    },

    clickBackButtonLoanTypePage(){
        I.click(this.buttons.backButtonLoanTypePage);
    }

    clickButtonAterSeeSchema(){
        I.click(this.buttons.backButton);
    }
}