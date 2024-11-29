const { I } = inject();

module.exports = {

  buttons: {
    tabDocument: "~tabDocument",
    documentGiro: "~primaryFolderGiro",
    documentLoan: "~primaryFolderLoan",
    documentOther: "~buttonOtherDoc",
    itemLoan: "~buttonSelectLoan",
    itemDocumentLoan: { xpath: '//android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[1]' },
    downloadDoc: "~buttonInfo_",
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
    cancelDelete: "~buttonCancel",
    confirmDelete: "~buttonConfirmed",
    saveDocument: "~buttonSaveDoc",
    deleteDetail: "~buttonDeleteDoc",
    downloadOtherDoc: "~buttonDownload",
    createFolder: "~buttonNext",
    saveName: "~buttonNext",
    infoDoc: "~buttonInfo_",
    infoDocDetail: "~buttonInfo",
    infoDocTrash: "~buttonInfo_",
    infoDocTrashDetail: "~buttonInfo",
    changeName: "~buttonChangeName",
    itemOtherDoc: "~content_",
    itemOtherDocDetail: "~content_",
    trash: "~buttonTrash",
    openFolderTrash: "~buttonFolder_",
    openFileTrash: "~buttonFiles_",
    permanentDeleteDoc: "~buttonPermanentDeleted",
    permanentDeleteAll: "~buttonPermanentDeletedAll",
    confirmPermanentDelete: "~buttonYesCancel",
    cancelPermanentDelete: "~buttonNoCancel",
    restoreDoc: "~buttonRefund",
  },
  links: {
    usePassword: "~buttonUsePassword",
  },
  fields: {
    password: "~textFieldPassword",
    folderName: "~fieldFolderName",
    changeFolderName: "~fieldChangeFolder",
    changeFileName: "~fieldChangeName",
  },
  msgErrorFields: {
    password: "~textErrorPassword",
    folderName: "~fieldFolderNameError",
    changeFolderName: "~fieldChangeFolderError",
    changeFileName: "~fieldChangeNameError"
  },
  texts: {
    fileSize: { xpath: "//android.view.View[2]/android.widget.ScrollView/android.widget.TextView[3]" },
    fileNameUploaded: "~textDocName",
    titleDetailFolder: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.TextView",
    nameDocTrashRoot: {xpath: ""},
    nameDocTrashDetail: {xpath: ""},
  },
  icons: {
    completeUpload: { xpath: "//android.view.View[2]/android.widget.ScrollView/android.widget.ImageView" },
    resetName: "~buttonReset"
  },
  googleElement: {
    titleDrive: { xpath: "(//android.widget.TextView[@text=\"Drive\"])[1]" },
    search: { xpath: "//android.widget.TextView[@content-desc=\"Search\"]" },
    fieldSearch: { class: 'android.widget.AutoCompleteTextView' },
    firstOption: { xpath: "//androidx.cardview.widget.CardView[1]/androidx.cardview.widget.CardView/android.widget.RelativeLayout/android.widget.FrameLayout[1]" },
    firstCardView: { xpath: '//android.widget.GridView/androidx.cardview.widget.CardView[1]/androidx.cardview.widget.CardView[1]' },
    titleFirstOption: { xpath: "//android.widget.RelativeLayout[1]/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.TextView[1]" },
  },
  statusElement: {
    buttonSaveOtherDoc: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]" },
    fieldNameDoc: {xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText"},
    buttonSeeDoc: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View"}
  },

  clickTabDocument() {
    I.waitForElement(this.buttons.tabDocument, 10);
    I.click(this.buttons.tabDocument);
  },
  clickDocumentGiro() {
    I.waitForElement(this.buttons.documentGiro, 10);
    I.click(this.buttons.documentGiro);
  },
  clickDocumentLoan() {
    I.waitForElement(this.buttons.documentLoan, 10);
    I.click(this.buttons.documentLoan);
  },
  clickItemLoan() {
    I.waitForElement(this.buttons.itemLoan, 10);
    I.click(this.buttons.itemLoan);
  },

  closePopUpBiometricInactive() {
    I.waitForElement(this.buttons.closePopUp, 10);
    I.click(this.buttons.closePopUp);
  },

  closeBottomSheetPassword() {
    I.waitForElement(this.buttons.closePopUp, 10);
    I.click(this.buttons.closePopUp);
  },

  clickActivatedBiometric() {
    I.waitForElement(this.buttons.activatedNow, 10);
    I.click(this.buttons.activatedNow);
  },

  clickLinkUsePassword() {
    I.waitForElement(this.links.usePassword, 10);
    I.click(this.links.usePassword);
  },

  inputPassword(password) {
    I.waitForElement(this.fields.password, 10);
    I.setText(this.fields.password, password);
  },

  clickIconEyePassword() {
    I.waitForElement(this.buttons.eyePassword, 10);
    I.click(this.buttons.eyePassword);
  },

  clearPassword() {
    I.waitForElement(this.fields.password, 10);
    I.clearField(this.fields.password);
  },

  clickSeeDocument() {
    I.waitForElement(this.buttons.seeDocument, 10);
    I.click(this.buttons.seeDocument);
  },

  async getMessageErrorPassword() {
    I.waitForElement(this.msgErrorFields.password, 10);
    return await I.grabTextFrom(this.msgErrorFields.password);
  },

  clickMenuOtherDocument() {
    I.waitForElement(this.buttons.documentOther, 10);
    I.click(this.buttons.documentOther);
  },

  clickUploadOtherDocument() {
    I.waitForElement(this.buttons.uploadOtherDoc, 10);
    I.click(this.buttons.uploadOtherDoc);
  },

  closeBottomSheet() {
    I.waitForElement(this.buttons.closeBottomSheet, 10);
    I.click(this.buttons.closeBottomSheet);
  },

  cancelUpload() {
    I.waitForElement(this.buttons.confirmCancel, 10);
    I.click(this.buttons.confirmCancel);
  },

  backToUpload() {
    I.waitForElement(this.buttons.backToUpload, 10);
    I.click(this.buttons.backToUpload);
  },

  clickUploadDoc() {
    I.waitForElement(this.buttons.addDoc, 10);
    I.click(this.buttons.addDoc);
  },

  uploadFile() {
    I.waitForElement(this.buttons.upload, 10);
    I.click(this.buttons.upload);
  },

  clickAddFolder() {
    I.waitForElement(this.buttons.addFolder, 10);
    I.click(this.buttons.addFolder);
  },

  clickDeleteDoc() {
    I.waitForElement(this.buttons.deleteDoc, 10);
    I.click(this.buttons.deleteDoc);
  },

  deleteOtherDoc(index) {
    I.waitForElement(this.buttons.deleteDetail + index, 10);
    I.click(this.buttons.deleteDetail + index);
  },

  saveDocument() {
    I.waitForElement(this.buttons.saveDocument, 10);
    I.click(this.buttons.saveDocument);
  },

  cancelDeleteDoc() {
    I.waitForElement(this.buttons.cancelDelete, 10);
    I.click(this.buttons.cancelDelete);
  },

  confirmDeleteDoc() {
    I.waitForElement(this.buttons.confirmDelete, 10);
    I.click(this.buttons.confirmDelete);
  },

  cancelDeleteFolder() {
    I.waitForElement(this.buttons.cancelDelete, 10);
    I.click(this.buttons.cancelDelete);
  },

  confirmDeleteFolder() {
    I.waitForElement(this.buttons.confirmDelete, 10);
    I.click(this.buttons.confirmDelete);
  },

  async getFileName() {
    I.waitForElement(this.texts.fileNameUploaded, 10);
    return await I.grabTextFrom(this.texts.fileNameUploaded);
  },

  async getFileNameInListOtherDoc(index) {
    const finalIndex = index + 2;
    const firstPattern = "//android.widget.ScrollView/android.widget.TextView"
    const finalPattern = firstPattern + "[" + finalIndex + "]";

    I.waitForElement(finalPattern, 20);
    return await I.grabTextFrom(finalPattern);
  },

  async getFileNameInListDetailOtherDoc(index) {
    const firstPattern = "//android.widget.ScrollView/android.widget.TextView"
    const finalPattern = firstPattern + "[" + index + "]";

    I.waitForElement(finalPattern, 20);
    return await I.grabTextFrom(finalPattern);
  },

  async getFolderNameInListOtherDoc(index) {
    const finalIndex = index+1;
    const firstPattern = "//android.widget.ScrollView/android.view.View";
    const lastPattern = "/android.widget.TextView";

    const finalPattern = firstPattern + "[" + finalIndex + "]" + lastPattern

    I.waitForElement(finalPattern, 20);
    return await I.grabTextFrom(finalPattern);
  },

  async getFolderNameInListDetailOtherDoc(index) {
    const firstPattern = "//android.widget.ScrollView/android.view.View";
    const lastPattern = "/android.widget.TextView";

    const finalPattern = firstPattern + "[" + index + "]" + lastPattern

    I.waitForElement(finalPattern, 20);
    return await I.grabTextFrom(finalPattern);
  },

  async searchGoogleDrive(fileName) {

    I.waitForElement(this.googleElement.search, 20);
    I.click(this.googleElement.search);
    I.waitForElement(this.googleElement.fieldSearch, 20);
    I.click(this.googleElement.fieldSearch);
    I.wait(2);
    I.type(fileName, 100);
    I.wait(4);

    I.waitForElement(this.googleElement.firstOption, 20);

    return await I.grabTextFrom(this.googleElement.titleFirstOption);
  },

  clickFirstOptionSearch() {
    I.waitForElement(this.googleElement.firstOption, 20);
    I.click(this.googleElement.firstOption);
  },

  fillFieldFolderName(folderName) {
    I.waitForElement(this.fields.folderName, 20);
    I.clearField(this.fields.folderName);
    I.setText(this.fields.folderName, folderName);
    I.hideDeviceKeyboard();
  },

  fillFieldFolderNameViaKeyboard(folderName) {
    I.waitForElement(this.fields.folderName, 20);
    I.clearField(this.fields.folderName);
    I.click(this.fields.folderName);
    I.type(folderName, 300);
    I.hideDeviceKeyboard();
  },

  fillNewFolderName(folderName) {
    I.waitForElement(this.fields.changeFolderName, 20);
    I.setText(this.fields.changeFolderName, folderName);
    I.hideDeviceKeyboard();
  },

  fillNewFolderNameViaKeyboard(folderName) {
    I.waitForElement(this.fields.changeFolderName, 20);
    I.clearField(this.fields.changeFolderName);
    I.click(this.fields.changeFolderName);
    I.type(folderName, 300);
    I.hideDeviceKeyboard();
  },

  fillNewFileName(fileName) {
    I.waitForElement(this.fields.changeFileName, 20);
    I.setText(this.fields.changeFileName, fileName);
    I.hideDeviceKeyboard();
  },

  fillNewFileNameViaKeyboard(fileName) {
    I.waitForElement(this.fields.changeFileName, 20);
    I.clearField(this.fields.changeFileName);
    I.click(this.fields.changeFileName);
    I.type(fileName, 300);
    I.hideDeviceKeyboard();
  },

  clickIconClear() {
    I.waitForElement(this.icons.resetName, 20);
    I.click(this.icons.resetName);
  },

  clearViaKeyboardChangeFolderName() {
    I.waitForElement(this.fields.changeFolderName, 20);
    I.clearField(this.fields.changeFolderName);
  },

  clearViaKeyboardChangeFileName() {
    I.waitForElement(this.fields.changeFileName, 20);
    I.clearField(this.fields.changeFileName);
  },

  clearViaKeyboardNewFolderName() {
    I.waitForElement(this.fields.folderName, 20);
    I.clearField(this.fields.folderName);
  },

  createNewFolder() {
    I.waitForElement(this.buttons.createFolder, 20);
    I.click(this.buttons.createFolder);
  },

  saveName() {
    I.waitForElement(this.buttons.saveName, 20);
    I.click(this.buttons.saveName);
  },

  clickInfoDocBucketlist(index) {
    I.waitForElement(this.buttons.infoDoc + index, 20);
    I.click(this.buttons.infoDoc + index);
  },

  clickInfoFolderBucketlist(index) {
    I.waitForElement(this.buttons.infoDoc + index, 20);
    I.click(this.buttons.infoDoc + index);
  },

  clickInfoFolderDetail() {
    I.waitForElement(this.buttons.infoDocDetail, 20);
    I.click(this.buttons.infoDocDetail);
  },

  clickChangeName() {
    I.waitForElement(this.buttons.changeName, 20);
    I.click(this.buttons.changeName);
  },

  clickItemOtherDoc() {
    I.waitForElement(this.buttons.itemOtherDoc+"0", 20);
    I.click(this.buttons.itemOtherDoc+"0");
  },

  clickFolderInDetail(index) {
    I.waitForElement(this.buttons.itemOtherDocDetail+index, 20);
    I.click(this.buttons.itemOtherDocDetail+index);
  },

  async getMessageErrorFieldNewFolder() {
    I.waitForElement(this.msgErrorFields.folderName, 10);
    return await I.grabTextFrom(this.msgErrorFields.folderName);
  },

  async getMessageErrorFieldChangeFolder() {
    I.waitForElement(this.msgErrorFields.changeFolderName, 10);
    return await I.grabTextFrom(this.msgErrorFields.changeFolderName);
  },

  async getMessageErrorFieldChangeFile() {
    I.waitForElement(this.msgErrorFields.changeFileName, 10);
    return await I.grabTextFrom(this.msgErrorFields.changeFileName);
  },

  async getTitleFolderDetail() {
    I.waitForElement(this.texts.titleDetailFolder, 10);
    return await I.grabTextFrom(this.texts.titleDetailFolder);
  },

  clickMenuTrash(){
    I.waitForElement(this.buttons.trash, 20);
    I.click(this.buttons.trash);
  },

  clickMenuTitleTrash(){
    I.waitForElement(this.buttons.infoDocTrashDetail, 20);
    I.click(this.buttons.infoDocTrashDetail);
  },

  clickInfoDetailFolderInTrash(index){
    I.waitForElement(this.buttons.infoDocTrash+index, 20);
    I.click(this.buttons.infoDocTrash+index);
  },

  clickInfoDetailFileInTrash(index){
    I.waitForElement(this.buttons.infoDocTrash+index, 20);
    I.click(this.buttons.infoDocTrash+index);
  },

  clickDeleteAllPermanent(){
    I.waitForElement(this.buttons.permanentDeleteAll, 20);
    I.click(this.buttons.permanentDeleteAll);
  },

  confirmDeleteAll(){
    I.waitForElement(this.buttons.confirmPermanentDelete, 20);
    I.click(this.buttons.confirmPermanentDelete);
  },

  cancelDeleteAll(){
    I.waitForElement(this.buttons.cancelPermanentDelete, 20);
    I.click(this.buttons.cancelPermanentDelete);
  },

  clickRestore(){
    I.waitForElement(this.buttons.restoreDoc, 20);
    I.click(this.buttons.restoreDoc);
  },

  clickDeletePermanent(){
    I.waitForElement(this.buttons.permanentDeleteDoc, 20);
    I.click(this.buttons.permanentDeleteDoc);
  },

  confirmDelete(){
    I.waitForElement(this.buttons.confirmDelete, 20);
    I.click(this.buttons.confirmDelete);
  },

  cancelDelete(){
    I.waitForElement(this.buttons.cancelDelete, 20);
    I.click(this.buttons.cancelDelete);
  },

  openFolderTrash(index){
    I.waitForElement(this.buttons.openFolderTrash+index, 20);
    I.click(this.buttons.openFolderTrash+index);
  },

  async getDocNameTrashRoot(index) {
    I.waitForElement(this.texts.nameDocTrashRoot+index, 10);
    return await I.grabTextFrom(this.texts.nameDocTrashRoot+index);
  },

  async getDocNameTrashDetail(index) {
    I.waitForElement(this.texts.nameDocTrashDetail+index, 10);
    return await I.grabTextFrom(this.texts.nameDocTrashDetail+index);
  },

}
