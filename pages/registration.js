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
    btnBackRegist: "~buttonBackRegist",
    btnConfirm: "~buttonConfirm",
  },
  messageErrorFields:{
    fullName: "~textMsgErrorFullName",
    email: "~textMsgErrorEmail",
    mobileNumber: "~textMsgErrorPhoneNumber",
    password: "~textMsgErrorPassword",
    confirmPassword: "~textMsgErrorConfirmPassword",
  },
  icons:{
    iconEyePassword: "~iconEyePassword",
    iconEyeConfirmPassword: "~iconEyeConfirmPassword",
  },
  links:{
    linkLogin: "~linkLogin",
    linkTermsCondition: "~linkTermsCondition",
    linkPrivacyPolicy: "~linkPrivacyPolicy",
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

  async getMessageErrorFieldRegistration (fieldName) {
      if(Object.keys(this.messageErrorFields).indexOf(fieldName) === -1){
        throw new Error('Field ${fieldName} is not found');
      }
      I.seeElement(this.messageErrorFields[fieldName]);
      return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  clickIconEyePassword(){
    I.click(this.icons.iconEyePassword);
  },

  clickIconEyeConfirmPassword(){
    I.click(this.icons.iconEyeConfirmPassword);
  },

  clickCreateAccountButton() {
    I.click(this.buttons.createAccount);
  },

  goToLoginPage() {
    I.click(this.links.linkLogin);
  },

  goToTermsAndConditionPage() {
    I.click(this.links.linkTermsCondition);
  },

  goToPrivacyPolicyPage() {
    I.click(this.links.linkPrivacyPolicy);
  },
};
