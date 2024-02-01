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
    tryAgain: "~buttonTryAgain",
    close: "~buttonClose",
    creatPINPopUp: "~",
    understand: "~",
    otherMenu: "~",
    createPIN: "~",
    changePassword: "~",
    changePIN: "~",
    emailSupport: "~", 
    closeOurTeam: "~",
  },
  icon: {
    eyePassword: "~iconShowHidePassword",
  },
  messageErrorFields: {
    errorPIN: "~textErrorPin",         
  },

  toastbar: {
    successPin: "~",
  },

  submitPassword() {
    I.waitForElement(this.buttons.submitpassword, 5);
    I.click(this.buttons.submitpassword);
  },

  inputPassword(password) {
    I.waitForElement(this.fields.password, 5);
    I.setText(this.fields.password, password);
  },

  tryAgain() {
    I.waitForElement(this.buttons.tryAgain);
    I.click(this.buttons.tryAgain);
    I.wait(1);
  },

  closeSheetBlocked() {
    I.click(this.buttons.close);
  },

  inputPIN(pin) {    
    I.waitForElement(this.fields.newPIN, 5);
    I.setText(this.fields.newPIN, pin1);
    I.hideDeviceKeyboard();
  },

  // async inputPIN() {
    // I.wait(5);
    // let newPin ='123456';
    // for (let i=0; i < newPin.length; i++) {
      // await I.setText(this.fields.newPIN, newPin[i]);
    // }
  // },

  popupCreatePIN() {
    I.waitForText("Buat PIN", 10);
    I.seeElement(this.buttons.creatPINPopUp);
  },

  clickButtonUnderstand(){
    I.waitForElement(this.buttons.understand);
    I.click(this.buttons.understand);
  },

  clickPopUpCreatePIN(){
    I.click(this.buttons.creatPINPopUp);
  },

  inputConfirmationPIN(confirmationPIN) {
    I.waitForText("Konfirmasi PIN Baru", 10);
    I.setText(this.fields.newPIN, confirmationPIN);
  },

    nexttoTransferPage() {
    I.click(this.buttons.nextpagetransfer);
  },

  clickEyePassword() {
    I.click(this.icon.eyePassword);
  },

  async getMessageErrorPIN() {
    I.waitForElement(this.messageErrorFields.errorPIN, 5);
    return await I.grabTextFrom(this.messageErrorFields.errorPIN);
  },

  
  
    continueAfterCreatePin(){
    I.waitForElement(this.buttons.nextpagetransfer, 10);
    I.click(this.buttons.nextpagetransfer);
  },

  getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  },

  getRandomNumberPin() {
    const randomNumbers = [];
    for (let i = 0; i < 6; i++) {
      const randomNumber = getRandomInt(1, 100); // Change the range as needed
      randomNumbers.push(randomNumber);
    }
    return randomNumbers;
  },

  async getMessageErrorOTP() {
    I.waitForElement(this.messageErrorFields.errorOTPcode, 5);
    return await I.grabTextFrom(this.messageErrorFields.errorOTPcode);
  },

  goToOtherMenu(){
    I.click(this.buttons.otherMenu);
  },

  goToCreatePIN(){
    I.click(this.buttons.createPIN);

  },

  goToChangePIN(){
    I.click(this.buttons.changePIN);

  },

  closeBottomSheet(){
    I.click(this.buttons.closeOurTeam);
  },  
}
