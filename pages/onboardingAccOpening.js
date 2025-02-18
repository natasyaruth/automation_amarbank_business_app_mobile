const {
  I,
  uploadKtpPage,
  uploadSelfiePage,
  uploadSelfieKtpPage,
  formKtpPage,
  formPersonalDataPage,
  formDomicileAddressPage,
  formEmploymentDataPage,
  formBusinessAddressPage,
  formBusinessProfilePage,
  formBusinessOwnerPage,
  uploadBusinessDocPage,
  uploadDao,
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
    cardInvited: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]" },
    giroAccountCorporate: "~bbBtnOpenGiro",
    giroAccountMsme: "~smeBtnOpenGiro",
    submitTypeGiro: "~btnOpenGiro",
    openAllTransactionApproval: "~showAllBtn",
    cardTransaction: "~transactionDetail",
    rejectCard: { xpath: "//android.widget.ScrollView/android.view.View[2]/android.view.View[2]" },
    openProgressAccount: "~btnDropoff",
    widgetDocumentSafe: "~buttonLearn",
    submitNPWP: "~nextButton",
    backNpwp: "~btnBack",
    confirmNpwp: "~btnConfirmed",
    closeBottomSheet: "~buttonClose",
    sentFeedBack: "~yesBtn",
    cancelFeedBack: "~cancelBtn",
    copyAccNumber: "~buttonCopyAccountNumber",
    resendCode: "~btnRetrySendEmail",
    changeEmail: "~btnChangeEmail",
    backToListDirector: "~btnBack",
    confirmResendCode: "~btnSend",
    backToBottomSheetEmail: "~btnBack",
    confirmChangeEmailInvitee: "~btnSend",
    saveAndResend: "~btnChangeSendEmail",
  },
  fields: {
    npwpBusiness: "~textFieldNpwpNumber",
    fieldFeedback: "~otherField",
    emailInvitee: "~fieldEmail",
  },
  radioButtons: {
    company: "~optionPTPerusahaan",
    cv: "~optionCV",
    individualBusiness: "~optionPTPerorangan",
    ud: "~optionUD",
    individual: "~optionIndividu",
    rbProcessLater: "~checklist1",
    rbComparingApp: "~checklist2",
    rbNotSure: "~checklist3",
    rbHasOtherApp: "~checklist4",
    rbOther: "~checklist5",
  },
  texts: {
    userId: "~txtUserName",
    titleCardAccOpening: "~txtTitleCard",
    descCardAccOpening: "~txtDescCard",
    invitedName: "~txtInvitedName",
    email: "~txtEmailName",
    progress: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[3]" },
    status: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[4]" },
    ktp: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[6]" },
    verification: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[7]" },
    selfie: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[8]" },
    selfieKtp: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[9]" },
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
    transactionApprovalType: "~transactionApprovalType",
    transactionRecipientName: "~transactionRecipientName",
    transactionRecipientBank: "~transactionRecipientBank",
    transactionDate: "~transactionDate",
    transactionAmount: "~transactionAmount",
    npwpNumber: "~npwpNumberText",
    accountHolder: "~txtCompanyName",
    accNumber: "~textAccountNumber",
    destinationEmail: "~txtEmail",
    oldEmailInvitee: "~txtOldEmail",
    newEmailInvitee: "~txtNewEmail",
  },
  msgErrorFields: {
    npwpBusiness: "~textMsgErrorNpwpNumber",
    emailInvitee: "~fieldEmailError",
  },
  tabs: {
    home: "~tabHome",
    business: "~tabBusiness",
    callCenter: "~tabCallCenter",
    document: "~tabDocument",
    others: "~tabOthers",
    funding: "~tabFunding",
    lending: "~tabLending",
  },
  icons: {
    redDotNotificationDoc: "~indicatorRedDot",
    eyeAmount: "~btnEyes",
    clearEmail: "~btnEmailClear",
  },
  statusEnabled: {
    buttonChooseTypeGiro: {xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]"},
    buttonSendFeedback: {xpath: "//android.widget.ScrollView/android.view.View/android.view.View[6]"},
    buttonCancelProcess: {xpath: "//android.widget.ScrollView/android.view.View/android.view.View[7]"},
    buttonSaveAndResend: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View"},
  },

  chooseLegalityBusinessType(type) {
    I.waitForElement(this.radioButtons[type], 20);
    I.click(this.radioButtons[type]);
  },

  swipeToCardGiroAccount() {
    I.waitForElement(this.buttons.giroAccount, 10);
    I.swipeLeft(this.buttons.giroAccount, 1000, 2500);
  },

  openGiroAccount() {
    I.waitForElement(this.buttons.giroAccount, 10);
    I.click(this.buttons.giroAccount);
  },

  openGiroAccountFromDashboard() {
    I.waitForElement(this.buttons.openAccount, 10);
    I.click(this.buttons.openAccount);
  },

  openGiroAccountMsme() {
    I.waitForElement(this.buttons.giroAccountMsme, 10);
    I.click(this.buttons.giroAccountMsme);
  },

  openGiroAccountCorporate() {
    I.waitForElement(this.buttons.giroAccountCorporate, 10);
    I.click(this.buttons.giroAccountCorporate);
  },

  submitTypeGiro(){
    I.waitForElement(this.buttons.submitTypeGiro, 10);
    I.click(this.buttons.submitTypeGiro);
  },

  continueToKYC() {
    I.waitForElement(this.buttons.next, 10);
    I.click(this.buttons.next);
  },

  validatePage(pageName) {
    switch (pageName) {
      case "Upload eKTP":
        I.waitForText("Ambil Foto eKTP Anda", 20);
        I.waitForElement(uploadKtpPage.buttons.directToTakePhoto, 10);
        break;
      case "Data KTP":
        I.waitForElement(formKtpPage.fields.eKtpNumber, 20);
        break;
      case "Upload Selfie":
        I.waitForText("Ambil Foto Diri Anda", 20);
        I.waitForElement(uploadSelfiePage.buttons.directToTakePhoto, 10);
        break;
      case "Upload Selfie with KTP":
        I.waitForText("Ambil Foto Diri Anda dengan KTP", 10);
        I.waitForElement(uploadSelfieKtpPage.buttons.directToTakePhoto, 10);
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
        I.waitForElement(uploadBusinessDocPage.buttons.refresh, 10);
        break;
      case "Method Upload Document":
        I.waitForElement(uploadBusinessDocPage.buttons.chooseMethodUpload, 10);
        break;
      case "Registration Director":
        I.waitForElement(this.buttons.cardInvited, 10);
        break;
      case "Detail Progress Account Opening":
        I.waitForText("Pengajuanmu Sedang Diproses Tim Kami", 10);
        break;
      default:
        throw new Error("Page name is not recognize");
    }
  },

  async completeStepKYCInvitee(userIDPartner, passwordPartner, stepName) {
    switch (stepName) {
      case "Upload eKTP":
        await uploadDao.uploadKTP(userIDPartner, passwordPartner);
        break;
      case "Data KTP":
        await uploadDao.submitIdentityDetails(userIDPartner, passwordPartner);
        break;
      case "Upload Selfie":
        await resetStateDao.resetStateFlow(userIDPartner, passwordPartner, 5);
        break;
      case "Upload Selfie with KTP":
        await resetStateDao.resetStateFlow(userIDPartner, passwordPartner, 6);
        break;
      default:
        throw new Error("Page name is not recognize");
    }
  },

  async updateStep(userID, password, stepName) {
    switch (stepName) {
      case "Choose Legality Type" || "Login Invitee":
        await resetStateDao.resetStateFlow(userID, password, 2);
        break;
      case "Login Invitee":
        await resetStateDao.resetStateFlow(userID, password, 2);
        break;
      case "Upload eKTP":
        await resetStateDao.resetStateFlow(userID, password, 3);
        break;
      case "Data KTP":
        await resetStateDao.resetStateFlow(userID, password, 4);
        break;
      case "Upload Selfie":
        await resetStateDao.resetStateFlow(userID, password, 5);
        break;
      case "Upload Selfie with KTP":
        await resetStateDao.resetStateFlow(userID, password, 6);
        break;
      case "Data Personal":
        await resetStateDao.resetStateFlow(userID, password, 7);
        break;
      case "Data Domicile Address":
        await resetStateDao.resetStateFlow(userID, password, 8);
        break;
      case "Data Employment":
        await resetStateDao.resetStateFlow(userID, password, 9);
        break;
      default:
        throw new Error("Page name is not recognize");
    }
  },

  chooseLater() {
    I.waitForElement(this.buttons.later, 15);
    I.click(this.buttons.later);
  },

  goToTabHome() {
    I.waitForElement(this.tabs.home, 10);
    I.click(this.tabs.home);
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
    I.waitForElement(this.buttons.completeData, 20);
    I.click(this.buttons.completeData);
  },

  continueCompleteDoc() {
    I.waitForElement(this.buttons.completeDoc, 10);
    I.click(this.buttons.completeDoc);
  },

  continueToProgressVerification() {
    I.waitForElement(this.buttons.openProgressAccount, 10);
    I.click(this.buttons.openProgressAccount);
  },

  openCardReject() {
    I.waitForElement(this.buttons.rejectCard, 10);
    I.click(this.buttons.rejectCard);
  },

  openWidgetDocumentSafe() {
    I.waitForElement(this.buttons.widgetDocumentSafe, 10);
    I.click(this.buttons.widgetDocumentSafe);
  },

  continueCompleteRegistrationDirectors() {
    I.waitForElement(this.buttons.invitedDirectors, 10);
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
    I.waitForElement(this.buttons.cardInvited, 10);
    I.click(this.buttons.cardInvited);
  },

  async getStatus() {
    I.waitForElement(this.texts.status, 10);
    return await I.grabTextFrom(this.texts.status);
  },

  async getProgress() {
    I.waitForElement(this.texts.progress, 10);
    return await I.grabTextFrom(this.texts.progress);
  },

  async getTextDetail(idText) {
    I.waitForElement(this.texts[idText], 10);
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
    return await I.grabTextFrom(this.texts.dormantFeeCorporate);
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

  openAllTransactionApproval() {
    I.waitForElement(this.buttons.openAllTransactionApproval, 10);
    I.click(this.buttons.openAllTransactionApproval);
  },

  openCardTransaction() {
    I.waitForElement(this.buttons.cardTransaction, 10);
    I.click(this.buttons.cardTransaction);
  },

  clickButtonProgressAccOpeningDetail() {
    I.waitForElement(this.buttons.openProgressAccount, 10);
    I.click(this.buttons.openProgressAccount);
  },

  async getStatusTransaction() {
    I.waitForElement(this.texts.transactionApprovalType, 10);
    return I.grabTextFrom(this.texts.transactionApprovalType);
  },

  async getRecipientName() {
    I.waitForElement(this.texts.transactionRecipientName, 10);
    return I.grabTextFrom(this.texts.transactionRecipientName);
  },

  async getRecipientBankName() {
    I.waitForElement(this.texts.transactionRecipientBank, 10);
    return I.grabTextFrom(this.texts.transactionRecipientBank);
  },

  async getTransactionDate() {
    I.waitForElement(this.texts.transactionDate, 10);
    return I.grabTextFrom(this.texts.transactionDate);
  },

  async getAmountTransaction() {
    I.waitForElement(this.texts.transactionAmount, 10);
    return I.grabTextFrom(this.texts.transactionAmount);
  },

  fillFieldNPWPBusiness(npwp) {
    I.waitForElement(this.fields.npwpBusiness, 10);
    I.setText(this.fields.npwpBusiness, npwp);
    I.hideDeviceKeyboard();
  },

  async getMessageErrorNPWP() {
    I.waitForElement(this.msgErrorFields.npwpBusiness, 10);
    return I.grabTextFrom(this.msgErrorFields.npwpBusiness);
  },

  continueToDataPersonal() {
    I.waitForElement(this.buttons.submitNPWP, 10);
    I.click(this.buttons.submitNPWP);
  },

  clearFieldNPWPBusiness() {
    I.waitForElement(this.fields.npwpBusiness, 10);
    I.clearField(this.fields.npwpBusiness);
  },

  clearFieldFeedback() {
    I.waitForElement(this.fields.fieldFeedback, 10);
    I.clearField(this.fields.fieldFeedback);
  },

  async getNPWPBusiness() {
    I.waitForElement(this.texts.npwpNumber, 10);
    return I.grabTextFrom(this.texts.npwpNumber);
  },

  clickBackPopUp() {
    I.waitForElement(this.buttons.backNpwp, 10);
    I.click(this.buttons.backNpwp);
  },

  confirmNPWP() {
    I.waitForElement(this.buttons.confirmNpwp, 30);
    I.click(this.buttons.confirmNpwp);
  },

  closeBottomSheet() {
    I.waitForElement(this.buttons.closeBottomSheet, 10);
    I.click(this.buttons.closeBottomSheet);
  },

  clickRbProcessLater() {
    I.waitForElement(this.radioButtons.rbProcessLater, 10);
    I.click(this.radioButtons.rbProcessLater);
  },

  clickRbComparingApp() {
    I.waitForElement(this.radioButtons.rbComparingApp, 10);
    I.click(this.radioButtons.rbComparingApp);
  },

  clickRbNotSure() {
    I.waitForElement(this.radioButtons.rbNotSure, 10);
    I.click(this.radioButtons.rbNotSure);
  },

  clickRbHasOtherApp() {
    I.waitForElement(this.radioButtons.rbHasOtherApp, 10);
    I.click(this.radioButtons.rbHasOtherApp);
  },

  clickRbOther() {
    I.waitForElement(this.radioButtons.rbOther, 10);
    I.click(this.radioButtons.rbOther);
  },

  fillFeedBack(text) {
    I.waitForElement(this.fields.fieldFeedback, 10);
    I.click(this.fields.fieldFeedback);
    I.type(text, 100);
    I.hideDeviceKeyboard();
  },

  backToProcessAcc() {
    I.waitForElement(this.buttons.cancelFeedBack, 10);
    I.click(this.buttons.cancelFeedBack);
  },

  sendExitSurvey() {
    I.waitForElement(this.buttons.sentFeedBack, 10);
    I.click(this.buttons.sentFeedBack);
  },

  clickOptionExitSurvey(option) {

    switch (option) {

      case "Proses akan dilanjutkan nanti":
        this.clickRbProcessLater();
        break;
      case "Sedang membandingkan dengan aplikasi lain":
        this.clickRbComparingApp();
        break;
      case "Tidak paham dengan keuntungan yang ditawarkan":
        this.clickRbNotSure();
        break;
      case "Sudah memiliki aplikasi menawarkan keuntungan yang serupa":
        this.clickRbHasOtherApp();
        break;
      case "Lainnya":
        this.clickRbOther();
        break;
      default:
        throw new Error("Option "+option+" is not recognize. Please check again");  
    }
  },

  async getAccHolderName() {
    I.waitForElement(this.texts.accountHolder, 10);
    return I.grabTextFrom(this.texts.accountHolder);
  },

  async getAccNumber() {
    I.waitForElement(this.texts.accNumber, 10);
    return I.grabTextFrom(this.texts.accNumber);
  },

  copyAccNumber() {
    I.waitForElement(this.buttons.copyAccNumber, 10);
    I.click(this.buttons.copyAccNumber);
  },

  clickEyeAmount() {
    I.waitForElement(this.icons.eyeAmount, 10);
    I.click(this.icons.eyeAmount);
  },

  clickResendBusinessCode(){
    I.waitForElement(this.buttons.resendCode, 10);
    I.click(this.buttons.resendCode);
  },

  clickChangeEmailInvitee(){
    I.waitForElement(this.buttons.changeEmail, 10);
    I.click(this.buttons.changeEmail);
  },

  async getEmailReceiver(){
    I.waitForElement(this.texts.destinationEmail, 10);
    return await I.grabTextFrom(this.texts.destinationEmail);
  },

  async getOldEmail(){
    I.waitForElement(this.texts.oldEmailInvitee, 10);
    return await I.grabTextFrom(this.texts.oldEmailInvitee);
  },

  async getNewEmail(){
    I.waitForElement(this.texts.newEmailInvitee, 10);
    return await I.grabTextFrom(this.texts.newEmailInvitee);
  },

  backToListDirectors(){
    I.waitForElement(this.buttons.backToListDirector, 10);
    I.click(this.buttons.backToListDirector);
  },

  backToBottomSheet(){
    I.waitForElement(this.buttons.backToBottomSheetEmail, 10);
    I.click(this.buttons.backToBottomSheetEmail);
  },

  sendBusinessCode(){
    I.waitForElement(this.buttons.confirmResendCode, 10);
    I.click(this.buttons.confirmResendCode);
  },

  clearEmailViaKeyboard(){
    I.waitForElement(this.fields.emailInvitee, 10);
    I.clearField(this.fields.emailInvitee);
  },

  clickIconClear(){
    I.waitForElement(this.icons.clearEmail, 10);
    I.click(this.icons.clearEmail);
  },

  saveEmailAndSendBusinessCode(){
    I.waitForElement(this.buttons.saveAndResend, 10);
    I.click(this.buttons.saveAndResend);
  },

  fillEmailInvitee(emailInvitee){
    I.waitForElement(this.fields.emailInvitee, 10);
    I.clearField(this.fields.emailInvitee);
    I.setText(this.fields.emailInvitee, emailInvitee);
  },

  async getMessageErrorEmail(){
    I.waitForElement(this.msgErrorFields.emailInvitee, 10);
    return await I.grabTextFrom(this.msgErrorFields.emailInvitee);
  },

  confirmEmailAndSendBusinessCode(){
    I.waitForElement(this.buttons.confirmChangeEmailInvitee, 10);
    I.click(this.buttons.confirmChangeEmailInvitee);
  },

  clickTabLending(){
    I.waitForElement(this.tabs.lending, 30);
    I.click(this.tabs.lending);
  },

  clickTabFunding(){
    I.waitForElement(this.tabs.funding, 30);
    I.click(this.tabs.funding);
  },

}
