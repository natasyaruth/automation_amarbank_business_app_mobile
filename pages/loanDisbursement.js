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
    cardInvoice: "~cardInvoice",
  },

  textFields: {
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

  toastBars: {
    toastBarIssueHasBeenReported: "~toastBarIssueHasBeenReported",
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

  async validateSectionHaveNotPastDueDate() {
    const haveNotPastDueDate = await I.dontSee('Anda Memiliki Tagihan Yang Belum Dibayar');
    if (haveNotPastDueDate) {
      //Click the "Gunakan Limit" button
      I.dontSee('Selesaikan pembayaran terlebih dahulu sebelum menggunakan limit');
      I.seeElement(this.buttons.buttonDetailLimit);
    } else {
      I.see('Selesaikan pembayaran terlebih dahulu sebelum menggunakan limit');
      I.seeElement(this.buttons.buttonDismiss);
      I.seeElement(this.buttons.buttonClose);
      I.click(this.buttons.buttonDismiss);
      I.click(this.buttons.buttonUseLimit);
      I.click(this.buttons.buttonClose);
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

  goToProgramLoanInformation() {
    I.seeElement(this.buttons.buttonDetailLimit);
    I.click(this.buttons.buttonDetailLimit);
  },

  validateProgramLoanInformation() {
    I.waitForVisible('Informasi Program Pinjaman');
    I.see('Program pinjaman ini berlaku untuk semua pencairan invoice pembelian ke supplier Anda');
  },

  closeProgramLoanInformation() {
    I.click(this.buttons.buttonClose);
    I.waitForInvisible('Informasi Program Pinjaman');
    I.waitForVisible(this.buttons.buttonDetailLimit);
  },

  async goToCheckInvoiceDetail() {
    const buttonSelector = await (this.buttons.buttonDetailInvoice)[1];
    I.waitForVisible(buttonSelector);
    I.click(buttonSelector);
  },

  async InvoiceDetailConfirmation() {
    const InvoiceName1 = await I.grabTextFrom(this.cards.cardInvoice)[1];
    I.click(this.buttons.buttonDetailInvoice);
    const InvoiceName2 = await I.grabTextFrom('text 2');
    if (InvoiceName1 === InvoiceName2) {
      console.log('Invoice Name is matched');
    } else {
      console.log('Invoice name is not match');
    }
  },

  validateInvoiceConfirmationDetail() {
    I.see('Dokumen Invoice');
    I.see('Nominal Invoice');
    I.see('Nomor Invoice');
    I.see('Tanggal Invoice');
    I.see('Masa Berlaku Invoice');
    I.see('Rekening Supplier');
    I.seeElement(this.buttons.buttonDisburse);
    I.seeElement(this.buttons.buttonComplaint);
  },

  openDocumentPreview() {
    I.waitForElement(this.buttons.buttonPreview);
    I.click(this.buttons.buttonPreview);
  },

  hasAnInvoiceIssue() {
    I.seeElement(this.buttons.buttonComplaint);
    I.click(this.buttons.buttonComplaint);
  },

  validateInvoiceIssuePage() {
    I.waitForText('Invoice Tidak Sesuai');
    I.see('Jelaskan ketidaksesuaian atau kendala pada invoice pembelian dari supplier');
    I.see('Laporkan Kendala');
    I.seeElement(this.textFields.textFieldIssue);
    I.seeElement(this.buttons.buttonSendComplaint);
  },

  closeInvoiceIssuePage() {
    I.seeElement(this.buttons.buttonClose);
    I.waitForElement(this.buttons.buttonDetailInvoice);
  },

  inputInvoiceIssue() {
    I.fillField((this.textFields.textFieldIssue), ('Nominalnya tidak sesuai dengan yang disepakati di awal'));
    I.waitForClickable(this.buttons.buttonSendComplaint);
    I.click(this.buttons.buttonSendComplaint);
  },

  validateToastBarIssueHasBeenReported() {
    I.waitForText('Kendala invoice sudah dilaporkan');
    I.see('Kendala invoice sudah dilaporkan');
  },

  validateLimitInsufficient() {
    I.see('Limit Tidak Mencukupi');
    I.see('Mohon maaf, pembayaran invoice tidak dapat diproses karena limit pinjaman Anda tidak mencukupi untuk saat ini');
    I.seeElement(this.buttons.buttonDismiss);
    I.click(this.buttons.buttonDismiss);
  },

  async validateDisburseAmountPageMoreThan2Billion() {
    const disbursementAmountMoreThan2Billion = await I.See('Perhitungan Pencairan');
    if (disbursementAmountMoreThan2Billion) {
      I.see('Dana akan langsung dicairkan ke Supplier');
      I.see('Nominal Pinjaman');
      I.see('Nominal Pencairan');
      I.see('Pencairan 80%')
      I.see('Jatuh Tempo');
      I.see('Total Bunga');
      I.see('Bunga per bulan');
      I.see('Biaya Administrasi 3%');
      I.see('Nominal yang Dicairkan');
    } else {
      I.see('Dana akan langsung dicairkan ke Supplier');
      I.see('Nominal Pinjaman');
      I.dontSee('Nominal Pencairan');
      I.dontSee('Pencairan 80%')
      I.see('Jatuh Tempo');
      I.see('Total Bunga');
      I.see('Bunga per bulan');
      I.see('Biaya Administrasi 3%');
      I.see('Nominal yang Dicairkan');
    }
  },

  async validateDisburseAmountPageLessOrEqualThan2Billion() {
    const disbursementAmountLessOrEqualThan2Billion = await I.See('Perhitungan Pencairan');
    if (disbursementAmountLessOrEqualThan2Billion) {
      I.see('Dana akan langsung dicairkan ke Supplier');
      I.see('Nominal Pinjaman');
      I.dontSee('Nominal Pencairan');
      I.dontSee('Pencairan 80%')
      I.see('Jatuh Tempo');
      I.see('Total Bunga');
      I.see('Bunga per bulan');
      I.see('Biaya Administrasi 3%');
      I.see('Nominal yang Dicairkan');
    } else {
      I.see('Dana akan langsung dicairkan ke Supplier');
      I.see('Nominal Pinjaman');
      I.see('Nominal Pencairan');
      I.see('Pencairan 80%')
      I.see('Jatuh Tempo');
      I.see('Total Bunga');
      I.see('Bunga per bulan');
      I.see('Biaya Administrasi 3%');
      I.see('Nominal yang Dicairkan');
    }
  },

  validateSendPDCPage() {
    I.waitForText('Pengiriman PDC (Cek Mundur');
    I.see('Segera mengirimkan PDC sebagai jaminan ke alamay berikut');
    I.see('Alamat Pengiriman');
    I.see('Menara Standard Chartered Lt.11, Jl. Prof. DR. Satrio No.164, RT.4/RW.4, Karet Semanggi, Setiabudi, Jakarta Selatan 12930')
    I.seeElement(this.buttons.buttonCopy);
    I.see('Penerima');
    I.see('Amar Bank (Digital SMB team');
    I.see('Pastikan isi nominal pada PDC (cek mundur) sesuai dengan nominal pinjaman');
    I.see('Nominal Pinjaman');
    I.seeElement(this.buttons.buttonClose);
  },

  copyDeliveryAddress() {
    I.click(this.buttons.buttonCopy);
    I.waitForText('Berhasil disalin');
    I.see('Berhasil disalin');
  },

  closeDeliveryAddress() {
    I.click(this.buttons.buttonClose);
    I.waitForElement(this.buttons.buttonDetailInvoice);
    I.seeElement(this.buttons.buttonDetailInvoice);
  },

  //Loan Type AP - Direct Loan

  usingLimitLoanDisbursementTypeAPDirectLoan() {
    I.seeElement(this.cards.cardLimitAPDirectLoan);
    I.waitForElement(this.buttons.buttonUseLimit);
    I.click(this.buttons.buttonUseLimit);
  },

  validateAnchorDetail() {
    I.waitForElement(this.buttons.buttonUpload);
    I.seeElement(this.buttons.buttonUpload);
    I.seeElement(this.buttons.buttonDetailLimit);
  },




}
