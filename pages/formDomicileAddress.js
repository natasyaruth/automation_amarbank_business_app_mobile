const { I } = inject();

module.exports = {

  fields:{
    address: "~fieldAddress",
    rt: "~fieldRt",
    rw: "~fieldRw",
    search: "~tag",
  },
  dropDown:{
    typeResidence: "~fieldTypeResidence",
  },
  dropDownSearch:{
    province: "~fieldProvince",
    city: "~fieldCity",
    district: "~fieldDistrict",
    village: "~fieldVillage",
    firstItem: {xpath: "//android.view.View[2]/android.view.View/android.view.View"},
  },
  buttons: {
    saveDomicile: "~buttonSaveAddress",
    closeBottomSheet: "~buttonClose"
  },
  radioButtons:{
    ktpAddress: "~checkboxOldAddress",
    newAddress: "~checkboxNewAddress"
  },

  fillNewAddress(domicileAddress){
    const information = Object.keys(domicileAddress);
    
    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = domicileAddress[fieldName];

      if(
        Object.keys(this.fields).indexOf(fieldName) !== -1
        ){
        I.setText(this.fields[fieldName], value);

      } else if (
        Object.keys(this.dropDown).indexOf(fieldName) !== -1
        ){
        I.click(this.dropDown[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.click(value);
      } else if(
        Object.keys(this.dropDownSearch).indexOf(fieldName) !== -1
      ) {
        I.click(this.dropDownSearch[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.setText(this.fields.search, value);
        I.click(this.dropDownSearch.firstItem);
        I.swipeUp(this.dropDownSearch[fieldName], 500, 1000);
      } else{
        throw new Error(information[i]+" not found, please check again data naming");
      }
    }
  },

  saveDomicileAddress(){
    I.click(this.buttons.saveDomicile);
  },

  chooseNewDomicile(){
    I.click(this.radioButtons.newAddress);
    I.waitForElement(this.dropDown.typeResidence, 10);
  },

  chooseKtpDomicile(){
    I.click(this.radioButtons.ktpAddress);
  }
}
