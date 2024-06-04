const { I } = inject();

module.exports = {

  fields: {
    eKtpNumber: "~textFieldEktpNumber",
    fullName: "~textFieldName",
    placeOfBirth: "~textFieldPlaceOfBirth",
    address: "~textFieldAddress",
    rt: "~textFieldRT",
    rw: "~textFieldRW",
    search: "~textFieldSearch"
  },
  buttons: {
    saveEktp: "~buttonSaveEktpData",
    chooseDate: "~buttonChoose",
    backFromDate: "~buttonCancel",
    closeBottomSheet: "~buttonClose",
    helpDHN: "~showSupportBtn",
    closePage: "~buttonClose",
  },
  dropDowns: {
    gender: "~textFieldGender",
    religion: "~textFieldReligion",
    maritalStatus: "~textFieldMaritalStatus",
    firstItem: { xpath: "//android.view.View[2]/android.view.View/android.view.View[1]" },
  },
  dropDownsSearch: {
    province: "~textFieldProvince",
    city: "~textFieldCity",
    village: "~textFieldVillage",
    district: "~textFieldDistrict",
    firstItem: { xpath: "//android.view.View[2]/android.view.View/android.view.View" },
  },
  datePicker: {
    dateOfBirth: "~textFieldDateOfBirth",
  },
  messageErrorFields: {
    eKtpNumber: "~textErrorEktpNumber",
    fullName: "~textErrorName",
    placeOfBirth: "~textErrorPlaceOfBirth",
    address: "~textErrorAddress",
    rt: "~textErrorRT",
    rw: "~textErrorRW",
    gender: "~textErrorGender",
    province: "~textErrorProvince",
    city: "~textErrorCity",
    village: "~textErrorVillage",
    district: "~textErrorDistrict",
    religion: "~textErrorReligion",
    maritalStatus: "~textErrorMaritalStatus",
    dateOfBirth: "~textErrorDateOfBirth",
  },
  text: {
    date: "~textDate",
    month: "~textMonth",
    year: "~textYear",
    blockerVerificationTitle: "~blockerVerificationTitle",
    blockerVerificationDesc: "~blockerVerificationDesc",
  },

  fillInformation(ktpData) {
    I.waitForElement(this.fields.eKtpNumber, 10);
    I.wait(3);

    const information = Object.keys(ktpData);
    for (let i = 0; i < information.length; i++) {
      const fieldName = information[i];
      const value = ktpData[fieldName];
      if (
        Object.keys(this.fields).indexOf(fieldName) !== -1
      ) {
        I.setText(this.fields[fieldName], value);
        if (fieldName === "placeOfBirth") {
          I.swipeUp(this.datePicker.dateOfBirth, 500, 500);
        }

      } else if (
        Object.keys(this.dropDowns).indexOf(fieldName) !== -1
      ) {
        I.click(this.dropDowns[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.click(value);
      } else if (
        Object.keys(this.dropDownsSearch).indexOf(fieldName) !== -1
      ) {
        I.wait(1);
        I.click(this.dropDownsSearch[fieldName]);
        I.waitForElement(this.dropDownsSearch.firstItem, 10);
        I.setText(this.fields.search, value);
        I.hideDeviceKeyboard();
        I.click(this.dropDownsSearch.firstItem);

        if (fieldName !== "village") {
          I.swipeUp(this.dropDownsSearch[fieldName], 500, 1000);
        }

      } else if (
        Object.keys(this.datePicker).indexOf(fieldName) !== -1
      ) {
        I.click(this.datePicker[fieldName]);
        I.waitForElement(this.buttons.chooseDate, 10);
        I.swipeDown(this.text.year, 3000, 3000);
        I.click(this.buttons.chooseDate);
        I.waitForInvisible(this.buttons.chooseDate, 10);
        I.swipeUp(this.datePicker.dateOfBirth, 500, 700);
      } else {
        throw new Error(information[i] + " not found, please check again data naming");
      }
    }
  },

  fillField(fieldName, value) {
    I.waitForElement(this.fields[fieldName], 10);
    I.setText(this.fields[fieldName], value);
  },

  clearField(fieldName) {
    I.clearField(this.fields[fieldName]);
  },

  saveKtpData() {
    I.waitForElement(this.buttons.saveEktp, 10);
    I.click(this.buttons.saveEktp);
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

  closePage(){
    I.waitForElement(this.buttons.closePage, 10);
    I.click(this.buttons.closePage);
  },
}
