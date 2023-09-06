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
    onboardingPage: {xpath: '//android.widget.TextView[contains(@text, "Onboarding page")]'},
  },
  messageErrorFields:{
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
      I.click(this.fields[key]);
      I.seeElement(this.fields[key]);
      I.setText(this.fields[key], accountInformation[key]);
      I.hideDeviceKeyboard();
    });
  },
  
  fillFieldLogin(fieldName, txtValue){

    I.seeElement(this.fields[fieldName]);
    I.click(this.fields[fieldName]);
    I.setText(this.fields[fieldName], txtValue);
    I.hideDeviceKeyboard();
  },

  async getMessageErrorFieldLogin (fieldName) {
    if(Object.keys(this.messageErrorFields).indexOf(fieldName) === -1){
      throw new Error('Field ${fieldName} is not found');
    }
    I.seeElement(this.messageErrorFields[fieldName]);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  clickLoginButton() {
    I.click(this.buttons.login);
  },

  clickReactivationButton(){
    I.click(this.buttons.reactivation);
  },

  clickClosePopUpButton(){
    I.click(this.buttons.close);
  },

  clickBackToOnboardingPage(){
    I.click(this.buttons.back);
  },

  clickIconEyePassword(){
    I.click(this.icon.eyePassword);
  },

  clickIconCallCenter(){
    I.click(this.buttons.callCenter);
  },

  clickGoToRegistrationPage(){
    I.click(this.link.registration);
  },

  clickGoToForgotPasswordPage(){
    I.click(this.link.forgotPassword);
  },

  clickLinkOnPage(linkName){
    I.seeElement(this.link[linkName]);
    I.click(this.link[linkName]);
  },

  clickBackToPageLogin(){
    I.click(this.buttons.tryAgain);
    I.waitForInvisible(this.buttons.tryAgain, 2);
  },
  clickBtnOnBoardingPage(){
    I.wait(3);
    I.click(this.buttons.onboardingPage);
  }
}
