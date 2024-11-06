const { I } = inject();

module.exports = {

  buttons: {
    continueOnboarding: "~buttonChooseProduct",
    sentFeedBack: "~buttonSubmitSurvey",
  },
  fields: {
    other: "~textFieldOther",
  },
  radioButtons: {
    enough: "~optionEnough",
    notEnough: "~optionNotEnough",
  },
  checkBox: {
    uploadDoc: "~checkboxUploadDoc",
    categoryDoc: "~checkboxDocCategory",
    searchDoc: "~checkboxSearchDoc",
    other: "~checkboxOther",
  },
  statusElement: {
    buttonSentFeedBack: {xpath: "//android.view.View/android.view.View/android.widget.ScrollView/android.view.View[3]"}
  },

  clickChooseProduct() {
    I.waitForElement(this.buttons.continueOnboarding, 10);
    I.click(this.buttons.continueOnboarding);
  },

  clickContinueToLoanProcess() {
    I.waitForElement(this.buttons.continueOnboarding, 10);
    I.click(this.buttons.continueOnboarding);
  },

  clickContinueToAccOpening() {
    I.waitForElement(this.buttons.continueOnboarding, 10);
    I.click(this.buttons.continueOnboarding);
  },

  clickUseDocumentSafe() {
    I.waitForElement(this.buttons.continueOnboarding, 10);
    I.click(this.buttons.continueOnboarding);
  },

  clickRadioButtonDoneEnough() {
    I.waitForElement(this.radioButtons.enough, 10);
    I.click(this.radioButtons.enough);
  },

  clickRadionButtonNotEnough() {
    I.waitForElement(this.radioButtons.notEnough, 10);
    I.click(this.radioButtons.notEnough);
  },

  sentFeedback() {
    I.waitForElement(this.buttons.sentFeedBack, 10);
    I.click(this.buttons.sentFeedBack);
  },

  chooseFeedback(type) {
    switch (type) {
      case "Upload Dokumen":
        I.waitForElement(this.checkBox.uploadDoc, 10);
        I.click(this.checkBox.uploadDoc);
        break;
      case "Kategori Dokumen":
        I.waitForElement(this.checkBox.categoryDoc, 10);
        I.click(this.checkBox.categoryDoc);
        break;
      case "Cari Dokumen":
        I.waitForElement(this.checkBox.searchDoc, 10);
        I.click(this.checkBox.searchDoc);
        break;
      case "Lainnya":
        I.waitForElement(this.checkBox.other, 10);
        I.click(this.checkBox.other);
        break;
      default:
        throw new Error("Category is not recognize");
    }
  },

  fillFeedback(reason){
    I.waitForElement(this.fields.other, 10);
    I.setText(this.fields.other, reason);
  },

  clearFeedback(){
    I.waitForElement(this.fields.other, 10);
    I.clearField(this.fields.other);
  }

}
