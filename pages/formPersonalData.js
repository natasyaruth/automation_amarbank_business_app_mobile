const { I } = inject();

module.exports = {

  fields:{
    motherName: "~texfieldMotherName",
    npwp: "~texfieldNpwp"
  },
  dropDowns:{
    lastEducation: "~textfieldLastEdu",
    purposeAccount: "~textfieldPurpose",
    firstItem: {xpath: "//android.view.View[2]/android.view.View/android.view.View[1]"},
  },
  buttons: {
    savePersonalData: "~buttonSavePersonalData",
    closeBottomSheet: "~buttonClose",
  },

  async fillPersonalData(personalData){
    const information = Object.keys(personalData);
    
    for(let i=0;i<information.length;i++){
      const fieldName = information[i];
      const value = personalData[fieldName];

      if(
        Object.keys(this.fields).indexOf(fieldName) !== -1
        ){
        I.setText(this.fields[fieldName], value);

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

  savePersonalData(){
    I.click(this.buttons.savePersonalData);
  }
}
