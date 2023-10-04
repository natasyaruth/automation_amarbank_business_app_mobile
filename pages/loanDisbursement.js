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

  async validateLoanIsTenorMoreThanPastDueDate() {
    const loanTenorMoreThanPastDueDate = await I.see('Pengajuan Anda Melebihi Batas Aktif Fasilitas');
    if (loanTenorMoreThanPastDueDate) {
      I.see('Fasilitas akan berakhir pada');
      I.seeElement(this.buttons.buttonDismiss);
      I.seeElement(this.buttons.buttonClose);
      I.click(this.buttons.buttonDismiss);
      I.click(this.buttons.buttonUseLimit);
      I.click(this.buttons.buttonClose);
    } else {
      I.dontSee('Pengajuan Anda Melebihi Batas Aktif Fasilitas');
      I.seeElement(this.buttons.buttonDetailLimit);
    }
  },

  async validateLoanTenorLessThanPastDueDate() {
    const loanTenorLessThanPastDueDate = await I.dontSee('Pengajuan Anda Melebihi Batas Aktif Fasilitas');
    if (loanTenorLessThanPastDueDate) {
      I.seeElement(this.buttons.buttonDetailLimit);
    } else {
      I.See('Pengajuan Anda Melebihi Batas Aktif Fasilitas');
      I.dontSeeElement(this.buttons.buttonDetailLimit);
    }
  },

  async validateAlreadyUploadInvoice() {
    const alreadyUploadInvoice = await I.seeElement(this.buttons.buttonDetailInvoice);
    if (alreadyUploadInvoice) {
      I.see('Invoice Tersedia');
      I.seeElement(this.buttons.buttonDetailInvoice);
      I.dontSee('Supplier Anda Belum Upload Invoice');
    } else {
      I.dontSee(this.buttons.buttonDetailInvoice);
      I.see('Supplier Anda Belum Upload Invoice');
    }
  },

  async validateNotUploadInvoiceYet() {
    const notUploadInvoiceYet = await I.seeElement(this.buttons.buttonDetailLimit);
    if (notUploadInvoiceYet) {
      I.dontSee('Invoice Tersedia');
      I.dontSeeElement(this.buttons.buttonDetailInvoice);
      I.dontSee('Supplier Anda Belum Upload Invoice');
    } else {
      I.seeElement(this.buttons.buttonDetailInvoice);
      I.see('Invoice Tersedia');
    }
  },
}
