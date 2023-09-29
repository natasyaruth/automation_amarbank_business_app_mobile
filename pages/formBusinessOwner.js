const { I } = inject();

module.exports = {

  fields: {
    fullName: "~textFieldFullName",
    email: "~textFieldEmail",
    nik: "~textFieldNIK",
  },
  buttons: {
    addListDirector: "~buttonAdd",
    closeBottomSheet: "~buttonClose",
    saveListDirectors: "~buttonSaveListDirector",
    addDirector: "~buttonAddDirector",
    deleteDirector: "~buttonDelete",
    editDirector: "~buttonEdit",
    closeDialog: "~buttonCloseDialog",
    deleteDialog: "~buttonDeleteDialog",
    closeConfirm: "~buttonCloseConfirm",
    confirmation: "~buttonConfirm"
  },
  messageErrorFields:{
    fullName: "~textErrorFullName",
    email: "~textErrorEmail",
    nik: "~textErrorNIK",
  },
  text:{
    name: "~textName",
    email: "~textEmail",
    nik: "~textNik",
  },

  fillFormAddDirector(directorInformation){
    Object.keys(directorInformation).forEach((key) =>{
      I.waitForElement(this.fields[key], 10);
      I.setText(this.fields[key], directorInformation[key]);
      I.hideDeviceKeyboard();
    });
  },

  addListDirector(){
    I.click(this.buttons.addListDirector);
    I.waitForElement(this.buttons.closeBottomSheet, 10);
  },

  addDirector(){
    I.click(this.buttons.addDirector);
    I.waitForInvisible(this.buttons.closeBottomSheet, 10);
  },

  saveListDirectors(){
    I.waitForElement(this.buttons.saveListDirectors, 10);
    I.click(this.buttons.saveListDirectors);
  },

}
