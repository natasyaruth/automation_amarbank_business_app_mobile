const { I } = inject();

module.exports = {
  buttons: {
    giroAccount: "~buttonOpenGiroAccount",
    later: "~buttonLater",
    next: "~buttonNext",
  },
  radioButtons: {
    company: "~optionPTPerusahaan",
    cv: "~optionCV",
    individualBusiness: "~optionPTPerorangan",
    ud: "~optionUD",
    individual: "~optionIndividu",
  },

  chooseLegalityBusinessType(type) {
    I.waitForElement(this.radioButtons[type], 10);
    I.click(this.radioButtons[type]);
  },

  openGiroAccount() {
    I.swipeLeft(this.buttons.giroAccount, 500, 1000);
    I.click(this.buttons.giroAccount);
  },

  continueToKYC() {
    I.click(this.buttons.next);
  },

}
