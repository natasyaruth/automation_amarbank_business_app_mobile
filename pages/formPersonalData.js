const { I } = inject();

module.exports = {

  fields:{
    motherName: "~texfieldMotherName",
    npwp: "~texfieldNpwp"
  },
  dropdowns:{
    lastEducation: "~dropdownLastEdu",
    purposeAccount: "~dropdownPurpose"
  },
  buttons: {
    savePersonalData: "~buttonSavePersonalData",
    closeBottomSheet: "~buttonClose",
  },

  fillPersonalData(personalData){
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
