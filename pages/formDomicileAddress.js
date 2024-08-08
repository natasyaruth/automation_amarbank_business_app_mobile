const { I } = inject();

module.exports = {

  fields: {
    address: "~fieldAddress",
    rt: "~fieldRt",
    rw: "~fieldRw",
    search: "~textFieldSearch",
  },
  dropDown: {
    typeResidence: "~fieldTypeResidence",
  },
  dropDownSearch: {
    province: "~fieldProvince",
    city: "~fieldCity",
    district: "~fieldDistrict",
    village: "~fieldVillage",
    firstItem: { xpath: "//android.view.View[2]/android.view.View/android.view.View" },
  },
  buttons: {
    saveDomicile: "~buttonSaveAddress",
    closeBottomSheet: "~buttonClose"
  },
  radioButtons: {
    ktpAddress: "~checkboxOldAddress",
    newAddress: "~checkboxNewAddress"
  },
  messageErrorFields: {
    address: "~fieldErrorAddress",
    rt: "~fieldErrorRt",
    rw: "~fieldErrorRw",
    province: "~fieldErrorProvince",
    city: "~fieldErrorCity",
    village: "~fieldErrorVillage",
    district: "~fieldErrorDistrict",
    religion: "~fieldErrorReligion",
  },
  texts:{
    ktpAddress: {xpath: "~//android.widget.ScrollView/android.view.View[1]/android.widget.TextView[2]"},
  },

  fillNewAddress(domicileAddress) {
    I.waitForElement(this.fields.address, 10);

    const information = Object.keys(domicileAddress);

    for (let i = 0; i < information.length; i++) {
      const fieldName = information[i];
      const value = domicileAddress[fieldName];

      if (
        Object.keys(this.fields).indexOf(fieldName) !== -1
      ) {
        I.setText(this.fields[fieldName], value);
        if (fieldName === "rw" ||
            fieldName === "rt") {
              
          I.swipeUp(this.fields[fieldName], 800, 1000);
        }
      } else if (
        Object.keys(this.dropDown).indexOf(fieldName) !== -1
      ) {
        I.click(this.dropDown[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);
        I.click(value);
      } else if (
        Object.keys(this.dropDownSearch).indexOf(fieldName) !== -1
      ) {
        I.click(this.dropDownSearch[fieldName]);
        I.waitForElement(this.buttons.closeBottomSheet, 10);

        if (fieldName !== "village") {
          I.setText(this.fields.search, value);
        }

        I.wait(1);
        I.click(this.dropDownSearch.firstItem);

      } else {
        throw new Error(information[i] + " not found, please check again data naming");
      }
    }
  },

  fillField(fieldName, value) {
    I.waitForElement(this.fields[fieldName]);
    I.setText(this.fields[fieldName], value);
  },

  clearValue(fieldName) {
    I.clearField(this.fields[fieldName]);
  },

  saveDomicileAddress() {
    I.click(this.buttons.saveDomicile);
  },

  chooseNewDomicile() {
    I.waitForElement(this.radioButtons.newAddress, 10);
    I.click(this.radioButtons.newAddress);
    I.waitForElement(this.dropDown.typeResidence, 10);
  },

  chooseKtpDomicile() {
    I.waitForElement(this.radioButtons.ktpAddress, 10);
    I.click(this.radioButtons.ktpAddress);
  },

  async getMessageError(fieldName) {
    I.waitForElement(this.messageErrorFields[fieldName], 2);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  async getKtpAddress(fieldName) {
    I.waitForElement(this.texts.ktpAddress, 10);
    return await I.grabTextFrom(this.texts.ktpAddress);
  },
}
