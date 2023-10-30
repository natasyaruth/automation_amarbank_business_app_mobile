const { I } = inject();

module.exports = {

  // insert your locators and methods here
  fields: {

  },
  textView: {
    headerPDCDelivery: { xpath: '//android.widget.TextView[contains(@text, "Pengiriman PDC (Cek Mundur)")]' },
    textViewJaminanPDC: { xpath: '//android.widget.TextView[contains(@text, "Segera mengirimkan PDC (cek mundur) sebagai jaminan ke alamat berikut")]' }
  },
  buttons: {
    btnCopy: "~buttonCopy"
  },

  //
  clickBtnCopy(){
    I.wait(2);
    I.click(this.buttons.btnCopy);
  },
}
