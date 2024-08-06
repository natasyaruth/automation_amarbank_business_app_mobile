const { I } = inject();

module.exports = {
  fields: {
    textFieldReason: "",
    listCardLoanExpired: "",
    listCardLoanApproved: "",
    listCardLoanRejected: "",
    textProgressBar: "~textUploadProgress",
    progressBar: "~progressBar",

  },
  buttons: {
    viewDocNeeded: "~buttonShowDocumentList",
    btnClose: "~buttonCloseSuccessBottomSheet",
    btnUploadDoc: "",
    btnUploadNib: "",
    btnUploadAkte: "",
    btnUploadSk: "",
    btnUploadNpwp: "",
    btnUploadPurchase: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[2]' },
    btnUploadMutation: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[3]' },
    btnUploadFinReport: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[4]' },
    btnUploadKtpComm: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[1]' },
    btnUploadNPWPComm: "",
    btnRefreshUploadDoc: "~buttonRefresh",
    backBtn: "",
    btnAcceptLimitOffer: "",
    btnSendReason: "",
    btnStopUploadDoc: "",
    btnRetry: "",
    btnDeletefile: "",
    btnConfirmdelete:"",
    btnBacktoUpload:"",
  },
  textView: {
    titleBottomSheetDocNeeded: { xpath: '//android.widget.TextView[contains(@text, "Mohon persiapkan dokumen-dokumen berikut")]' },
    nibBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "NIB (Nomor Induk Berusaha)")]' },
    akteCompanyBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "Akta Perusahaan.")]' },
    skKemenkumhamBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "SK Kemenkumham.")]' },
    npwpCompanyBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "NPWP Perusahaan.")]' },

    ktpComisionerTextView:  { xpath: '//android.widget.TextView[contains(@text, "KTP Komisioner & Pemegang Saham.")]' },
    npwpComisionerTextView:  { xpath: '//android.widget.TextView[contains(@text, "NPWP Komisioner & Pemegang Saham.")]' },

       
    proofOfPurchaseBottomSheetTextViewAP: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.")]' },
    paymentMutationBottomSheetTextViewAP: { xpath: '//android.widget.TextView[contains(@text, "Rekening koran/mutasi rekening operasional 6 bulan terakhir.")]' },
    
    proofOfPurchaseBottomSheetTextViewAR: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.")]' },
    paymentMutationBottomSheetTextViewAR: { xpath: '//android.widget.TextView[contains(@text, "Rekening koran/mutasi rekening operasional 6 bulan terakhir.")]' },
   
    financialReportBottomSheetTextViewMSME: { xpath: '//android.widget.TextView[contains(@text, "Laporan keuangan 1 tahun terakhir dan tahun berjalan.")]' },
    financialReportBottomSheetTextViewCorp: { xpath: '//android.widget.TextView[contains(@text, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.")]' },
    
    proofOfPurchaseBottomSheetTextViewPO: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan bouwheer saat ini atau bouwheer lainnya dengan produk yang sama.")]' },
    paymentMutationBottomSheetTextViewPO: { xpath: '//android.widget.TextView[contains(@text, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan bouwheer.")]' },
    uploadDocTextViewPage: { xpath: '//android.widget.TextView[contains(@text, "Upload dokumen-dokumen sebagai berikut:")]' },
    nibUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "NIB Berbasis Resiko *")]' },
    akteCompanyUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Akta Perusahaan *")]' },
    skKemenkumhamUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "SK Kemenkumham *)]' },
    npwpCompanyUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "NPWP Perusahaan *)]' },
    proofOfPurchaseUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan buyer * (digabung dalam 1 file PDF)")]' },
    paymentMutationUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Contoh Mutasi Pembayaran 6 Bulan Terakhir * (digabung dalam 1 file PDF)")]' },
    financialReportUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Laporan Keuangan Dalam 1 Tahun Terakhir*  (digabung dalam 1 file PDF)")]' },
    alertBoxUploadDoc: { xpath: '//android.widget.TextView[contains(@text, "Dokumen terkirim. Periksa kembali jika sudah benar cek status terbaru di dashboard")]' },
    titleLimitActivationApproved: { xpath: '//android.widget.TextView[contains(@text, "Pengajuan limit telah disetujui sebesar")]' },
    valueInterest: { xpath: '//android.widget.TextView[contains(@text, "1.3%")]' },
    valueAdminFee: { xpath: '//android.widget.TextView[contains(@text, "3%")]' },
    valueLateFee: { xpath: '//android.widget.TextView[contains(@text, "0.1%")]' },
    contentDescLimitApproved: { xpath: '//android.widget.TextView[contains(@text, "Setiap pembayaran tagihan akan terpotong otomatis melalui autodebet Amar Bank.")]' },
    titleLimitActivationRejected: { xpath: '//android.widget.TextView[contains(@text, "Mohon Maaf, Permohonan limit Anda belum disetujui")]' },
    contentDescLimitRejected: { xpath: '//android.widget.TextView[contains(@text, "Kami memberitahukan bahwa hasil analisis kredit Anda belum memenuhi kriteria penilaian kami saat ini.")]' },
    titleLimitActivationExpired: { xpath: '//android.widget.TextView[contains(@text, "Penawaran limit sudah berakhir")]' },
    contentDescLimitExpired: { xpath: '//android.widget.TextView[contains(@text, "Beritahu kami alasan mengapa Anda tidak menyetujui penawaran limit yang kami sediakan.")]' },
    textErrorMessageUpload: { xpath: '//android.widget.TextView[contains(@text, "File Melebihi maksimal ukuran 15MB")]' },
    textviewinfoAR:  { xpath: '//android.widget.TextView[contains(@text, "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer.")]' },
    textviewinfoPO: { xpath: '//android.widget.TextView[contains(@text, "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan bouwheer.")]' },
  },
  messageErrorFields: {
    errorReasonField: "~textMsgErrorLoan",
  },

  // Function for call the id component
  async changeStatusVPBusinessApproved() {
    I.wait(5);
    let getLoanID = await I.sendPostRequest("https://dev-smb-loanapp.otoku.io/api/v1/loan/me/CREDIT_ANALYZED?limit=1");
    let loanID = getLoanID.data[0].loanId;
    const response = await I.sendPostRequest("https://dev-smb-loanapp.otoku.io/api/v1/loan/finagg/status/approved", {
      loanId: loanID,
    });
    if (!response) {
      throw new Error("failed to change status");
    }
    return {
      status: response.status,
      data: response.data,
    };
  },
  async changeStatusVPBusinessRejected() {
    I.wait(5);
    let getLoanID = await I.sendPostRequest("https://dev-smb-loanapp.otoku.io/api/v1/loan/me/CREDIT_ANALYZED?limit=1");
    let loanID = getLoanID.data[0].loanId;
    const response = await I.sendPostRequest("https://dev-smb-loanapp.otoku.io/api/v1/loan/finagg/status/rejected", {
      loanId: loanID,
    });
    if (!response) {
      throw new Error("failed to change status");
    }
    return {
      status: response.status,
      data: response.data,
    };
  },
  async getStatusLimitApproved() {
    I.wait(2);
    I.seeElement(this.fields.titleLimitActivationApproved);
    let actualLimitApproved = await I.grabAttributeFrom(this.textView.titleLimitActivationApproved, "text");
    I.assertEqual(actualLimitApproved, "Pengajuan limit telah disetujui sebesar");
  },
  async validateContentApprovedPage() {
    I.wait(2);
    I.seeElement(this.textView.valueInterest);
    I.wait(2);
    I.seeElement(this.textView.valueAdminFee);
    I.wait(2);
    I.seeElement(this.textView.valueLateFee);
    I.wait(2);
    let actualValue = await I.grabAttributeFrom(this.textView.contentDescLimitApproved, "text");
    I.assertEqual(actualValue, "Setiap pembayaran tagihan akan terpotong otomatis melalui autodebet Amar Bank.");
  },
  async getStatusLimitRejected() {
    I.wait(2);
    I.seeElement(this.textView.titleLimitActivationApproved);
    let actualLimitRejected = await I.grabAttributeFrom(this.textView.titleLimitActivationRejected, "text");
    I.assertEqual(actualLimitRejected, "Mohon Maaf, Permohonan limit Anda belum disetujui");
  },
  async validateContentRejectedPage() {
    I.wait(2);
    let actualValue = await I.grabAttributeFrom(this.textView.contentDescLimitRejected, "text");
    I.assertEqual(actualValue, "Kami memberitahukan bahwa hasil analisis kredit Anda belum memenuhi kriteria penilaian kami saat ini.");
  },
  async getStatusLimitExpired() {
    I.wait(2);
    I.seeElement(this.textView.titleLimitActivationExpired);
    let actualLimitExpired = await I.grabAttributeFrom(this.textView.titleLimitActivationExpired, "text");
    I.assertEqual(actualLimitExpired, "Penawaran limit sudah berakhir");
  },
  async validateContentExpiredPage() {
    I.wait(2);
    let actualValue = await I.grabAttributeFrom(this.textView.contentDescLimitExpired, "text");
    I.assertEqual(actualValue, "Beritahu kami alasan mengapa Anda tidak menyetujui penawaran limit yang kami sediakan.");
  },
  clickBtnViewRequiredDoc() {
    I.wait(2);
    I.click(this.buttons.viewDocNeeded);
  },
  async validateTextViewPrepareDocNeedTitle() {
    I.wait(2);
    let actualValue = await I.grabAttributeFrom(this.textView.titleBottomSheetDocNeeded, "text");
    I.assertEqual(actualValue, "Mohon persiapkan dokumen dokumen Berikut");
  },
  async validateBottomSheetDocNeededContent(loanType) {
    I.wait(2);
    switch (loanType) {
      case 'CorpAPPT.Perusahaan':
        I.wait(2);
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.akteCompanyBottomSheetTextView);
        I.seeElement(this.textView.skKemenkumhamBottomSheetTextView);
        I.seeElement(this.textView.npwpCompanyBottomSheetTextView);
        I.seeElement(this.textView.ktpComisionerTextView);
        I.seeElement(this.textView.npwpComisionerTextView);        
        let actualValueAPCorp = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPCorp, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueAPCorp1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPCorp1, "Rekening koran/mutasi rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueAPCorp2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueAPCorp2, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.click(this.buttons.btnClose);
        break;

      case 'CorpARPT.Perusahaan':
        I.wait(2);
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.akteCompanyBottomSheetTextView);
        I.seeElement(this.textView.skKemenkumhamBottomSheetTextView);
        I.seeElement(this.textView.npwpCompanyBottomSheetTextView);
        I.seeElement(this.textView.ktpComisionerTextView);
        I.seeElement(this.textView.npwpComisionerTextView);
        let actualValueCorpAR = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueCorpAR, "Minimal 3 contoh bukti pembelian dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueCorpAR1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueCorpAr1, "Rekening koran/mutasi rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueCorpAR2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueCorpAR2, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.click(this.buttons.btnClose);
        break;
      
      case 'MSMEAPPT.Perusahaan':
        I.wait(2);        
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.akteCompanyBottomSheetTextView);
        I.seeElement(this.textView.skKemenkumhamBottomSheetTextView);
        I.seeElement(this.textView.npwpCompanyBottomSheetTextView);
        I.seeElement(this.textView.ktpComisionerTextView);
        I.seeElement(this.textView.npwpComisionerTextView);
        let actualValueAPMSME = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPMSME, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueAPMSME2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPMSME2, "Rekening koran/mutasi rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueAPMSME3 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValueAPMSME3, "Laporan keuangan 1 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.click(this.buttons.btnClose);
        break;

      case 'MSMEARPT.Perusahaan':
        I.wait(2);
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.akteCompanyBottomSheetTextView);
        I.seeElement(this.textView.skKemenkumhamBottomSheetTextView);
        I.seeElement(this.textView.npwpCompanyBottomSheetTextView);
        let actualValueARMSME = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueARMSME, "Minimal 3 contoh bukti pembelian dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueARMSME2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueARMSME2, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan buyer atau pembeli.");
        I.wait(2);
        let actualValueARMSME3 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValueARMSME3, "Laporan keuangan dalam 1 tahun terakhir.");
        I.wait(2);
        I.click(this.buttons.btnClose);
        break;
      case 'PO':
        I.wait(2);
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.akteCompanyBottomSheetTextView);
        I.seeElement(this.textView.skKemenkumhamBottomSheetTextView);
        I.seeElement(this.textView.npwpCompanyBottomSheetTextView);
        let actualValuePO = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewPO, "text");
        I.assertEqual(actualValuePO, "Minimal 3 contoh bukti pembelian dengan bouwheer saat ini atau bouwheer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValuePO1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewPO, "text");
        I.assertEqual(actualValuePO1, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan bouwheer.");
        I.wait(2);
        let actualValuePO2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewAP, "text");
        I.assertEqual(actualValuePO2, "Laporan keuangan dalam 1 tahun terakhir(jika ada).");
        I.wait(2);
        I.click(this.buttons.btnClose);
        break;
    }
  },
  clickBtnUploadDoc() {
    I.wait(2);
    I.click(this.buttons.btnUploadDoc);
  },
  viewUploadDocPage() {
    I.wait(2);
    I.seeElement(this.textView.uploadDocTextViewPage);
  },
  async uploadDocuments(docType) {
    I.wait(2);
    switch (docType) {
      case 'nib':
        I.seeElement(this.buttons.btnUploadNib);
        I.attachFile(this.buttons.btnUploadNib, 'data/file.pdf');
      break;
      case 'deedOfComp':
        I.seeElement(this.buttons.btnUploadAkte);
        I.attachFile(this.buttons.btnUploadAkte, 'data/file.pdf');
      break;
      case 'SKKemen':
        I.seeElement(this.buttons.btnUploadSk);
        I.attachFile(this.buttons.btnUploadSk, 'data/file.pdf');
      break;
      case 'npwpComm':
        I.seeElement(this.buttons.btnUploadNpwp);
        I.attachFile(this.buttons.btnUploadNpwp, 'data/file.pdf');
      break;
      case 'KTPComm':
        I.seeElement(this.buttons.btnUploadKtpComm);
        I.attachFile(this.buttons.btnUploadKtComm, 'data/file.pdf');      
      break;
      case 'npwpofComm':
        I.seeElement(this.buttons.btnUploadNPWPComm);
        I.attachFile(this.buttons.btnUploadNPWPComm, 'data/file.pdf');
      break;
      case 'proofOfPurchase':
        I.seeElement(this.buttons.btnUploadPurchase);
        I.attachFile(this.buttons.btnUploadPurchase, 'data/file.jpg', 'data/file.jpeg', 'data/file.pdf', 'data/file.png');

        I.wait(2);
        let actualValueTextBar5 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar5, "true");
      break;
      case 'paymentMutation':
        I.seeElement(this.buttons.btnUploadMutation);
        I.attachFile(this.buttons.btnUploadMutation, 'data/file.jpg', 'data/file.jpeg', 'data/file.pdf', 'data/file.png');
        I.wait(2);
        let actualValueTextBar6 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar6, "true");
      break;
      case 'financialReports':
        I.seeElement(this.buttons.btnUploadFinReport);
        I.attachFile(this.buttons.btnUploadFinReport, 'data/file.jpg', 'data/file.jpeg', 'data/file.pdf', 'data/file.png');
        I.wait(2);
        let actualValueTextBar7 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar7, "true");
      break;
    }
  },
  clickBtnRefresh() {
    I.wait(2);
    I.click(this.buttons.btnRefreshUploadDoc);
  },
  clickBtnBackToLoanProcessing() {
    I.wait(2);
    I.click(this.buttons.backBtn);
  },
  clickListCardExpired() {
    I.wait(2);
    I.click(this.fields.listCardLoanExpired);
  },
  clickListCardRejected() {
    I.wait(2);
    I.click(this.fields.listCardLoanRejected);
  },
  clickListCardApproved() {
    I.wait(2);
    I.click(this.fields.listCardLoanApproved);
  },
  clickBtnSendReason() {
    I.wait(2);
    I.click(this.buttons.btnSendReason);
  },
  async getErrorFieldReason(fieldName) {
    if (Object.keys(this.messageErrorFields).indexOf(fieldName) === -1) {
      throw new Error('Field ${fieldName} is not found');
    }
    I.seeElement(this.messageErrorFields[fieldName]);
    return await I.grabTextFrom(this.messageErrorFields[fieldName]);
  },
  fillFieldReason(fieldName, txtValue) {
    I.seeElement(this.fields[fieldName]);
    if (
      this.fields[fieldName] === "" ||
      this.fields[fieldName] === null ||
      this.fields[fieldName] === "-"
    ) {
      I.clearField(this.fields[fieldName]);
      return;
    }
    I.setText(this.fields[fieldName], txtValue);
  },
  ClickBtnStopUploadingDokumen(){
    I.wait(5);
    I.click(this.buttons.btnStopUploadDoc);
  },
  ClickbuttonRetry(){
    I.wait(3);
    I.click(this.buttons.btnRetry);
  },
  ClickbuttonAcceptLimitOffer(){
    I.wait(3);
    I.click(this.buttons.btnAcceptLimitOffer);
  },
  ClickBtndeleteFileUploaded(){
    I.wait(2);
    I.click(this.buttons.btnDeletefile);
  },

  async uploadDocumentsMorethan15(docType) {
    I.wait(2);
    switch (docType) {
      case 'nib':
        I.seeElement(this.buttons.btnUploadNib);
        I.attachFile(this.buttons.btnUploadNib, 'data/file.pdf');
      break;
      case 'deedOfComp':
        I.seeElement(this.buttons.btnUploadAkte);
        I.attachFile(this.buttons.btnUploadAkte, 'data/file.pdf');
      break;
      case 'SKKemen':
        I.seeElement(this.buttons.btnUploadSk);
        I.attachFile(this.buttons.btnUploadSk, 'data/file.pdf');
      break;
      case 'npwpOfComp':
        I.seeElement(this.buttons.btnUploadNpwp);
        I.attachFile(this.buttons.btnUploadNpwp, 'data/file.pdf');
      break;
      case 'ktpOfComm':
        I.seeElement(this.buttons.btnUploadKtpComm);
        I.attachFile(this.buttons.btnUploadKtpComm, 'data/file18MB.pdf');     
        let actualValueErrorMessage1 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "displayed");
        I.assertEqual(actualValueErrorMessage1, "true"); 
      break;
      case 'npwpofComm':
        I.seeElement(this.buttons.btnUploadNPWPCom);
        I.attachFile(this.buttons.btnUploadNPWPCom, 'data/file.pdf');
        I.wait(2);
        let actualValueErrorMessage2 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "dispalyed");
        I.assertEqual(actualValueErrorMessage2, "true");
      break;
      case 'proofOfPurchase':
        I.seeElement(this.buttons.btnUploadPurchase);
        I.attachFile(this.buttons.btnUploadPurchase, 'data/file18MB.jpg', 'data/file18MB.jpeg', 'data/file18MB.pdf', 'data/file18MB.png');

        I.wait(2);
        let actualValueErrorMessage3 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "displayed");
        I.assertEqual(ctualValueErrorMessage3, "true");
      break;
      case 'paymentMutation':
        I.seeElement(this.buttons.btnUploadMutation);
        I.attachFile(this.buttons.btnUploadMutation, 'data/file.jpg', 'data/file.jpeg', 'data/file.pdf', 'data/file.png');
        I.wait(2);
        let actualValueErrorMessage4 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "displayed");
        I.assertEqual(actualValueErrorMessage4, "true");
      break;
      case 'financialReports':
        I.seeElement(this.buttons.btnUploadFinReport);
        I.attachFile(this.buttons.btnUploadFinReport, 'data/file.jpg', 'data/file.jpeg', 'data/file.pdf', 'data/file.png');
        I.wait(2);
        let actualValueErrorMessage5 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "displayed");
        I.assertEqual(actualValueErrorMessage5, "true");
      break;
    }
  },
  async validatetextinfoAR(){
    I.wait(2);
    let actualinfoAR = I.grabAttributeFrom(this.textview.textviewinfoAR, "text");
    I.assertEqual(actualinfoAR, "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer.");
  },
  async validatetextinfoPO(){
    I.wait(2);
    let actualinfoPO = I.grabAttributeFrom(this.textview.textviewinfoPO, "text");
    I.assertEqual(actualinfoPO, "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan bouwheer.");
  }
}