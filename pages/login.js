const { I } = inject();

module.exports = {
  fields: {
    userID: "~textFieldUserID",
    password: "~textFieldPassword",
  },
  buttons: {
    login: "~buttonLogin",
    tryAgain: "~buttonTryAgain",
    reactivation: "~buttonReactivation",
    close: "~buttonClose",
    callCenter: "~buttonCallCenter",
    onboardingPage: { xpath: '//android.widget.TextView[contains(@text, "Onboarding page")]' },
    tabOthers: "~tabOthers",
    logout: "~btnLogout",
    biometric: "~buttonLoginBiometric",
    laterBiometric: "~buttonSkip",
    activatedBiometric: "~buttonActiveNow",
    cancelNewDevice: "~buttonCancel",
    registerNewDevice: "~buttonRegister",
    understand: "~buttonUnderstand",
    continueSelfie: "~buttonContinueSelfie",
    takeSelfie: "~buttonTakeSelfie",
    reTakeSelfie: "~buttonTry",
    uploadSelfie: "~buttonUpload",
    continueToMainDashboard: "~buttonGoToDashboard",
  },
  messageErrorFields: {
    userID: "~textMsgErrorUserID",
    password: "~textMsgErrorPassword",
  },
  icon: {
    eyePassword: "~iconEyePassword",
  },
  link: {
    forgotPassword: "~linkForgotPassword",
    registration: "~linkRegistration",
  },
  checkbox: {
    rememberMe: "~checkBoxRememberMe",
  },
  text: {
    blockedDate: "~textTitle",
    errorFace: "~textError",
  },

  fillInAccountInformation(accountInformation) {
    Object.keys(accountInformation).forEach((key) => {
      if (this.fields[key] === undefined) {
        return;
      }
      I.click(this.fields[key]);
      I.seeElement(this.fields[key]);
      I.setText(this.fields[key], accountInformation[key]);
      I.hideDeviceKeyboard();
    });
  },

  fillFieldLogin(fieldName, txtValue) {
    I.seeElement(this.fields[fieldName]);
    I.click(this.fields[fieldName]);
    I.setText(this.fields[fieldName], txtValue);
    I.hideDeviceKeyboard();
  },

  async getMessageErrorFieldLogin(fieldName) {
    if (Object.keys(this.messageErrorFields).indexOf(fieldName) === -1) {
      throw new Error('Field ${fieldName} is not found');
    }
    I.seeElement(this.messageErrorFields[fieldName]);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  clickLoginButton() {
    I.click(this.buttons.login);
  },

  clickLogout() {
    I.waitForElement(this.buttons.logout, 10);
    I.click(this.buttons.logout);
  },

  clickReactivationButton() {
    I.click(this.buttons.reactivation);
  },

  closeBottomSheet() {
    I.waitForElement(this.buttons.close, 10);
    I.click(this.buttons.close);
  },

  clickBackToOnboardingPage() {
    I.click(this.buttons.back);
  },

  clickIconEyePassword() {
    I.click(this.icon.eyePassword);
  },

  clickIconCallCenter() {
    I.click(this.buttons.callCenter);
  },

  goToRegistrationPage() {
    I.click(this.link.registration);
  },

  goToForgotPasswordPage() {
    I.waitForElement(this.link.forgotPassword, 10);
    I.click(this.link.forgotPassword);
  },

  tryToLogin() {
    I.waitForElement(this.buttons.tryAgain, 10);
    I.click(this.buttons.tryAgain);
  },

  clickBtnOnBoardingPage() {
    I.wait(5);
    I.click(this.buttons.onboardingPage);
  },

  checkRememberMe() {
    let stateCheckBox = I.grabAttributeFrom(this.checkbox.rememberMe, 'checked')
    if (
      stateCheckBox === "true") {
      I.click(this.checkbox.rememberMe);
    }
    I.click(this.checkbox.rememberMe);
    I.seeAttributesOnElements(
      this.checkbox.rememberMe,
      {
        checked: "true"
      }
    );
  },

  async getValueUserID() {
    return await I.grabTextFromField(this.fields.userID);
  },

  clickBiometric() {
    I.waitForElement(this.buttons.biometric, 30);
    I.click(this.buttons.biometric);
  },

  clickLaterBiometric() {
    I.waitForElement(this.buttons.laterBiometric, 30);
    I.click(this.buttons.laterBiometric);
  },

  clickRegisterNewDevice() {
    I.waitForElement(this.buttons.registerNewDevice, 20);
    I.click(this.buttons.registerNewDevice);
  },

  closePageVerificationNewDevice() {
    I.waitForElement(this.buttons.close, 10);
    I.click(this.buttons.close);
  },

  continueTakeSelfie() {
    I.waitForElement(this.buttons.continueSelfie, 10);
    I.click(this.buttons.continueSelfie);
  },

  takePicture() {
    I.waitForElement(this.buttons.takeSelfie, 10);
    I.click(this.buttons.takeSelfie);
  },

  retakePicture() {
    I.waitForElement(this.buttons.reTakeSelfie, 10);
    I.click(this.buttons.reTakeSelfie);
  },

  submitPhoto() {
    I.waitForElement(this.buttons.uploadSelfie, 10);
    I.click(this.buttons.uploadSelfie);
  },

  continueToMainDashboard() {
    I.waitForElement(this.buttons.continueToMainDashboard, 10);
    I.click(this.buttons.continueToMainDashboard);
  },

  async getInfoMessageBlocked() {
    I.waitForElement(this.text.blockedDate, 10);
    return await I.grabTextFrom(this.text.blockedDate);
  },

}