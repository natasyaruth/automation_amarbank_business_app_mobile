const { I, uploadDao, resetStateDao } = inject();

module.exports = {

  buttons: {
    uploadDocument: "~buttonUploadDoc",
    refresh: "~buttonRefresh",
    continueToDashboard: "~buttonGoToDashboard",
  },
  upload: {
    nib: "~buttonUploadNib",
    certificate: "~buttonUploadAkta",
    sk: "~buttonUploadSk",
    npwp: "~buttonUploadNpwp",
  },
  link: {
    callCenter: "~buttonCallCenter",
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
  // 1. nib_berbasis_resiko
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
      case "NIB Berbasis Resiko":
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

    resetStateDao.reloadPageAfterResetState();
  },

  async uploadAllDocumentIndividualCompany(userID, password) {
    await
      uploadDao.uploadDocBusiness(userID, password, 1);

    await
      uploadDao.uploadDocBusiness(userID, password, 2);

    resetStateDao.reloadPageAfterResetState();
  },

  async uploadOneDocument(userID, password, typeDoc) {
    const enumDoc = this.getEnumDoc(typeDoc);

    await
      uploadDao.uploadDocBusiness(userID, password, enumDoc);

    resetStateDao.reloadPageAfterResetState()
  },

  async getMessageError() {
    I.waitForElement(this.messageError.uploadDoc, 10);
    return I.grabTextFrom(this.messageError.uploadDoc);
  },

  clickCallCenter() {
    I.waitForElement(this.link.callCenter, 10);
    I.click(this.link.callCenter);
  },
}
