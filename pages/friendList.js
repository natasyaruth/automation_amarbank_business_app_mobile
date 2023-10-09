module.exports = {
  fields: {
    inputSearchFriend: "~textFieldSearch",
    inputAccountNumber: "~textFieldAccountNumber",
    inputSearchBankName: "~textFieldSearchBank",
    inputNotes: "~textFieldNote",
  },
  cards: {
    itemFriendlist: "~itemReceiver",
    itemBankName: "~itemBank",
  },
  button: {
    buttonNewFriendlist: "~buttonTransfer",
    buttonCheckaccount: "~buttonInquiry",
    buttonNext: "~buttonNext",
    closeBottomSheetBankName: "~buttonClose",
  },
  dropdowns: {
    listBankName: "~dropDownFieldListBank",
    listCategory: "~dropDownCategory",
    listSubCategory: "~dropDownSubCategory",
    firstItem: { xpath: "//android.view.View[2]/android.view.View/android.view.View" },
  },
  text: {
    textReceiverName: "~textReceiverName",
    textbankname: "~textBankName",
  },
  checbox: {
    checkSaveFriendList: "~checkBoxSaveReceiver",
  },
  messageError: {
    errorAccountNumber: "~textFieldErrorAccountNumber",
  },
  fillSearchFriendlist(friendname) {
    I.waitForElement(this.fields.inputSearchFriend, 10);
    I.setText(this.fields.inputSearchFriend, friendname);
  },
  addNewFriendList() {
    I.click(this.button.buttonNewFriendlist);
  },
  searchBankName(bankname) {
    I.click(this.dropdownslistBankName);
    I.waitForElement(this.button.closeBottomSheetBankName, 10);
    I.setText(this.fields.inputSearchBankName, bankname);
    I.hideDeviceKeyboard();
    I.click(this.dropdowns.firstItem);
  },
  fillAccountNumber(accountnumber) {
    I.setText(this.fields.inputAccountNumber, accountnumber);
  },
  checkingaccountnumber() {
    I.click(this.button.buttonCheckaccount);
  },
  async saveFriendlist() {
    const isChecked = await I.grabAttributeFrom(this.checkBox.checkSaveFriendList, "checked");

    if (isChecked === "false") {
      I.click(this.checkBox.checkSaveFriendList);
    }
    I.click(this.button.buttonNext);
  },
  async SavedFriendlist() {
    const isChecked = await I.grabAttributeFrom(this.checkBox.checkSaveFriendList, "checked");

    if (isChecked === "true") {
      I.click(this.checkBox.checkSaveFriendList);
    }
    I.click(this.button.buttonNext);
  },
  async getMessageErrorAccoutNotFound() {
    return await I.grabValueFrom(this.messageError.errorAccountNumber);
  },
}
