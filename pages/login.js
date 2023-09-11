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

  fillInAccountInformation(accountInformation) {
    Object.keys(accountInformation).forEach((key) => {
      if (this.fields[key] === undefined) {
        return;
      }
      I.seeElement(this.fields[key]);
      I.setText(this.fields[key], accountInformation[key]);
    });
  },

  fillFieldLogin(fieldName, txtValue) {
    I.seeElement(this.fields[fieldName]);
    I.setText(this.fields[fieldName], txtValue);
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

  clickReactivationButton() {
    I.click(this.buttons.reactivation);
  },

  closeBottomSheet() {
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
    I.click(this.link.forgotPassword);
  },

  tryToLogin() {
    I.click(this.buttons.tryAgain);
    I.waitForInvisible(this.buttons.tryAgain, 2);
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
}
