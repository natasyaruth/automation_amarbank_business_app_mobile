const { I } = inject();

module.exports = {
  field:{
    companyName: "~fieldCompany"
  }, 
  dropDowns:{
    workType: "~dropdownWork",
    sourceIncome: "~dropdownSourceIncome",
    monthlyIncome: "~dropdownMonthlyIncome",
    industry: "~dropdownIndustry",
  },
  buttons:{
    saveEmploymentData: "~buttonSaveWorkData",
    closeBottomSheet: "~buttonClose",
    continueToKYB: "~buttonNext"
  },

  fillEmploymentData(employmentData){
    const information = Object.keys(employmentData);

    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = employmentData[fieldName];

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
      } else{
        throw new Error(information[i]+" not found, please check again data naming");
      }
    }
  },

  saveEmploymentData(){
    I.click(this.buttons.saveEmploymentData);
  },

  continueToKYB(){
    I.click(this.buttons.continueToKYB);
  }
}
