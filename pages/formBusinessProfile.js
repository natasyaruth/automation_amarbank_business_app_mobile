const { I } = inject();

module.exports = {

  fields: {
    businessName: "~textFieldBusinessName",
    businessField: "~textFieldBusiness",
    npwp: "~textFieldNpwp",
    nib: "~textFieldNib",
  },
  buttons: {
    saveProfileBusiness: "~buttonSaveJobData",
    chooseDate: "~buttonChoose",
    cancelDate: "~buttonCancel",
    closeBottomSheet: "~buttonClose",
    helpDHN: "~showSupportBtn",
  },
  dropDowns: {
    industry: "~textFieldIndustryType",
    monthlyIncome: "~textFieldIncome",
    firstItem: { xpath: "//android.view.View[2]/android.view.View/android.view.View[1]" },
  },
  datePicker: {
    businessDateStart: "~textFieldBusinessDateStart",
  },
  messageErrorFields: {
    businessName: "~textErrorBusinessName",
    industry: "~textErrorIndustryType",
    businessField: "~textErrorBusiness",
    monthlyIncome: "~textErrorIncome",
    npwp: "~textErrorNpwp",
    nib: "~textErrorNib",
    businessDateStart: "~textErrorBusinessDateStart",
  },
  text: {
    date: "~textDate",
    month: "~textMonth",
    year: "~textYear",
    blockerVerificationTitle: "~blockerVerificationTitle",
    blockerVerificationDesc: "~blockerVerificationDesc",
  },

  fillBusinessProfile(businessProfileData) {
    const information = Object.keys(businessProfileData);

    for (let i = 0; i < information.length; i++) {
      const fieldName = information[i];
      const value = businessProfileData[fieldName];

      if (
        Object.keys(this.fields).indexOf(fieldName) !== -1
      ) {
        I.setText(this.fields[fieldName], value);

      } else if (
        Object.keys(this.dropDowns).indexOf(fieldName) !== -1
      ) {

        I.click(this.dropDowns[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.click(value);
        I.swipeUp(this.dropDowns[fieldName], 500, 1000);

      } else if (
        Object.keys(this.datePicker).indexOf(fieldName) !== -1
      ) {
        I.click(this.datePicker[fieldName]);
        I.waitForElement(this.buttons.chooseDate, 10);
        I.swipeDown(this.text.date, 2000, 4000);
        I.wait(1);
        I.swipeDown(this.text.month, 2000, 4000);
        I.wait(1);
        I.swipeDown(this.text.year, 2000, 4000);
        I.click(this.buttons.chooseDate);
        I.waitForInvisible(this.buttons.chooseDate, 10);

      } else {
        throw new Error(information[i] + " not found, please check again data naming");
      }
    }
  },

  saveBusinessProfile() {
    I.waitForElement(this.buttons.saveProfileBusiness, 10);
    I.click(this.buttons.saveProfileBusiness);
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

  clickHelp() {
    I.waitForElement(this.buttons.helpDHN, 10);
    I.click(this.buttons.helpDHN);
  },

  async getTitleValidationBlocker() {
    I.waitForElement(this.text.blockerVerificationTitle, 10);
    return await I.grabTextFrom(this.text.blockerVerificationTitle);
  },

  async getContentValidationBlocker() {
    I.waitForElement(this.text.blockerVerificationDesc, 10);
    return await I.grabTextFrom(this.text.blockerVerificationDesc);
  },

}
