const { I } = inject();

module.exports = {

  // insert your locators and methods here
  fields: {

  },
  textView: {
    headerBusinessLoan: { xpath: '//android.widget.TextView[contains(@text, "Pinjaman Bisnis")]' },
    textViewSisaLimitPinjaman: { xpath: '//android.widget.TextView[contains(@text, "Sisa Limit Pinjaman")]' }
  },
  buttons: {
    btnCloseOnBoarding: "~buttonCloseOnboarding"
  },

  //
  clickBtnCloseOnBoarding(){
    I.wait(2);
    I.click(this.buttons.btnCloseOnBoarding);
  },
}
