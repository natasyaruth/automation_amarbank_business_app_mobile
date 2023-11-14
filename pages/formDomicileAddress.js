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
    address: "~textErrorAddress",
    rt: "~textErrorRT",
    rw: "~textErrorRW",
    province: "~textErrorProvince",
    city: "~textErrorCity",
    village: "~textErrorVillage",
    district: "~textErrorDistrict",
    religion: "~textErrorReligion",
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
        if (fieldName === "rw") {
          I.swipeUp(this.fields[fieldName], 500, 800);
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
        I.setText(this.fields.search, value);
        I.wait(1);
        I.click(this.dropDownSearch.firstItem);

        if (fieldName !== "village") {
          I.swipeUp(this.dropDownSearch[fieldName], 500, 1000);
        }

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
}
