const { I } = inject();

module.exports = {
  buttons: {
    copyAccNumber: "~btnCopyAccountNumber",
    btnProfile: "~tabBusiness",
    documentProcuration: "~buttonPowerAttorney",
    documentBusiness: "~buttonBusinessDoc",
    documentGiro: "~buttonGiroDoc",
    downloadNib: "~buttonDownloadNib",
    downloadDeed: "~buttonDownloadAkta",
    downloadSk: "~buttonDownloadSk",
    downloadNpwp: "~buttonDownloadNpwp",
    transactionApprovalDetail: "~transactionApprovalDetail",
  },

  clickTabProfile() {
    I.waitForElement(this.buttons.btnProfile, 20);
    I.click(this.buttons.btnProfile);
  },

  clickDocumentBusiness(){
    I.waitForElement(this.buttons.documentBusiness, 10);
    I.click(this.buttons.documentBusiness);
  },

  clickDocumentGiro(){
    I.waitForElement(this.buttons.documentGiro, 10);
    I.click(this.buttons.documentGiro);
  },

  openTransactionApproval(){
    I.waitForElement(this.buttons.transactionApprovalDetail, 10);
    I.click(this.buttons.transactionApprovalDetail);
  },

}
