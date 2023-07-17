const { I } = inject();

module.exports = {
  fields: {
    otpField1: "otpField1",
    otpField2: "otpField2",
    otpField3: "otpField3",
    otpField4: "otpField4",
    otpField5: "otpField5",
    otpField6: "otpField6",
  },
  buttons: {
    sendOtp: "buttonSendOtp",
  },

  isOpen() {
    I.waitForElement(this.fields.otpField1, 30);
  },

  fillInOptCode(optCode) {
    I.fillField(this.fields.otpField1, optCode[0]);
    I.fillField(this.fields.otpField2, optCode[1]);
    I.fillField(this.fields.otpField3, optCode[2]);
    I.fillField(this.fields.otpField4, optCode[3]);
    I.fillField(this.fields.otpField5, optCode[4]);
    I.fillField(this.fields.otpField6, optCode[5]);
  },

  sendOtp() {
    I.click(this.buttons.sendOtp);
  },
};
