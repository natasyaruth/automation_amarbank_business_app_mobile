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

