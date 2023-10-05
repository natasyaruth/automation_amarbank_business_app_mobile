const { click } = require("webdriverio/build/commands/element");

const { I } = inject();

module.exports = {
  fields: {
    inputSearchFriend: "~textFieldSearch",
    inputNorek: "~textFieldAccountNumber",
    inputSearchBankName: "~textFieldSearchBank",
    inputNotes: "~textFieldNote",
  },
  cards: {
    itemFriendlist: "~itemReceiver",  
    itemBankName: "~itemBank",
  },
  button: {
    buttonTransferPenerimaBaru: "~buttonTransfer",
    buttonCheckaccount: "~buttonInquiry",
    buttonNext: "~buttonNext",
    closeBottomSheetBankName: "~buttonClose",

  },
  dropdowns: {
    listBankName: "~dropDownFieldListBank",
    listCategory: "~dropDownCategory",
    listSubCategory: "~dropDownSubCategory",
  },
  text: {
    textReceiverName: "~textReceiverName",
    textbankname: "~textBank",
  },
  checbox: {
    checkSaveFriendList: "~checkBoxSaveReceiver",
  },
  messageError: {
    errorAccountNumber: "~textFieldErrorAccountNumber",
  },
  fillSearchFriendlist(friendname){
    I.waitForElement(this.fields.inputSearchFriend,10);
    I.setText(this.fields.inputSearchFriend,friendname);
  },
  transferNoFriendlist(){
    I.click(this.button.buttonTransferPenerimaBaru);
  },
 fillSearchBankName(bankname){  
  I.setText(this.fields.inputSearchBankName,bankname);
  I.click(this.button.closeBottomSheetBankName);
 },
 fillAccountNumber(accountnumber){
  I.setText(this.fields.inputNorek,accountnumber);
 },
checkingaccountnumber(){
  I.click(this.button.buttonCheckaccount);
},
saveFriendlist(){
  I.wait(5);
  I.see(this.text.textbankname);
  I.see('Pastikan Pemilik rekening benar')
  I.see(this.text.textReceiverName);
  I.click(this.checbox.checkSaveFriendList);
  I.click(this.button.buttonNext);
},
async getMessageErrorAccoutNotFound(){
  return await I.grabValueFrom(this.messageError.errorAccountNumber);
},
}



