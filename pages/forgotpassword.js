const { I } = inject();

module.exports = {
  fields: {
    userID: "~textFieldUserID",
    email: "~textFieldEmail",
  },
  buttons: {
    resetPassword: "~buttonResetPassword",
    backPopUpConfirm: "~buttonBackUserID",
    checkEmail: "~buttonCheckEmail",
    confirm: "~buttonConfirm",
    tryAgain: "~buttonTryAgain",
    understand: "~buttonUnderstand",
  },
  link: {
    resendEmail: "~linkResendEmail",
  },
  text: {
    userID: "~labelEmail",
    companyName: "~textCompanyName",
    email: "~textEmail"
  },
  messageErrorFields: {
    userID: "~textMsgErrorUserID",
    email: "~textMsgErrorEmail"
  },

  fillUserID(txtValue) {
    I.waitForElement(this.fields.userID, 10);
    I.setText(this.fields.userID, txtValue);
  },

  fillEmail(txtValue) {
    I.waitForElement(this.fields.email, 10);
    I.setText(this.fields.email, txtValue);
  },

  isOpen() {
    I.waitForElement(this.fields.userID, 10);
  },

  clickButtonResetPassword() {
    I.click(this.buttons.resetPassword);
  },

  resendEmail() {
    I.click(this.link.resendEmail);
  },

  clickButtonConfirm() {
    I.click(this.buttons.confirm);
  },

  backtoPageResetPassword() {
    I.click(this.buttons.backPopUpConfirm);
  },
  
  async getMessageError(field) {
    I.waitForElement(this.messageErrorFields[field], 10);
    return await I.grabTextFrom(this.messageErrorFields[field]);
  },

  async getUserID() {
    I.waitForElement(this.text.userID, 10);
    return await I.grabTextFrom(this.text.userID);
  },

  async getCompanyName() {
    I.waitForElement(this.text.companyName, 10);
    return await I.grabTextFrom(this.text.companyName);
  },

  clickTryAgain(){
    I.waitForText("Coba Lagi", 10);
    I.click(this.buttons.tryAgain);
  },

  clickUnderstand(){
    I.waitForText("Mengerti", 10);
    I.click(this.buttons.understand);
  },
}