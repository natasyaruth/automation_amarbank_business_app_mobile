const { I } = inject();

module.exports = {

  buttons: {
    notifCenter: "~buttonNotification",
    detailNotificationInfo: "~buttonNotificationDetailInfo",
    detailNotificationTrx: "~buttonNotificationDetailTransaction",
    understand: "~buttonUnderstand",
  },
  tabs: {
    all: "~buttonChipAll",
    info: "~buttonChipInfo",
    transaction: "~buttonChipTransaction",
    loan: "~buttonChipLoan",
  },
  indicators: {
    notifRedDot: "~notificationIndicatorRedDot",
    notifRedDotBucketlist: "~notificationIndicatorRedDot"
  },
  texts:{
    date: "~textDate",
    time: "~textTime",
    infoNotif: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.widget.TextView[1]"},
    infoNotifDetail: {xpath: "//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[1]"},
    title: "~textTitle",
    description: "~textDesc",
    statusTrx: "~textTransactionStatus",
    amount: "~textAmount",
    pendingTrxStatus: "~textPendingTransactionStatus",
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

  async getTitleBucketlist(index){
    I.waitForElement(this.texts.title+index, 10);
    return await I.grabTextFrom(this.texts.title+index);
  },

  async getTimeDetail(){
    I.waitForElement(this.texts.time, 10);
    return await I.grabTextFrom(this.texts.time);
  },

  async getTimeBucketlist(index){
    I.waitForElement(this.texts.time+index, 10);
    return await I.grabTextFrom(this.texts.time+index);
  },

  async getDescBucketlist(index){
    I.waitForElement(this.texts.description+index, 10);
    return await I.grabTextFrom(this.texts.description+index);
  },

  async getStatusTrxBucketlist(index){
    I.waitForElement(this.texts.statusTrx+index, 10);
    return await I.grabTextFrom(this.texts.statusTrx+index);
  },

  async getInfoNotifBucketlist(index){
    I.waitForElement(this.texts.infoNotif+index, 10);
    return await I.grabTextFrom(this.texts.infoNotif+index);
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

  async getLatestDescription(){
    I.waitForElement(this.texts.description+"0", 10);
    return await I.grabTextFrom(this.texts.description+"0");
  },

  async getTransferAmount(){
    I.waitForElement(this.texts.amount, 10);
    return await I.grabTextFrom(this.texts.amount);
  },

  async getLatestTransferAmount(){
    I.waitForElement(this.texts.amount+"0", 10);
    return await I.grabTextFrom(this.texts.amount+"0");
  },

  async getStatusTrx(){
    I.waitForElement(this.texts.statusTrx, 10);
    return await I.grabTextFrom(this.texts.statusTrx);
  },

  async getLatestStatusTrx(){
    I.waitForElement(this.texts.statusTrx+"0", 10);
    return await I.grabTextFrom(this.texts.statusTrx+"0");
  },

  async getTitle(){
    I.waitForElement(this.texts.title, 10);
    return await I.grabTextFrom(this.texts.title);
  },

  async getLatestTitle(){
    I.waitForElement(this.texts.title+"0", 10);
    return await I.grabTextFrom(this.texts.title+"0");
  },

  async getInfoNotif(){
    I.waitForElement(this.texts.infoNotif, 10);
    return await I.grabTextFrom(this.texts.infoNotif);
  },

  async getInfoNotifDetail(){
    I.waitForElement(this.texts.infoNotifDetail, 10);
    return await I.grabTextFrom(this.texts.infoNotifDetail);
  },

  async getPendingTrxStatus(index){
    I.waitForElement(this.texts.pendingTrxStatus+index, 10);
    return I.grabTextFrom(this.texts.pendingTrxStatus+index);
  },
}
