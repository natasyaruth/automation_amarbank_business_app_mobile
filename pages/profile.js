const { I } = inject();

module.exports = {
  buttons: {
    copyAccNumber: "~buttonCopyAccountNumber",
    btnProfile: "~tabBusiness",
    documentProcuration: "~buttonPowerAttorney",
    documentBusiness: "~buttonBusinessDoc",
    documentGiro: "~buttonGiroDoc",
    downloadNib: "~buttonDownloadNib",
    downloadDeed: "~buttonDownloadAkta",
    downloadSk: "~buttonDownloadSk",
    downloadNpwp: "~buttonDownloadNpwp",
    transactionApprovalDetail: "~transactionApprovalDetail",
    showHide: "~buttonShowHide",
    businessProfile: "~buttonBusinessProfile",
    submitPassword: "",
    close: "~btnClose"
  },
  texts: {
    name: "~textName",
    email: "~textEmail",
    phonenumber: "~textPhoneNumber",
    address: "~textAddress",
    businessName: "~textBusinessName",
    accNumber: "~textAccountNumber",
    industry: "~textIndustryType",
    businessType: "~textBusinessType",
    foundedDate: "~textFoundedAt",
    businessAddress: "~textBusinessAddress",
  },
  statusElement:{
    buttonSeeData: {xpath: ""},
  },

  clickTabProfile() {
    I.waitForElement(this.buttons.btnProfile, 20);
    I.click(this.buttons.btnProfile);
  },

  clickDocumentBusiness(){
    I.waitForElement(this.buttons.documentBusiness, 10);
    I.click(this.buttons.documentBusiness);
  },
  openTransactionApproval(){
    I.waitForElement(this.buttons.transactionApprovalDetail, 10);
    I.click(this.buttons.transactionApprovalDetail);
  },

  openMenuBusinessProfile(){
    I.waitForElement(this.buttons.businessProfile, 10);
    I.click(this.buttons.businessProfile);
  },

  clickEyeInfoProfile(){
    I.waitForElement(this.buttons.showHide, 10);
    I.click(this.buttons.showHide);
  },

  clickToSeeData(){
    I.waitForElement(this.buttons.transactionApprovalDetail, 10);
    I.click(this.buttons.transactionApprovalDetail);
  },

  clickCopy(){
    I.waitForElement(this.buttons.copyAccNumber, 10);
    I.click(this.buttons.copyAccNumber);
  },

  closeBottomSheet(){
    I.waitForElement(this.buttons.close, 10);
    I.click(this.buttons.close);
  },

  async getDomicileAddress(){
    I.waitForElement(this.texts.address, 10);
    return await I.grabTextFrom(this.texts.address);
  },

  async getFoundedDate(){
    I.waitForElement(this.texts.foundedDate, 10);
    return await I.grabTextFrom(this.texts.foundedDate);
  },

  async getCompanyName(){
    I.waitForElement(this.texts.businessName, 10);
    return await I.grabTextFrom(this.texts.businessName);
  },

  async getName(){
    I.waitForElement(this.texts.name, 10);
    return await I.grabTextFrom(this.texts.name);
  },

  async getEmail(){
    I.waitForElement(this.texts.email, 10);
    return await I.grabTextFrom(this.texts.email);
  },

  async getPhonenumber(){
    I.waitForElement(this.texts.phonenumber, 10);
    return await I.grabTextFrom(this.texts.phonenumber);
  },

  async getAccNumber(){
    I.waitForElement(this.texts.accNumber, 10);
    return await I.grabTextFrom(this.texts.accNumber);
  },

  async getIndustry(){
    I.waitForElement(this.texts.industry, 10);
    return await I.grabTextFrom(this.texts.industry);
  },

  async getBusinessType(){
    I.waitForElement(this.texts.businessType, 10);
    return await I.grabTextFrom(this.texts.businessType);
  },

  async getBusinessAddress(){
    I.waitForElement(this.texts.businessAddress, 10);
    return await I.grabTextFrom(this.texts.businessAddress);
  },

}
