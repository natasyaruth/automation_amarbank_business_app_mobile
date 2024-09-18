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
      friendListName: { xpath: "//android.view.View/android.view.View[1]/android.view.View/android.widget.TextView[2]"},
      friendListBankName: { xpath: "//android.view.View/android.view.View[1]/android.view.View/android.widget.TextView[3]"},
      friendListAccNumber: {xpath: "//android.view.View/android.view.View[1]/android.view.View/android.widget.TextView[4]"},
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
      I.waitForElement(this.fields.searchFriendName, 30);    
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
      I.waitForElement(this.buttons.checkAccount, 10);
      I.click(this.buttons.checkAccount);
    },

    clickTopFriendList() {
      I.waitForElement(this.cards.friendList, 10);
      I.click(this.cards.friendList);
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

    async getFriendListName(){
      I.waitForElement(this.text.friendListName, 10);
      return await I.grabTextFrom(this.text.friendListName);
    },

    async getFriendListAccNumber(){
      I.waitForElement(this.text.friendListAccNumber, 10);
      return await I.grabTextFrom(this.text.friendListAccNumber);
    },

    async getFriendListBankName(){
      I.waitForElement(this.text.friendListBankName, 10);
      return await I.grabTextFrom(this.text.friendListBankName);
    },
  }
  