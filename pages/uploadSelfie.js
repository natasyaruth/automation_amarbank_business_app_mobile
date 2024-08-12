const { I } = inject();

module.exports = {
  buttons: {
    directToTakePhoto: "~buttonTakePhoto",
    takePhoto: "~buttonTakePhoto",
    reTakePhoto: "~buttonRetake",
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
  
  async getInformationAccount(){
    return await I.grabTextFrom(this.text.infoType);
  }
}
