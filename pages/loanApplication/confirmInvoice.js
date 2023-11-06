const { I } = inject();

module.exports = {

  // insert your locators and methods here
  fields: {

  },
  textView: {
    headerConfirmInvoice: { xpath: '//android.widget.TextView[contains(@text, "Konfirmasi Invoice")]' },
    textViewDokumenInvoice: { xpath: '//android.widget.TextView[contains(@text, "Dokumen Invoice")]' }
  },
  buttons: {
    btnPreview: "~buttonPreview",
    btnDisburse: "~buttonDisburse",
    btnComplain: "~buttonComplain"
  },

  //
  clickBtnPreview(){
    I.wait(2);
    I.click(this.buttons.btnPreview);
  },
  clickBtnDisburse(){
    I.wait(2);
    I.click(this.buttons.btnDisburse);
  },
  clickBtnComplain(){
    I.wait(2);
    I.click(this.buttons.btnComplain);
  },
}
