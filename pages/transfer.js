const { I } = inject();

module.exports = {
  fields: {
    amount: "~textFieldNominal",
    notes: "~textFieldNote",
    pin: "~textFieldPIN",
  },
  texts: {
    balance: "~textBalance",
    amount: "~textNominal",
    service: "~textService",
    total: "~textTotal",
    category: "~textCategory",
    subCategory: "~textSubCategory",
    note: "~textNote",
    
  },
  dropdownLists: {
    category: "~dropDownCategory",
    subCategory: "~dropDownSubCategory",
  },
  buttons: {
    methodTransfer: "~buttonChoseMethod",
    refresh: "~buttonRefresh",
    closeSubCategory: "~buttonClose",    
    transfer: "~buttonTransfer",
    copy: "~buttonCopy",
    share: "~buttonShare",
    checkStatus: "~buttonCheckStatus",
    checkMethod: "~buttonChangeMethod",
    clooseBottomLocked: "~buttonClose",
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
  messageErrors: {
    amount: "~textFieldErrorNominal",
    notes: "~textFieldErrorNote",
    pin: "~textFieldErrorPIN",
    warningErrorPin: "~textWarningPin",
    blockedPin: "~textBlockPin",
  },

  inputAmountTransfer(amount){
    I.waitForElement(this.fields.amount, 10);
    I.setText(this.fields.amount, amount);
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
    I.click(this.dropdownLists.category);
    I.waitForElement(this.buttons.closeSubCategory, 10);
    I.click(category);
  },

  fillNotes(notes){
    I.waitForElement(this.fields.notes, 10);
    I.setText(this.fields.notes, notes);
  },

  chooseMethodTransfer(){
    I.click(this.buttons.methodTransfer);
  },

  chooseRtol(){
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
    I.click(this.buttons.transfer);
  },

  confirmTransfer(){
    I.click(this.buttons.transfer);
  },

  inputPin(pin){
    I.waitForElement(this.fields.pin, 10);
    I.setText(this.fields.pin, pin);
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
}
