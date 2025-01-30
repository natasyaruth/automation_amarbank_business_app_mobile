const { I } = inject();

module.exports = {
  fields: {
    password: "~textFieldPassword",
    newPIN: "~textFieldPIN",
    otpcode: "~textFieldOtp",
    confirmPIN: "~textFieldPIN",
  },
  buttons: {
    login: "~buttonLogin",
    submitpassword: "~buttonNext",
    nextpagetransfer: "~buttonNext",
    btnNext: "~buttonNext",
    tryAgain: "~buttonTryAgain",
    close: { xpath: "(//android.view.View[@content-desc='buttonClose'])[1]"},
    backToPin: { xpath: "(//android.view.View[@content-desc='buttonBack'])[1]"},
    cancel: "~buttonYes",
    cancelNo: "~buttonNo",
    btnTransfer: "~btnTransfer",
    back: "~buttonNo",
    backToDashboard: "~buttonBackToDashboard",
    forgotPIN: "~buttonForgotPin",
    btnFilterHistoryTrx: { xpath: "(//android.view.View[@content-desc='buttonFilter'])[1]" },
    creatPINPopUp: "~buttonCreatePin",
    understand: "~buttonUnderstand",
    otherMenu: "~tabOthers",
    createPIN: "~btnPin",
    changePassword: "~btnPassword",
    changePIN: "~btnPin",
    emailSupport: "~btnToEmail",
    closeOurTeam: "~",
  },
  icon: {
    eyePassword: "~iconShowHidePassword",
  },
  messageErrorFields: {
    errorPIN: "~textErrorPin",
    errorOtp: "~textErrorOtp",
  },
  toastbar: {
    successPin: "~",
  },

  submitPassword() {
    I.waitForElement(this.buttons.submitpassword, 5);
    I.click(this.buttons.submitpassword);
  },

  inputPassword(password) {
    I.waitForElement(this.fields.password, 10);
    I.clearField(this.fields.password);
    I.setText(this.fields.password, password);
  },

  tryAgain() {
    I.waitForElement(this.buttons.tryAgain, 10);
    I.click(this.buttons.tryAgain);
    I.wait(1);
  },

  closeSheetBlocked() {
    I.click(this.buttons.close);
  },

  inputPIN(pin) {
    I.waitForElement(this.fields.newPIN, 5);
    I.setText(this.fields.newPIN, pin);
    I.hideDeviceKeyboard();
  },

  popupCreatePIN() {
    I.waitForText("Buat PIN", 10);
    I.seeElement(this.buttons.creatPINPopUp);
    I.seeElement(this.buttons.backToDashboard);
  },

  popupCancelCreatePIN() {
    I.waitForElement(this.buttons.cancel, 10);
    I.waitForElement(this.buttons.back, 10);
  },

  clickButtonClose() {
    I.waitForElement(this.buttons.close, 10);
    I.click(this.buttons.close);
  },

  clickButtonBack() {
    I.waitForElement(this.buttons.back, 10);
    I.click(this.buttons.back);
  },
  clickButtonBackPinConfirm() {
    I.waitForElement(this.buttons.backToPin, 10);
    I.click(this.buttons.backToPin);
  },

  clickButtonBackToDashboard() {
    I.waitForElement(this.buttons.backToDashboard, 10);
    I.click(this.buttons.backToDashboard);
  },

  clickButtonForgotPIN() {
    I.waitForElement(this.buttons.forgotPIN, 10);
    I.click(this.buttons.forgotPIN);
  },

  clickButtonCancel() {
    I.waitForElement(this.buttons.cancel, 10);
    I.click(this.buttons.cancel);
  },
  clickBtnNext(){
    I.waitForElement(this.buttons.btnNext, 10);
    I.click(this.buttons.btnNext);
  },

  clickButtonCancelNo() {
    I.waitForElement(this.buttons.cancelNo, 10);
    I.click(this.buttons.cancelNo);
  },

  clickButtonUnderstand() {
    I.waitForElement(this.buttons.understand, 10);
    I.click(this.buttons.understand);
  },

  clickPopUpCreatePIN() {
    I.waitForElement(this.buttons.creatPINPopUp, 10);
    I.click(this.buttons.creatPINPopUp);
  },

  inputConfirmationPIN(confirmationPIN) {
    I.waitForText("Konfirmasi PIN Baru", 10);
    I.setText(this.fields.newPIN, confirmationPIN);
  },

  nexttoTransferPage() {
    I.waitForElement(this.buttons.nextpagetransfer, 10);
    I.click(this.buttons.nextpagetransfer);
  },

  clickEyePassword() {
    I.waitForElement(this.icon.eyePassword, 10);
    I.click(this.icon.eyePassword);
  },

  async getMessageErrorPIN() {
    I.waitForElement(this.messageErrorFields.errorPIN, 10);
    return await I.grabTextFrom(this.messageErrorFields.errorPIN);
  },

  continueAfterCreatePin() {
    I.waitForElement(this.buttons.nextpagetransfer, 10);
    I.click(this.buttons.nextpagetransfer);
  },

  getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  },

  getRandomNumberPin() {
    const randomNumbers = [];
    for (let i = 0; i < 6; i++) {
      const randomNumber = this.getRandomInt(1, 100); // Change the range as needed
      randomNumbers.push(randomNumber);
    }
    return randomNumbers;
  },

  async getMessageErrorOTP() {
    I.waitForElement(this.messageErrorFields.errorOtp, 5);
    return await I.grabTextFrom(this.messageErrorFields.errorOtp);
  },

  async getEmailValue() {
    let email = await I.grabTextFrom(this.label.email);
    return email
  },

  fillInOtpCode(otpCode) {
    I.waitForElement(this.fields.otpcode, 10);
    I.setText(this.fields.otpcode, otpCode);
  },

  goToOtherMenu() {
    I.click(this.buttons.otherMenu);
  },

  goToLoginPage() {
    I.wait(5);
    I.waitForElement(this.buttons.login, 10);
  },

  goToCreatePIN() {
    I.waitForElement(this.buttons.createPIN, 20);
    I.click(this.buttons.createPIN);
  },

  goToChangePIN() {
    I.waitForElement(this.buttons.changePIN, 20);
    I.click(this.buttons.changePIN);
  },

  closeBottomSheet() {
    I.click(this.buttons.closeOurTeam);
  },

}
