const { I } = inject();

module.exports = {
    textField: {
        textTitleOnboarding: "",
        textBenefit1: "",
        textBenefit2: "",
        textBenefit2: "",
        textOnlyWith1: "",
        textOnlyWith2: "",
        textOnlyWith3: "",
        textFieldLoanTypePage: {xpath: '//android.widget.TextView[contains(@text, "Bagaimana gambaran masalah pendanaan Anda?")]'},
        textFieldLoanAP: {xpath: '//android.widget.TextView[contains(@text, "Saya butuh tempo untuk mendanai tagihan dari supplier")]'},
        textFieldLoanAR: {xpath: '//android.widget.TextView[contains(@text, "Saya butuh dana di muka karena pembeli belum bayar tagihan.")]'},
        textFieldLoanPO: {xpath: '//android.widget.TextView[contains(@text, "Saya butuh pinjaman untuk mendanai proyek")]'},
        textLoanSchemaAP: {xpath: '//android.widget.TextView[contains(@text, "Skema Pinjaman Distributor")]'},
        textLoanSchemaAR: {xpath: '//android.widget.TextView[contains(@text, "Skema Pinjaman Modal Proyek")]'},
        textLoanSchemaPO: {xpath: '//android.widget.TextView[contains(@text, "Skema Pinjaman Tagihan Faktur")]'}
    },
    buttons: {
        startButton: "",
        backButtonLoanTypePage: {xpath: '//android.view.View[@content-desc="buttonBack"]'},
        nextButton: "~buttonResetPassword"
    },
    radioButtons: {
        radioBtnAP: {xpath: '//android.widget.RadioButton'},
        radioBtnAR: {xpath: '//android.widget.RadioButton'},
        radioBtnPO: {xpath: '//android.widget.RadioButton'},
    },
    contentFields: {
        fieldAP: "",
        fieldAR: "",
        fieldPO: "",
        viewPageAP: "~Loan Schema",
        viewPageAR: "~Loan Schema",
        viewPagePO: "~Loan Schema"
    },

// Function for call the id component
    validationTextTittleOnboarding(){
        I.assertEqual(this.textField.textTitleOnboarding, "");
    },
    viewPageOnBoarding(){
        I.see(this.textField.textTitleOnboarding);
    },

    validationTextOnlyWithFirst(){
        I.assertEqual(this.textField.textOnlyWith1, "");
    },
    validationTextOnlyWithTwo(){
        I.assertEqual(this.textField.textOnlyWith2, "");
    },
    validationTextOnlyWithThree(){
        I.assertEqual(this.textField.textOnlyWith3, "");
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
    validationBenefitText(benefitText){
        switch (benefitText){
            case first:
                I.assertEqual(this.textField.textBenefit1, "");
                break;
            case two:
                I.assertEqual(this.textField.textBenefit2, "");
                break;
            case three:
                I.assertEqual(this.textField.textBenefit2, "");
                break;
        }

    },

    validateLoanTypeList(loanType,){
        switch (loanType){
            case AP:
                I.assertEqual(this.textField.textFieldLoanAP, "");
                break;
            case AR:
                I.assertEqual(this.textField.textFieldLoanAR, "");
                break;
            case PO:
                I.assertEqual(this.textField.textFieldLoanPO, "");
                break;
        }
    },

    selectLoanTypeList(){
        switch (selectLoanType){
            case AP:
                I.click(this.radioButtons.radioBtnAP);
                break;
            case AR:
                I.click(this.radioButtons.radioBtnAR);
                break;
            case PO:
                I.click(this.radioButtons.radioBtnPO);
                break;
        }
    },

    validateLoanSchemPage(loanSchema){
        switch (loanSchema){
            case AP:
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaAP);
                I.assertEqual(actualValue, 'Skema Pinjaman Distributor');
                break;
            case AR:
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaAR);
                I.assertEqual(actualValue, 'Skema Pinjaman Modal Proyek');
                break;
            case PO:
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaPO);
                I.assertEqual(actualValue, 'Skema Pinjaman Tagihan Faktur');
                break;
        }
    },
    validateContentField(contentFieldText){
        switch (contentFieldText){
            case AP:
                I.seeElement(this.contentFields.viewPageAP);
                break;
            case AR:
                I.seeElement(this.contentFields.viewPageAR);
                break;
            case PO:
                I.seeElement(this.contentFields.viewPagePO);
                break;
        }
    },

    clickBackButtonLoanTypePage(){
        I.click(this.buttons.backButtonLoanTypePage);
    }
}