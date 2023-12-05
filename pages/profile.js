const { I } = inject();

module.exports = {
  buttons: {
    copyAccNumber: "~btnCopyAccountNumber",
    btnProfile: "~tabBusiness",
    documentProcuration: "~btnDownload",
    documentBusiness: "~buttonBusinessDoc",
    documentGiro: "~buttonGiroDoc",
    downloadNib: "~buttonDownloadNib",
    downloadDeed: "~buttonDownloadAkta",
    downloadSk: "~buttonDownloadSk",
    downloadNpwp: "~buttonDownloadNpwp",
  },

  clickTabProfile() {
    I.click(this.buttons.btnProfile);
  },

  clickDocumentBusiness(){
    I.waitForElement(this.buttons.documentBusiness, 10);
    I.click(this.buttons.documentBusiness);
  },

  clickDocumentGiro(){
    I.waitForElement(this.buttons.documentGiro, 10);
    I.click(this.buttons.documentGiro);
  }

}
