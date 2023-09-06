const { I } = inject();

module.exports = {
    textField: {
        loanProcessPage: ""
    },
    fields: {
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
    }
}