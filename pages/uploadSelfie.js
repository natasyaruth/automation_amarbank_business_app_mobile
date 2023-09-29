const { I } = inject();

module.exports = {
  buttons: {
    takePhoto: "~buttonTakePhoto",
  },
  text: {
    infoType: "~textAccountFormation",
  },

  async getInformationAccount(){
    return await I.grabTextFrom(this.text.infoType);
  }
}
