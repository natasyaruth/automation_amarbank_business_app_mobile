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
        textFieldLoanTypePage: "",
        textFieldLoanAP: "",
        textFieldLoanAR: "",
        textFieldLoanPO: "",
        textLoanSchemaAP: "",
        textLoanSchemaAR: "",
        textLoanSchemaPO: ""
    },
    buttons: {
        startButton: "",
        backButtonLoanTypePage: "",
        nextButton: ""
    },
    radioButtons: {
        radioBtnAP: "",
        radioBtnAR: "",
        radioBtnPO: "",
    },
    contentFields: {
        fieldAP: "",
        fieldAR: "",
        fieldPO: "",
        viewPageAP: "",
        viewPageAR: "",
        viewPagePO: ""
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
                I.assertEqual(this.textField.textLoanSchemaAP, "");
                break;
            case AR:
                I.assertEqual(this.textField.textLoanSchemaAR, "");
                break;
            case PO:
                I.assertEqual(this.textField.textLoanSchemaPO, "");
                break;
        }
    },
    validateContentField(contentFieldText){
        switch (contentFieldText){
            case AP:
                I.assertEqual(this.contentFields.fieldAP, "");
                break;
            case AR:
                I.assertEqual(this.contentFields.fieldAR, "");
                break;
            case PO:
                I.assertEqual(this.contentFields.fieldPO, "");
                break;
        }
    },

    clickBackButtonLoanTypePage(){
        I.click(this.buttons.backButtonLoanTypePage);
    }
}