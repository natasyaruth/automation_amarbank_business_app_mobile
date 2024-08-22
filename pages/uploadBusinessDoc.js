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
    deleteNIB: "~button0",
    deleteAkta: "~button1",
    deleteSK: "~button2",
    deleteNPWP: "~button3",
    directToProgressAccOpening: "~buttonNext",
    reUpload: "~buttonUpload",
    callCenter: {xpath: "//android.widget.TextView[@content-desc=\"buttonCallCenter\"]"},
    confirmDelete: "~buttonDelete",
    cancelDelete: "~buttonBack",
    close: "~buttonCloseBottomSheet",
  },
  upload: {
    nib: {xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[1]"},
    certificate: {xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[2]"},
    sk: {xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[3]"},
    npwp: {xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[4]"},
  },
  link: {
    callCenter: "~buttonCallCenter",
    viaOtherDevice: "~buttonUploadWeb",
    directToDashboard: "~buttonToDashboard",
  },
  texts:{
    sizeDocumentNIB: "~sizeSource0",
    sizeDocumentAkta: "~sizeSource1",
    sizeDocumentSK: "~sizeSource2",
    sizeDocumentNPWP: "~sizeSource3",
  },
  messageError: {
    uploadDoc: "~textErrorUpload",
  },
  icons:{
    uploadedNib: {xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[1]"},
    uploadedAkta: {xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[2]"},
    uploadedSK: {xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[3]"},
    uploadedNpwp: {xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[4]"},
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

    const fileType = 'pdf';

    const enumDoc = [1, 2, 5, 7];

    for(let i=0;i<4;i++){
      await
        uploadDao.uploadDocBusiness(userID, password, enumDoc[i], fileType);
      I.wait(5);  
    }

  },

  async uploadAllDocumentIndividualCompany(userID, password) {
    const fileType = 'pdf';
    await
      uploadDao.uploadDocBusiness(userID, password, 1, fileType);
      I.wait(5);  
    await
      uploadDao.uploadDocBusiness(userID, password, 2, fileType);
      I.wait(5);  

  },

  async uploadOneDocument(userID, password, typeDoc, fileType) {
    const enumDoc = this.getEnumDoc(typeDoc);

    await
      uploadDao.uploadDocBusiness(userID, password, enumDoc, fileType);
    
      I.wait(2);
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
