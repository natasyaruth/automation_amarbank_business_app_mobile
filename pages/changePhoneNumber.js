const { I } = inject();

module.exports = {

  fields: {
    newPhoneNumber: "~textFieldNewPhoneNumber",
  },

  label: {
    oldPhoneNumber: "~textOldPhoneNumber",
  },

  button: {
    btnChangePhoneNumber: "~buttonChangePhoneNumber",

  },

  messageErrorField: {
    msgErrorPhoneNumber: "~textMsgErrorPhoneNumber",
  },

  fillFieldNewPhoneNumber(txtValue){

    I.seeElement(this.fields.newPhoneNumber);
    I.click(this.fields.newPhoneNumber);
    I.setText(this.fields.newPhoneNumber, txtValue);
    I.hideDeviceKeyboard();
  },

  clickChangePhoneNumberBtn(){
    I.click(this.button.btnChangePhoneNumber);
  },

  async getOldPhoneNumber (){
    return await I.grabTextFrom(this.label.oldPhoneNumber);
  },

  async getMessageErrorNewPassword () {
    I.waitForElement(this.messageErrorField.msgErrorPhoneNumber, 2);
    return await I.grabTextFrom(this.messageErrorField.msgErrorPhoneNumber);
},
}
