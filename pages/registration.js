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
    acceptWebView: "~acceptWebviewBtn",
    acceptPDP: "~buttonAcceptPDP",
    readTnC: "~buttonReadTnc",
    backPDP: "~buttonNext",
    closePDP: "~buttonLogout",
    submitPDP: "~btnCreateAccount",
  },
  messageErrorFields: {
    fullName: "~textMsgErrorFullName",
    email: "~textMsgErrorEmail",
    mobileNumber: "~textMsgErrorPhoneNumber",
    password: "~textMsgErrorPassword",
    confirmPassword: "~textMsgErrorConfirmPassword",
    businessCode: "~textMsgErrorBusinessCode",
  },
  icons: {
    eyePassword: "~iconEyePassword",
    eyeConfirmPassword: "~iconEyeConfirmPassword",
  },
  links: {
    login: "~linkLogin",
  },
  label: {
    email: "~labelEmail",
    mobileNumber: "~labelPhoneNumber",
    companyName: "~labelCompanyName",
  },
  checkButton:{
    firstPdp: "~cbReadAccept",
    secondPdp: "~cbReceiveInfoProduct"
  },
  text: {
    firstPdpText: {
      xpath:
        '//android.widget.TextView[contains(@text, //android.widget.TextView[@text="Membagikan data dan/atau informasi pribadi secara benar, lengkap, asli, sah dan sesuai peraturan perundang-undangan yang berlaku kepada  Bank sebagai syarat penggunaan produk atau layanan Bank. *"])]',
    },
    secondPdpText: {
      xpath:
        '//android.widget.TextView[contains(@text, //android.widget.TextView[@text="Membagikan penggunaan data dan/atau informasi pribadi oleh/kepada pihak ketiga untuk tujuan penggunaan produk atau layanan Bank. *"])]',
    },
    thirdPdpText: {
      xpath:
        '//android.widget.TextView[contains(@text, //android.widget.TextView[@text="Menerima penawaran produk dan/atau layanan melalui sarana komunikasi pribadi nasabah sebagai syarat penggunaan produk atau layanan Bank."])]',
    },
  },
  scroll: {
    scrollToButton: "~scrollContentWebview",
  },
  statusElement:{
    buttonLogin: {xpath: "//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View"},
    buttonRegist: {xpath: "//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View"},
  },

  fillInAccountInformation(accountInformation) {
    Object.keys(accountInformation).forEach((key) => {
      if (this.fields[key] === undefined) {
        return;
      }
      I.waitForElement(this.fields[key],5);
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

  fillFieldRegistration(fieldName, txtValue) {
    I.waitForElement(this.fields[fieldName], 5);
    I.seeElement(this.fields[fieldName]);
    I.fillField(this.fields[fieldName], txtValue);
  },

  async getMessageErrorFieldRegistration(fieldName) {
    if (Object.keys(this.messageErrorFields).indexOf(fieldName) === -1) {
      throw new Error("Field ${fieldName} is not found");
    }
    I.waitForElement(this.messageErrorFields[fieldName], 15);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  clearFieldsRegistration(fieldName) {
    I.clearField(this.fields[fieldName]);
  },

  async getValueFromFieldRegistration(fieldName) {
    if (Object.keys(this.fields).indexOf(fieldName) === -1) {
      throw new Error("Field ${fieldName} is not found");
    }
    I.seeElement(this.fields[fieldName]);
    return await I.grabTextFromField(this.fields[fieldName]);
  },

  async getValueInformation(labelName) {
    if (Object.keys(this.label).indexOf(labelName) === -1) {
      throw new Error("Field ${fieldName} is not found");
    }
    I.seeElement(this.label[labelName]);
    return await I.grabTextFrom(this.label[labelName]);
  },

  async checkTnC() {
    I.waitForElement(this.buttons.createAccountPDP, 5);
    let isDisabled = await I.grabAttributeFrom(
      this.buttons.createAccountPDP,
      "clickable"
    );

    if (isDisabled === "false") {
      console.log("Tombol dalam keadaan disable.");
      //return true;
    } else {
      console.log("Tombol dalam keadaan enable.");
      //return true;
    }
  },

  // async verifyButtonDisabled(){
  //   let isDisabled = await I.grabAttributeFrom((this.buttons.createAccountPDP), 'disabled');
  // if (isDisabled === 'true') {
  // //console.log('The element is disabled');
  // } else {
  //   //console.log('The element is not disabled');
  // }
  // },

  clickIconEyePassword(){
    I.click(this.icons.eyePassword);
  },

  clickIconEyeConfirmPassword() {
    I.click(this.icons.eyeConfirmPassword);
  },

  clickCreateAccountButton() {
    I.swipeUp(this.fields.confirmPassword, 500, 1000);
    I.scrollIntoView(this.buttons.createAccount);
    // I.waitForInvisible(this.buttons.backRegist, 3);
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
    I.waitForElement(this.checkButton.firstPdp, 10);
    I.checkOption(this.checkButton.firstPdp);
  },

  clickCheckboxPDPOptional(){
    I.waitForElement(this.checkButton.secondPdp, 10);
    I.checkOption(this.checkButton.secondPdp);
  },

  clickButtonCreateAccountPdp(buttonName) {
    I.waitForElement(this.buttons.createAccountPDP, 5);
    I.click(this.buttons[buttonName]);
    I.wait(5);
  },

  goToLoginPage() {
    I.swipeUp(this.fields.confirmPassword, 10000, 3000);
    I.click(this.links.login);
  },

  agreeWithTermsAndCondition() {
    I.waitForElement(this.buttons.acceptWebView, 10);
    I.click(this.buttons.acceptWebView);
  },

  agreeWithPrivacyAndPolicy() {
    I.waitForElement(this.buttons.acceptWebView, 10);
    I.click(this.buttons.acceptWebView);
  },

  agreeWithPDP() {
    I.waitForElement(this.buttons.acceptPDP, 10);
    I.click(this.buttons.acceptPDP);
  },

  continueRegistration(){
    I.click(this.buttons.continueRegist);
  },

  clickScrollToEndOfPage() {
    I.waitForElement(this.scroll.scrollToButton, 10);
    I.click(this.scroll.scrollToButton);
  },

  readTnC(){
    I.waitForElement(this.buttons.readTnC, 10);
    I.click(this.buttons.readTnC);
  },

  cancelPDP(){
    I.waitForElement(this.buttons.closePDP, 10);
    I.click(this.buttons.closePDP);
  },

  backToPDP(){
    I.waitForElement(this.buttons.backPDP, 10);
    I.click(this.buttons.backPDP);
  },

  submitPDPRegist(){
    I.waitForElement(this.buttons.submitPDP, 10);
    I.click(this.buttons.submitPDP);
  },
};
