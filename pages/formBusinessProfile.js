const { I } = inject();

module.exports = {

  fields: {
    businessName: "~textFieldBusinessName",
    npwp: "~textFieldNpwp",
    nib: "~textFieldNib",
    averageTransaction: "~averageTransactionField",
    otherType: "~textFieldOther",
  },
  buttons: {
    saveProfileBusiness: "~buttonSaveJobData",
    chooseDate: "~buttonChoose",
    cancelDate: "~buttonCancel",
    closeBottomSheet: "~buttonClose",
    helpDHN: "~showSupportBtn",
    submitIndustry: "~buttonSubmit",
    submitBusinessField: "~buttonSubmit",
  },
  dropDowns: {
    industry: "~textFieldIndustryType",
    monthlyIncome: "~textFieldIncome",
    businessField: "~textFieldBusiness",
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
    averageTransaction: "~averageTransactionErrorField",
  },
  text: {
    date: "~textDate",
    month: "~textMonth",
    year: "~textYear",
    blockerVerificationTitle: "~blockerVerificationTitle",
    blockerVerificationDesc: "~blockerVerificationDesc",
    optionIndustryType: "~industryTypeOption",
    optionBusinessField: "~businessTypeOption",
  },
  statusElement: {
    buttonSubmitIndustryType: { xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]" },
    buttonSubmitBusinessField: { xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]" },
    valueFieldIndustryType: { xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.widget.ScrollView/android.widget.EditText[2]" },
    valueFieldBusinessField: { xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.widget.ScrollView/android.widget.EditText[3]" },
    valueFieldOtherIndustryType: { xpath: "/hierarchy/android.view.ViewGroup/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.widget.EditText" },
    valueFieldOtherBusinessField: { xpath: "/hierarchy/android.view.ViewGroup/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.widget.EditText" },
  },

  fillBusinessProfile(businessProfileData) {
    const information = Object.keys(businessProfileData);

    for (let i = 0; i < information.length; i++) {
      const fieldName = information[i];
      const value = businessProfileData[fieldName];

      if (
        Object.keys(this.fields).indexOf(fieldName) !== -1
      ) {
        I.waitForElement(this.fields[fieldName], 20);
        I.clearField(this.fields[fieldName]);
        I.setText(this.fields[fieldName], value);

      } else if (
        Object.keys(this.dropDowns).indexOf(fieldName) !== -1
      ) {
        I.waitForElement(this.dropDowns[fieldName], 20);
        I.click(this.dropDowns[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.wait(2);
        I.click(value);
        I.wait(2);
        if (
          fieldName === "industry" ||
          fieldName === "businessField"
        ) {
          I.click(this.buttons.submitBusinessField);
        }

        I.waitForElement(this.dropDowns[fieldName], 20);
        I.swipeUp(this.dropDowns[fieldName], 1300, 1000);

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

  async getValue(fieldName) {

    let valueField;

    if (

      Object.keys(this.fields).indexOf(fieldName) !== -1

    ) {

      I.waitForElement(this.fields[fieldName], 10);
      valueField = await I.grabTextFrom(this.fields[fieldName]);

    } else if (

      Object.keys(this.dropDowns).indexOf(fieldName) !== -1

    ) {

      I.waitForElement(this.dropDowns[fieldName], 10);
      valueField = await I.grabTextFrom(this.dropDowns[fieldName]);

    } else {

      throw new Error(fieldName + " not found, please check again data naming");

    }

    return valueField;

  },

  clickDropDown(dropdownName) {
    I.waitForElement(this.dropDowns[dropdownName], 10);
    I.click(this.dropDowns[dropdownName]);
    I.waitForElement(this.buttons.closeBottomSheet, 20);
  },

  closeBottomSheet() {
    I.waitForElement(this.buttons.closeBottomSheet, 10);
    I.click(this.buttons.closeBottomSheet);
  },

  async getOptionTextIndustry(index) {
    const finalIndex = index + 1;
    const path = "//android.view.ViewGroup/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.view.View[" + finalIndex + "]/android.widget.TextView";
 
    I.waitForElement(path, 10);
    return await I.grabTextFrom(path);
  },

  async getOptionTextBusinessField(index) {
    const finalIndex = index + 1;
    const path = "//android.view.ViewGroup/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.view.View[" + finalIndex + "]/android.widget.TextView";
 
    I.waitForElement(path, 10);
    return await I.grabTextFrom(path);
  },

  submitIndustry() {
    I.waitForElement(this.buttons.submitIndustry, 10);
    I.click(this.buttons.submitIndustry);
  },

  submitBusinessField() {
    I.waitForElement(this.buttons.submitBusinessField, 10);
    I.click(this.buttons.submitBusinessField);
  },

  fillFieldOtherType(otherType) {
    I.waitForElement(this.fields.otherType, 10);
    I.click(this.fields.otherType);
    I.type(otherType, 1000);
    I.hideDeviceKeyboard();
  },

}
