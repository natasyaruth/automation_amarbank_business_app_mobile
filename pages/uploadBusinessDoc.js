const { I } = inject();

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

  uploadAllDocumentCompany() {
    const uploadDoc = Object.keys(this.upload);
    const path = './data/businessDoc.pdf';
    for (let i = 0; i < uploadDoc.length; i++) {
      I.attachFile(this.upload[i], path);
      I.wait(1);
    }
  },

  uploadAllDocumentIndividualCompany() {
    const uploadDoc = Object.keys(this.upload);
    const path = './data/businessDoc.pdf';

    I.attachFile(this.upload.nib, path);
    I.wait(1);
    I.attachFile(this.upload.certificate, path);
    I.wait(1);
  },

  uploadOneDocument(typeDoc, path) {
    switch (typeDoc) {
      case "NIB Berbasis Resiko":
        I.attachFile(this.upload.nib, path);
        break;
      case "Akta Perusahaan":
        I.attachFile(this.upload.certificate, path);
        break;
      case "SK Kemenkumham":
        I.attachFile(this.upload.sk, path);
        break;
      case "NPWP Perusahaan":
        I.attachFile(this.upload.npwp, path);
        break;
      default:
        throw new Error("Document name is not recognize");
    }
    I.wait(1);
  },

  async getMessageError(){
    I.waitForElement(this.messageError.uploadDoc, 10);
    return I.grabTextFrom(this.messageError.uploadDoc);
  },

  clickCallCenter(){
    I.waitForElement(this.link.callCenter, 10);
    I.click(this.link.callCenter);
  },  
}
