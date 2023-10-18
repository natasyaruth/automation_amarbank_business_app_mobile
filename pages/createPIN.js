const { I } = inject();

module.exports = {
  fields: {
    password: "~textFieldPassword",
    newPIN: "~textFieldPin",
    otpcode: "~textFieldOtp",
    confirmPIN: ~"textFieldPin",
  },
  buttons: {
    submitpassword: "~buttonNext",  
    nextpagetransfer: "~buttonNext",
    tryagainpassword: ~"buttonTry",
    closesheetpassword: ~"buttonClose",
    reactiveAccount: ~"buttonReactive",
  },
  icon: {
    eyePassword: "~iconShowHidePassword",
  },
  messageErrorFields: {
    errorPIN: ~"textErrorPin",
    errorOTPcode: ~"textErrorOtp",
    errorPassword: ~"textErrorPassword",
    blockPassword: ~"textBlockPassword",
  },
  texts: {
    email: ~"textEmail",
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
    I.setText(this.fields.newPIN,pin);
  },
  inputConfirmationPIN(confirmationPIN){
    I.waitForText("Konfirmasi PIN Baru",10);
    I.setText(this.fields.confirmPIN,confirmationPIN);
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
  async getMessageErrorPassword(){
    I.waitForElement(this.messageErrorFields.errorPassword,5);
    return await I.grabTextFrom(this.messageErrorField.errorPasswords);
  },
  async getmessageBlockPassword(){
    I.waitForElement(this.messageErrorFields.blockPassword,5);
    return await I.grabTextFrom(this.messageErrorFields.blockPassword);
  },
  submitTryAgainPassword(){
    I.click(this.buttons.tryagainpassword);
  },
  reactiveAccount(){
    I.click(this.buttons.reactiveAccount);
  },
  async getconfirmemail(){
    return await I.grabTextFrom(this.texts.email);  
 },
}
 