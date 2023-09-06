const { I } = inject();

module.exports = {
    textField:{
        textFieldLoanAmountPage: "",
        textFieldLegalityBussPage: "",
        textFieldHeadOfficeLocationPage: "",
        textFieldSuccesApplyLoan: ""
    },
    fields: {
        amountLoanField: "",
        tenorLoanField: "",
        bussTypeField: "",
        dateEstablishField: "",
        bussLocationField: "",
        titleSuccesApplyLoanField: "",
        subTitleSuccesApplyLoanField: "",
        informationBussNeedDoneField: "",
        informationLoanNeedDoneField: "",
        completeDataSection: "",
        tenorLoanListField: "",
        dayDateEstablish1: "",
        dayDateEstablish2: "",
        dayDateEstablish3: "",
        monthDateEstablish1: "",
        monthDateEstablish2: "",
        monthDateEstablish3: "",
        yearDateEstablish1: "",
        yearDateEstablish2: "",
        yearDateEstablish3: ""
    },
    buttons: {
        nextBtn: "",
        closeBtn: "",
        openAccount: ""
    },
    messageErrorFields: {
        amountLoanField: "",
        tenorLoanField: "",
        bussTypeField: "",
        dateEstablishField: "",
        bussLocationField: ""
    },
    radioButton: {
        otherLocationRadioBtn: "",
        jabodetabekLocationRadioBtn: "",
        legalityBussTypePTCompany: "",
        legalityBussTypePTPersonal: "",
        legalityBussTypeCV: "",
        legalityBussTypeUD: "",
        legalityBussTypePersonal: ""
    },
    icons: {
        iconInfoNeedBuss: "",
        iconInfoNeedLoan: "",
        iconCompletedData: ""
    },

    // Function for call the id component
    viewLoanAmountPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldLoanAmountPage);
    },
    viewLegalityBussPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldLegalityBussPage);
    },
    viewHeadOfficeLocationPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldHeadOfficeLocationPage);
    },
    clearAmountLoan(){
        I.clearField(this.fields.amountLoanField);
    },
    clickBtnNextOnLoanAmountPage(){
        I.wait(5);
        I.click(this.buttons.nextBtn);
    },
    async getMessageErrorFieldOnLoanAmount (fieldName) {
        if(Object.keys(this.messageErrorFields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.messageErrorFields[fieldName]);
        return await I.grabTextFrom(this.messageErrorFields[fieldName]);
    },
    fillFieldLoanAmount(fieldName, txtValue){
        I.seeElement(this.fields[fieldName]);
        if (
            this.fields[fieldName] === "" ||
            this.fields[fieldName] === null ||
            this.fields[fieldName] === "-"
        ){
            I.clearField(this.fields[fieldName]);
            return;
        }
        I.setText(this.fields[fieldName], txtValue);
    },
    selectTenorLoan(){
        I.wait(5);
        I.click(this.fields.tenorLoanField);
        I.wait(5);
        I.click(this.fields.tenorLoanListField);
    },
    selectLegalityBussType(){
        I.wait(5);
        I.click(this.radioButton.legalityBussTypePTPersonal);
        I.click(this.radioButton.legalityBussTypePersonal);
        I.click(this.radioButton.legalityBussTypeUD);
        I.click(this.radioButton.legalityBussTypeCV);
        I.wait(5);
        I.click(this.radioButton.legalityBussTypePTCompany);
    },
    selectBussEstabilishmentDate(){
        I.wait(5);
        I.click(this.fields.dateEstablishField);
    },
    selectDayDate(dayDate){
        switch (dayDate){
            case 1:
                I.click(this.fields.dayDateEstablish1);
                break;
            case 2:
                I.click(this.fields.dayDateEstablish2);
                break;
            case 3:
                I.click(this.fields.dayDateEstablish3);
                break;
        }
    },
    selectMonthDate(monthDate){
        switch (monthDate){
            case 1:
                I.click(this.fields.monthDateEstablish1);
                break;
            case 2:
                I.click(this.fields.monthDateEstablish2);
                break;
            case 3:
                I.click(this.fields.monthDateEstablish3);
                break;
        }
    },
    selectYearDate(yearDate){
        switch (yearDate){
            case 1:
                I.click(this.fields.yearDateEstablish1);
                break;
            case 2:
                I.click(this.fields.yearDateEstablish2);
                break;
            case 3:
                I.click(this.fields.yearDateEstablish3);
                break;
        }
    },
    clickCloseBtn(){
        I.wait(5);
        I.click(this.buttons.closeBtn);
    },
    selectJabodetabekLocation(){
        I.wait(5);
        I.click(this.radioButton.jabodetabekLocationRadioBtn);
    },
    viewSuccessApplyLoanPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldSuccesApplyLoan);
    },
    validateBussNeedDoneSection(){
        I.seeElement(this.icons.iconInfoNeedBuss);
        I.wait(5);
        I.seeElement(this.fields.informationBussNeedDoneField);
    },
    validateLoanNeedDoneSection(){
        I.seeElement(this.icons.iconInfoNeedLoan);
        I.wait(5);
        I.seeElement(this.fields.informationLoanNeedDoneField);
    },
    validateCompletedDataSection(){
        I.seeElement(this.icons.iconCompletedData);
        I.wait(5);
        I.seeElement(this.fields.completeDataSection);
    },
    selectLocationOthers(){
        I.wait(5);
        I.seeElement(this.radioButton.otherLocationRadioBtn);
        I.click(this.radioButton.otherLocationRadioBtn);
    },
    async getTextFieldSuccessApplyLoan (fieldName) {
        if(Object.keys(this.fields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFrom(this.fields[fieldName]);
    },
}