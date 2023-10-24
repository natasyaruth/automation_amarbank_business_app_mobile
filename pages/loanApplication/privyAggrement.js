const { I } = inject();

module.exports = {

  // insert your locators and methods here
  fields: {
    countDownTimer: "",
    viewAdditionDoc: ""

  },
  textView: {
    titleTncSignDigital: { xpath: '//android.widget.TextView[contains(@text, "Tanda Tangan Digital dengan Privy")]' },
    subTitleTncSignDigital: { xpath: '//android.widget.TextView[contains(@text, "Lakukan tanda tangan digital sebelum")]' },
    anountionAboutPrivy: { xpath: '//android.widget.TextView[contains(@text, "Privy.id sebagai penyedia layanan tanda tangan digital yang ditunjuk oleh OJK.")]' },
    anountionPrepareDoc: { xpath: '//android.widget.TextView[contains(@text, "Persiapkan dokumen tambahan yang dibutuhkan saat mencairkan limit.")]' },
    additionDocTitle: { xpath: '//android.widget.TextView[contains(@text, "Persiapkan Dokumen Tambahan")]' },
    additionDocSubTitle: { xpath: '//android.widget.TextView[contains(@text, "Dokumen berikut ini dibutuhkan saat limit akan Anda digunakan.")]' },
    additionDocFirst: { xpath: '//android.widget.TextView[contains(@text, "PDC (cek mundur) sebagai jaminan setiap melakukan pencairan limit.")]' },
    additionDocTwo: { xpath: '//android.widget.TextView[contains(@text, "Dokumen yang menginformasikan rekening yang anda gunakan dalam bertransaksi dengan buyer Anda.")]' },
    additionDocThree: { xpath: '//android.widget.TextView[contains(@text, "Dokumen yang berisi bahwa Amar Bank diizinkan untuk joint account ke rekening tersebut.")]' },
    headerBarDigitalSign: { xpath: '//android.widget.TextView[contains(@text, "Tanda Tangan Digital Privy.id")]' },
    headerBarTnC: { xpath: '//android.widget.TextView[contains(@text, "Syarat dan Ketentuan")]' },
    headerSignPrivyPage: { xpath: '//android.widget.TextView[contains(@text, "Tanda Tangan Digital")]' },
    dialogOtp: { xpath: '//android.widget.TextView[contains(@text, "Konfirmasi")]' },
    notifOtpSend: { xpath: '//android.widget.TextView[contains(@text, "OTP Dikirim")]' },
    notifSignSuccess: { xpath: '//android.widget.TextView[contains(@text, "OTP Dikirim")]' },
    titleWaitingLimitActivation: { xpath: '//android.widget.TextView[contains(@text, "Proses Aktivasi Limit Pinjaman")]' },
    subTitleWaitingLimitActivation: { xpath: '//android.widget.TextView[contains(@text, "Mohon menunggu, butuh 1-3 menit untuk mengaktivasi layanan pinjaman.")]' },
    titleSuratKuasa: { xpath: '//android.widget.TextView[contains(@text, "Download Surat Kuasa")]' },
    textViewStepFirst: { xpath: '//android.widget.TextView[contains(@text, "Klik Tombol Download")]' },
    textViewStepTwo: { xpath: '//android.widget.TextView[contains(@text, "Isi informasi yang dibutuhkan")]' },
    textViewStepThree: { xpath: '//android.widget.TextView[contains(@text, "Print & Tanda Tangan")]' },
    textViewStepFour: { xpath: '//android.widget.TextView[contains(@text, "Kirimkan Surat Kuasa")]' },
    textViewInformationPrivy: { xpath: '//android.widget.TextView[contains(@text, "Saya menyetujui menggunakan Tanda Tangan Digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat.")]' },
    textViewPrepareDocument: { xpath: '//android.widget.TextView[contains(@text, "Persiapkan dokumen tambahan yang dibutuhkan saat mencairkan limit.")]' },
    toastSuratKuasa: { xpath: '//android.widget.TextView[contains(@text, "Surat kuasa sudah berhasil diunduh. Mohon segera isi dan kirim")]' }
  },
  buttons: {
    btnClose: "~buttonClose",
    btnReadSign: "",
    backButton: "",
    btnSignOnPrivy: "",
    btnNextOnPrivy: "",
    btnConfirmOnPrivy: "",
    btnCheckStatus: "",
    btnAcceptLimitOffer: "",
    btnDownload: "~buttonDownload",
    btnLater: "~buttonLater",
    btnInfoDownload: "~buttonInfoDownload",
    btnInfoSignPrivy: "~buttonInfoSignPrivy",
    btnDocumentRequirement: "~buttonDocumentRequirement"

  },
  checkBox: {
    cbTnC: "~checkbox"
  },

  // async getString() {
  // let valueString = await I.grabAttributeFrom(this.textView.additionDocFirst, "text");
  // const myString = valueString.split("/");
  // let word = myString[1];
  // },
  async viewTncWithPrivyPage() {
    I.wait(2);
    I.seeElement(this.textView.titleTncSignDigital);
    let actualTitle = await I.grabAttributeFrom(this.textView.titleTncSignDigital, "text");
    I.assertEqual(actualTitle, "Tanda Tangan Digital dengan Privy");
    I.wait(2);
    let actualSubTitle = await I.grabAttributeFrom(this.textView.subTitleTncSignDigital, "text");
    I.assertEqual(actualSubTitle, "Lakukan tanda tangan digital sebelum");
  },
  countDownTimerDisplayed() {
    I.wait(2);
    I.seeElement(this.fields.countDownTimer);
  },
  async validateInfoAboutPrivy() {
    I.wait(2);
    let actualValue = await I.grabAttributeFrom(this.textView.anountionAboutPrivy, "text");
    I.assertEqual(actualValue, "Privy.id sebagai penyedia layanan tanda tangan digital yang ditunjuk oleh OJK.");
  },
  async validatePrepareDoc() {
    I.wait(2);
    let actualValue = await I.grabAttributeFrom(this.textView.anountionPrepareDoc, "text");
    I.assertEqual(actualValue, "Persiapkan dokumen tambahan yang dibutuhkan saat mencairkan limit.");
  },
  clickBtnViewAdditionDoc() {
    I.wait(2);
    I.click(this.fields.viewAdditionDoc);
  },
  clickDigitalSign() {
    I.click("Tanda Tangan Digital");
    I.wait(2);
    I.seeElement(this.textView.headerBarDigitalSign);
    I.wait(2);
    I.click(this.buttons.backButton);
  },
  clickTnC() {
    I.click("Syarat dan Ketentuan");
    I.wait(2);
    I.seeElement(this.textView.headerBarTnC);
    I.wait(2);
    I.click(this.buttons.backButton);
  },
  viewAggrementPrivyPage() {
    I.wait(2);
    I.seeElement(this.textView.headerSignPrivyPage);
  },
  notifSendOtpPrivy() {
    I.seeElement(this.textView.dialogOtp);
    I.wait(2);
    I.seeElement(this.textView.notifOtpSend);
  },
  clickBtnConfirmOtp(){
    I.wait(5);
    I.click(this.buttons.btnConfirmOnPrivy);
  },
  validationSignSuccess() {
    I.wait(2);
    I.seeElement(this.textView.notifSignSuccess);
  },
  viewPageWaitingActivationLimit() {
    I.seeElement(this.textView.titleWaitingLimitActivation);
  },
  async getTextViewWatingActivationLimit(fieldName) {
    if (Object.keys(this.textView).indexOf(fieldName) === -1) {
      throw new Error('Field ${fieldName} is not found');
    }
    I.seeElement(this.textView[fieldName]);
    return await I.grabTextFrom(this.textView[fieldName]);
  },
  clickBtnCheckStatus() {
    I.wait(2);
    I.click(this.buttons.btnCheckStatus);
  },
  clickBtnAcceptLimitOffer() {
    I.wait(2);
    I.click(this.buttons.btnAcceptLimitOffer);
  },
  clickBtnClose() {
    I.wait(2);
    I.click(this.buttons.btnClose);
  },
  clickBtnDownload() {
    I.wait(2);
    I.click(this.buttons.btnDownload);
  },
  clickBtnLater() {
    I.wait(2);
    I.click(this.buttons.btnLater);
  },
  clickBtnInfoDownload() {
    I.wait(2);
    I.click(this.buttons.btnInfoDownload);
  },
  clickBtnInfoSignPrivy() {
    I.wait(2);
    I.click(this.buttons.btnInfoSignPrivy);
  },
  clickDocumentRequirement() {
    I.wait(2);
    I.click(this.buttons.btnDocumentRequirement);
  },
  clickcheckBox() {
    I.wait(2);
    I.click(this.checkBox.cbTnC);
  },
  async validateBottomSheetContent(loanType) {
    I.wait(2);
    switch (loanType) {
      case 'AP':
        I.wait(2);
        I.seeElement(this.textView.additionDocTitle);
        I.seeElement(this.textView.additionDocSubTitle);
        let actualValue = await I.grabAttributeFrom(this.textView.additionDocFirst, "text");
        I.assertEqual(actualValue, "PDC (cek mundur) sebagai jaminan setiap melakukan pencairan limit.");
        I.wait(2);
        I.click(this.buttons.btnClose);
      break;
      case 'AR':
        I.wait(2);
        I.seeElement(this.textView.additionDocTitle);
        I.seeElement(this.textView.additionDocSubTitle);
        let actualValueFirst = await I.grabAttributeFrom(this.textView.additionDocFirst, "text");
        I.assertEqual(actualValueFirst, "PDC (cek mundur) sebagai jaminan setiap melakukan pencairan limit.");
        let actualValueTwo = await I.grabAttributeFrom(this.textView.additionDocTwo, "text");
        I.assertEqual(actualValueTwo, "Dokumen yang menginformasikan rekening yang anda gunakan dalam bertransaksi dengan buyer Anda.");
        let actualValueThree = await I.grabAttributeFrom(this.textView.additionDocThree, "text");
        I.assertEqual(actualValueThree, "Dokumen yang berisi bahwa Amar Bank diizinkan untuk joint account ke rekening tersebut.");
        I.wait(2);
        I.click(this.buttons.btnClose);
      break;
      case 'PO':
        I.wait(2);
        I.seeElement(this.textView.additionDocTitle);
        I.seeElement(this.textView.additionDocSubTitle);
        let actualValueFirstPO = await I.grabAttributeFrom(this.textView.additionDocFirst, "text");
        I.assertEqual(actualValueFirstPO, "PDC (cek mundur) sebagai jaminan setiap melakukan pencairan limit.");
        let actualValueTwoPO = await I.grabAttributeFrom(this.textView.additionDocTwo, "text");
        I.assertEqual(actualValueTwoPO, "Dokumen yang menginformasikan rekening yang anda gunakan dalam bertransaksi dengan buyer Anda.");
        let actualValueThreePO = await I.grabAttributeFrom(this.textView.additionDocThree, "text");
        I.assertEqual(actualValueThreePO, "Dokumen yang berisi bahwa Amar Bank diizinkan untuk joint account ke rekening tersebut.");
        I.wait(2);
        I.click(this.buttons.btnClose);
      break;
    }
  },
  clickBtnReadAndSign() {
    I.wait(2);
    I.click(this.buttons.btnReadSign);
  },
  clickBtnSignOnPrivy(){
    I.wait(2);
    I.click(this.buttons.btnSignOnPrivy);
  },
  clickBtnNextOnPrivy(){
    I.wait(2);
    I.click(this.buttons.btnNextOnPrivy);
  },
  async validateStepDownloadSuratKuasa(stepType) {
    I.wait(2);
    switch (stepType) {
      case 'first':
        I.wait(2);
        I.seeElement(this.textView.textViewStepFirst);
        I.seeElement(this.textView.titleSuratKuasa);
        let actualValueFirst = await I.grabAttributeFrom(this.textView.textViewStepFirst, "text");
        I.assertEqual(actualValueFirst, "Klik Tombol Download");
      break;
      case 'two':
        I.wait(2);
        I.seeElement(this.textView.textViewStepTwo);
        I.seeElement(this.textView.titleSuratKuasa);
        let actualValueTwo = await I.grabAttributeFrom(this.textView.textViewStepTwo, "text");
        I.assertEqual(actualValueTwo, "Isi informasi yang dibutuhkan");
      break;
      case 'three':
        I.wait(2);
        I.seeElement(this.textView.textViewStepThree);
        I.seeElement(this.textView.titleSuratKuasa);
        let actualValueThree = await I.grabAttributeFrom(this.textView.textViewStepThree, "text");
        I.assertEqual(actualValueThree, "Print & Tanda Tangan");
      break;
      case 'four':
        I.wait(2);
        I.seeElement(this.textView.textViewStepFour);
        I.seeElement(this.textView.titleSuratKuasa);
        let actualValueFour = await I.grabAttributeFrom(this.textView.textViewStepFour, "text");
        I.assertEqual(actualValueFour, "Kirimkan Surat Kuasa");
      break;
    }
  },
  async validateToshMessage(){
    I.wait(3);
    let actualValue = await I.grabAttributeFrom(this.textView.toastSuratKuasa, 'text');
    I.assertEqual(actualValue, "Surat kuasa sudah berhasil diunduh. Mohon segera isi dan kirim");
  },
  async validateInformationPrivy(){
    I.wait(3);
    let actualValue = await I.grabAttributeFrom(this.textView.textViewInformationPrivy, 'text');
    I.assertEqual(actualValue, "Saya menyetujui menggunakan Tanda Tangan Digital melalui Privy.id beserta Syarat dan Ketentuan yang telah dibuat.");
  },
  async validatePrepareDocument(){
    I.wait(3);
    let actualValue = await I.grabAttributeFrom(this.textView.textViewPrepareDocument, 'text');
    I.assertEqual(actualValue, "Persiapkan dokumen tambahan yang dibutuhkan saat mencairkan limit.");
  }
}
