const { I } = inject();

module.exports = {

  buttons: {
    tabDocument: "~tabDocument",
    documentGiro: "~buttonGiroDoc",
    documentLoan: "~buttonLoanDoc",
    documentOther: "~buttonOtherDoc",
    itemLoan: "~buttonSelectLoan",
    itemDocumentLoan: {xpath: '//android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[1]'},
    downloadNib: "~buttonDownloadNib",
    downloadDeed: "~buttonDownloadAkta",
    downloadSk: "~buttonDownloadSk",
    downloadLetter: "~buttonSuratPernyataanPendirianPt",
    downloadNpwp: "~buttonDownloadNpwp",
    downloadLastCertificate: "~buttonAktaPerubahanTerakhir",
    downloadLastSk: "~buttonSkKemenkumhamPerubahan",
    downloadLastLetter: "~buttonSuratPernyataanPerubahanTerakhir",
    closePopUp: "~buttonClose",
    activatedNow: "~buttonActiveNow",
    seeDocument: "~buttonSeeDocument",
    eyePassword: "~iconShowHidePassword",
    uploadOtherDoc: "~buttonUploadOtherDoc",
    upload: "~buttonUpload",
    closeBottomSheet: "~buttonClose",
    deleteDoc: "~buttonDelete",
    confirmCancel: "~buttonNoCancel",
    backToUpload: "~buttonYesCancel",
    cancelDelete: "~buttonNoDelete",
    confirmDelete: "~buttonYesDelete",
    saveDocument: "~buttonSaveDoc",
    deleteDetail: "~buttonDeleteDoc",
    downloadOtherDoc: "~buttonDownload",
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
  texts: {
    fileName: "~textDocName",
    fileSize: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.widget.TextView[4]"},
  },
  icons:{
    completeUpload: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[1]"},
  },
  googleElement: {
    titleDrive: {xpath: "(//android.widget.TextView[@text=\"Drive\"])[1]"},
    search: {xpath: "//android.widget.Button[@content-desc=\"Search\"]"},
    fieldSearch: {class: 'android.widget.AutoCompleteTextView'},
    firstOption: {xpath: "//androidx.cardview.widget.CardView[1]/androidx.cardview.widget.CardView/android.widget.RelativeLayout/android.widget.FrameLayout[1]"},
    firstCardView: {xpath: '//android.widget.GridView/androidx.cardview.widget.CardView[1]/androidx.cardview.widget.CardView[1]'},
    titleFirstOption: {xpath: "//android.widget.RelativeLayout[1]/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.TextView[1]"},
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

  clickMenuOtherDocument(){
    I.waitForElement(this.buttons.documentOther, 10);
    I.click(this.buttons.documentOther);
  },

  clickUploadOtherDocument(){
    I.waitForElement(this.buttons.uploadOtherDoc, 10);
    I.click(this.buttons.uploadOtherDoc);
  },

  closeBottomSheet(){
    I.waitForElement(this.buttons.closeBottomSheet, 10);
    I.click(this.buttons.closeBottomSheet);
  },

  cancelUpload(){
    I.waitForElement(this.buttons.confirmCancel, 10);
    I.click(this.buttons.confirmCancel);
  },

  backToUpload(){
    I.waitForElement(this.buttons.backToUpload, 10);
    I.click(this.buttons.backToUpload);
  },

  clickUploadDoc(){
    I.waitForElement(this.buttons.upload, 10);
    I.click(this.buttons.upload);
  },

  clickDeleteDoc(){
    I.waitForElement(this.buttons.deleteDoc, 10);
    I.click(this.buttons.deleteDoc);
  },

  deleteOtherDoc(index){
    I.waitForElement(this.buttons.deleteDetail+index, 10);
    I.click(this.buttons.deleteDetail+index);
  },

  saveDocument(){
    I.waitForElement(this.buttons.saveDocument, 10);
    I.click(this.buttons.saveDocument);
  },

  cancelDeleteDoc(){
    I.waitForElement(this.buttons.cancelDelete, 10);
    I.click(this.buttons.cancelDelete);
  },

  confirmDeleteDoc(){
    I.waitForElement(this.buttons.confirmDelete, 10);
    I.click(this.buttons.confirmDelete);
  },

  async getFileName(){
    I.waitForElement(this.texts.fileName, 10);
    return await I.grabTextFrom(this.texts.fileName);
  },

  async getFileNameInListOtherDoc(index){
    I.waitForElement(this.texts.fileName+index, 10);
    return await I.grabTextFrom(this.texts.fileName+index);
  },

  async searchGoogleDrive(fileName){

    I.waitForElement(this.googleElement.search, 20);
    I.click(this.googleElement.search);
    I.waitForElement(this.googleElement.fieldSearch, 20);
    I.click(this.googleElement.fieldSearch);
    I.wait(2);
    I.type(fileName, 100);
    I.wait(2);

    I.waitForElement(this.googleElement.firstOption, 20);

    return await I.grabTextFrom(this.googleElement.titleFirstOption);
  },

  clickFirstOptionSearch(){
    I.waitForElement(this.googleElement.firstOption, 20);

    I.click(this.googleElement.firstOption);
  }
}
