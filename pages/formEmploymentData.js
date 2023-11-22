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
    firstItem: {xpath: "//android.view.View[2]/android.view.View/android.view.View[1]"},
  },
  buttons:{
    saveEmploymentData: "~buttonSaveWorkData",
    closeBottomSheet: "~buttonClose",
    continue: "~buttonNext",
    continueDashboard: {xpath: '//android.view.View[@content-desc="buttonNext"]'}
  },
  checkBox:{
    termsAndCondition: "~checkBoxPrivacyPolicy",
    rights: "~checkBoxRight",
  },
  scrollView: {
    scroll: {xpath: "//android.widget.ScrollView",}
  },
  messageErrorFields: {
    workType: "~fieldErrorWork",
    sourceIncome: "~fieldErrorSourceIncome",
    monthlyIncome: "~fieldErrorMonthlyIncome",
    industry: "~fieldErrorIndustry",
    companyName: "~fieldErrorCompany",
  },

  async fillEmploymentData(employmentData){
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

        let isLoad = await I.grabNumberOfVisibleElements(this.dropDowns.firstItem);
        
        while(isLoad === 0){
          I.click(this.buttons.closeBottomSheet);
          I.wait(2);
          I.click(this.dropDowns[fieldName]);
          I.waitForElement(this.buttons.closeBottomSheet, 10);
          isLoad = await I.grabNumberOfVisibleElements(this.dropDowns.firstItem);
        }

        I.click(value);
      } else{
        throw new Error(information[i]+" not found, please check again data naming");
      }
    }
  },

  fillFieldCompany(value){
     I.waitForElement(this.field.companyName, 10);
     I.setText(this.field.companyName, value);
  },

  saveEmploymentData(){
    I.click(this.buttons.saveEmploymentData);
  },

  continueToKYB(){
    I.click(this.buttons.continue);
  },

  continueToDashboard(){
    I.click(this.buttons.continueDashboard);
  },

  clearFieldCompany(){
    I.clearField(this.field.companyName);
  },

  async getMessageError(fieldName){
    I.waitForElement(this.messageErrorFields[fieldName], 10);
    return I.grabTextFrom(this.messageErrorFields[fieldName]);
  },
}
