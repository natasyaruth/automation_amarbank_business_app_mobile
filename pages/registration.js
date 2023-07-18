const { I } = inject();

module.exports = {
  fields: {
    fullName: "~textFieldFullName",
    email: "~textFieldEmail",
    mobileNumber: "~textFieldPhoneNumber",
    password: "~textFieldPassword",
    confirmPassword: "~textFieldPasswordConfirm",
  },
  buttons: {
    createAccount: "~buttonCreateAccount",
  },
  messageErrorFields:{
    msgErrorFullName: "~textMsgErrorFullname",
    msgErrorEmail: "~textMsgErrorEmail",
    msgErrorPhoneNumber: "~textMsgErrorPhoneNumber",
    msgPassword: "~textMsgErrorPassword",
    msgConfirmPassword: "~textMsgErrorConfirmPassword",
  },

  fillInAccountInformation(accountInformation) {
    Object.keys(accountInformation).forEach((key) => {
      if (this.fields[key] === undefined) {
        return;
      }

      I.seeElement(this.fields[key]);

      if (
        this.fields[key] === "" ||
        this.fields[key] === null ||
        this.fields[key] === "-"
      ) {
        I.clearField(this.fields[key]);
        return;
      }

      I.setText(this.fields[key], accountInformation[key]);
      I.hideDeviceKeyboard();
    });
  },

  fillFieldRegistration(fieldName, txtValue){

    I.seeElement(this.fields[fieldName]);

    if (
      this.fields[fieldName] === "" ||
      this.fields[fieldName] === null ||
      this.fields[fieldName] === "-"
    ) {
      I.clearField(this.fields[fieldName]);
      return;
    }

    I.click(this.fields[fieldName]);
    I.setText(this.fields[fieldName], txtValue);
    I.hideDeviceKeyboard();
  },

  getMessageErrorFieldRegistration (fieldName)  {
    let getValue;
    async ({I}) => {

      if(
        fieldName === this.fields.fullName
        ){
        I.seeElement(this.messageErrorFields.msgErrorFullName);
        getValue = await I.grabTextFrom(this.messageErrorFields.msgErrorFullName);
      
      } else if(
        fieldName === this.fields.email
        ){
        I.seeElement(this.messageErrorFields.msgErrorEmail);
        getValue = await I.grabTextFrom(this.messageErrorFields.msgErrorEmail);
     
      } else if(
        fieldName === this.fields.mobileNumber
        ){
        I.seeElement(this.messageErrorFields.msgErrorPhoneNumber);
        getValue = await I.grabTextFrom(this.messageErrorFields.msgErrorPhoneNumber);
      
      } else if(
        fieldName === this.fields.password
        ){
        I.seeElement(this.messageErrorFields.msgPassword);
        getValue = await I.grabTextFrom(this.messageErrorFields.password);
      
      } else if(
        fieldName === this.fields.confirmPassword
        ){
        I.seeElement(this.messageErrorFields.msgConfirmPassword);
        getValue = await I.grabTextFrom(this.messageErrorFields.msgConfirmPassword);  
      }

      return getValue;
    }
  },

  clickCreateAccountButton() {
    I.click(this.buttons.createAccount);
  },
};
