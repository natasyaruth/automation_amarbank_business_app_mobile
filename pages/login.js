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

  getMessageErrorFieldLogin (fieldName)  {
    let getValue;
    async ({I}) => {

      if(
        fieldName === this.fields.userID
        ){
        I.seeElement(this.messageErrorFields.msgErrorUserID);
        getValue = await I.grabTextFrom(this.messageErrorFields.msgErrorUserID);
      
      } else if(
        fieldName === this.fields.password
        ){
        I.seeElement(this.messageErrorFields.msgPassword);
        getValue = await I.grabTextFrom(this.messageErrorFields.msgPassword); 
      }

      return getValue;
    }
  },

  clickLoginButton() {
    I.click(this.buttons.login);
  },

}
