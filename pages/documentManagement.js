const { I, getDataDao, resetStateDao } = inject();

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
    cancelDelete: "~buttonConfirmed",
    confirmDelete: "~buttonCancel",
    saveDocument: "~buttonSaveDoc",
    deleteDetail: "~buttonDeleteDoc",
    downloadOtherDoc: "~buttonDownload",
    downloadGiroDoc: "~buttonDownload",
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
    confirmPermanentDelete: "~buttonCancel",
    cancelPermanentDelete: "~buttonConfirmed",
    restoreDoc: "~buttonRefund",
    copyMove: "~buttonCopyMove",
    addFolderFromMoveCopy: "~buttonAddFolder",
    cancelMoveCopy: "~buttonCancel",
    moveAndCopy: "~buttonMove",
    confirmMove: "~buttonMove",
    move: "~MoveButton",
    copy: "~btnDuplicate",
    buttonNantiSaja: "~buttonBackLoan",
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
    changeFileName: "~fieldChangeNameError",
  },
  texts: {
    titleDocBrankas: {xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.TextView"},
    titleBottomSheet: {xpath:"/hierarchy/android.view.ViewGroup/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.TextView"},
    fileSize: { xpath: "//android.view.View[2]/android.widget.ScrollView/android.widget.TextView[3]" },
    fileNameUploaded: "~textDocName",
    titleDetailFolder: "//android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.TextView",
    fileNameNIB: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[2]"},
    fileNameAktaPendirian: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[5]"},
    fileNameSKKemPendirian: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[8]"},
    fileNameNPWPBisnisCompany: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[11]"},
    fileNameNPWPBisnisIndividualCompany: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[5]"},
    fileNameSerPendaftaran: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[8]"},
    fileNameSerPerubahanTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[14]"},
    fileNameAktaPerTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[14]"},
    fileNameSuratPerPendirian: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[11]"},
    fileNameSuratPerPerubahanTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[17]"},
    fileNameSKKemPerTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[17]"},
    extTypeNIB: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[3]"},
    extTypeAktaPendirian: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[6]"},
    extTypeSKKemPendirian: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[9]"},
    extTypeNPWPBisnisCompany: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[12]"},
    extTypeNPWPBisnisIndividualCompany: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[6]"},
    extTypeSerPendaftaran: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[9]"},
    extTypeSerPerubahanTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[15]"},
    extTypeAktaPerTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[15]"},
    extTypeSuratPerPendirian: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[12]"},
    extTypeSuratPerPerubahanTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[18]"},
    extTypeSKKemPerTerakhir: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TextView[18]"},
  },
  icons: {
    completeUpload: { xpath: "//android.view.View[2]/android.widget.ScrollView/android.widget.ImageView" },
    resetName: "~buttonReset",
    overflowMenu: {xpath: '(//android.widget.ImageView[@content-desc="file"])[1]'},
    iconDownload: "~download icon",
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
    fieldNameDoc: { xpath: "//android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText" },
    buttonSeeDoc: { xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View" },
    buttonMove: {xpath: ""},
  },
  folders: {
    folderNameFacility: { xpath: '(//android.view.View[@content-desc="folderName"])[3]' },
    folderDisbursement: "~folderName",
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

  async getTitleFolderBrankas() {
    I.waitForElement(this.texts.titleDocBrankas, 10);
    return await I.grabTextFrom(this.texts.titleDocBrankas);
  },

  async getFileNameInListOtherDoc(index) {
    const finalIndex = index + 1;
    const firstPattern = "//android.widget.ScrollView/android.view.View"
    const finalPattern = firstPattern + "[" + finalIndex + "]/android.widget.TextView";

    I.waitForElement(finalPattern, 20);
    return await I.grabTextFrom(finalPattern);
  },

  async getFileNameInListDetailOtherDoc(index) {
    const firstPattern = "//android.widget.ScrollView/android.view.View"
    const finalPattern = firstPattern + "[" + index + "]/android.widget.TextView";

    I.waitForElement(finalPattern, 20);
    return await I.grabTextFrom(finalPattern);
  },

  async getFolderNameInListOtherDoc(index) {
    const finalIndex = index + 1;
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
    I.clearField(this.fields.changeFileName);
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
    I.waitForElement(this.buttons.itemOtherDoc + "0", 20);
    I.click(this.buttons.itemOtherDoc + "0");
  },

  clickFolderInDetail(index) {
    I.waitForElement(this.buttons.itemOtherDocDetail + index, 20);
    I.click(this.buttons.itemOtherDocDetail + index);
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

  async getTitleBottomSheet() {
    I.waitForElement(this.texts.titleBottomSheet, 10);
    return await I.grabTextFrom(this.texts.titleBottomSheet);
  },

  clickMenuTrash() {
    I.waitForElement(this.buttons.trash, 20);
    I.click(this.buttons.trash);
  },

  clickMenuTitleTrash() {
    I.waitForElement(this.buttons.infoDocTrashDetail, 20);
    I.click(this.buttons.infoDocTrashDetail);
  },

  clickInfoDetailFolderInTrash(index) {
    I.waitForElement(this.buttons.infoDocTrash + index, 20);
    I.click(this.buttons.infoDocTrash + index);
  },

  clickInfoDetailFileInTrash(index) {
    I.waitForElement(this.buttons.infoDocTrash + index, 20);
    I.click(this.buttons.infoDocTrash + index);
  },

  clickDeleteAllPermanent() {
    I.waitForElement(this.buttons.permanentDeleteAll, 20);
    I.click(this.buttons.permanentDeleteAll);
  },

  confirmDeleteAll() {
    I.waitForElement(this.buttons.confirmPermanentDelete, 20);
    I.click(this.buttons.confirmPermanentDelete);
  },

  cancelDeleteAll() {
    I.waitForElement(this.buttons.cancelPermanentDelete, 20);
    I.click(this.buttons.cancelPermanentDelete);
  },

  clickRestore() {
    I.waitForElement(this.buttons.restoreDoc, 20);
    I.click(this.buttons.restoreDoc);
  },

  clickDeletePermanent() {
    I.waitForElement(this.buttons.permanentDeleteDoc, 20);
    I.click(this.buttons.permanentDeleteDoc);
  },

  confirmDelete() {
    I.waitForElement(this.buttons.confirmDelete, 20);
    I.click(this.buttons.confirmDelete);
  },

  cancelDelete() {
    I.waitForElement(this.buttons.cancelDelete, 20);
    I.click(this.buttons.cancelDelete);
  },

  openFolderTrash(index) {
    I.waitForElement(this.buttons.openFolderTrash + index, 20);
    I.click(this.buttons.openFolderTrash + index);
  },

  async getFolderNameTrashRoot(index) {
    const textView = "/android.widget.TextView";
    const rootView = "//android.widget.LinearLayout/android.widget.FrameLayout/androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.view.View";
    const finalElement = rootView + "[" + index + "]" + textView;

    I.waitForElement(finalElement, 10);
    return await I.grabTextFrom(finalElement);
  },

  async getDocNameTrashRoot(index) {
    const idElement = this.buttons.openFileTrash.replace(/~/, '');
    const textView = "//android.view.View[@content-desc=\"" + idElement + index + "\"]/android.widget.TextView";

    I.waitForElement(textView, 10);
    return await I.grabTextFrom(textView);
  },

  async getDocNameTrashDetail(index) {
    I.waitForElement(this.texts.nameDocTrashDetail + index, 10);
    return await I.grabTextFrom(this.texts.nameDocTrashDetail + index);
  },

  async clickThreeDotFileGiro(userID, password, giroDoc) {
    switch (giroDoc) {
      case "NIB":
        I.waitForElement(this.buttons.downloadDoc + "0", 10);
        I.click(this.buttons.downloadDoc + "0");
        break;
      case "Akta Pendirian":
        I.waitForElement(this.buttons.downloadDoc + "1", 10);
        I.click(this.buttons.downloadDoc + "1");
        break;
      case "SK Kemenkumham Pendirian":
        I.waitForElement(this.buttons.downloadDoc + "2", 10);
        I.click(this.buttons.downloadDoc + "2");
        break;
      case "NPWP Bisnis":
        const legalityType = (await getDataDao.getLegalityType(userID, password)).legalityType;
        if (
          legalityType === "PT Perorangan" &&
          legalityType === "UD"
        ) {
          I.waitForElement(this.buttons.downloadDoc + "1", 10);
          I.click(this.buttons.downloadDoc + "1");

        } else {
          I.waitForElement(this.buttons.downloadDoc + "3", 10);
          I.click(this.buttons.downloadDoc + "3");
        }
        break;
      case "Akta Perubahan Terakhir":
        I.waitForElement(this.buttons.downloadDoc + "4", 10);
        I.click(this.buttons.downloadDoc + "4");
        break;
      case "SK Kemenkumham Perubahan Terakhir":
        I.waitForElement(this.buttons.downloadDoc + "5", 10);
        I.click(this.buttons.downloadDoc + "5");
        break;
      case "Sertifikat Pendaftaran":
        I.waitForElement(this.buttons.downloadDoc + "2", 10);
        I.click(this.buttons.downloadDoc + "2");
        break;
      case "Surat Pernyataan Pendirian":
        I.waitForElement(this.buttons.downloadDoc + "3", 10);
        I.click(this.buttons.downloadDoc + "3");
        break;
      case "Sertifikat Perubahan Terakhir":
        I.waitForElement(this.buttons.downloadDoc + "4", 10);
        I.click(this.buttons.downloadDoc + "4");
        break;
      case "Surat Pernyataan Perubahan Terakhir":
        I.waitForElement(this.buttons.downloadDoc + "5", 10);
        I.click(this.buttons.downloadDoc + "5");
        break;
      default:
        throw new Error("Not recognize the giro document name");
    }
  },

  clickMoveAndCopy(){
    I.waitForElement(this.buttons.copyMove, 20);
    I.click(this.buttons.copyMove);
  },

  cancelMoveAndCopy(){
    I.waitForElement(this.buttons.cancelMoveCopy, 20);
    I.click(this.buttons.cancelMoveCopy);
  },

  moveAndCopy(){
    I.waitForElement(this.buttons.moveAndCopy, 20);
    I.click(this.buttons.moveAndCopy);
  },

  clickCreateNewFolderInMoveAndCopy(){
    I.waitForElement(this.buttons.addFolderFromMoveCopy, 20);
    I.click(this.buttons.addFolderFromMoveCopy);
  },

  async getFileNameGiroNIB(){
    I.waitForElement(this.texts.fileNameNIB, 10);
    return I.grabTextFrom(this.texts.fileNameNIB);
  },

  async getFileNameGiroAktaPendirian(){
    I.waitForElement(this.texts.fileNameAktaPendirian, 10);
    return I.grabTextFrom(this.texts.fileNameAktaPendirian);
  },

  async getFileNameGiroSKKemPendirian(){
    I.waitForElement(this.texts.fileNameSKKemPendirian, 10);
    return I.grabTextFrom(this.texts.fileNameSKKemPendirian);
  },

  async getFileNameGiroNPWPBusinessCompany(){
    I.waitForElement(this.texts.fileNameNPWPBisnisCompany, 10);
    return I.grabTextFrom(this.texts.fileNameNPWPBisnisCompany);
  },

  async getFileNameGiroAktaPerTerakhir(){
    I.waitForElement(this.texts.fileNameAktaPerTerakhir, 10);
    return I.grabTextFrom(this.texts.fileNameAktaPerTerakhir);
  },

  async getFileNameSKKemPerTerakhir(){
    I.waitForElement(this.texts.fileNameSKKemPerTerakhir, 10);
    return I.grabTextFrom(this.texts.fileNameSKKemPerTerakhir);
  },

  async getFileNameNPWPBusinessIndividualCompany(){
    I.waitForElement(this.texts.fileNameNPWPBisnisIndividualCompany, 10);
    return I.grabTextFrom(this.texts.fileNameNPWPBisnisIndividualCompany);
  },

  async getFileNameSerPendaftaran(){
    I.waitForElement(this.texts.fileNameSerPendaftaran, 10);
    return I.grabTextFrom(this.texts.fileNameSerPendaftaran);
  },

  async getFileNameSuratPerPendirian(){
    I.waitForElement(this.texts.fileNameSuratPerPendirian, 10);
    return I.grabTextFrom(this.texts.fileNameSuratPerPendirian);
  },

  async getFileNameSertifikatPerTerakhir(){
    I.waitForElement(this.texts.fileNameSerPerubahanTerakhir, 10);
    return I.grabTextFrom(this.texts.fileNameSerPerubahanTerakhir);
  },

  async getFileNameSuratPerPerubahanTerakhir(){
    I.waitForElement(this.texts.fileNameSuratPerPerubahanTerakhir, 10);
    return I.grabTextFrom(this.texts.fileNameSuratPerPerubahanTerakhir);
  },

  async getExtTypeGiroNIB(){
    I.waitForElement(this.texts.extTypeNIB, 10);
    return I.grabTextFrom(this.texts.extTypeNIB);
  },

  async getExtTypeGiroAktaPendirian(){
    I.waitForElement(this.texts.extTypeAktaPendirian, 10);
    return I.grabTextFrom(this.texts.extTypeAktaPendirian);
  },

  async getExtTypeGiroSKKemPendirian(){
    I.waitForElement(this.texts.extTypeSKKemPendirian, 10);
    return I.grabTextFrom(this.texts.extTypeSKKemPendirian);
  },

  async getExtTypeGiroNPWPBusinessCompany(){
    I.waitForElement(this.texts.extTypeNPWPBisnisCompany, 10);
    return I.grabTextFrom(this.texts.extTypeNPWPBisnisCompany);
  },

  async getExtTypeGiroAktaPerTerakhir(){
    I.waitForElement(this.texts.extTypeAktaPerTerakhir, 10);
    return I.grabTextFrom(this.texts.extTypeAktaPerTerakhir);
  },

  async getExtTypeSKKemPerTerakhir(){
    I.waitForElement(this.texts.extTypeSKKemPerTerakhir, 10);
    return I.grabTextFrom(this.texts.extTypeSKKemPerTerakhir);
  },

  async getExtTypeNPWPBusinessIndividualCompany(){
    I.waitForElement(this.texts.extTypeNPWPBisnisIndividualCompany, 10);
    return I.grabTextFrom(this.texts.extTypeNPWPBisnisIndividualCompany);
  },

  async getExtTypeSerPendaftaran(){
    I.waitForElement(this.texts.extTypeSerPendaftaran, 10);
    return I.grabTextFrom(this.texts.extTypeSerPendaftaran);
  },

  async getExtTypeSuratPerPendirian(){
    I.waitForElement(this.texts.extTypeSuratPerPendirian, 10);
    return I.grabTextFrom(this.texts.extTypeSuratPerPendirian);
  },

  async getExtTypeSertifikatPerTerakhir(){
    I.waitForElement(this.texts.extTypeSerPerubahanTerakhir, 10);
    return I.grabTextFrom(this.texts.extTypeSerPerubahanTerakhir);
  },

  async getExtTypeSuratPerPerubahanTerakhir(){
    I.waitForElement(this.texts.extTypeSuratPerPerubahanTerakhir, 10);
    return I.grabTextFrom(this.texts.extTypeSuratPerPerubahanTerakhir);
  },

  clickMove(){
    I.waitForElement(this.buttons.move, 20);
    I.click(this.buttons.move);
  },

  confirmMove(){
    I.waitForElement(this.buttons.confirmMove, 20);
    I.click(this.buttons.confirmMove);
  },

  clickCopy(){
    I.waitForElement(this.buttons.copy, 20);
    I.click(this.buttons.copy);
  },


  // lending
  clickDocumentLoan() {
    I.wait(5);
    I.click(this.buttons.documentLoan);
  },

  clickFolderFacility(){
    I.wait(3);
    I.click(this.folders.folderNameFacility);
  },

  clickFolderDisbursement(){
    I.wait(3);
    I.click(this.folders.folderDisbursement);
  },

  clickButtonNantiSaja() {
    I.waitForElement(this.buttons.buttonNantiSaja, 10);
    I.click(this.buttons.buttonNantiSaja);
  },
  clickOverflowMenu() {
    I.wait(3);
    I.click(this.icons.overflowMenu);
  },
  clickIconDownload(){
    I.wait(3);
    I.click(this.icons.iconDownload);
  },


}

