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

    if (
      this.fields.newPhoneNumber === "" ||
      this.fields.newPhoneNumber === null ||
      this.fields.newPhoneNumber === "-"
    ) {
      I.clearField(this.fields.newPhoneNumber);
      return;
    }

    I.click(this.fields.newPhoneNumber);
    I.setText(this.fields.newPhoneNumber, txtValue);
    I.hideDeviceKeyboard();
  },

  clickChangePhoneNumberBtn(){
    I.click(this.button.btnChangePhoneNumber);
  },
}
