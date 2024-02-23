const { I } = inject();

module.exports = {
button: {
    btnApplyLoan: "~buttonStart",
    btnNext: "~buttonNext",
    btnPinjaman: "~buttonPinjaman",
    },

fields: {
    inputNominal: "~textFieldLoan",
    inputTenor: "~textFieldTenor",
   },

messageError: {
    txtMeessageEmptyLoan: "textMsgEmptyLoan",
    txtMessageEmptyTenor: "~textMsgEmptyTenor",
    txtMessageErrorLoan: "~textMsgErrorLoan",
    txtMessageErrorTenor: "~textMsgErrorTenor",
    },

radioButtons: {
        radioBtnAP: "~radioButtonAP",
        radioBtnAR: "~radioButtonAR",
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
    
selectLoanTypeList(selectLoanType){
        switch (selectLoanType){
            case 'AP':
                I.click(this.radioButtons.radioBtnAP);
            break;
            case 'AR':
                I.click(this.radioButtons.radioBtnAR);
            break;
            
        }
    },

 ClickAjukanLoan(){
    I.click(this.button.btnApplyLoan);
 },

 ClickNext(){
    I.click(this.button.btnNext);
 },

  fillNominalPinjaman(){
    I.setText(this.fields.inputNominal);  
},

fillTenor(){
    I.setText(this.fields.inputTenor);
},

async getMessageEmptyLoan() {
    return await I.grabValueFrom(this.messageError.txtMeessageEmptyLoan);
  },

async getMessageEmptyTenor(){
    return await I.grabValueFrom(this.messageError.txtMessageEmptyTenor);
},

async getMessageErrorLoan(){
    return await I.grabValueFrom(this.messageError.txtMessageErrorLoan);
},

async getMessageErrorTenor(){
    return await I.grabValueFrom(this.messageError.txtMessageErrorTenor);
}, 

}

