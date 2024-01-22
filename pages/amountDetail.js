const { I } = inject();

module.exports = {

  buttons: {
    detailAmount: "~directToDetailBalanceInfo",
    iconEye: "~btnEyes",
  },
  text:{
    activeBalance: "~txtActiveBalance",
    blockBalance: "~txtBlockBalance",
    totalBalance: "~txtTotalBalance",
  },

  clickIconEye(){
    I.waitForElement(this.buttons.iconEye, 10);
    I.click(this.buttons.iconEye);
  },

  openDetailAmount(){
    I.click(this.buttons.detailAmount);
  },

  async getActiveAmount(){
    I.waitForElement(this.text.activeBalance, 10);
    return await I.grabTextFrom(this.text.activeBalance);
  },

  async getBlockingAmount(){
    I.waitForElement(this.text.blockBalance, 10);
    return await I.grabTextFrom(this.text.blockBalance);
  },

  async getTotalAmount(){
    I.waitForElement(this.text.totalBalance, 10);
    return await I.grabTextFrom(this.text.totalBalance);
  },

}
