const { I } = inject();

module.exports = {
  field:{
    companyName: "~fieldCompany"
  }, 
  dropDowns:{
    workType: "~fieldTypeWork",
    sourceIncome: "~fieldSourceIncome",
    monthlyIncome: "~fieldMonthlyIncome",
    industry: "~fieldIndustry",
  },
  buttons:{
    saveEmploymentData: "~buttonSaveWorkData",
    closeBottomSheet: "~buttonClose",
    continue: "~buttonNext",
  },

  fillEmploymentData(employmentData){
    const information = Object.keys(employmentData);

    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = employmentData[fieldName];

      if(
        Object.keys(this.field).indexOf(fieldName) !== -1
        ){
        I.setText(this.field[fieldName], value);

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
    I.click(this.buttons.continue);
  },

  continueToDashboard(){
    I.click(this.buttons.continue);
  }
}
