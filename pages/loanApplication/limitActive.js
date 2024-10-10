const { I } = inject();

module.exports = {

  // insert your locators and methods here
  fields: {

  },
  textView: {
    headerLimitActive: { xpath: '//android.widget.TextView[contains(@text, "Selamat, Limit Pinjaman Telah Aktif")]' },
    textViewLimitTersedia: { xpath: '//android.widget.TextView[contains(@text, "Limit Tersedia")]' },
    textViewLimitSupplier: { xpath: '//android.widget.TextView[contains(@text, "Supplier")]' },
    textViewLimitBuyer: { xpath: '//android.widget.TextView[contains(@text, "Buyer")]' },
    textViewLimitBouwheer: { xpath: '//android.widget.TextView[contains(@text, "Bouwheer")]' },
    textViewLimitNoPinjaman: { xpath: '//android.widget.TextView[contains(@text, "No. Pinjaman")]' },
    textViewLimitInformasiTambahan: { xpath: '//android.widget.TextView[contains(@text, "Informasi Tambahan")]' },
    textviewheaderRejectPage: { xpath: '//android.widget.TextView[contains(@text, "Mohon Maaf, Permohonan limit Anda belum disetujui")]' },


  },
  buttons: {
    btnBack: "~buttonBack",
    btnCopy: "~buttonCopy",
    btnBackToDashboard: "~buttonBackToDashboard"
  },

  buttons: {
    onestar: "~buttonOnestar",
    twostar: "~buttonTwostar",
    threestar: "~buttonThreestar",
    fourstar: "~buttonFourstar",
    fivestar: "~buttonFivestar",
    sendLending: "~sendfeedbacklending",
  },
  fields: {
    feedbacklending: "~textfieldsfeedback",
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


  clickRatingLending(index){

    switch(index){

        case "1":
          I.waitForElement(this.buttons.onestar, 10);
          I.click(this.buttons.onestar);
          break;
        case "2":
            I.waitForElement(this.buttons.twostar,10);
            I.click(this.buttons.twostar);
            break;
        case "3":
            I.waitForElement(this.buttons.threestar,10);
            I.click(this.buttons.threestar);
            break;
        case "4":
            I.waitForElement(this.buttons.fourstar, 10);
            I.click(this.buttons.fourstar);
            break;
        case "5":
            I.waitForElement(this.buttons.fivestar, 10);
            I.click(this.buttons.fivestar);
            break;
            default:
                throw new Error("Please choose rating with range 1-5 stars");         
        }
},

InputFeedback(text) {
    I.waitForElement(this.fields.feedbacklending,30);
    I.click(this.fields.feedbacklending);
    I.type(text, 100);
    I.hideDeviceKeyboard();
},

sendFeedbacklending(){
    I.waitForElement(this.buttons.sendLending, 10);
    I.click(this.buttons.sendLending);
},
    

}



