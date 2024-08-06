const { I } = inject();

module.exports = {

  buttons:{
    next: "~buttonNext",
    tryPassword: "~buttonTry",
    understand: "~buttonUnderstand",
    cancel: "~buttonYes",
    backToChangePassword: "~buttonNo",
    changePassword: "~buttonChangePassword",
  },
  fields:{
    oldPassword: "~textFieldPassword",
    newPassword: "~textFieldNewPassword",
    confirmPassword: "~textFieldConfirmPassword",
    otp: "~textFieldOtp",
  },
  msgErrorFields:{
    oldPassword: "~textErrorPassword",
    newPassword: "~textErrorNewPassword",
    confirmPassword: "~textErrorConfirmPassword",
    otp: "~textErrorOtp",
  },
  link:{
    resendOtp: "~buttonSendOtp",
  },
  icons: {
    eyeOldPassword: "~iconShowHidePassword",
    eyeNewPassword: "~iconShowHideNewPassword",
    eyeConfirmPassword: "~iconShowHideConfirmPassword",
  },
  texts: {
    phoneNumber: "~textPhoneNumber",
  },

  inputOldPassword(oldPassword){
    I.waitForElement(this.fields.oldPassword, 10);
    I.setText(this.fields.oldPassword, oldPassword);
  },

  clearOldPassword(){
    I.waitForElement(this.fields.oldPassword, 10);
    I.clearField(this.fields.oldPassword);
  },

  async getMessageErrorFields(field){
    I.wait(1);
    I.waitForElement(this.msgErrorFields[field], 10);
    return await I.grabTextFrom(this.msgErrorFields[field]);
  },

  clickNext(){
    I.waitForElement(this.buttons.next, 10);
    I.click(this.buttons.next);
  },

  clickEyeOldPassword(){
    I.waitForElement(this.icons.eyeOldPassword, 10);
    I.click(this.icons.eyeOldPassword);
  },

  clickEyeNewPassword(){
    I.waitForElement(this.icons.eyeNewPassword, 10);
    I.click(this.icons.eyeNewPassword);
  },

  clickEyeConfirmPassword(){
    I.waitForElement(this.icons.eyeConfirmPassword, 10);
    I.click(this.icons.eyeConfirmPassword);
  },

  clickCancel(){
    I.waitForElement(this.buttons.cancel, 10);
    I.click(this.buttons.cancel);
  },

  clickBackToChangePassword(){
    I.waitForElement(this.buttons.backToChangePassword, 10);
    I.click(this.buttons.backToChangePassword);
  },

  inputNewPassword(newPassword){
    I.waitForElement(this.fields.newPassword, 10);
    I.setText(this.fields.newPassword, newPassword);
  },

  inputConfirmPassword(confirmPassword){
    I.waitForElement(this.fields.confirmPassword, 10);
    I.setText(this.fields.confirmPassword, confirmPassword);
  },

  clearNewPassword(){
    I.waitForElement(this.fields.newPassword, 10);
    I.clearField(this.fields.newPassword, newPassword);
  },

  clearConfirmPassword(){
    I.waitForElement(this.fields.confirmPassword, 10);
    I.clearField(this.fields.confirmPassword, confirmPassword);
  },

  clickChangePassword(){
    I.waitForElement(this.buttons.changePassword, 10);
    I.click(this.buttons.changePassword);
  },

  async getPhoneNumber(){
    I.waitForElement(this.texts.phoneNumber, 10);
    return await I.grabTextFrom(this.texts.phoneNumber);
  },  

  clickResendOTP(){
    I.waitForElement(this.link.resendOtp, 10);
    I.click(this.link.resendOtp);
  },

  inputOTP(otp){
    I.waitForElement(this.fields.otp, 10);
    I.setText(this.fields.otp, otp);
  },

  clickUnderstand(){
    I.waitForElement(this.buttons.understand, 10);
    I.click(this.buttons.understand);
  },

}
