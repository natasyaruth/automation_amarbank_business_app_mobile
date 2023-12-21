const { I } = inject();

module.exports = {

  // insert your locators and methods here
  textView: {
    textViewPinjaman01: { xpath: '//android.widget.TextView[contains(@text, "Halaman Ini Masih Kosong")]' },
    textViewPinjaman02: { xpath: '//android.widget.TextView[contains(@text, "Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.")]' }
  },
  buttons: {
    btnGiro: "~buttonGiroDoc",
    btnLoan: "~buttonLoanDoc",
    btnSelectLoan: "~buttonSelectLoan",
    btnDownload: "~buttonDownload"
  },

  //
  viewDocumentPage(){
    I.wait(2);
    I.seeElement(this.textView.textViewPinjaman01);
    I.seeElement(this.textView.textViewPinjaman02);
  },

  //
  clickBtnGiro(){
    I.wait(2);
    I.click(this.buttons.btnGiroDoc);
  },
  clickBtnLoan(){
    I.wait(2);
    I.click(this.buttons.btnLoanDoc);
  },
  clickBtnSelectLoan(){
    I.wait(2);
    I.click(this.buttons.btnSelectLoan);
  },
  clickBtnDownload(){
    I.wait(2);
    I.click(this.buttons.btnDownload);
  },
}