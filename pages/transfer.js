const { I } = inject();

module.exports = {
  field: {
    inputNominalTransfer: ~"textFieldNominal",
    inputNotes: ~"textFieldNote",
    inputPIN: ~"textFieldPIN",
  },
  text: {
    textBalance: ~"textBalance",
    textNominal: ~"textNominal",
    textService: ~"textService",
    textTotal: ~"textTotal",
    textCategory: ~"textCategory",
    textSubCategory: ~"textSubCategory",
    textNote: ~"textNote",
  },
  dropdownlist: {
    dropDownListCategory: ~"dropDownCategory",
    drobDownListSubCategory: ~"dropDownSubCategory",
  },
  button: {
    buttonChooseMethod: ~"buttonChoseMethod",
    buttonRefresh: ~"buttonRefresh",
    buttonCloseSubCategory: ~"buttonClose",    
    buttonTransfer: ~"buttonTransfer",
    buttonCopy: ~"buttonCopy",
    buttonShare: ~"buttonShare",
    buttonCheckStatus: ~"buttonCheckStatus",
    buttonCheckMethod: ~"buttonChangeMethod",
  },
  cards: {
    itemCategory: ~"itemCategory",
    itemSubCategory: ~"itemSubCategory",
  }, 
  chooseitem:{
  chooseMethodTransfer: ~"optionRTOL",
  },
  messageerror: {
    errorNominaltransfer: ~"textFieldErrorNominal",
    errorNotest: ~"textFieldErrorNote",
    errorPIN: ~"textFieldErrorPIN",
  },
  submitMethodTransfer(nominaltransfer){
    I.setText(this.field.inputNominalTransfer,nominaltransfer);
    I.click(this.dropdownlist.dropDownListCategory);
    I.waitForElement(this.button.buttonCloseSubCategory,5);
    I.click(this.dropdownlist.drobDownListSubCategory);
    I.waitForElement(this.button.buttonCloseSubCategory,5);  
    I.click(this.button.buttonChooseMethod); 
  }
  submitTransferRTOL(){
    I.click(this.chooseitem.chooseMethodTransfer);
    I.click(this.button.buttonTransfer);
  },
  confirmationTransfer(){
    I.seeElement(this.text.textNominal);
    I.seeElement(this.text.textService);
    I.seeElement(this.text.textTotal);
    I.seeElement(this.text.textCategory);
    I.seeElement(this.text.textSubCategory);
    I.seeElement(this.text.textNote);
    I.click(this.button.buttonTransfer);
  },
  inputPIN(inputPIN){
    I.setText(this.field.inputPIN);  
  },
  shareTransfer(){
    I.seeElement(this.text.textNote);
    I.click(this.button.buttonCopy);
    I.click(this.button.buttonShare);
  },


}
