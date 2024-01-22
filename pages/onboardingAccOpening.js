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
  formBusinessOwnerPage,
  resetStateDao,
} = inject();

module.exports = {
  buttons: {
    giroAccount: "~buttonOpenGiroAccount",
    openLoan: "~btnToLoan",
    openAccount: "~btnOpenAccount",
    later: "~buttonBackLoan",
    next: "~buttonNext",
    completeData: "~btnDropoff",
    close: "~btnClose",
    invitedDirectors: "~btnOpenInvited",
    completeDoc: "~btnOpenDoc",
    refresh: "~btnRefresh",
    cardInvited: "~btnCard",
    giroAccountCorporate: "~smeBtnOpenGiro",
    giroAccountMsme: "~bbBtnOpenGiro",
  },
  radioButtons: {
    company: "~optionPTPerusahaan",
    cv: "~optionCV",
    individualBusiness: "~optionPTPerorangan",
    ud: "~optionUD",
    individual: "~optionIndividu",
  },
  texts: {
    userId: "~txtUserName",
    titleCardAccOpening: "~txtTitleCard",
    descCardAccOpening: "~txtDescCard",
    invitedName: "~txtInvitedName",
    email: "~txtEmailName",
    progress: "~txtProgress",
    status: "~",
    ktp: "~txtPhoto",
    verification: "~txtVerifData",
    selfie: "~txtSelfie",
    adminFeeSme: "~smeAdminFee",
    adminFeeCorporate: "~bbAdminFee",
    minBalanceSme: "~smeMinBalance",
    minBalanceCorporate: "~bbMinBalance",
    minCostSme: "~smeMinCost",
    minCostCorporate: "~bbMinCost",
    dormantFeeSme: "~smeDormantFee",
    dormantFeeCorporate: "~bbDormantFee",
    checkBookFeeSme: "~smeCheckbookFee",
    checkBookFeeCorporate: "~bbCheckbookFee",
    loanLimitSme: "~smeLoanLimit",
    loanLimitCorporate: "~bbLoanLimit",
  },
  tabs: {
    home: "~tabHome",
    business: "~tabBusiness",
    callCenter: "~tabCallCenter",
    others: "~tabOthers",
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

  openGiroAccountMsme() {
    I.waitForElement(this.buttons.giroAccountMsme, 10);
    I.click(this.buttons.giroAccountMsme);
  },

  openGiroAccountCorporate() {
    I.waitForElement(this.buttons.giroAccountCorporate, 10);
    I.click(this.buttons.giroAccountCorporate);
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
      case "Continue Process KYB":
        I.waitForElement(formEmploymentDataPage.buttons.continue, 10);
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
      case "Upload Document Business":
        I.waitForElement(formBusinessAddressPage.buttons.email, 10);
        break;
      case "Registration Director":
        I.waitForElement(formBusinessAddressPage.buttons.email, 10);
        break;
      default:
        throw new Error("Page name is not recognize");
    }
  },

  async updateStep(stepName, userID, password) {
    switch (stepName) {
      case "Upload eKTP":
        await resetStateDao.resetStateFlow(3, userID, password);
        resetStateDao.reloadPageAfterResetState();
        break;
      case "Data KTP":
        await resetStateDao.resetStateFlow(4, userID, password);
        resetStateDao.reloadPageAfterResetState();
        break;
      case "Upload Selfie":
        await resetStateDao.resetStateFlow(5, userID, password);
        resetStateDao.reloadPageAfterResetState();
        break;
      case "Data Personal":
        await resetStateDao.resetStateFlow(7, userID, password);
        resetStateDao.reloadPageAfterResetState();
        break;
      case "Data Domicile Address":
        await resetStateDao.resetStateFlow(8, userID, password);
        resetStateDao.reloadPageAfterResetState();
        break;
      case "Data Employment":
        await resetStateDao.resetStateFlow(9, userID, password);
        resetStateDao.reloadPageAfterResetState();
        break;
      default:
        throw new Error("Page name is not recognize");
    }
  },

  chooseLater() {
    I.waitForElement(this.buttons.later, 10);
    I.click(this.buttons.later);
  },

  goToTabBusiness() {
    I.waitForElement(this.tabs.business, 10);
    I.click(this.tabs.business);
  },

  goToTabOthers() {
    I.waitForElement(this.tabs.others, 10);
    I.click(this.tabs.others);
  },

  async getUserId() {
    I.waitForElement(this.texts.userId, 10);
    return await I.grabTextFrom(this.texts.userId);
  },

  continueCompleteData() {
    I.click(this.buttons.completeData);
  },

  continueCompleteDoc() {
    I.click(this.buttons.completeDoc);
  },

  continueCompleteRegistrationDirectors() {
    I.click(this.buttons.invitedDirectors);
  },

  closePageUploadDoc() {
    I.click(this.buttons.close);
  },

  async getInvitedDirectorName() {
    return await I.grabTextFrom(this.texts.invitedName);
  },

  async getInvitedDirectorEmail() {
    return await I.grabTextFrom(this.texts.email);
  },

  openDetailRegistrationDirector() {
    I.click(this.buttons.cardInvited);
  },

  async getStatus() {
    return await I.grabTextFrom(this.texts.status);
  },

  async getProgress() {
    return await I.grabTextFrom(this.texts.progress);
  },

  async getTextDetail(idText) {
    return await I.grabTextFrom(this.texts[idText]);
  },

  async getAdminFeeCorporate() {
    return await I.grabTextFrom(this.texts.adminFeeCorporate);
  },

  async getAdminFeeMsme() {
    return await I.grabTextFrom(this.texts.adminFeeSme);
  },

  async getMinBalanceCorporate() {
    return await I.grabTextFrom(this.texts.minBalanceCorporate);
  },

  async getMinBalanceMsme() {
    return await I.grabTextFrom(this.texts.minBalanceSme);
  },

  async getMinCostCorporate() {
    return await I.grabTextFrom(this.texts.minCostCorporate);
  },

  async getMinCostMsme() {
    return await I.grabTextFrom(this.texts.minCostSme);
  },

  async getDormantFeeCorporate() {
    return await I.grabTextFrom(this.texts.dormantFeeSme);
  },

  async getDormantFeeMsme() {
    return await I.grabTextFrom(this.texts.dormantFeeSme);
  },

  async getCheckBookFeeCorporate() {
    return await I.grabTextFrom(this.texts.checkBookFeeCorporate);
  },

  async getCheckBookFeeMsme() {
    return await I.grabTextFrom(this.texts.checkBookFeeSme);
  },

  async getLoanLimitCorporate() {
    return await I.grabTextFrom(this.texts.loanLimitCorporate);
  },

  async getLoanLimitMsme() {
    return await I.grabTextFrom(this.texts.loanLimitSme);
  },

}
