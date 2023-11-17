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
    closeConfirm: "~buttonCloseConfirm",
    saveListDirectors: "~buttonSaveListDirector",
    addDirector: "~buttonAddDirector",
    updateDirector: "~buttonAddDirector",
    deleteDirector: "~buttonDelete",
    editDirector: "~buttonEdit",
    closeDialog: "~buttonCloseDialog",
    deleteDialog: "~buttonDeleteDialog",
    closeConfirm: "~buttonCloseConfirm",
    confirmation: "~buttonConfirm"
  },
  messageErrorFields: {
    fullName: "~textErrorFullName",
    email: "~textErrorEmail",
    nik: "~textErrorNIK",
  },
  text: {
    name: "~textName",
    email: "~textEmail",
    nik: "~textNik",
  },
  scrollView: {
    scroll: "android.widget.ScrollView"
  },

  fillFormAddDirector(directorInformation) {
    Object.keys(directorInformation).forEach((key) => {
      I.waitForElement(this.fields[key], 10);
      I.setText(this.fields[key], directorInformation[key]);
      I.hideDeviceKeyboard();
    });
  },

  clearAllFieldDirector(){
    I.waitForElement(this.fields.fullName, 10);
    I.clearField(this.fields.fullName);
    I.clearField(this.fields.email);
    I.clearField(this.fields.nik);
  },

  addListDirector() {
    I.waitForElement(this.buttons.addListDirector, 10);
    I.click(this.buttons.addListDirector);
    I.waitForElement(this.buttons.closeBottomSheet, 10);
  },

  addDirector() {
    I.click(this.buttons.addDirector);
    I.waitForInvisible(this.buttons.closeBottomSheet, 10);
  },

  chooseDeleteDirector() {
    I.waitForElement(this.buttons.deleteDirector, 10);
    I.click(this.buttons.deleteDirector);
  },

  confirmDeleteDirector() {
    I.waitForElement(this.buttons.closeDialog, 10);
    I.click(this.buttons.deleteDialog);
  },

  chooseUpdateDirector() {
    I.waitForElement(this.buttons.editDirector);
    I.click(this.buttons.editDirector);
  },

  saveUpdateDirector() {
    I.click(this.buttons.updateDirector);
  },

  saveBusinessOwner() {
    I.waitForText("Simpan Pemilik Bisnis", 10);
    I.click(this.buttons.saveListDirectors);
  },

  saveListDirectors() {
    I.waitForElement(this.buttons.saveListDirectors, 10);
    I.click(this.buttons.saveListDirectors);
  },

  saveDirector() {
    I.waitForText("Simpan Daftar Direktur", 10);
    I.click(this.buttons.saveListDirectors);
  },

  swipeToButtonSaveListDirectors() {
    I.performSwipe({x: 1000, y: 1000},{x: 100, y: 100});
  },

  confirmListDirectors() {
    I.waitForElement(this.buttons.closeConfirm, 10);
    I.click(this.buttons.confirmation);
  },

  fillField(fieldName, value) {
    I.waitForElement(this.fields[fieldName], 10);
    I.setText(this.fields[fieldName], value);
  },

  clearField(fieldName) {
    I.clearField(this.fields[fieldName]);
  },

  async getMessageError(fieldName) {
    I.waitForElement(this.messageErrorFields[fieldName], 2);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

}
