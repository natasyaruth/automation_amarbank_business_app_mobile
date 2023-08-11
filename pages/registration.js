const { I } = inject();

module.exports = {
  fields: {
    fullName: "~textFieldFullName",
    email: "~textFieldEmail",
    mobileNumber: "~textFieldPhoneNumber",
    password: "~textFieldPassword",
    confirmPassword: "~textFieldPasswordConfirm",
    businessCode: "~textFieldBusinessCode",
  },
  buttons: {
    createAccount: "~buttonCreateAccount",
    backRegist: "~buttonBackRegist",
    confirm: "~buttonConfirm",
  },
  messageErrorFields:{
    fullName: "~textMsgErrorFullName",
    email: "~textMsgErrorEmail",
    mobileNumber: "~textMsgErrorPhoneNumber",
    password: "~textMsgErrorPassword",
    confirmPassword: "~textMsgErrorConfirmPassword",
    businessCode: "~textMsgErrorBusinessCode"
  },
  icons:{
    eyePassword: "~iconEyePassword",
    eyeConfirmPassword: "~iconEyeConfirmPassword",
  },
  links:{
    login: "~linkLogin",
    termsCondition: "~linkTermsCondition",
    privacyPolicy: "~linkPrivacyPolicy",
  },
  label:{
    email: "~labelEmail",
    mobileNumber: "~labelPhoneNumber",
    companyName: "~labelCompanyName",
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
      I.waitForElement(this.messageErrorFields[fieldName], 2);
      return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  clearFieldsRegistration(fieldName){
    I.clearField(this.fields[fieldName]);
  },

  async getValueFromFieldRegistration (fieldName) {
    if(Object.keys(this.fields).indexOf(fieldName) === -1){
      throw new Error('Field ${fieldName} is not found');
    }
    I.seeElement(this.fields[fieldName]);
    return await I.grabTextFromField(this.fields[fieldName]);
  },

  async getValueInformation(labelName) {
    if(Object.keys(this.label).indexOf(labelName) === -1){
      throw new Error('Field ${fieldName} is not found');
    }
    I.seeElement(this.label[labelName]);
    return await I.grabTextFrom(this.label[labelName]);
  },

  clickIconEyePassword(){
    I.click(this.icons.eyePassword);
  },

  clickIconEyeConfirmPassword(){
    I.click(this.icons.eyeConfirmPassword);
  },

  clickCreateAccountButton() {
    I.click(this.buttons.createAccount);
  },

  clickButtonBackToPageRegistration(){
    I.waitForElement(this.buttons.backRegist);
    I.click(this.buttons.backRegist);
    I.waitForInvisible(this.buttons.backRegist, 3);
  },

  clickButtonConfirm(){
    I.waitForElement(this.buttons.confirm);
    I.click(this.buttons.confirm);
    I.waitForInvisible(this.buttons.confirm, 3);
  },

  goToLoginPage() {
    I.click(this.links.login);
  },

  goToTermsAndConditionPage() {
    I.click(this.links.termsCondition);
  },

  goToPrivacyPolicyPage() {
    I.click(this.links.privacyPolicy);
  },
};