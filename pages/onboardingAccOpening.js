const { tabs } = require("./loanDashboard");

const { 
  I,
  uploadKtpPage,
  uploadSelfiePage,
  formKtpPage,
  formPersonalDataPage,
  formDomicileAddressPage,
  formEmploymentDataPage,
  formBusinessAddressPage,
  formBusinessProfilePage,
  formBusinessOwnerPage 
} = inject();

module.exports = {
  buttons: {
    giroAccount: "~buttonOpenGiroAccount",
    openLoan: "~btnToLoan",
    openAccount: "~btnOpenAccount",
    later: "~buttonBackLoan",
    next: "~buttonNext",
    completeData: "~btnCompleteData"
  },
  radioButtons: {
    company: "~optionPTPerusahaan",
    cv: "~optionCV",
    individualBusiness: "~optionPTPerorangan",
    ud: "~optionUD",
    individual: "~optionIndividu",
  },
  texts:{
    userId: "~txtUserName",
    titleCardAccOpening: "~txtTitleCard",
    descCardAccOpening: "~txtDescCard",
  },
  tabs: {
    home: "~tabHome",
    business: "~tabBusiness",
    callCenter: "~tabCallCenter",
    others: "~tabOthers"
  },

  chooseLegalityBusinessType(type) {
    I.waitForElement(this.radioButtons[type], 10);
    I.click(this.radioButtons[type]);
  },

  swipeToCardGiroAccount() {
    I.waitForElement(this.buttons.giroAccount, 10);
    I.swipeLeft(this.buttons.giroAccount, 1000, 2000);
  },

  openGiroAccount() {
    I.waitForElement(this.buttons.giroAccount, 10);
    I.click(this.buttons.giroAccount);
  },

  continueToKYC() {
    I.waitForElement(this.buttons.next, 10);
    I.click(this.buttons.next);
  },

  validatePage(pageName) {
    switch (pageName) {
      case "Upload eKTP":
        I.waitForElement(uploadKtpPage.buttons.takePhoto, 10);
        break;
      case "Data KTP":
        I.waitForElement(formKtpPage.fields.eKtpNumber, 10);
        break;
      case "Upload Selfie":
        I.waitForElement(uploadSelfiePage.buttons.takePhoto, 10);
        break;
      case "Data Personal":
        I.waitForElement(formPersonalDataPage.dropDowns.lastEducation, 10);
        I.wait(3);
        break;
      case "Data Domicile Address":
        I.waitForElement(formDomicileAddressPage.buttons.saveDomicile, 10);
        I.wait(3);
        break;
      case "Data Employment":
        I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
        I.wait(3);
        break;
      case "Data Business Profile":
        I.waitForElement(formBusinessProfilePage.fields.businessName, 10);
        I.wait(3);
        break;
      case "Data Business Owner":
        I.waitForElement(formBusinessOwnerPage.buttons.saveListDirectors, 10);
        I.wait(3);
        break;
      case "Data Director List":
        I.waitForElement(formBusinessOwnerPage.buttons.addListDirector, 10);
        I.wait(3);
        break;
      case "Data Business Address":
        I.waitForElement(formBusinessAddressPage.fields.address, 10);
        I.wait(3);
        break;
      default:
        throw new Error("Page name is not recognize");
    }
  },

  chooseLater(){
    // I.waitForElement(this.buttons.later, 10);
    // I.click(this.buttons.later);
    I.waitForText("Nanti Saja", 10);
    I.click("Nanti Saja");
  },

  goToTabBusiness(){
    I.click(this.tabs.business);
  },

  async getUserId(){
    I.waitForElement(this.texts.userId, 10);
    return await I.grabTextFrom(this.texts.userId);
  },

  continueCompleteData(){
    I.click(this.buttons.completeData);
  },
  
}
