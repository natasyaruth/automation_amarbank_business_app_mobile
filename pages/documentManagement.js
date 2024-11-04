const { I } = inject();

module.exports = {

  buttons: {
    tabDocument: "~tabDocument",
    documentGiro: "~primaryFolderGiro",
    documentLoan: "~primaryFolderLoan",
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
    uploadOtherDoc: "~addFolderDoc",
    addDoc: "~addDoc",
    addFolder: "~addFolder",
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
    createFolder: "~buttonNext",
    saveName: "~buttonNext",
    infoDoc: "~buttonInfo_",
    infoDocDetail: "~buttonInfo",
    changeName: "~buttonChangeName",
    itemOtherDoc: {xpath: ""},
    itemOtherDocDetail: {xpath: ""},
  },
  links:{
    usePassword: "~buttonUsePassword",
  },
  fields:{
    password: "~textFieldPassword",
    folderName: "~fieldFolderName",
    changeFolderName: "~fieldChangeFolder",
    changeFileName: "~fieldChangeName",
  },
  msgErrorFields:{
    password: "~textErrorPassword",
    folderName: "~fieldFolderNameError",
    changeFolderName: "~fieldChangeFolderError",
    changeFileName: "~fieldChangeNameError"
  },
  texts: {
    fileName: {xpath: ""},
    fileNameDetail: {xpath: ""},
    fileSize: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.widget.TextView[4]"},
  },
  icons:{
    completeUpload: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[1]"},
    resetName: "~buttonReset"
  },
  googleElement: {
    titleDrive: {xpath: "(//android.widget.TextView[@text=\"Drive\"])[1]"},
    search: {xpath: "//android.widget.Button[@content-desc=\"Search\"]"},
    fieldSearch: {class: 'android.widget.AutoCompleteTextView'},
    firstOption: {xpath: "//androidx.cardview.widget.CardView[1]/androidx.cardview.widget.CardView/android.widget.RelativeLayout/android.widget.FrameLayout[1]"},
    firstCardView: {xpath: '//android.widget.GridView/androidx.cardview.widget.CardView[1]/androidx.cardview.widget.CardView[1]'},
    titleFirstOption: {xpath: "//android.widget.RelativeLayout[1]/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.TextView[1]"},
  },
  statusElement: {
    buttonSaveOtherDoc: {xpath: ""},
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
    I.waitForElement(this.buttons.addDoc, 10);
    I.click(this.buttons.addDoc);
  },

  clickAddFolder(){
    I.waitForElement(this.buttons.addFolder, 10);
    I.click(this.buttons.addFolder);
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
    I.waitForElement(this.texts.fileNameDetail, 10);
    return await I.grabTextFrom(this.texts.fileNameDetail);
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
  },

  fillFieldFolderName(folderName){
    I.waitForElement(this.fields.folderName, 20);
    I.setText(this.fields.folderName, folderName);
    I.hideDeviceKeyboard();
  },

  fillFieldFolderNameViaKeyboard(folderName){
    I.waitForElement(this.fields.folderName, 20);
    I.click(this.fields.folderName);
    I.type(folderName, 300);
    I.hideDeviceKeyboard();
  },

  fillNewFolderName(folderName){
    I.waitForElement(this.fields.changeFolderName, 20);
    I.setText(this.fields.changeFolderName, folderName);
    I.hideDeviceKeyboard();
  },

  fillNewFileName(fileName){
    I.waitForElement(this.fields.changeFileName, 20);
    I.setText(this.fields.changeFileName, fileName);
    I.hideDeviceKeyboard();
  },

  clickIconClear(){
    I.waitForElement(this.icons.resetName, 20);
    I.click(this.icons.resetName);
  },

  clearViaKeyboardChangeFolderName(){
    I.waitForElement(this.fields.changeFolderName, 20);
    I.clearField(this.fields.changeFolderName);
  },

  clearViaKeyboardChangeFileName(){
    I.waitForElement(this.fields.changeFileName, 20);
    I.clearField(this.fields.changeFileName);
  },

  clearViaKeyboardNewFolderName(){
    I.waitForElement(this.fields.folderName, 20);
    I.clearField(this.fields.folderName);
  },

  createNewFolder(){
    I.waitForElement(this.buttons.createFolder, 20);
    I.click(this.buttons.createFolder);
  },

  saveName(){
    I.waitForElement(this.buttons.saveName, 20);
    I.click(this.buttons.saveName);
  },

  clickInfoDocBucketlist(index){
    I.waitForElement(this.buttons.infoDoc+index, 20);
    I.click(this.buttons.infoDoc+index);
  },

  clickInfoFolderBucketlist(index){
    I.waitForElement(this.buttons.infoDoc+index, 20);
    I.click(this.buttons.infoDoc+index);
  },

  clickInfOFolderDetail(){
    I.waitForElement(this.buttons.infoDocDetail, 20);
    I.click(this.buttons.infoDocDetail);
  },

  clickChangeName(){
    I.waitForElement(this.buttons.changeName, 20);
    I.click(this.buttons.changeName);
  },

  clickItemOtherDoc(){
    I.waitForElement(this.buttons.itemOtherDoc, 20);
    I.click(this.buttons.itemOtherDoc);
  },

  clickItemOtherDocDetail(){
    I.waitForElement(this.buttons.itemOtherDocDetail, 20);
    I.click(this.buttons.itemOtherDocDetail);
  },

  async getMessageErrorFieldNewFolder(){
    I.waitForElement(this.msgErrorFields.folderName, 10);
    return await I.grabTextFrom(this.msgErrorFields.folderName);
  },

  async getMessageErrorFieldChangeFolder(){
    I.waitForElement(this.msgErrorFields.changeFolderName, 10);
    return await I.grabTextFrom(this.msgErrorFields.changeFolderName);
  },

  async getMessageErrorFieldChangeFile(){
    I.waitForElement(this.msgErrorFields.changeFileName, 10);
    return await I.grabTextFrom(this.msgErrorFields.changeFileName);
  },
}
