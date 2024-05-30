const { I } = inject();

module.exports = {

  buttons: {
    tabDocument: "~tabDocument",
    documentGiro: "~buttonGiroDoc",
    documentLoan: "~buttonLoanDoc",
    itemLoan: "~buttonSelectLoan",
    itemDocumentLoan: {xpath: '//android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[1]'},
    downloadNib: "~buttonDownloadNib",
    downloadDeed: "~buttonDownloadAkta",
    downloadSk: "~buttonDownloadSk",
    downloadNpwp: "~buttonDownloadNpwp",
  },

  clickTabDocument(){
    I.waitForElement(this.buttons.tabDocument, 10);
    I.click(this.buttons.tabDocument);
  },
  clickDocumentGiro(){
    I.waitForElement(this.buttons.documentGiro, 10);
    I.click(this.buttons.documentGiro);
  },
  clickDocumentLoan(){
    I.waitForElement(this.buttons.documentLoan, 10);
    I.click(this.buttons.documentLoan);
  },
  clickItemLoan(){
    I.waitForElement(this.buttons.itemLoan, 10);
    I.click(this.buttons.itemLoan);
  }
}
