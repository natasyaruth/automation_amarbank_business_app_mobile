const { I } = inject();

module.exports = {
    textField: {
        loanProcessPage: "",
    },
    fields: {
        titleFieldSuccessCompleteData: {xpath: '//android.widget.TextView[contains(@text, "Terima kasih telah melengkapi Data Diri")]'},
        subTitleFieldSuccessCompleteData: {xpath: '//android.widget.TextView[contains(@text, "Mohon melengkapi Data Bisnis Anda untuk melanjutkan proses pengajuan pinjaman")]'},
        titleDocumentField: "",
        statusCheckingDocumentField: "",
        wordingDocumentField: "",
        titleAnalystCreditField: "",
        statusAnalystCreditField: "",
        wordingAnalystCreditField: "",
        titleLastStepField: "",
        statusLastStepField: "",
        wordingLastStepField: ""
    },
    buttons:{
        btnViewDocument: ""
    },

    // Function for call the id component
    viewLoanProcessPage(){
        I.seeElement(this.textField.loanProcessPage);
    },
    async getValueField (fieldName){
        if(Object.keys(this.fields).indexOf(fieldName) === -1){
            throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFromField(this.fields[fieldName]);
    },
    async getTextFieldSuccessCompleteData (fieldName) {
        if(Object.keys(this.fields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFrom(this.fields[fieldName]);
    },
}