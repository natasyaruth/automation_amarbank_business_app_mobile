const { I } = inject();

module.exports = {

  fields: {
    eKtpNumber: "~textFieldEktpNumber",
    fullName: "~textFieldName",
    placeOfBirth: "~textFieldPlaceOfBirth",
    address: "~textFieldAddress",
    rt: "~textFieldRT",
    rw: "~textFieldRW",
    search: "~tag"
  },
  buttons: {
    saveEktp: "~buttonSaveEktpData",
    chooseDate: "~buttonChoose",
    backFromDate: "~buttonCancel",
    closeBottomSheet: "~buttonClose"
  },
  dropDowns:{
    gender: "~textFieldGender",
    religion: "~textFieldReligion",
    maritalStatus: "~textFieldMaritalStatus",
  },
  dropDownsSearch:{
    province: "~textFieldProvince",
    city: "~textFieldCity",
    village: "~textFieldVillage",
    district: "~textFieldDistrict",
    firstItem: {xpath: "//android.view.View[2]/android.view.View/android.view.View"},
  },
  datePicker:{
    dateOfBirth: "~textFieldDateOfBirth",
  },
  messageErrorFields:{
    eKtpNumber: "~textErrorEktpNumber",
    fullName: "~textErrorName",
    placeOfBirth: "~textErrorPlaceOfBirth",
    address: "~textErrorAddress",
    rt: "~textErrorRT",
    rw: "~textErrorRW",
    gender: "~textErrorGender",
    province: "~textErrorProvince",
    city: "~textErrorCity",
    village: "~textErrorVillage",
    district: "~textErrorDistrict",
    religion: "~textErrorReligion",
    maritalStatus: "~textErrorMaritalStatus",
    dateOfBirth: "~textErrorDateOfBirth",
  },
  text:{
    date: "~textDate",
    month: "~textMonth",
    year: "~textYear",
  },

  fillInformation(ktpData){
    const information = Object.keys(ktpData);
    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = ktpData[fieldName];
      if(
        Object.keys(this.fields).indexOf(fieldName) !== -1
        ){
        I.setText(this.fields[fieldName], value);

      } else if (
        Object.keys(this.dropDowns).indexOf(fieldName) !== -1
        ){
        I.click(this.dropDowns[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.click(value);
      } else if (
        Object.keys(this.dropDownsSearch).indexOf(fieldName) !== -1
        ){
        I.click(this.dropDownsSearch[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.setText(this.fields.search, value);
        I.hideDeviceKeyboard();
        I.wait(1);
        I.click(this.dropDownsSearch.firstItem);
        I.swipeUp(this.dropDownsSearch[fieldName], 500, 1000);
      }  else if (
        Object.keys(this.datePicker).indexOf(fieldName) !== -1
        ){
        I.click(this.datePicker[fieldName]);
        I.waitForElement(this.buttons.chooseDate, 10);
        I.swipeDown(this.text.year, 2000, 4000);
        I.click(this.buttons.chooseDate);  
        I.waitForInvisible(this.buttons.chooseDate, 10);
        I.swipeUp(this.fields.address, 1800, 1000);
      }
    }
  },

  saveKtpData(){
    I.waitForElement(this.buttons.saveEktp, 10);
    I.click(this.buttons.saveEktp);
  },

}
