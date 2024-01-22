const { I } = inject();

module.exports = {

  buttons:{
    deleteAccount: "~buttonDeleteAccount",
    continue: "",
    verify: "",
    iconEye: "",
    submit: "",
    tryAgain: "",
  }, 
  fields: {
    password: "",
    reason: "",
  },
  messageErrorField:{
    reason: "",
  },

  clickMenuAccountDelete(){
    I.waitForElement(this.buttons.deleteAccount, 10);
    I.click(this.buttons.deleteAccount);
  },

  continueDeleteAccount(){
    I.waitForElement(this.buttons.continue, 10);
    I.click(this.buttons.continue);
  },

  clickEyePassword(){
    I.waitForElement(this.buttons.iconEye, 10);
    I.click(this.buttons.iconEye);
  },

  verifyPassword(){
    I.waitForElement(this.buttons.verify, 10);
    I.click(this.buttons.verify);
  },

  tryAgainPassword(){
    I.waitForElement(this.buttons.tryAgain, 10);
    I.click(this.buttons.tryAgain);
  },

  submitRequestAccDeletion(){
    I.waitForElement(this.buttons.submit, 10);
    I.click(this.buttons.submit);
  },

  fillPassword(password){
    I.waitForElement(this.fields.password, 10);
    I.setText(this.fields.password, password);
  },

  fillReason(reason){
    I.waitForElement(this.fields.reason, 10);
    I.setText(this.fields.reason, reason);
  },

  clearFieldReason(){
    I.clearField(this.fields.reason);
  },

  clearFieldPassword(){
    I.clearField(this.fields.password);
  },

  async getMessageErrorReason(){
    I.waitForElement(this.messageErrorField.reason, 10);
    return await I.grabTextFrom(this.messageErrorField.reason);
  }

}
