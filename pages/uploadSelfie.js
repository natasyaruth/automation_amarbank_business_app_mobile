const { I } = inject();

module.exports = {
  buttons: {
    directToTakePhoto: "~buttonTakePhoto",
    takePhoto: "~buttonTakePhoto",
    reTakePhoto: "~buttonRetake",
    upload: "~buttonUpload",
  },
  text: {
    infoType: "~textAccountFormation",
  },

  directToTakePhoto() {
    I.waitForElement(this.buttons.directToTakePhoto, 10);
    I.click(this.buttons.directToTakePhoto);
  },

  reTakePhoto() {
    I.waitForElement(this.buttons.reTakePhoto, 10);
    I.click(this.buttons.reTakePhoto);
  },

  takeSelfie(){
    I.waitForElement(this.buttons.takePhoto, 10);
    I.click(this.buttons.takePhoto);
  },

  uploadSelfie(){
    I.waitForElement(this.buttons.upload, 10);
    I.click(this.buttons.upload);
  },
  
  async getInformationAccount(){
    return await I.grabTextFrom(this.text.infoType);
  }
}
