const { I } = inject();

module.exports = {
  buttons: {
    directToTakePhoto: "~buttonTakePhoto",
    takePhoto: "~buttonTakePhoto",
    understand: "~buttonUnderstand",
    retake: "~buttonRetake",
    upload: "~buttonUpload",
  },
  text: {
    infoType: "~textInfo",
    errorUpload: "~textErrorUpload",
  },
  image:{
    eKtp: "~imageEktp", 
  },

  directToTakePhoto() {
    I.waitForElement(this.buttons.directToTakePhoto, 10);
    I.click(this.buttons.directToTakePhoto);
  },

  takePhoto() {
    I.waitForElement(this.buttons.takePhoto, 10);
    I.click(this.buttons.takePhoto);
  },

  uploadPhoto() {
    I.waitForElement(this.buttons.upload, 10);
    I.click(this.buttons.upload);
  },

  retakePhoto() {
    I.waitForElement(this.buttons.retake, 10);
    I.click(this.buttons.retake);
  },

  understandThePermission() {
    I.waitForElement(this.buttons.understand, 10);
    I.click(this.buttons.understand);
  },

  async getTextInformationType() {
    I.waitForElement(this.text.infoType, 20);
    return await I.grabTextFrom(this.text.infoType);
  },

  async getMessageErrorUploadEktp(){
    I.waitForElement(this.text.errorUpload, 10);
    return await I.grabTextFrom(this.text.errorUpload);
  },

}
