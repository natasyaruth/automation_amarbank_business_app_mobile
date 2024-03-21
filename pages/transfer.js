const { I } = inject();

module.exports = {
  fields: {
    amount: "~textFieldNominal",
    notes: "~textFieldNote",
    pin: "~textFieldPIN",
    receiverListPage: { xpath: '//android.widget.TextView[contains(@text, "Daftar Penerima")]' },
    transferMethodePage: { xpath: '//android.widget.TextView[contains(@text, "Layanan Transfer")]' },
    confirmTrfPage: { xpath: '//android.widget.TextView[contains(@text, "Konfirmasi Transfer")]' },
  },
  texts: {
    balance: "~textBalance",
    amount: "~textNominal",
    service: "~textService",
    total: "~textTotal",
    category: "~textCategory",
    subCategory: "~textSubCategory",
    note: "~textNote",
    senderName: {xpath: "//android.widget.ScrollView/android.widget.TextView[2]"},
    senderAccNumber: {xpath: "//android.widget.ScrollView/android.widget.TextView[5]"},
    receiverName: {xpath: "//android.widget.ScrollView/android.widget.TextView[6]"},
    receiverAccNumber: {xpath: "//android.widget.ScrollView/android.widget.TextView[9]"},
    variableSenderConfirmationPage: {xpath: "//android.widget.TextView[2]"},
    adminFeeRTOL: "~feeRTOL",
    adminFeeBIFAST: "~feeBifast",
    adminFeeRTGS: "~feeRTGS",
    adminFeeSKN: "~feeSKN",
  },
  dropdownLists: {
    category: "~dropDownCategory",
    subCategory: "~dropDownSubCategory",
  },
  buttons: {
    methodTransfer: "~buttonChoseMethod",
    refresh: "~buttonRefresh",
    closeSubCategory: "~buttonClose", 
    closeDetailTransferPage: "~buttonClose",    
    transfer: "~buttonTransfer",
    sectionBtnTrf: "~btnTransfer",
    copy: {xpath: "//android.view.View/android.widget.ScrollView/android.view.View[1]/android.view.View[2]"},
    share: "~buttonShare",
    checkStatus: "~buttonCheckStatus",
    checkMethod: "~buttonChangeMethod",
    backToDashboard: "~buttonBackToDashboard",
    callCenter:"~buttonCallCenter",
  },
  cards: {
    category: "~itemCategory",
    subCategory: "~itemSubCategory",
  }, 
  radioButtons:{
    methodRtol: "~optionRTOL",
    methodRtgs: "~optionRTGS",
    methodBifast: "~optionBifast",
    methodSkn: "~optionSKN",
  },
  messageErrorFields: {
    amount: "~textFieldErrorNominal",
    notes: "~textFieldErrorNote",
    pin: "~textFieldErrorPIN",
    warningErrorPin: "~textWarningPin",
    blockedPin: "~textBlockPin",
    dropDownErrorField: "~dropDownErrorSubCategory",
  },

  inputAmountTransfer(amount){
    I.waitForElement(this.fields.amount, 10);
    I.setText(this.fields.amount, amount);
  },

  async getMessageErrorFieldOnOnInquiryTransfer (fieldName) {
    if(Object.keys(this.messageErrorFields).indexOf(fieldName) === -1){
      throw new Error('Field ${fieldName} is not found');
    }
    I.waitForElement(this.messageErrorFields[fieldName], 10);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  async getMessageErrorField(fieldName){
    I.waitForElement(this.messageErrorFields[fieldName], 10)
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  async getBalance(){
    I.waitForElement(this.texts.balance, 10)
    return await I.grabTextFrom(this.texts.balance);
  },

  async getMessageErrorAmount(){
    I.waitForElement(this.messageErrorFields.amount, 10)
    return await I.grabTextFrom(this.messageErrorFields.amount);
  },

  async getMessageErrorPIN(){
    I.waitForElement(this.messageErrorFields.pin, 10)
    return await I.grabTextFrom(this.messageErrorFields.pin);
  },

  async getMessageErrorNotes(){
    I.waitForElement(this.messageErrorFields.notes, 10);
    return await I.grabTextFrom(this.messageErrorFields.notes);
  },

  async getAmountConfirmation(){
    I.waitForElement(this.texts.amount, 10);
    return await I.grabTextFrom(this.texts.amount);
  },

  async getServiceMethod(){
    I.waitForElement(this.texts.service, 10);
    return await I.grabTextFrom(this.texts.service);
  },

  async getTotal(){
    I.waitForElement(this.texts.total, 10);
    return await I.grabTextFrom(this.texts.total);
  },

  async getCategory(){
    I.waitForElement(this.texts.category, 10);
    return await I.grabTextFrom(this.texts.category);
  },

  async getNotes(){
    I.waitForElement(this.texts.note, 10);
    return await I.grabTextFrom(this.texts.note);
  },

  async getMessageWarningPIN(){
    return await I.grabTextFrom(this.messageErrors.warningErrorPin);
  },

  async getMessageBlockedPin(){
    return await I.grabTextFrom(this.messageErrors.blockedPin);
  },

  chooseCategory(category){
    I.waitForElement(this.dropdownLists.category, 10);
    I.click(this.dropdownLists.category);
    I.waitForElement(this.buttons.closeSubCategory, 10);
    I.click(category);
  },

  fillNotes(notes){
    I.waitForElement(this.fields.notes, 10);
    I.setText(this.fields.notes, notes);
  },

  chooseMethodTransfer(){
    I.waitForElement(this.buttons.methodTransfer, 10);
    I.click(this.buttons.methodTransfer);
  },

  nextProcessTransfer(){
    I.waitForElement(this.buttons.methodTransfer, 10);
    I.click(this.buttons.methodTransfer);
  },

  chooseRtol(){
    I.waitForElement(this.radioButtons.methodRtol, 10);
    I.click(this.radioButtons.methodRtol);
  },

  chooseSkn(){
    I.click(this.radioButtons.methodSkn);
  },

  chooseRtgs(){
    I.click(this.radioButtons.methodRtgs);
  },

  chooseBifast(){
    I.click(this.radioButtons.methodBifast);
  },

  processTransfer(){
    I.waitForElement(this.buttons.transfer, 10);
    I.click(this.buttons.transfer);
  },

  confirmTransfer(){
    I.click(this.buttons.transfer);
  },

  inputPin(pin){
    I.waitForElement(this.fields.pin, 10);
    I.fillField(this.fields.pin, pin);
    I.hideDeviceKeyboard();
  },

  shareReceipt(){
    I.click(this.buttons.share);
  },

  backToDashboard(){
    I.click(this.buttons.backToDashboard);
  },

  callAmarTeamService(){
    I.click(this.buttons.callCenter);
  },

  viewPageFriendList(){
    I.wait(3);
    I.seeElement(this.fields.receiverListPage);
  },

  viewPageTrfMethodeList(){
    I.wait(3);
    I.seeElement(this.fields.transferMethodePage);
  },

  viewPageConfirmTrf(){
    I.wait(3);
    I.seeElement(this.fields.confirmTrfPage);
  },

  clickSectionBtnTransfer(){
    I.waitForElement(this.buttons.sectionBtnTrf, 20);
    I.click(this.buttons.sectionBtnTrf);
  },

  closePageAfterTransfer(){
    I.click(this.buttons.closeDetailTransferPage);
  },

  async getReceiverName(){
    return I.grabTextFrom(this.texts.receiverName);
  },

  async getReceiverAccNnumber(){
    return I.grabTextFrom(this.texts.receiverAccNumber);
  },

  async getSenderName(){
    return I.grabTextFrom(this.texts.senderName);
  },

  async getSenderAccNnumber(){
    return I.grabTextFrom(this.texts.senderAccNumber);
  },

  async getConfirmSenderName(){
    return I.grabTextFrom(this.texts.variableSenderConfirmationPage);
  },

  async getAdminFeeRTOL(){
    I.waitForElement(this.texts.adminFeeRTOL, 10);
    return I.grabTextFrom(this.texts.adminFeeRTOL);
  },

  async getAdminFeeBIFAST(){
    I.waitForElement(this.texts.adminFeeBIFAST, 10);
    return I.grabTextFrom(this.texts.adminFeeBIFAST);
  },

  async getAdminFeeRTGS(){
    I.waitForElement(this.texts.adminFeeRTGS, 10);
    return I.grabTextFrom(this.texts.adminFeeRTGS);
  },

  async getAdminFeeSKN(){
    I.waitForElement(this.texts.adminFeeSKN, 10);
    return I.grabTextFrom(this.texts.adminFeeSKN);
  }
}
