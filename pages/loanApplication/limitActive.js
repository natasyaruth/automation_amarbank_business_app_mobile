const { I } = inject();

module.exports = {

  // insert your locators and methods here
  fields: {

  },
  textView: {
    headerLimitActive: { xpath: '//android.widget.TextView[contains(@text, "Selamat, Limit Pinjaman Telah Aktif")]' },
    textViewLimitTersedia: { xpath: '//android.widget.TextView[contains(@text, "Limit Tersedia")]' },
    textViewLimitSupplier: { xpath: '//android.widget.TextView[contains(@text, "Supplier")]' },
    textViewLimitNoPinjaman: { xpath: '//android.widget.TextView[contains(@text, "No. Pinjaman")]' },
    textViewLimitInformasiTambahan: { xpath: '//android.widget.TextView[contains(@text, "Informasi Tambahan")]' }
  },
  buttons: {
    btnBack: "~buttonBack",
    btnCopy: "~buttonCopy",
    btnBackToDashboard: "~buttonBackToDashboard"
  },

  //
  clickBtnBack(){
    I.wait(2);
    I.click(this.buttons.btnBack);
  },
  clickBtnCopy(){
    I.wait(2);
    I.click(this.buttons.btnCopy);
  },
  clickBtnBackToDashboard(){
    I.wait(2);
    I.click(this.buttons.btnBackToDashboard);
  },
}
