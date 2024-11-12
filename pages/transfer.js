const { I, globalVariable } = inject();

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
    dailyLimit: "~textDailyLimit",
    amount: "~textNominal",
    service: "~textService",
    total: "~textTotal",
    category: "~textCategory",
    subCategory: "~textSubCategory",
    note: "~textNote",
    confirmSenderName: { xpath: "//android.view.View/android.view.View/android.widget.TextView[2]" },
    confirmSenderAccNumber: { xpath: "//android.view.View/android.view.View/android.widget.TextView[5]" },
    confirmSenderBankName: { xpath: "//android.view.View/android.view.View/android.widget.TextView[3]" },
    confirmRecipientName: { xpath: "//android.view.View/android.view.View/android.widget.TextView[6]" },
    confirmRecipientAccNumber: { xpath: "//android.view.View/android.view.View/android.widget.TextView[9]" },
    confirmRecipientBankName: { xpath: "//android.view.View/android.view.View/android.widget.TextView[7]" },
    confirmAdminFee: { xpath: "//android.view.View/android.view.View/android.widget.TextView[15]" },
    senderName: { xpath: "//android.widget.ScrollView/android.widget.TextView[2]" },
    senderBankName: { xpath: "//android.widget.ScrollView/android.widget.TextView[3]" },
    senderAccNumber: { xpath: "//android.widget.ScrollView/android.widget.TextView[5]" },
    receiverName: { xpath: "//android.widget.ScrollView/android.widget.TextView[6]" },
    receiverBankName: { xpath: "//android.widget.ScrollView/android.widget.TextView[7]" },
    receiverAccNumber: { xpath: "//android.widget.ScrollView/android.widget.TextView[9]" },
    referenceNumber: { xpath: "//android.widget.ScrollView/android.view.View[1]/android.widget.TextView" },
    dateTransfer: { xpath: "//android.widget.ScrollView/android.widget.TextView[14]" },
    timeTransfer: { xpath: "//android.widget.ScrollView/android.widget.TextView[16]" },
    variableSenderConfirmationPage: { xpath: "//android.widget.TextView[2]" },
    adminFeeRTOL: "~feeRTOL",
    adminFeeBIFAST: "~feeBifast",
    adminFeeRTGS: "~feeRTGS",
    adminFeeSKN: "~feeSKN",
    titleActiveSaldo: { xpath: '//android.view.View/android.widget.ScrollView/android.widget.TextView[1]' },
    titleAmountTransfer: { xpath: '//android.view.View/android.widget.ScrollView/android.widget.TextView[3]' },
    titleAdminFee: { xpath: '//android.view.View/android.widget.ScrollView/android.widget.TextView[5]' },
    titleTotalAmount: { xpath: '//android.view.View/android.widget.ScrollView/android.widget.TextView[7]' },
    textBalanceAmount: "~textBalanceAmount",
    textTransferAmount: "~textTransferAmount",
    textTransferFee: "~textTransferFee",
    textTotalAmount: "~textTotalAmount",
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
    copy: { xpath: "//android.view.View/android.widget.ScrollView/android.view.View[1]/android.view.View[2]" },
    share: "~buttonShare",
    checkStatus: "~buttonCheckStatus",
    checkMethod: "~buttonChangeMethod",
    backToDashboard: "~buttonBackToDashboard",
    callCenter: "~buttonCallCenter",
    tryAgain: "~",
  },
  cards: {
    category: "~itemCategory",
    subCategory: "~itemSubCategory",
  },
  radioButtons: {
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
    balance: "~textBalanceError",
  },

  inputAmountTransfer(amount) {
    I.waitForElement(this.fields.amount, 10);
    I.setText(this.fields.amount, amount);
  },

  async getMessageErrorFieldOnOnInquiryTransfer(fieldName) {
    if (Object.keys(this.messageErrorFields).indexOf(fieldName) === -1) {
      throw new Error('Field ${fieldName} is not found');
    }
    I.waitForElement(this.messageErrorFields[fieldName], 10);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  async getMessageErrorField(fieldName) {
    I.waitForElement(this.messageErrorFields[fieldName], 10)
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },

  async getBalance() {
    I.waitForElement(this.texts.balance, 10)
    return await I.grabTextFrom(this.texts.balance);
  },

  async getMessageErrorAmount() {
    I.waitForElement(this.messageErrorFields.amount, 10)
    return await I.grabTextFrom(this.messageErrorFields.amount);
  },

  async getMessageErrorPIN() {
    I.waitForElement(this.messageErrorFields.pin, 10)
    return await I.grabTextFrom(this.messageErrorFields.pin);
  },

  async getMessageErrorNotes() {
    I.waitForElement(this.messageErrorFields.notes, 10);
    return await I.grabTextFrom(this.messageErrorFields.notes);
  },

  async getAmountConfirmation() {
    I.waitForElement(this.texts.amount, 10);
    return await I.grabTextFrom(this.texts.amount);
  },

  async getServiceMethod() {
    I.waitForElement(this.texts.service, 10);
    return await I.grabTextFrom(this.texts.service);
  },

  async getTotal() {
    I.waitForElement(this.texts.total, 10);
    return await I.grabTextFrom(this.texts.total);
  },

  async getCategory() {
    I.waitForElement(this.texts.category, 10);
    return await I.grabTextFrom(this.texts.category);
  },

  async getNotes() {
    I.waitForElement(this.texts.note, 10);
    return await I.grabTextFrom(this.texts.note);
  },

  async getMessageWarningPIN() {
    return await I.grabTextFrom(this.messageErrors.warningErrorPin);
  },

  async getMessageBlockedPin() {
    return await I.grabTextFrom(this.messageErrors.blockedPin);
  },

  chooseCategory(category) {
    I.waitForElement(this.dropdownLists.category, 10);
    I.click(this.dropdownLists.category);
    I.waitForElement(this.buttons.closeSubCategory, 10);
    I.click(category);
  },

  fillNotes(notes) {
    I.waitForElement(this.fields.notes, 10);
    I.setText(this.fields.notes, notes);
  },

  chooseMethodTransfer() {
    I.waitForElement(this.buttons.methodTransfer, 10);
    I.click(this.buttons.methodTransfer);
  },

  nextProcessTransfer() {
    I.waitForElement(this.buttons.methodTransfer, 10);
    I.click(this.buttons.methodTransfer);
  },

  chooseRtol() {
    I.waitForElement(this.radioButtons.methodRtol, 10);
    I.click(this.radioButtons.methodRtol);
  },

  chooseSkn() {
    I.waitForElement(this.radioButtons.methodSkn, 10);
    I.click(this.radioButtons.methodSkn);
  },

  chooseRtgs() {
    I.waitForElement(this.radioButtons.methodRtgs, 10);
    I.click(this.radioButtons.methodRtgs);
  },

  chooseBifast() {
    I.waitForElement(this.radioButtons.methodBifast, 10);
    I.click(this.radioButtons.methodBifast);
  },

  processTransfer() {
    I.waitForElement(this.buttons.transfer, 10);
    I.click(this.buttons.transfer);
  },

  confirmTransfer() {
    I.waitForElement(this.buttons.transfer, 10);
    I.click(this.buttons.transfer);
  },

  inputPin(pin) {
    I.waitForElement(this.fields.pin, 10);
    I.fillField(this.fields.pin, pin);
    I.hideDeviceKeyboard();
  },

  shareReceipt() {
    I.click(this.buttons.share);
  },

  backToDashboard() {
    I.click(this.buttons.backToDashboard);
  },

  callAmarTeamService() {
    I.click(this.buttons.callCenter);
  },

  clickTry() {
    I.waitForElement(this.buttons.tryAgain, 10);
    I.click(this.buttons.tryAgain);
  },

  validatePageTransfer() {
    I.waitForElement(this.fields.amount, 10);
    I.waitForElement(this.fields.notes, 10);
    I.waitForElement(this.dropdownLists.category, 10);
    I.waitForElement(this.texts.dailyLimit, 10);
    I.waitForElement(this.texts.balance, 10);
  },

  viewPageFriendList() {
    I.waitForElement(this.fields.receiverListPage, 10);
  },

  viewPageTrfMethodeList() {
    I.waitForElement(this.fields.transferMethodePage, 10);
  },

  clickSectionBtnTransfer() {
    I.waitForElement(this.buttons.sectionBtnTrf, 50);
    I.click(this.buttons.sectionBtnTrf);
  },

  closePageAfterTransfer() {
    I.waitForElement(this.buttons.closeDetailTransferPage, 10);
    I.click(this.buttons.closeDetailTransferPage);
  },

  async getReceiverName() {
    I.waitForElement(this.texts.receiverName, 10);
    return I.grabTextFrom(this.texts.receiverName);
  },

  async getReceiverBankName() {
    I.waitForElement(this.texts.receiverBankName, 10);
    return I.grabTextFrom(this.texts.receiverBankName);
  },

  async getReceiverAccNnumber() {
    I.waitForElement(this.texts.receiverAccNumber, 10);
    return I.grabTextFrom(this.texts.receiverAccNumber);
  },

  async getSenderName() {
    I.waitForElement(this.texts.senderName, 10);
    return I.grabTextFrom(this.texts.senderName);
  },

  async getSenderBankName() {
    I.waitForElement(this.texts.senderBankName, 10);
    return I.grabTextFrom(this.texts.senderBankName);
  },

  async getSenderAccNnumber() {
    I.waitForElement(this.texts.senderAccNumber, 10);
    return I.grabTextFrom(this.texts.senderAccNumber);
  },

  async getConfirmSenderName() {
    I.waitForElement(this.texts.variableSenderConfirmationPage, 10);
    return I.grabTextFrom(this.texts.variableSenderConfirmationPage);
  },

  async getAdminFeeRTOL() {
    I.waitForElement(this.texts.adminFeeRTOL, 10);
    return I.grabTextFrom(this.texts.adminFeeRTOL);
  },

  async getAdminFeeBIFAST() {
    I.waitForElement(this.texts.adminFeeBIFAST, 10);
    return I.grabTextFrom(this.texts.adminFeeBIFAST);
  },

  async getAdminFeeRTGS() {
    I.waitForElement(this.texts.adminFeeRTGS, 10);
    return I.grabTextFrom(this.texts.adminFeeRTGS);
  },

  async getAdminFeeSKN() {
    I.waitForElement(this.texts.adminFeeSKN, 10);
    return I.grabTextFrom(this.texts.adminFeeSKN);
  },

  async getAmountActive() {
    I.waitForElement(this.texts.balance, 10);
    return I.grabTextFrom(this.texts.balance);
  },

  async getTitleAmountActive() {
    I.waitForElement(this.texts.titleActiveSaldo, 10);
    return I.grabTextFrom(this.texts.titleActiveSaldo);
  },

  async getTitleAmountTransfer() {
    I.waitForElement(this.texts.titleAmountTransfer, 10);
    return I.grabTextFrom(this.texts.titleAmountTransfer);
  },

  async getTitleAdminFee() {
    I.waitForElement(this.texts.titleAdminFee, 10);
    return I.grabTextFrom(this.texts.titleAdminFee);
  },

  async getTitleTotalAmount() {
    I.waitForElement(this.texts.titleTotalAmount, 10);
    return I.grabTextFrom(this.texts.titleTotalAmount);
  },

  async getValueAmountActive() {
    I.waitForElement(this.texts.textBalanceAmount, 10);
    return I.grabTextFrom(this.texts.textBalanceAmount);
  },

  async getValueAmountTransfer() {
    I.waitForElement(this.texts.textTransferAmount, 10);
    return I.grabTextFrom(this.texts.textTransferAmount);
  },

  async getValueAdminFee() {
    I.waitForElement(this.texts.textTransferFee, 10);
    return I.grabTextFrom(this.texts.textTransferFee);
  },

  async getValueTotalAmount() {
    I.waitForElement(this.texts.textTotalAmount, 10);
    return I.grabTextFrom(this.texts.textTotalAmount);
  },

  async getDateTransfer() {
    I.waitForElement(this.texts.dateTransfer, 10);
    return I.grabTextFrom(this.texts.dateTransfer);
  },

  formattedToThreeDigit(amount) {
    const numberAmount = parseInt(amount);

    const numberString = numberAmount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
      numberString.splice(i, 0, '.');
    }
    const formattedAmount = numberString.join('');

    return formattedAmount;
  },

  async getConfirmSenderName() {
    I.waitForElement(this.texts.confirmSenderName, 10);
    return I.grabTextFrom(this.texts.confirmSenderName);
  },

  async getConfirmSenderAccNumber() {
    I.waitForElement(this.texts.confirmSenderAccNumber, 10);
    return I.grabTextFrom(this.texts.confirmSenderAccNumber);
  },

  async getConfirmSenderBankName() {
    I.waitForElement(this.texts.confirmSenderBankName, 10);
    return I.grabTextFrom(this.texts.confirmSenderBankName);
  },

  async getConfirmRecipientName() {
    I.waitForElement(this.texts.confirmRecipientName, 10);
    return I.grabTextFrom(this.texts.confirmRecipientName);
  },

  async getConfirmRecipientAccNumber() {
    I.waitForElement(this.texts.confirmRecipientAccNumber, 10);
    return I.grabTextFrom(this.texts.confirmRecipientAccNumber);
  },

  async getConfirmRecipientBankName() {
    I.waitForElement(this.texts.confirmRecipientBankName, 10);
    return I.grabTextFrom(this.texts.confirmRecipientBankName);
  },

  async getConfirmAdminFee() {
    I.waitForElement(this.texts.confirmAdminFee, 10);
    return I.grabTextFrom(this.texts.confirmAdminFee);
  },

  async getValueDailyLimitTransaction() {
    I.waitForElement(this.texts.dailyLimit, 10);
    return I.grabTextFrom(this.texts.dailyLimit);
  },

  getAmount() {
    const amount = globalVariable.transfer.amount;

    const numberString = amount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
      numberString.splice(i, 0, '.');
    }

    const stringAmount = numberString.join('');

    return "Rp" + stringAmount;
  }
}
