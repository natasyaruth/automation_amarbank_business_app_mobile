const { I } = inject();

module.exports = {
    fields: {
        userID: "~textFieldUserID",
        newPassword: "~textFieldPassword",
        confirmNewPassword: "~textFieldConfirmationPassword"
      },
    buttons: {
        resetPassword: "~buttonResetPassword",
        backResetPassword: "~buttonBackUserID",
        checkEmail: "~buttonCheckEmail",
        confirm: "~buttonConfirm",
      },
    icon: {
        eyePassword: "~iconEyePassword",
        eyeConfirmPassword: "~iconEyeConfirmPassword",
      },
    link: {
        resendEmail: "~linkResendEmail",
      },
    text: {
        textUserID: "~textUserID",
        textCompanyName: "~textCompanyName",
        textEmail: "~textEmail"
      },
    messageErrorFields:{
        msgErrorUserID: "~textMsgErrorUserID",
        msgPassword: "~textMsgErrorPassword",
        msgConfirmPassword: "~textMsgErrorConfirmPassword"
      },
    
    fillFieldForgotPassword(fieldName, txtValue){

        I.seeElement(this.fields[fieldName]);
        I.click(this.fields[fieldName]);
        I.setText(this.fields[fieldName], txtValue);
        I.hideDeviceKeyboard();
      },

    clickButtonResetPassword() {
        I.click(this.buttons.resetPassword);
      },
    clickButtonCheckEmail() {
        I.click(this.buttons.checkEmail);
      },
    clickButtonConfirm() {
        I.click(this.buttons.confirm);
      },
    clickButtonBackUserID() {
        I.click(this.buttons.back);
      },
}