const { error } = require("codeceptjs-testrail/lib/output");

const { I } = inject();

module.exports = {
  buttons: {
    //Type AP
    buttonUseLimit: "~buttonUseLimit",
    buttonClose: "~buttonClose",
    buttonDismiss: "~buttonDismiss",
    buttonBack: "~buttonBack",
    buttonDownloadReport: "~buttonDownloadReport",
    buttonCallCenter: "~buttonCallCenter",
    buttonDetailLimit: "~buttonDetailLimit",
    buttonDetailInvoice: "~buttonDetailInvoice",
    buttonPreview: "~buttonPreview",
    buttonDisburse: "~buttonDisburse",
    buttonComplaint: "~buttonComplaint",
    buttonClose: "~buttonClose",
    buttonSendPdc: "~buttonSendPdc",
    buttonCopy: "~buttonCopy",
    buttonSendComplaint: "~buttonSendComplaint",
    //Direct AP
    buttonUpload: "~buttonUpload",
    buttonClose: "~buttonClose",
    buttonTakePicture: "~buttonTakePicture",
    buttonGetFromGallery: "~buttonGetFromGallery",
    buttonTakePicture: "~buttonTakePicture",
    buttonEdit: "~buttonEdit",
    buttonContinuePay: "~buttonContinuePay",
    buttonSaveForLater: "~buttonSaveForLater",
    buttonCheckStatus: "~buttonCheckStatus",
    buttonCallCenter: "~buttonCallCenter",
    buttonReupload: "~buttonReupload",
    buttonInputSupplier: "~buttonInputSupplier",
    buttonContinuePay: "~buttonContinuePay",
    buttonSaveForLater: "~buttonSaveForLater",
    buttonVerify: "~buttonVerify",
    buttonNext: "~buttonNext",
  },

  cards: {
    cardLimitAP: "~cardLimitAP",
    cardLimitAPDirectLoan: "~cardLimitAPDirectLoan",
    cardLimitAR: "~cardLimitAR",
    cardLimitPO: "~cardLimitPO",
  },

  texts: {
    textFieldIssue: "~textFieldIssue",
    textFieldNominal: "~textFieldNominal",
    textFieldDate: "~textFieldDate",
    textFieldSupplierName: "~textFieldSupplierName",
    textFieldPhone: "~textFieldPhone",
    textFieldSearchBank: "~textFieldSearchBank",
    textFieldAccountNo: "~textFieldAccountNo",
    textFieldSupplierName: "~textFieldSupplierName",
    textFieldPhone: "~textFieldPhone",
  },


  usingLimitLoanDisbursementTypeAP() {
    I.seeElement(this.cards.cardLimitAP);
    I.waitForElement(this.buttons.buttonUseLimit);
    I.click(this.buttons.buttonUseLimit);
  },

  async validateSectionHavePastDueDate() {
    const pastDueDate = await I.see('Anda Memiliki Tagihan Yang Belum Dibayar');
    if (pastDueDate) {
      // Click the "Gunakan Limit" button
      I.see('Selesaikan pembayaran terlebih dahulu sebelum menggunakan limit');
      I.seeElement(this.buttons.buttonDismiss);
      I.seeElement(this.buttons.buttonClose);
      I.click(this.buttons.buttonDismiss);
      I.click(this.buttons.buttonUseLimit);
      I.click(this.buttons.buttonClose);
    } else {
      I.dontSee('Selesaikan pembayaran terlebih dahulu sebelum menggunakan limit');
      I.seeElement(this.buttons.buttonDetailLimit);
    }
  },



}
