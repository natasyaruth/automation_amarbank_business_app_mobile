const { I } = inject();

module.exports = {
  fields: {
    otp: "~textFieldCode",
  },
  label: {
    phonenumber: "~textPhoneNumber",
  },
  links: {
    changePhoneNumber: "~linkChangePhoneNumber",
    resendOTP: "~linkResendOtp"
  },
  msgError: {
    otp: "~textMsgErrorOtp",
  },
  button: {
    verifyPhoneNumber: "~buttonVerifyPhoneNumber",
  },

  async getPhoneNumber(){
    I.waitForElement(this.label.phonenumber, 10);
    return await I.grabTextFrom(this.label.phonenumber);;
  },

  async getMessageError (){
    I.waitForElement(this.msgError.otp, 10);
    return await I.grabTextFrom(this.msgError.otp);
  },

  isOpen() {
    I.waitForElement(this.fields.otp, 30);
    I.waitForInvisible(this.links.resendOTP, 50);
  },

  fillInOtpCode(otpCode) {
    I.fillField(this.fields.otp, otpCode);
    I.hideDeviceKeyboard();
  },

  sendOtp() {
    I.click(this.button.verifyPhoneNumber);
  },

  clearFieldOTP(){
    I.clearField(this.fields.otp);
  },

  clickChangePhoneNumber(){
    I.click(this.links.changePhoneNumber);
  },

  resendOTP(){
    I.click(this.links.resendOTP);
  }
};
