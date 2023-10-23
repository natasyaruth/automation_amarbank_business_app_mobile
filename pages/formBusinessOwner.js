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
    I.waitForElement(this.buttons.closeBottomSheet, 10);
  },

  saveDirector() {
    I.waitForText("Simpan Daftar Direktur", 10);
    I.click(this.buttons.saveListDirectors);
  },

  async swipeToButtonSaveListDirectors() {
    const locateScroll = locate(this.scrollView.scroll);
    const isVisible = await I.grabNumberOfVisibleElements(this.buttons.saveListDirectors);

    if (isVisible === 0) {
      I.swipeTo(
        this.buttons.saveListDirectors,
        locateScroll,
        "up",
        100,
        500,
        800
      );
    }
  },

  confirmListDirectors() {
    const locateScroll = locate(this.scrollView.scroll);
    I.swipeTo(
      this.buttons.confirmation,
      locateScroll,
      "up",
      100,
      500,
      800
    );
    I.click(this.buttons.confirmation);
  },

}
