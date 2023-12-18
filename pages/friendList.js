const { I } = inject();

module.exports = {
    fields: {
      searchFriendName: "~textFieldSearch",
      accountNumber: "~textFieldAccountNumber",
      searchBank: "~textFieldSearch",
      notes: "~textFieldNote",
    },
    cards: {
      friendList: "~itemReceiver",
      bankName: "~itemBank",
    },
    buttons: {
      newFriendlist: "~buttonTransfer",
      checkAccount: "~buttonInquiry",
      next: "~buttonNext",
      closeBottomSheetBankName: "~buttonClose",
      
    },
    dropDowns: {
      listBankName: "~dropDownFieldListBank",
      listCategory: "~dropDownCategory",
      listSubCategory: "~dropDownSubCategory",
      firstItem: { xpath: "//android.view.View[2]/android.view.View/android.view.View" },
    },
    text: {
      receiverName: "~textReceiverName",
      bankName: "~textBank",
    },
    checkBox: {
      saveFriendList: "~checkBoxSaveReceiver",
    },
    messageError: {
      accountNumber: "~textFieldErrorAccountNumber",
      errorPassword: "~textErrorPassword",
    },
  
    fillSearchFriendlist(friendListname) {  
      I.waitForElement(this.fields.searchFriendName, 10);    
      I.setText(this.fields.searchFriendName, friendListname);
      I.hideDeviceKeyboard();
    },
  
    closeBankList(){
      I.click(this.buttons.closeBottomSheetBankName);
    },
  
    addNewFriendList(){
      I.waitForElement(this.buttons.newFriendlist,10);
      I.click(this.buttons.newFriendlist);
    },
  
    chooseListBank(){
      I.waitForElement(this.dropDowns.listBankName,10);
      I.click(this.dropDowns.listBankName);
    },
      
    chooseBank(){
      I.click(this.dropDowns.firstItem);
    },
  
    searchBankName(bankName) {
      I.setText(this.fields.searchBank, bankName);
      I.hideDeviceKeyboard();
    },
  
    fillAccountNumber(accountnumber) {
      I.setText(this.fields.accountNumber, accountnumber);
      I.hideDeviceKeyboard();
    },
  
    checkingAccountNumber() {
      I.click(this.buttons.checkAccount);
    },
  
    async saveFriendlist() {
      I.wait(5);
      let isChecked = await I.grabAttributeFrom(this.checkBox.saveFriendList, "checked");
      if (isChecked === "false") {
        I.click(this.checkBox.saveFriendList);
      }
    },
  
    async unSavedFriendlist() {
      I.wait(5);
      let isChecked = await I.grabAttributeFrom(this.checkBox.saveFriendList, "checked");
      if (isChecked === "true") {
        I.click(this.checkBox.saveFriendList);
      }
    },
  
    processToTransfer(){
      I.click(this.buttons.next);
    },
  
    async getMessageErrorAccoutNotFound() {
      return await I.grabValueFrom(this.messageError.accountNumber);
    },
  
    async getBankName(){
      return await I.grabTextFrom(this.text.bankName);
    },
  
    async getValueAccNumber(){
      return I.grabTextFromField(this.fields.accountNumber);
    },
  
    async getReceiverName(){
      return await I.grabTextFrom(this.text.receiverName);
    },
  }
  