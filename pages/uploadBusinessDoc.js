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
    deleteNPWP: "~button1",
    deleteAktaBusiness: "~button1",
    deleteNPWPBusiness: "~button3",
    deleteAkta: "~button2",
    deleteSKBusiness: "~button2",
    deleteSK: "~button2",
    deleteLastCertificate: "~button4",
    deleteLastSk: "~button5",
    directToProgressAccOpening: "~buttonNext",
    reUpload: "~buttonUpload",
    callCenter: { xpath: "//android.widget.TextView[@content-desc=\"buttonCallCenter\"]" },
    confirmDelete: "~buttonDelete",
    cancelDelete: "~buttonBack",
    close: "~buttonCloseBottomSheet",
  },
  upload: {
    nib: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[1]" },
    certificateBusiness: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[2]" },
    certificate: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[3]" },
    sk: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[4]" },
    skBusiness: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[3]" },
    npwp: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[2]" },
    npwpBusiness: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[4]" },
    lastCertificate: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[5]" },
    lastSk: { xpath: "(//android.view.View[@content-desc=\"buttonUpload\"])[6]" },
  },
  link: {
    callCenter: "~buttonCallCenter",
    viaOtherDevice: "~buttonUploadWeb",
    directToDashboard: "~buttonToDashboard",
  },
  texts: {
    sizeDocumentNIB: "~sizeSource0",
    sizeDocumentAktaBusiness: "~sizeSource1",
    sizeDocumentAkta: "~sizeSource2",
    sizeDocumentSK: "~sizeSource2",
    sizeDocumentSKBusiness: "~sizeSource2",
    sizeDocumentNPWPBusiness: "~sizeSource3",
    sizeDocumentNPWP: "~sizeSource1",
    sizeDocumentLastCertificate: "~sizeSource4",
    sizeDocumentLastSk: "~sizeSource5",
  },
  messageError: {
    uploadDoc: "~textErrorUpload",
  },
  icons: {
    uploadedNib: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[1]" },
    uploadedAkta: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[3]" },
    uploadedAktaBusiness: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[2]" },
    uploadedSK: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[4]" },
    uploadedSKBusiness: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[3]" },
    uploadedNpwp: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[2]" },
    uploadedNpwpBusiness: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[4]" },
    uploadedLastCertificate: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[5]" },
    uploadedLastSk: { xpath: "(//android.view.View[@content-desc=\"iconUploaded\"])[6]" },
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
  // 1 -> nib
  // 2 -> akta_pendirian
  // 3 -> anggaran_dasar
  // 4 -> akta_perubahan_terakhir / sertifikat_perubahan_terakhir
  // 5 -> npwp_business
  // 6 -> surat_pernyataan_pendirian_pt
  // 7 -> sk_kemenkumham
  // 8 -> others
  // 9 -> sk_kemenkumham_perubahan
  // 10 -> surat_pernyataan_perubahan_terakhir

  getEnumDoc(typeDoc) {
    let enumDoc = 0;

    switch (typeDoc) {
      case "NIB":
        return enumDoc = 1;
      case "Akta Pendirian":
        return enumDoc = 2;
      case "Akta Perubahan Terakhir":
        return enumDoc = 4;
      case "Sertifikat Perubahan Terakhir":
        return enumDoc = 9;
      case "Sertifikat Pendaftaran":
        return enumDoc = 7;
      case "NPWP Bisnis":
        return enumDoc = 5;
      case "Surat Pernyataan Pendirian":
        return enumDoc = 6;
      case "SK Kemenkumham Pendirian":
        return enumDoc = 7;
      case "SK Kemenkumham Perubahan Terakhir":
        return enumDoc = 9;
      case "Surat Pernyataan Perubahan Terakhir":
        return enumDoc = 10;
      default:
        throw new Error("Document name is not recognize");
    }
  },

  async uploadAllDocumentCompany() {

    const fileType = 'pdf';

    const enumDoc = [1, 2, 7, 5, 4, 9];

    for (let i = 0; i < enumDoc.length; i++) {
      await
        uploadDao.uploadDocBusiness(enumDoc[i], fileType);
      I.wait(5);
    }

  },

  async uploadAllDocumentCompanyRequired() {

    const fileType = 'pdf';

    const enumDoc = [1, 2, 7, 5];

    for (let i = 0; i < enumDoc.length; i++) {
      await
        uploadDao.uploadDocBusiness(enumDoc[i], fileType);
      I.wait(5);
    }

  },

  async uploadAllDocumentIndividualCompanyRequired(legalityType) {

    const fileType = 'pdf';

    const enumDocIndividualComp = [1, 5, 7, 6];
    const enumDocUD = [1, 5];

    if (

      legalityType === "UD"

    ) {
      for (let i = 0; i < enumDocUD.length; i++) {
        await
          uploadDao.uploadDocBusiness(enumDocUD[i], fileType);
        I.wait(5);
      }
    } else if (

      legalityType === "PT Perorangan"

    ) {
      for (let i = 0; i < enumDocIndividualComp.length; i++) {
        await
          uploadDao.uploadDocBusiness(enumDocIndividualComp[i], fileType);
        I.wait(5);
      }
    }

  },

  async uploadAllDocumentIndividualCompany(legalityType) {
    const fileType = 'pdf';

    const enumDocUD = [1, 5];

    const enumDocIndividualComp = [1, 5, 7, 6, 9, 10];

    if (

      legalityType === "UD"

    ) {
      for (let i = 0; i < enumDocUD.length; i++) {
        await
          uploadDao.uploadDocBusiness(enumDocUD[i], fileType);
        I.wait(5);
      }
    } else if (

      legalityType === "PT Perorangan"

    ) {
      for (let i = 0; i < enumDocIndividualComp.length; i++) {
        await
          uploadDao.uploadDocBusiness(enumDocIndividualComp[i], fileType);
        I.wait(5);
      }
    }

  },

  async uploadOneDocument(typeDoc, fileType) {
    const enumDoc = this.getEnumDoc(typeDoc);

    await
      uploadDao.uploadDocBusiness(enumDoc, fileType);

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

  clickChooseMethodUpload() {
    I.waitForElement(this.buttons.chooseMethodUpload, 10);
    I.click(this.buttons.chooseMethodUpload);
  },

  chooseDirectUpload() {
    I.waitForElement(this.buttons.methodViaApp, 10);
    I.click(this.buttons.methodViaApp);
  },

  chooseUploadFromOtherDevice() {
    I.waitForElement(this.buttons.methodViaOtherDevice, 10);
    I.click(this.buttons.methodViaOtherDevice);
  },

  copyLink() {
    I.waitForElement(this.buttons.copy, 10);
    I.click(this.buttons.copy);
  },

  clickDirectToProgressUploadDoc() {
    I.waitForElement(this.buttons.directToUploadProgress, 10);
    I.click(this.buttons.directToUploadProgress);
  },

  clickUpdateProgress() {
    I.waitForElement(this.buttons.refresh, 10);
    I.click(this.buttons.refresh);
  },

  clickLinkUploadViaOtherDevice() {
    I.waitForElement(this.link.viaOtherDevice, 10);
    I.click(this.link.viaOtherDevice);
  },

  deleteDocumentNIB() {
    I.waitForElement(this.buttons.deleteNIB, 10);
    I.click(this.buttons.deleteNIB);
  },

  deleteDocumentAktaBusiness() {
    I.waitForElement(this.buttons.deleteAktaBusiness, 10);
    I.click(this.buttons.deleteAktaBusiness);
  },

  deleteDocumentAkta() {
    I.waitForElement(this.buttons.deleteAkta, 10);
    I.click(this.buttons.deleteAkta);
  },

  deleteDocumentSK() {
    I.waitForElement(this.buttons.deleteSK, 10);
    I.click(this.buttons.deleteSK);
  },

  deleteDocumentSKBusiness() {
    I.waitForElement(this.buttons.deleteSKBusiness, 10);
    I.click(this.buttons.deleteSKBusiness);
  },

  deleteDocumentNPWPBusiness() {
    I.waitForElement(this.buttons.deleteNPWPBusiness, 10);
    I.click(this.buttons.deleteNPWPBusiness);
  },

  deleteDocumentNPWP() {
    I.waitForElement(this.buttons.deleteNPWP, 10);
    I.click(this.buttons.deleteNPWP);
  },

  deleteDocumentLastAkta() {
    I.waitForElement(this.buttons.deleteLastCertificate, 10);
    I.click(this.buttons.deleteLastCertificate);
  },

  deleteDocumentLastSK() {
    I.waitForElement(this.buttons.deleteLastSk, 10);
    I.click(this.buttons.deleteLastSk);
  },

  clickRequestAccOpening() {
    I.waitForElement(this.buttons.sendRequestAccOpening, 10);
    I.click(this.buttons.sendRequestAccOpening);
  },

  clickDirectToProgressAccOpening() {
    I.waitForElement(this.buttons.chooseMethodUpload, 10);
    I.click(this.buttons.chooseMethodUpload);
  },

  clickLinkToMainDashboard() {
    I.waitForElement(this.link.directToDashboard, 10);
    I.click(this.link.directToDashboard);
  },

  confirmDelete() {
    I.waitForElement(this.buttons.confirmDelete, 10);
    I.click(this.buttons.confirmDelete);
  },

  cancelDelete() {
    I.waitForElement(this.buttons.cancelDelete, 10);
    I.click(this.buttons.cancelDelete);
  },

  reUploadDocument() {
    I.waitForElement(this.buttons.reUpload, 10);
    I.click(this.buttons.reUpload);
  },

  clickCallCenterProgressAccOpening() {
    I.waitForElement(this.buttons.callCenter, 10);
    I.click(this.buttons.callCenter);
  },

  closeBottomSheet() {
    I.waitForElement(this.buttons.close, 10);
    I.click(this.buttons.close);
  },
}
