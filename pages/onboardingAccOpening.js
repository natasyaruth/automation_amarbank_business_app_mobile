const { I } = inject();

module.exports = {
  buttons: {
    giroAccount: "~buttonOpenGiroAccount",
    openLoan: "~btnToLoan",
    openAccount: "~btnOpenAccount",
    later: "~buttonBackLoan",
    next: "~buttonNext",
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
  tab: {
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

  getStateNumber(stateName) {
    switch (stateName) {
      case "Tipe Bisnis":
        return "0";

      case "Foto eKTP":
        return "3";

      case "Verifikasi Data eKTP":
        return "4";

      case "Selfie":
        return "5";

      case "Data Diri":
        return "7";
        
      case "Alamat Tempat Tinggal":
        return "8";
        
      case "Data Pekerjaan":
        return "9";
        
      case "Profil Bisnis":
        return "10";
        
      case "Pemilik Bisnis":
        return "11";
        
      case "Upload Dokumen":
        return "12";
        
      default:
        throw new Error("State name is not recognize, please refer to this list:");
    }
  },

  chooseLater(){
    I.click(this.buttons.later);
  },

  async getUserId(){
    I.waitForElement(this.texts.userId, 10);
    return await I.grabTextFrom(this.texts.userId);
  }

}
