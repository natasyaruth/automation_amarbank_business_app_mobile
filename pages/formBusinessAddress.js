const { I } = inject();

module.exports = {

  fields: {
    address: "~textFieldAddress",
    rt: "~textFieldRT",
    rw: "~textFieldRW",
    search: "~textFieldSearch",
  },
  buttons: {
    openAccount: "~buttonOpenAccount",
    closeBottomSheet: "~buttonClose",
    email: "~buttonDirectEmail",
    closePage: "~buttonClose",
    acceptWebView: "~acceptWebviewBtn",
  },
  dropDownsSearch:{
    province: "~textFieldProvince",
    city: "~textFieldCity",
    district: "~textFieldDistrict",
    village: "~textFieldVillage",
    firstItem: {xpath: "//android.view.View[2]/android.view.View/android.view.View"},
  },
  messageErrorFields:{
    address: "~textErrorAddress",
    rt: "~textErrorRT",
    rw: "~textErrorRW",
    province: "~textErrorProvince",
    city: "~textErrorCity",
    village: "~textErrorVillage",
    district: "~textErrorDistrict",
  },
  checkBox:{
    termsAndCondition: "~checkBoxPrivacyPolicy",
    rights: "~checkBoxRight",
    privy: "~checkBoxPrivy",
    loan: "~checkBoxLoan",
  },
  scroll:{
    scrollToButton: "~scrollContentWebview",
  },

  fillBusinessAddress(businessAddress){
    const information = Object.keys(businessAddress);

    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = businessAddress[fieldName];
      if(
        Object.keys(this.fields).indexOf(fieldName) !== -1
        ){
        I.waitForElement(this.fields[fieldName], 10);
        I.click(this.fields[fieldName]);
        I.wait(2);
        I.clearField(this.fields[fieldName]);
        I.setText(this.fields[fieldName], value);
        I.hideDeviceKeyboard();
      } else if (
        Object.keys(this.dropDownsSearch).indexOf(fieldName) !== -1
        ){
        I.click(this.dropDownsSearch[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.wait(2);
        I.setText(this.fields.search, value);
        I.hideDeviceKeyboard();
        I.click(this.dropDownsSearch.firstItem);
        I.swipeUp(this.dropDownsSearch[fieldName], 500, 1000);

      } else{
        throw new Error(information[i]+" not found, please check again data naming");
      }
    }
  },

  async checkTnC(){

    I.waitForElement(this.checkBox.termsAndCondition,10);
    const isChecked = await I.grabAttributeFrom(this.checkBox.termsAndCondition, "checked");

    if(isChecked === "false"){
      I.click(this.checkBox.termsAndCondition);
    }
  },

  async checkPrivy(){

    I.waitForElement(this.checkBox.privy,10);
    const isChecked = await I.grabAttributeFrom(this.checkBox.privy, "checked");

    if(isChecked === "false"){
      I.click(this.checkBox.privy);
    }
  },

  async checkRights(){

    I.waitForElement(this.checkBox.rights,10);
    const isChecked = await I.grabAttributeFrom(this.checkBox.rights, "checked");

    if(isChecked === "false"){
      I.click(this.checkBox.rights);
    }
  },

  openAccount(){
    I.waitForElement(this.buttons.openAccount, 10);
    I.click(this.buttons.openAccount);
  },

  closePageUploadDoc(){
    I.click(this.buttons.closePage);
  },

  fillField(fieldName, value) {
    I.waitForElement(this.fields[fieldName], 10);
    I.setText(this.fields[fieldName], value);
  },

  clearField(fieldName) {
    I.clearField(this.fields[fieldName]);
  },

  async getMessageError(fieldName) {
    I.waitForElement(this.messageErrorFields[fieldName], 2);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  clickScrollToEndOfPage(){
    I.waitForElement(this.scroll.scrollToButton, 10);
    I.click(this.scroll.scrollToButton);
  },

  agreeWithRightsAndObligations() {
    I.waitForElement(this.buttons.acceptWebView);
    I.click(this.buttons.acceptWebView);
  },

}
