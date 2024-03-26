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
    btnUploadKtpNpwp: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[1]' },
    btnRefreshUploadDoc: "~buttonRefresh",
    backBtn: "",
    btnAcceptLimitOffer: "",
    btnSendReason: ""
  },
  textView: {
    titleBottomSheetDocNeeded: { xpath: '//android.widget.TextView[contains(@text, "Persiapkan Dokumen Berikut")]' },
    nibBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "NIB (Nomor Induk Berusaha) berbasis resiko.")]' },
    akteCompanyBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "Akta Perusahaan.")]' },
    skKemenkumhamBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "SK dari kemenkumham.")]' },
    npwpCompanyBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "NPWP Perusahaan.")]' },
    proofOfPurchaseBottomSheetTextViewAR: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan buyer saat ini atau buyer lainnya dengan produk yang sama.")]' },
    paymentMutationBottomSheetTextViewAR: { xpath: '//android.widget.TextView[contains(@text, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan buyer atau pembeli.")]' },
    financialReportBottomSheetTextViewAR: { xpath: '//android.widget.TextView[contains(@text, "Laporan keuangan dalam 1 tahun terakhir.")]' },
    financialReportBottomSheetTextViewAP: { xpath: '//android.widget.TextView[contains(@text, "Laporan keuangan dalam 1 tahun terakhir(jika ada).")]' },
    proofOfPurchaseBottomSheetTextViewAP: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan supplier saat ini atau supplier lainnya dengan produk yang sama.")]' },
    paymentMutationBottomSheetTextViewAP: { xpath: '//android.widget.TextView[contains(@text, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau pembeli.")]' },
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
    I.assertEqual(actualValue, "Persiapkan Dokumen Berikut");
  },
  async validateBottomSheetDocNeededContent(loanType) {
    I.wait(2);
    switch (loanType) {
      case 'AP':
        I.wait(2);
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.akteCompanyBottomSheetTextView);
        I.seeElement(this.textView.skKemenkumhamBottomSheetTextView);
        I.seeElement(this.textView.npwpCompanyBottomSheetTextView);
        let actualValue = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValue, "Minimal 3 contoh bukti pembelian dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValue1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValue1, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau pembeli.");
        I.wait(2);
        let actualValue2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewAP, "text");
        I.assertEqual(actualValue2, "Laporan keuangan dalam 1 tahun terakhir(jika ada).");
        I.wait(2);
        I.click(this.buttons.btnClose);
        break;
      case 'APIND':
        I.wait(2);
        let actualValueInd = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueInd, "Minimal 3 contoh bukti pembelian dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueInd1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueInd1, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau pembeli.");
        I.wait(2);
        let actualValueInd2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueInd2, "Laporan keuangan dalam 1 tahun terakhir(jika ada).");
        I.wait(2);
        I.click(this.buttons.btnClose);
        break;
      case 'AR':
        I.wait(2);
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.akteCompanyBottomSheetTextView);
        I.seeElement(this.textView.skKemenkumhamBottomSheetTextView);
        I.seeElement(this.textView.npwpCompanyBottomSheetTextView);
        let actualValueAR = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueAR, "Minimal 3 contoh bukti pembelian dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueAR1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueAR1, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan buyer atau pembeli.");
        I.wait(2);
        let actualValueAR2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueAR2, "Laporan keuangan dalam 1 tahun terakhir.");
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
      case 'npwpOfComp':
        I.seeElement(this.buttons.btnUploadNpwp);
        I.attachFile(this.buttons.btnUploadNpwp, 'data/file.pdf');
      break;
      case 'ktpNpwpOfComp':
        I.seeElement(this.buttons.btnUploadKtpNpwp);
        I.attachFile(this.buttons.btnUploadKtpNpwp, 'data/file.pdf');
      break;
      case 'proofOfPurchase':
        I.seeElement(this.buttons.btnUploadPurchase);
        I.attachFile(this.buttons.btnUploadPurchase, 'data/file.pdf');
        I.wait(2);
        let actualValueTextBar5 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar5, "true");
      break;
      case 'paymentMutation':
        I.seeElement(this.buttons.btnUploadMutation);
        I.attachFile(this.buttons.btnUploadMutation, 'data/file.pdf');
        I.wait(2);
        let actualValueTextBar6 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar6, "true");
      break;
      case 'financialReports':
        I.seeElement(this.buttons.btnUploadFinReport);
        I.attachFile(this.buttons.btnUploadFinReport, 'data/file.pdf');
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

}