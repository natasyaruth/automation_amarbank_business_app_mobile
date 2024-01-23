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
    createAccountPDP: "~btnCreateAccount",
    backRegist: "~buttonBackRegist",
    confirm: "~buttonConfirm",
    continueRegist: "~btnNext",
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
  checkButton:{
    firstPdp: "~cbShareValidInfo",
    secondPdp: "~cbShareToOthers",
    thirdPdp: "~cbReceiveInfoProduct",
  },
  text:{
    firstPdpText: "Membagikan data dan/atau informasi pribadi secara benar, lengkap, asli, sah dan sesuai peraturan perundang-undangan yang berlaku kepada Bank sebagai syarat penggunaan produk atau layanan Bank.",
    secondPdpText: "Membagikan penggunaan data dan/atau informasi pribadi oleh/kepada pihak ketiga untuk tujuan penggunaan produk atau layanan Bank.",
    thirdPdpText: "Menerima penawaran produk dan/atau layanan melalui sarana komunikasi pribadi nasabah sebagai syarat penggunaan produk atau layanan Bank.",
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
    I.setText(this.fields[fieldName], txtValue);
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
    I.swipeUp(this.fields.confirmPassword, 500, 1000);
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
    I.waitForInvisible(this.buttons.confirm, 10);
  },

  clickCheckboxPDPMandatory(){
    I.waitForElement(this.checkButton.firstPdp);
    I.checkOption(this.checkButton.firstPdp);
    I.checkOption(this.checkButton.secondPdp);
    I.wait(5);
  },

  clickCheckboxPDPOptional(){
    I.waitForElement(this.checkButton.firstPdp);
    I.checkOption(this.checkButton.thirdPdp);
    I.wait(5);
  },

  clickButtonCreateAccountPdp(buttonName){
    I.waitForElement(this.buttons.createAccountPDP);
    I.click(this.buttons[buttonName]);
    I.wait(5);
  },

  goToLoginPage() {
    I.swipeUp(this.fields.confirmPassword, 10000, 3000);
    I.click(this.links.login);
  },

  goToTermsAndConditionPage() {
    I.swipeUp(this.buttons.createAccount, 10000, 3000);
    I.click(this.links.termsCondition);
  },

  goToPrivacyPolicyPage() {
    I.swipeUp(this.buttons.createAccount, 10000, 3000);
    I.click(this.links.privacyPolicy);
  },

  continueRegistration(){
    I.click(this.buttons.continueRegist);
  },
};