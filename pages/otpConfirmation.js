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
    return await I.grabTextFrom(this.label.phonenumber);;
  },

  async getMessageError (){
    I.waitForElement(this.msgError.otp, 10);
    return await I.grabTextFrom(this.msgError.otp);
  },

  isOpen() {
    I.waitForElement(this.fields.otp, 30);
  },

  fillInOtpCode(otpCode) {
    I.fillField(this.fields.otp, otpCode);
  },

  sendOtp() {
    I.click(this.button.verifyPhoneNumber);
  },

  clearFieldOTP(){
    I.clearField(this.fields.otp);
  },
};
