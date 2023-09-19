const { I } = inject();

module.exports = {
  fields: {
    userID: "~textFieldUserID",
  },
  buttons: {
    resetPassword: "~buttonResetPassword",
    backPopUpConfirm: "~buttonBackUserID",
    checkEmail: "~buttonCheckEmail",
    confirm: "~buttonConfirm",
  },
  link: {
    resendEmail: "~linkResendEmail",
  },
  text: {
    userID: "~textUserID",
    companyName: "~textCompanyName",
    email: "~textEmail"
  },
  messageErrorFields: {
    userID: "~textMsgErrorUserID",
  },

  fillUserID(txtValue) {
    I.setText(this.fields.userID, txtValue);
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
  
  async getMessageError() {
    I.waitForElement(this.messageErrorFields.userID, 10);
    return await I.grabTextFrom(this.messageErrorFields.userID);
  },

  async getUserID() {
    I.waitForElement(this.text.userID, 10);
    return await I.grabTextFrom(this.text.userID);
  },

  async getCompanyName() {
    I.waitForElement(this.text.companyName, 10);
    return await I.grabTextFrom(this.text.companyName);
  },
}