const { I } = inject();

module.exports = {

  fields: {
    address: "~textFieldAddress",
    rt: "~textFieldRT",
    rw: "~textFieldRW",
    search: "~tag",
  },
  buttons: {
    openAccount: "~buttonOpenAccount",
    closeBottomSheet: "~buttonClose"
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
    village: "~textFieldVillage",
    district: "~textFieldDistrict",
  },
  checkBox:{
    termsAndCondition: "~checkBoxPrivacyPolicy",
    rights: "~checkBoxRight",
  },

  fillBusinessAddress(businessAddress){
    const information = Object.keys(businessAddress);

    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = businessAddress[fieldName];
      if(
        Object.keys(this.fields).indexOf(fieldName) !== -1
        ){
        I.setText(this.fields[fieldName], value);

      } else if (
        Object.keys(this.dropDownsSearch).indexOf(fieldName) !== -1
        ){
        I.click(this.dropDownsSearch[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
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
    const isChecked = await I.grabAttributeFrom(this.checkBox.termsAndCondition, "checked");
    console.log(isChecked);
    if(isChecked === "false"){
      I.click(this.checkBox.termsAndCondition);
    }
  },

  async checkRights(){
    const isChecked = await I.grabAttributeFrom(this.checkBox.rights, "checked");

    if(isChecked === "false"){
      I.click(this.checkBox.rights);
    }
  },

  openAccount(){
    I.waitForElement(this.buttons.openAccount, 10);
    I.click(this.buttons.openAccount);
  },

}
