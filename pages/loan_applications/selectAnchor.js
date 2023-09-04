const { I } = inject();

module.exports = {
    textField: {
        textFieldAnchorPage: "",
        textFieldTitleAnchorNotFound: "",
        textFieldSubTitleAnchorNotFound: "",
        textFieldAnchorCooperatingPage: "",
        textFieldSelectLoanAmountPage: ""
    },
    fields: {
        searchField: "",
        anchorList: "",
        dateField: "",
        dateMonthField: "",
        dateYearField: "",
        valueDateField: "",
        anchorNameField: "",
        industryTypeField: "",
        industryTypeList: ""
    },
    buttons: {
        selectBtn: "",
        cancelBtn: "",
        backBtn: "",
        nextBtn: ""
    },
    icon: {
        otherAnchor: ""
    },
    messageErrorFields: {
        msgErrorAnchorName: "",
        msgErrorIndustryType: "",
        msgErrorDateCooperating: ""
    },

    // Function for call the id component
    viewAnchorPage(){
        I.seeElement(this.textField.textFieldAnchorPage);
    },
    fillFieldSearch(txtValue){
        I.seeElement(this.fields.searchField);
        I.setText(this.fields.searchField, txtValue);
    },
    validateAnchorNotFound(){
        I.grabTextFromField(this.textField.textFieldTitleAnchorNotFound, '');
        I.grabTextFromField(this.textField.textFieldSubTitleAnchorNotFound, '');
    },
    selectAnchorList(){
        I.seeElement(this.fields.anchorList);
        I.click(this.fields.anchorList);
    },
    viewAnchorCooperatingPage(){
        I.seeElement(this.textField.textFieldAnchorCooperatingPage);
    },
    viewLoanAmountPage(){
        I.seeElement(this.textField.textFieldSelectLoanAmountPage);
    },
    selectDateCooperating(){
        I.seeElement(this.fields.dateField);
        I.click(this.fields.dateField);
        I.wait(5);
        I.click(this.fields.dateMonthField);
        I.wait(5);
        I.click(this.fields.dateYearField);
    },
    validateDateValueCooperating(){
        I.seeElement(this.fields.valueDateField);
        I.grabTextFromField(this.fields.valueDateField, '');
    },
    clickBackButtonToListAcnhor(){
        I.wait(5);
        I.click(this.fields.backBtn);
    },
    clickIconOtherAnchor(){
        I.wait(5);
        I.click(this.icon.otherAnchor);
    },
    clickNextBtnOnAnchorPage(){
        I.wait(5);
        I.click(this.buttons.nextBtn);
    },
    async getMessageErrorFieldOnOtherAnchor (fieldName) {
        if(Object.keys(this.messageErrorFields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.messageErrorFields[fieldName]);
        return await I.grabTextFrom(this.messageErrorFields[fieldName]);
      },
    async getValueFieldData (fieldName){
        if(Object.keys(this.fields).indexOf(fieldName) === -1){
            throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFromField(this.fields[fieldName]);
    },
    fillFieldAnchorName(fieldName, txtValue){
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
    selectIndustryType(){
        I.wait(5);
        I.seeElement(this.fields.industryTypeField);
        I.click(this.fields.industryTypeField);
        I.wait(5);
        I.click(this.fields.industryTypeList);
    }
}