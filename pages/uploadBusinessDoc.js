const { I, uploadDao } = inject();

module.exports = {

  buttons: {
    uploadDocument: "~buttonUploadDoc",
    refresh: "~buttonRefresh",
    continueToDashboard: "~buttonGoToDashboard",
    chooseMethodUpload: "~buttonNext",
    methodViaApp: "~buttonUploadMobile",
    methodViaOtherDevice: "~buttonUploadOtherDevice",
    copy: "~buttonCopy",
    directToUploadProgress: "~buttonUploadProgress",
    sendRequestAccOpening: "~buttonSubmit",
    refresh: "~buttonRefresh",
    deleteNIB: "~buttonRemoveNib",
    deleteAkta: "~buttonRemoveCompanyCert",
    deleteSK: "~buttonRemoveCompanyLaw",
    deleteNPWP: "~buttonRemoveCompanyNpwp",
    directToProgressAccOpening: "~buttonNext",
    reUpload: "~buttonReUploadDoc",
    callCenter: "~buttonCallCenter",
    confirmDelete: "~buttonDelete",
    cancelDelete: "~buttonBack",
    close: "~buttonClose",
  },
  upload: {
    nib: "~buttonUploadNib",
    certificate: "~buttonUploadAkta",
    sk: "~buttonUploadSk",
    npwp: "~buttonUploadNpwp",
  },
  link: {
    callCenter: "~buttonCallCenter",
    viaOtherDevice: "~buttonUploadWeb",
    directToDashboard: "~buttonToDashboard",
  },
  texts:{
    sizeDocumentNIB: {xpath: ""},
    sizeDocumentAkta: {xpath: ""},
    sizeDocumentSK: {xpath: ""},
    sizeDocumentNPWP: {xpath: ""},
  },
  messageError: {
    uploadDoc: "~textErrorUpload",
  },

  clickUploadDocument() {
    I.waitForElement(this.buttons.uploadDocument, 10);
    I.click(this.buttons.uploadDocument);
  },

  goToMainDashboard() {
    I.waitForElement(this.buttons.continueToDashboard, 10);
    I.click(this.buttons.continueToDashboard);
  },

  // BUSINESS DOC ENUM
  // 1. nib
  // 2. akta_pendirian
  // 3. anggaran_dasar
  // 4. akta_perubahan_terakhir
  // 5. npwp
  // 6. surat_pernyataan_pendirian_pt
  // 7. sk_kemenkumham
  // 8. others

  getEnumDoc(typeDoc) {
    let enumDoc = 0;

    switch (typeDoc) {
      case "NIB":
        return enumDoc = 1;
      case "Akta Perusahaan":
        return enumDoc = 2;
      case "SK Kemenkumham":
        return enumDoc = 7;
      case "NPWP Perusahaan":
        return enumDoc = 5;
      default:
        throw new Error("Document name is not recognize");
    }
  },

  async uploadAllDocumentCompany(userID, password) {
    await
      uploadDao.uploadDocBusiness(userID, password, 1);

    await
      uploadDao.uploadDocBusiness(userID, password, 2);

    await
      uploadDao.uploadDocBusiness(userID, password, 5);

    await
      uploadDao.uploadDocBusiness(userID, password, 7);

  },

  async uploadAllDocumentIndividualCompany(userID, password) {
    await
      uploadDao.uploadDocBusiness(userID, password, 1);

    await
      uploadDao.uploadDocBusiness(userID, password, 2);

  },

  async uploadOneDocument(userID, password, typeDoc) {
    const enumDoc = this.getEnumDoc(typeDoc);

    await
      uploadDao.uploadDocBusiness(userID, password, enumDoc);
  },

  async getMessageError() {
    I.waitForElement(this.messageError.uploadDoc, 10);
    return I.grabTextFrom(this.messageError.uploadDoc);
  },

  clickCallCenter() {
    I.waitForElement(this.link.callCenter, 10);
    I.click(this.link.callCenter);
  },

  clickChooseMethodUpload(){
    I.waitForElement(this.buttons.chooseMethodUpload, 10);
    I.click(this.buttons.chooseMethodUpload);
  },

  chooseDirectUpload(){
    I.waitForElement(this.buttons.methodViaApp, 10);
    I.click(this.buttons.methodViaApp);
  },

  chooseUploadFromOtherDevice(){
    I.waitForElement(this.buttons.methodViaOtherDevice, 10);
    I.click(this.buttons.methodViaOtherDevice);
  },

  copyLink(){
    I.waitForElement(this.buttons.copy, 10);
    I.click(this.buttons.copy);
  },

  clickDirectToProgressUploadDoc(){
    I.waitForElement(this.buttons.directToUploadProgress, 10);
    I.click(this.buttons.directToUploadProgress);
  },

  clickUpdateProgress(){
    I.waitForElement(this.buttons.refresh, 10);
    I.click(this.buttons.refresh);
  },

  clickLinkUploadViaOtherDevice(){
    I.waitForElement(this.link.viaOtherDevice, 10);
    I.click(this.link.viaOtherDevice);
  },

  deleteDocumentNIB(){
    I.waitForElement(this.buttons.deleteNIB, 10);
    I.click(this.buttons.deleteNIB);
  },

  deleteDocumentAktaPerusahaan(){
    I.waitForElement(this.buttons.deleteAkta, 10);
    I.click(this.buttons.deleteAkta);
  },

  deleteDocumentSK(){
    I.waitForElement(this.buttons.deleteSK, 10);
    I.click(this.buttons.deleteSK);
  },

  deleteDocumentNPWPPerusahaan(){
    I.waitForElement(this.buttons.deleteNPWP, 10);
    I.click(this.buttons.deleteNPWP);
  },

  clickRequestAccOpening(){
    I.waitForElement(this.buttons.sendRequestAccOpening, 10);
    I.click(this.buttons.sendRequestAccOpening);
  },

  clickDirectToProgressAccOpening(){
    I.waitForElement(this.buttons.chooseMethodUpload, 10);
    I.click(this.buttons.chooseMethodUpload);
  },

  clickLinkToMainDashboard(){
    I.waitForElement(this.link.directToDashboard, 10);
    I.click(this.link.directToDashboard);
  },

  confirmDelete(){
    I.waitForElement(this.buttons.confirmDelete, 10);
    I.click(this.buttons.confirmDelete);
  },

  cancelDelete(){
    I.waitForElement(this.buttons.cancelDelete, 10);
    I.click(this.buttons.cancelDelete);
  },

  reUploadDocument(){
    I.waitForElement(this.buttons.reUpload, 10);
    I.click(this.buttons.reUpload);
  },

  clickCallCenterProgressAccOpening(){
    I.waitForElement(this.buttons.callCenter, 10);
    I.click(this.buttons.callCenter);
  },

  closeBottomSheet(){
    I.waitForElement(this.buttons.close, 10);
    I.click(this.buttons.close);
  },
}
