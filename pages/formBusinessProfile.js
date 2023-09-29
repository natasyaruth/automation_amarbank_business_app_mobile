const { I } = inject();

module.exports = {

  fields: {
    businessName: "~textFieldBusinessName",
    businessField: "~textFieldBusiness",
    monthlyIncome: "~textFieldIncome",
    npwp: "~textFieldNpwp",
    nib: "~textFieldNib",
  },
  buttons: {
    saveProfileBusiness: "~buttonSaveJobData",
    closeBottomSheet: "~buttonClose"
  },
  dropDowns:{
    industry: "~textFieldIndustryType",
    firstItem: {xpath: "//android.view.View[2]/android.view.View/android.view.View[1]"},
  },
  datePicker:{
    businessDateStart: "~textFieldBusinessDateStart",
  },
  messageErrorFields:{
    businessName: "~textErrorBusinessName",
    industry: "~textErrorIndustryType",
    businessField: "~textErrorBusiness",
    monthlyIncome: "~textErrorIncome",
    npwp: "~textErrorNpwp",
    nib: "~textErrorNib",
    businessDateStart: "~textErrorBusinessDateStart",
  },
  text:{
    date: "~textDate",
    month: "~textMonth",
    year: "~textYear",
  },

  fillBusinessProfile(businessProfileData){
    const information = Object.keys(businessProfileData);

    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = businessProfileData[fieldName];

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
        Object.keys(this.datePicker).indexOf(fieldName) !== -1
        ){

        I.click(this.datePicker[fieldName]);
        I.waitForElement(this.buttons.chooseDate, 10);
        I.swipeDown(this.text.date, 2000, 4000);
        I.wait(1);
        I.swipeDown(this.text.month, 2000, 4000);
        I.wait(1);
        I.swipeDown(this.text.year, 2000, 4000);
        I.click(this.buttons.chooseDate);  
        I.waitForInvisible(this.buttons.chooseDate, 10);

      } else{
        throw new Error(information[i]+" not found, please check again data naming");
      }
    }
  },

  saveBusinessProfile(){
    I.waitForElement(this.buttons.saveProfileBusiness, 10);
    I.click(this.buttons.saveProfileBusiness);
  },

}
