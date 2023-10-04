const { button } = require("./otpConfirmation");

const { I } = inject();

module.exports = {
  fields: {
    password: "~textFieldPassword",
    newPIN: "~textFieldPin",
    otpcode: "~textFieldOtp",
  },
  buttons: {
    submitpassword: "~buttonNext",  
    nextpagetransfer: "~buttonNext",
  },
  icon: {
    eyePassword: "~iconShowHidePassword",
  },
  messageErrorFields: {
    errorPIN: "~",
    errorOTPcode: "~",
  },
  submitPassword(){
    I.waitForElement(this.buttons.next,5); 
    I.click(this.buttons.submitpassword);
  },
  inputPassword(password){
    I.waitForElement(this.fields.password,5);
    I.setText(this.fields.password,password);
  },
  inputPIN(pin){
    I.waitForElement(this.fields.pin,5);
    I.setText(this.fields.newPIN,pin)
  },
  inputConfirmationPIN(confirmationPIN){
    I.waitForText("Konfirmasi PIN Baru",10);
    I.setText(this.fields.newPIN,confirmationPIN);  
  },
  inputOTP(OTPcode){
    I.waitForElement(this.fields.otpcode,5);
    I.setText(this.fields.otpcode,OTPcode);
  },
  NexttoTransferPage(){
    I.click(this.buttons.nextpagetransfer);
  },
  async getMessageErrorPIN(){
    I.waitForElement(this.messageErrorFields.errorPIN,5);
    return await I.grabTextFrom(this.messageErrorFields.errorPIN);
  },
  async getMessageErrorOTP(){
    I.waitForElement(this.messageErrorFields.errorOTPcode,5);
    return await I.grabTextFrom(this.messageErrorFields.errorOTPcode);
  },

}
 