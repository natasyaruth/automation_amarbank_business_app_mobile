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
    closePopUp: "~buttonClose",
    activatedNow: "~buttonActiveNow",
    seeDocument: "~buttonSeeDocument",
    eyePassword: "~iconShowHidePassword",
  },
  links:{
    usePassword: "~buttonUsePassword",
  },
  fields:{
    password: "~textFieldPassword",
  },
  msgErrorFields:{
    password: "~textErrorPassword",
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
  },

  closePopUpBiometricInactive(){
    I.waitForElement(this.buttons.closePopUp, 10);
    I.click(this.buttons.closePopUp);
  },

  closeBottomSheetPassword(){
    I.waitForElement(this.buttons.closePopUp, 10);
    I.click(this.buttons.closePopUp);
  },

  clickActivatedBiometric(){
    I.waitForElement(this.buttons.activatedNow, 10);
    I.click(this.buttons.activatedNow);
  },

  clickLinkUsePassword(){
    I.waitForElement(this.links.usePassword, 10);
    I.click(this.links.usePassword);
  },

  inputPassword(password){
    I.waitForElement(this.fields.password, 10);
    I.setText(this.fields.password, password);
  },

  clickIconEyePassword(){
    I.waitForElement(this.buttons.eyePassword, 10);
    I.click(this.buttons.eyePassword);
  },

  clearPassword(){
    I.waitForElement(this.fields.password, 10);
    I.clearField(this.fields.password);
  },

  clickSeeDocument(){
    I.waitForElement(this.buttons.seeDocument, 10);
    I.click(this.buttons.seeDocument);
  },

  async getMessageErrorPassword(){
    I.waitForElement(this.msgErrorFields.password, 10);
    return await I.grabTextFrom(this.msgErrorFields.password);
  },
}
