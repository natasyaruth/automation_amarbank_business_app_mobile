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
    variableSenderConfirmationPage: {xpath: "//android.widget.TextView[2]"}
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
    I.seeElement(this.messageErrorFields[fieldName]);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  async getMessageErrorField(fieldName){
    return await I.grabTextFrom(fieldName);
  },

  async getBalance(){
    return await I.grabTextFrom(this.texts.balance);
  },

  async getMessageErrorAmount(){
    return await I.grabTextFrom(this.messageErrors.amount);
  },

  async getMessageErrorPIN(){
    return await I.grabTextFrom(this.messageErrors.pin);
  },

  async getMessageErrorNotes(){
    return await I.grabTextFrom(this.messageErrors.notes);
  },

  async getAmountConfirmation(){
    return await I.grabTextFrom(this.texts.amount);
  },

  async getServiceMethod(){
    return await I.grabTextFrom(this.texts.service);
  },

  async getTotal(){
    return await I.grabTextFrom(this.texts.total);
  },

  async getCategory(){
    return await I.grabTextFrom(this.texts.category);
  },

  async getNotes(){
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
    I.wait(5);
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
}
