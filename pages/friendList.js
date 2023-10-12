module.exports = {
    fields: {
      searchFriend: "~textFieldSearch",
      accountNumber: "~textFieldAccountNumber",
      searchBankName: "~textFieldSearchBank",
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
      bankName: "~textBankName",
    },
    checkBox: {
      saveFriendList: "~checkBoxSaveReceiver",
    },
    messageError: {
      accountNumber: "~textFieldErrorAccountNumber",
    },
  
    fillSearchFriendlist(friendname) {
      I.waitForElement(this.fields.searchFriend, 10);
      I.setText(this.fields.searchFriend, friendname);
      I.hideDeviceKeyboard();
    },
  
    closeBankList(){
      I.click(this.buttons.closeBottomSheetBankName);
    },
  
    addNewFriendList() {
      I.waitForElement(this.buttons.newFriendlist, 10);
      I.click(this.buttons.newFriendlist);
    },
  
    chooseListBank(){
      I.click(this.dropDowns.listBankName);
      I.waitForElement(this.buttons.closeBottomSheetBankName, 10);
    },
  
    chooseBank(){
      I.click(this.dropDowns.firstItem);
    },
  
    searchBankName(bankname) {
      I.setText(this.fields.searchBankName, bankname);
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
      const isChecked = await I.grabAttributeFrom(this.checkBox.saveFriendList, "checked");
  
      if (isChecked === "false") {
        I.click(this.checkBox.saveFriendList);
      }
    },
  
    async unSavedFriendlist() {
      const isChecked = await I.grabAttributeFrom(this.checkBox.saveFriendList, "checked");
  
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
  
    getValueAccNumber(){
      return I.grabTextFromField(this.fields.accountNumber);
    },
  
    async getReceiverName(){
      return await I.grabTextFrom(this.text.receiverName);
    },
  }
  