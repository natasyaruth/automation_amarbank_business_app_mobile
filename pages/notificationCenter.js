const { I } = inject();

module.exports = {

  buttons: {
    notifCenter: "~buttonNotification",
    detailNotificationInfo: "~buttonNotificationDetailInfo",
    detailNotificationTrx: "~buttonNotificationDetailTransaction",
    understand: "~buttonUnderstand",
  },
  tabs: {
    all: "~buttonNotification",
    info: "~buttonChipInfo",
    transaction: "~buttonChipTransaction",
    loan: "~buttonChipLoan",
  },
  indicators: {
    notifRedDot: "~notificationIndicatorRedDot",
    notifRedDotBucketlist: "~notificationIndicatorRed"
  },
  texts:{
    date: "~textDate",
    time: "~textTime",
    infoNotif: {xpath: ""},
    infoNotifDetail: {xpath: ""},
    title: "~textTitle",
    description: "~textDesc",
    statusTrx: "~textTransactionStatus",
    amount: "~textAmount",
  },

  openNotificationCenter(){
    I.waitForElement(this.buttons.notifCenter, 10);
    I.click(this.buttons.notifCenter);
  },

  clickTabAll(){
    I.waitForElement(this.tabs.all, 10);
    I.click(this.tabs.all);
  },

  clickTabInfo(){
    I.waitForElement(this.tabs.info, 10);
    I.click(this.tabs.info);
  },

  clickTabTransaction(){
    I.waitForElement(this.tabs.transaction, 10);
    I.click(this.tabs.transaction);
  },

  clickTabLoan(){
    I.waitForElement(this.tabs.loan, 10);
    I.click(this.tabs.loan);
  },

  async getDateDetail(){
    I.waitForElement(this.texts.date, 10);
    return await I.grabTextFrom(this.texts.date);
  },

  async getDateBucketlist(index){
    I.waitForElement(this.texts.date+index, 10);
    return await I.grabTextFrom(this.texts.date+index);
  },

  async getTimeDetail(){
    I.waitForElement(this.texts.time, 10);
    return await I.grabTextFrom(this.texts.time);
  },

  async getTimeBucketlist(index){
    I.waitForElement(this.texts.time+index, 10);
    return await I.grabTextFrom(this.texts.time+index);
  },

  clickUnderstand(){
    I.waitForElement(this.buttons.understand, 10);
    I.click(this.buttons.understand);
  },

  openDetailNotifInfo(index){
    I.waitForElement(this.buttons.detailNotificationInfo+index, 10);
    I.click(this.buttons.detailNotificationInfo+index);
  },

  openDetailNotifTransaction(index){
    I.waitForElement(this.buttons.detailNotificationTrx+index, 10);
    I.click(this.buttons.detailNotificationTrx+index);
  },

  async getDescription(){
    I.waitForElement(this.texts.description, 10);
    return await I.grabTextFrom(this.texts.description);
  },

  async getTransferAmount(){
    I.waitForElement(this.texts.amount, 10);
    return await I.grabTextFrom(this.texts.amount);
  },

  async getStatusTrx(){
    I.waitForElement(this.texts.statusTrx, 10);
    return await I.grabTextFrom(this.texts.statusTrx);
  },

  async getTitle(){
    I.waitForElement(this.texts.title, 10);
    return await I.grabTextFrom(this.texts.title);
  },

  async getInfoNotif(){
    I.waitForElement(this.texts.infoNotif, 10);
    return await I.grabTextFrom(this.texts.infoNotif);
  },

  async getInfoNotifDetail(){
    I.waitForElement(this.texts.infoNotifDetail, 10);
    return await I.grabTextFrom(this.texts.infoNotifDetail);
  },

}
