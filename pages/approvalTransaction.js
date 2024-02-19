const { I } = inject();

module.exports = {

  buttons: {
    approveTransaction: "~transactionApprovedBtn",
    rejectTransaction: "~transactionRejectedBtn",
    tabOnProgress: "~transactionInprocessTab",
    tabDone: "~transactionDoneTab",
    tabNeedApproval: "~transactionNeedApprovalTab",
    tabWaitingForApproval: "~transactionWaitingTab",
    openDetailTransaction: "~transactionDetail",
    closeInfo: "~transactionNeedApprovalInfoClose",
    submitPassword: "~buttonNext",
    iconEyePassword: "~iconShowHidePassword",
    passwordIncorrect: "~passwordIncorrectBtn",
  },
  texts: {
    transactionApprovalType: "~transactionApprovalType",
    transactionRecipientName: "~transactionRecipientName",
    transactionRecipientBank: "~transactionRecipientBank",
    transactionDate: "~transactionDate",
    transactionAmount: "~transactionAmount",
    senderName: "~senderName",
    senderAccount: "~senderAccount",
    recipientName: "~recipientName",
    recipientAccount: "~recipientAccount",
    amountTransferOut: "~transferOut",
    nameCreatedBy: "~createdBy",
    referenceNumber: "~referenceNumber",
    date: "~date",
    category: "~category",
    noted: "~noted",
    nameRejectedBy: "~rejectedBy",
    infoIncorrectPassword: "~passwordIncorrectDesc",
    phoneNumber: "~textPhoneNumber",
  },
  messageErrorField: {
    textMsgErrorOtp: "~textMsgErrorOtp",
  },
  links: {
    seeDetailOnSnackbar: "~transactionDetailToast",
    resendOtp: "~linkResendOtp",
  },
  fields: {
    password: "~textFieldPassword",
    otpCode: "~textFieldCode",
  },

  openCardTransaction() {
    I.waitForElement(this.buttons.cardTransaction, 10);
    I.click(this.buttons.cardTransaction);
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

  async getSenderName() {
    I.waitForElement(this.texts.senderName, 10);
    return I.grabTextFrom(this.texts.senderName);
  },

  async getSenderAccountNumber() {
    I.waitForElement(this.texts.senderAccount, 10);
    return I.grabTextFrom(this.texts.senderAccount);
  },

  async getRecipientName() {
    I.waitForElement(this.texts.recipientName, 10);
    return I.grabTextFrom(this.texts.recipientName);
  },

  async getRecipientAccountNumber() {
    I.waitForElement(this.texts.recipientAccount, 10);
    return I.grabTextFrom(this.texts.recipientAccount);
  },

  async getAmountTransfer() {
    I.waitForElement(this.texts.amountTransferOut, 10);
    return I.grabTextFrom(this.texts.amountTransferOut);
  },

  async getNameCreatedBy() {
    I.waitForElement(this.texts.nameCreatedBy, 10);
    return I.grabTextFrom(this.texts.nameCreatedBy);
  },

  async getNameRejectedBy() {
    I.waitForElement(this.texts.nameRejectedBy, 10);
    return I.grabTextFrom(this.texts.nameRejectedBy);
  },

  async getDateTransaction() {
    I.waitForElement(this.texts.date, 10);
    return I.grabTextFrom(this.texts.date);
  },

  async getCategoryName() {
    I.waitForElement(this.texts.category, 10);
    return I.grabTextFrom(this.texts.category);
  },

  async getNotes() {
    I.waitForElement(this.texts.noted, 10);
    return I.grabTextFrom(this.texts.noted);
  },

  async getPhoneNumber() {
    I.waitForElement(this.texts.phoneNumber, 10);
    return I.grabTextFrom(this.texts.phoneNumber);
  },

  async getDescInfoIncorrectPassword() {
    I.waitForElement(this.texts.infoIncorrectPassword, 10);
    return I.grabTextFrom(this.texts.infoIncorrectPassword);
  },

  async getMessageErrorOtp() {
    I.waitForElement(this.messageErrorField.textMsgErrorOtp, 10);
    return I.grabTextFrom(this.messageErrorField.textMsgErrorOtp);
  },

  approveTransaction() {
    I.waitForElement(this.buttons.approveTransaction, 10);
    I.click(this.buttons.approveTransaction);
  },

  rejectTransaction() {
    I.waitForElement(this.buttons.rejectTransaction, 10);
    I.click(this.buttons.rejectTransaction);
  },

  openTabInProcess() {
    I.waitForElement(this.buttons.tabOnProgress, 10);
    I.click(this.buttons.tabOnProgress);
  },

  openTabDone() {
    I.waitForElement(this.buttons.tabDone, 10);
    I.click(this.buttons.tabDone);
  },

  openTabNeedApproval() {
    I.waitForElement(this.buttons.tabNeedApproval, 10);
    I.click(this.buttons.tabNeedApproval);
  },

  openTabWaitingForApproval() {
    I.waitForElement(this.buttons.tabWaitingForApproval, 10);
    I.click(this.buttons.tabWaitingForApproval);
  },

  closeInformationTransaction() {
    I.waitForElement(this.buttons.closeInfo, 10);
    I.click(this.buttons.closeInfo);
  },

  openDetailApprovalOnSanackbar() {
    I.waitForElement(this.links.seeDetailOnSnackbar, 10);
    I.click(this.links.seeDetailOnSnackbar);
  },

  fillPassword(password) {
    I.waitForElement(this.fields.password, 10);
    I.setText(this.fields.password, password);
  },

  fillOtpCode(otp) {
    I.waitForElement(this.fields.otpCode, 10);
    I.setText(this.fields.otpCode, otp);
  },

  clickIconEyePassword() {
    I.waitForElement(this.buttons.iconEyePassword, 10);
    I.click(this.buttons.iconEyePassword);
  },

  submitPassword() {
    I.waitForElement(this.buttons.submitPassword, 10);
    I.click(this.buttons.submitPassword);
  },

  clickButtonIncorrectPassword() {
    I.waitForElement(this.buttons.passwordIncorrect, 10);
    I.click(this.buttons.passwordIncorrect);
  },

  resendOtp(){
    I.waitForElement(this.links.resendOtp, 10);
    I.click(this.links.resendOtp);
  }

}
