const { I } = inject();

module.exports = {

  // insert your locators and methods here
  fields: {

  },
  textView: {
    headerInvite01: { xpath: '//android.widget.TextView[contains(@text, "Selamat!")]' },
    headerInvite02: { xpath: '//android.widget.TextView[contains(@text, "Anda diundang untuk pengajuan pinjaman bisnis melalui Amar Bank Bisnis")]' },
    headerForm: { xpath: '//android.widget.TextView[contains(@text, "Konfirmasi Data")]' },
    textViewInvitePenawaran: { xpath: '//android.widget.TextView[contains(@text, "Penawaran dari")]' },
    textViewInviteLimit: { xpath: '//android.widget.TextView[contains(@text, "Limit yang ditawarkan")]' },
    textViewInviteTenor: { xpath: '//android.widget.TextView[contains(@text, "Tenor yang ditawarkan")]' },
    textViewInviteBunga: { xpath: '//android.widget.TextView[contains(@text, "Bunga per bulan yang ditawarkan")]' },
    textViewInviteSkema: { xpath: '//android.widget.TextView[contains(@text, "Skema")]' },
    textViewInviteData: { xpath: '//android.widget.TextView[contains(@text, "Pastikan data dibawah ini sudah benar!")]' }
  },
  textField:{
    textAnchorName: "~textAnchorName",
    textAmountLimit: "~textAmountLimit",
    textTenor: "~textTenor",
    textInterestRate: "~textInterestRate",
    textSchema: "~textSchema",
    textTnc: "~textTnc",
    textErrorTnc: "~textErrorTnc",
    textLoanSchemaAP: "~textTitle",
    textLoanSchemaAR: "~textTitle"
  },
  checkBox: {
    checkboxtnc: "~checkboxTnc",
  },
  buttons: {
    btnSchema: "~buttonSchema",
    btnAccept: "~buttonAccept",
    btnClose: "~buttonClose",
    btnNext: "~buttonNext"
  },
  
  //
  viewInvitationPage(){
    I.wait(2);
    I.seeElement(this.textView.headerInvite01);
    I.seeElement(this.textView.headerInvite02);
  },
  async getTextFieldTittle (fieldName) {
    if(Object.keys(this.textView).indexOf(fieldName) === -1){
      throw new Error('Field ${fieldName} is not found');
    }
    I.seeElement(this.textView[fieldName]);
    return await I.grabTextFrom(this.textView[fieldName]);
},

  //
  viewDataConfirmationPage(){
    I.wait(2);
    I.seeElement(this.textView.headerForm);
  },
  
  // switch page invitation AP AR
  async validateInviteBusinessPage(loanSchema){
    switch (loanSchema){
        case 'AP':
          I.seeElement(this.textField.textAnchorName);
          I.seeElement(this.textField.textAmountLimit);
          I.seeElement(this.textField.textTenor);
          I.seeElement(this.textField.textInterestRate);
          let actualValueAP = await I.grabAttributeFrom(this.textField.textSchema, "text");
          I.assertEqual(actualValueAP, 'Pinjaman Supplier');
        break;
        case 'AR':
          I.seeElement(this.textField.textAnchorName);
          I.seeElement(this.textField.textAmountLimit);
          I.seeElement(this.textField.textTenor);
          I.seeElement(this.textField.textInterestRate);
          let actualValueAR = await I.grabAttributeFrom(this.textField.textSchema, "text");
          I.assertEqual(actualValueAR, 'Pinjaman Distributor');
        break;
    }
  },
  async validateWordingTextTnC(){
    I.wait(2);
    let actualValue = await I.grabAttributeFrom(this.checkBox.checkboxtnc, "text");
    I.assertEqual(actualValue, "Saya menyetujui Syarat & Ketentuan dalam pengajuan pinjaman dari PT. Bank Amar Indonesia Tbk .")
  },

  //
  clickBtnSchema(){
    I.wait(2);
    I.click(this.buttons.btnSchema);
  },
  clickBtnAccept(){
    I.wait(2);
    I.click(this.buttons.btnAccept);
  },
  clickBtnClose(){
    I.wait(2);
    I.click(this.buttons.btnClose);
  },
  clickBtnNext(){
    I.wait(2);
    I.click(this.buttons.btnNext);
  },
  clickcheckBox(){
    I.click(this.checkBox.checkboxtnc);
  },
}
