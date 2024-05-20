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
        textLoanSchemaPO: "~textTitle",
        textLoan: "~textFieldLoan",      
        textAmount: "~textFieldCustomAmount",
        textTenor: {xpath: '//android.widget.TextView[contains(@text, "Min. tenor 30 hari, Max. tenor 180 hari")]'},
        texttitletopbarLoanNeeds:  {xpath: '//android.widget.TextView[contains(@text, "Pengajuan Limit Kredit Bisnis")]'},
        textnominalKredit: {xpath: '//android.widget.TextView[contains(@text, "Berapa kisaran nominal limit kredit yang Anda butuhkan? *")]'}, 
        textLoanDashboard: {xpath: '//android.widget.TextView[contains(@text, "Pengajuan Limit Kredit Bisnis")]'},
        textLoanAP: {xpath: '//android.widget.TextView[contains(@text, "Skema Distributor Financing")]'},
        textLoanAR: {xpath: '//android.widget.TextView[contains(@text, "Skema Supplier Financing")]'},
        textLoanPO: {xpath: '//android.widget.TextView[contains(@text, "Skema Project Financing")]'},
    
    },
    buttons: {
        startButton: {xpath: '(//android.view.View[@content-desc="buttonStartLoan"])[1]'},
        backButtonLoanTypePage: {xpath: '(//android.view.View[@content-desc="buttonBack"])[1]'},
        schemacreditButton: "~buttonSchema", 
        loanAPButton: "~cardAP",
        loanARButton: "~cardAR",
        loanPOButton: "~cardPO",
        schemaAPButton: "~buttonSchemaAP",
        schemaARButton: "~buttonSchemaAR",
        schemaPOButton: "~buttonSchemaPO",
        buttonClose: "~buttonClose",
        buttonNext: "~buttonNext",
        buttonBack: "~buttonBack",
        buttonSave: "~buttonSave",
        buttonClear: "~clearText",
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
        nominalMSME: "~optionUpTo5Billion",
        nominalCORP: "~optionMoreThan5Billion",
    },

// Apply Loan Journey Improvement
    clickButtonSchema(){
        I.click(this.buttons.schemacreditButton);
    },
    clickButtonLoanAP(){
        I.click(this.buttons.loanAPButton);
    },
    clickButtonLoanAR(){
        I.click(this.buttons.loanARButton);
    },
    clickButtonLoanPO(){
        I.click(this.buttons.loanPOButton);
    },
    clickButtonSchemaAP(){
        I.click(this.buttons.schemaAPButton);
    },
    clickButtonSchemaAR(){
        I.click(this.buttons.schemaARButton);
    },
    clickButtonSchemaPO(){
        I.click(this.buttons.schemaPOButton);
    },
    clickButtonClose(){
        I.click(this.buttons.buttonClose);
    },
    clickButtonNext(){
        I.click(this.buttons.buttonNext);
    },
    clickButtonBack(){
        I.click(this.buttons.buttonBack);
    },
    clickButtonSave(){
        I.click(this.buttons.buttonSave);
    },
    clickButtonClear(){
        I.click(this.buttons.buttonClear);
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

    async validateTitleTopBarLoanNeeds(titleLoanNeeds){
        let actual = await I.grabAttributeFrom(this.textField.texttitletopbarLoanNeeds, 'text');
        I.assertEqual(actual, 'Pengajuan Limit Kredit Bisnis');
    },

    async validateLoanAmountRequested(titleNominal){
        let actual = await I.grabAttributeFrom(this.textField.textnominalKredit, 'text');
        I.assertEqual(actual, 'Berapa kisaran nominal limit kredit yang Anda butuhkan? *');
    },

    async validateLoanTenor(titleTenor){
        let.actual = await I.grabAttributeFrom(this.textField.textTenor, 'text');
        I.assertEqual(actuak, 'Min. tenor 30 hari, Max. tenor 180 hari');

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
                I.click(this.buttons.schemaARButton);
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
    },

    clickButtonAterSeeSchema(){
        I.click(this.buttons.backButton);
    },
}