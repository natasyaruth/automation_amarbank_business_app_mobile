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
    back: "~buttonBack",
    close: "~buttonClose",
  },
  messageErrorFields:{
    msgErrorUserID: "~textMsgErrorUserID",
    msgPassword: "~textMsgErrorPassword",
  },
  icon: {
    callCenter: "~iconCallCenter",
    eyePassword: "~iconEyePassword",
  },
  link: {
    forgotPassword: "~linkForgotPassword",
    registration: "~linkRegistration",
  },
  checkbox: {
    rememberMe: "~checkBoxRememberMe",
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
    I.click(this.icon.callCenter);
  },

  clickGoToRegistrationPage(){
    I.click(this.link.registration);
  },

  clickGoToForgotPasswordPage(){
    I.click(this.link.forgotPassword);
  },

  clickBackToPageLogin(){
    I.click(this.buttons.tryAgain);
    I.waitForInvisible(this.buttons.tryAgain, 2);
  },
}
