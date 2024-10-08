const { agreeWithPrivacyAndPolicy } = require("../registration");

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
    btnnpwpbisnis: "",
    btnUploadaktapendirian: "",
    btnUploadskkemenkumhanpendirian: "",
    btnUploadnpwpbisnis: "",
    btnUploadaktaperubahanterakhir: "",
    btnUploadskkemenkumhanperubahanakhir: "",
    btnUploadktpcomm: "",  
    btnUploadnpwpcomm: "",
    btnUploadsertifikatpendaftaran: "",
    btnUploadsuratpernyataanpendirian: "",
    btnUploadsertifikatperubahanakhir:"",
    btnUploadsuratpernyataanperubahanakhir: "",
    btnUploadPurchase: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[2]' },
    btnUploadMutation: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[3]' },
    btnUploadFinReport: { xpath: '(//android.view.View[@content-desc="buttonUpload"])[4]' },
    btnUploadSPKPO: "",
   
    btnRefreshUploadDoc: "~buttonRefresh",
    backBtn: "",
    btnAcceptLimitOffer: "",
    btnSendReason: "",
    btnStopUploadDoc: "",
    btnRetry: "",
    btnDeletefile: "",
    btnConfirmdelete:"",
    btnBacktoUpload:"",
    btnSelectMetodeUploadDoc: "",
  },
  textView: {
    titleBottomSheetDocNeeded: { xpath: '//android.widget.TextView[contains(@text, "Mohon persiapkan dokumen-dokumen berikut")]' },
    nibBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "NIB (Nomor Induk Berusaha)")]' },
    aktependirianBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "Akta Pendirian")]' },
    skKemenkumhampendirianTextView: { xpath: '//android.widget.TextView[contains(@text, "SK Kemenkumham Pendirian")]' },
    npwpCompanyBottomSheetTextView: { xpath: '//android.widget.TextView[contains(@text, "NPWP Bisnis")]' },
    akteperubahanTextView: { xpath: '//android.widget.TextView[contains(@text, "Akta Perubahan Terakhir (jika ada)")]' },
    skkemenkumhanterakhirTextView: { xpath: '//android.widget.TextView[contains(@text, "SK Kemenkumham Perubahan Terakhir (jika ada)")]' },
    ktpdanNpwnComisionertextView:  { xpath: '//android.widget.TextView[contains(@text, "KTP & NPWP Komisioner & Pemegang Saham.")]' },
    suratpendaftaranPTPerorangantextview:  { xpath: '//android.widget.TextView[contains(@text, "Sertifikat Pendaftaran")]' },
    suratpernyataanpendirianPTPerorangantextview : { xpath: '//android.widget.TextView[contains(@text, "Surat Pernyataan Pendirian")]' },
    sertifikatperubahanterakhirtextviewPTPerorangan: { xpath: '//android.widget.TextView[contains(@text, "Sertifikat Perubahan Terakhir (jika ada)")]' },
    suratpernyataanperubahanterakhirPTPerorangantextview: { xpath: '//android.widget.TextView[contains(@text, "Surat Pernyataan Perubahan Terakhir (jika ada)")]' },

    ktpComisionerTextView:  { xpath: '//android.widget.TextView[contains(@text, "KTP Komisioner & Pemegang Saham.")]' },
    npwpComisionerTextView:  { xpath: '//android.widget.TextView[contains(@text, "NPWP Komisioner & Pemegang Saham.")]' },

       
    proofOfPurchaseBottomSheetTextViewAP: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.")]' },
    paymentMutationBottomSheetTextViewAP: { xpath: '//android.widget.TextView[contains(@text, "Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau buyer.")]' },
    
    proofOfPurchaseBottomSheetTextViewAR: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.")]' },
    paymentMutationBottomSheetTextViewAR: { xpath: '//android.widget.TextView[contains(@text, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir")]' },
   
    financialReportBottomSheetTextViewMSME: { xpath: '//android.widget.TextView[contains(@text, "Laporan keuangan dalam 1 tahun terakhir.")]' },
    financialReportBottomSheetTextViewCorp: { xpath: '//android.widget.TextView[contains(@text, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.")]' },
    
    proofOfPurchaseBottomSheetTextViewPO: { xpath: '//android.widget.TextView[contains(@text, "Surat Perintah Kerja (SPK) dari bouwheer saat ini atau bouwheer lainnya dengan produk yang sama")]' },
   
    uploadDocTextViewPage: { xpath: '//android.widget.TextView[contains(@text, "Progress Upload Dokumen:")]' },
    infouploaddoctextview: { xpath: '//android.widget.TextView[contains(@text, "Format file: PDF")]' },
    infosizeuplaodtextview: { xpath: '//android.widget.TextView[contains(@text, "maximum ukuran per file: 15MB")]' },
    nibUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "NIB Berbasis Resiko *")]' },
    akteCompanyUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Akta Perusahaan *")]' },
    skKemenkumhamUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "SK Kemenkumham *)]' },
    npwpCompanyUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "NPWP Perusahaan *)]' },
    proofOfPurchaseUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan buyer *")]' },
    paymentMutationUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Contoh Mutasi Pembayaran 6 Bulan Terakhir *")]' },
    financialReportUploadDocTextView: { xpath: '//android.widget.TextView[contains(@text, "Laporan Keuangan Dalam 1 Tahun Terakhir*")]' },
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
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualaktapendirianAPcorp = await I.grabTextFrom(this.textView.aktependirianBottomSheetTextView);
        I.assertEqual(actualaktapendirianAPcorp, "Akta Pendirian");
        let actualskkemenkumpendirianAPcorp = await I.grabTextFrom(this.textview.skKemenkumhampendirianTextView);
        I.assertEqual(actualskkemenkumpendirianAPcorp, "SK Kemenkumham Pendirian");
        let actualnpwpbisnisAPcorp = await I.grabTextFrom(this.textView.npwpCompanyBottomSheetTextView);
        I.assertEqual(actualnpwpbisnisAPcorp, "NPWP Bisnis");
        let actualaktaperubahanakhirAPcorp = await I.grabTextFrom(this.textview.actualaktaperubahanakhirAPcorp);
        I.assertEqual(actualaktaperubahanakhirAPcorp, "Akta Perubahan Terakhir (jika ada)");
        let actualSKkemenkumhamperubahanakhirAPcorp = await I.grabTextFrom(this.textview.skkemenkumhanterakhirTextView);
        I.seeElement(this.textView.ktpComisionerTextView);
        I.seeElement(this.textView.npwpComisionerTextView);        
        let actualValueAPCorp = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPCorp, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueAPCorp1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPCorp1, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir");
        I.wait(2);
        let actualValueAPCorp2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueAPCorp2, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

      case 'CorpARPT.Perusahaan':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualaktapendirianARcorp = await I.grabTextFrom(this.textView.aktependirianBottomSheetTextView);
        I.assertEqual(actualaktapendirianARcorp, "Akta Pendirian");
        let actualskkemenkumpendirianARcorp = await I.grabTextFrom(this.textview.skKemenkumhampendirianTextView);
        I.assertEqual(actualskkemenkumpendirianARcorp, "SK Kemenkumham Pendirian");
        let actualnpwpbisnisARcorp = await I.grabTextFrom(this.textView.npwpCompanyBottomSheetTextView);
        I.assertEqual(actualnpwpbisnisARcorp, "NPWP Bisnis");
        let actualaktaperubahanakhirARcorp = await I.grabTextFrom(this.textview.actualaktaperubahanakhirAPcorp);
        I.assertEqual(actualaktaperubahanakhirARcorp, "Akta Perubahan Terakhir (jika ada)");
        let actualSKkemenkumhamperubahanakhirARcorp = await I.grabTextFrom(this.textview.skkemenkumhanterakhirTextView);
        I.seeElement(this.textView.ktpComisionerTextView);
        I.seeElement(this.textView.npwpComisionerTextView);
        let actualValueARCorp = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueARCorp, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueCorpAR1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueCorpAR1, "Rekening koran/mutasi rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueCorpAR2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueCorpAR2, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;
      
      case 'CorpAPPT.Perorangan':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualsertifikatpendaftaranPTPerorangan = await I.grabAttributeFrom(this.textView.sertifikatpendaftaranPTPerorangan, "text");
        I.assertEqual(actualsertifikatpendaftaranPTPerorangan, "Sertifikat Pendaftaran");
        let actualvaluenpwpcompany = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualvaluenpwpcompany, "NPWP Bisnis");
        let actualsuratpernyataanpendirian = await I.grabAttributeFrom(this.textView.suratpernyataanpendirianPTPerorangantextview, "text");
        I.assertEqual(actualsuratpernyataanpendirian, "Surat Pernyataan Pendirian");
        let actualsertifikatperubahanterakhir = await I.grabAttributeFrom(this.textview.sertifikatperubahanterakhirtextviewPTPerorangan, "text");
        I.assertEqual(actualsertifikatperubahanterakhir, "Sertifikat Perubahan Terakhir (jika ada)");
        let actualsuratpernyataanperubahakhir = await I.grabAttributeFrom(this.textView.suratpernyataanperubahanterakhirPTPerorangantextview, "text");
        I.assertEqual(actualsuratpernyataanperubahakhir, "Surat Pernyataan Perubahan Terakhir (jika ada)");        
        let actualValueCorpAPPerorangan1 = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueCorpAPPerorangan1, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueCorpAPPerorangan2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueCorpAPPerorangan2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueCorpAPPerorangan3= await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueCorpAPPerorangan3, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;
        
      case 'CorpARPT.Perorangan':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualsertifikatpendaftaranARPTPerorangan = await I.grabAttributeFrom(this.textView.sertifikatpendaftaranPTPerorangan, "text");
        I.assertEqual(actualsertifikatpendaftaranARPTPerorangan, "Sertifikat Pendaftaran");
        let actualvaluenpwpcompanyAR = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualvaluenpwpcompanyAR, "NPWP Bisnis");
        let actualsuratpernyataanpendirianAR = await I.grabAttributeFrom(this.textView.suratpernyataanpendirianPTPerorangantextview, "text");
        I.assertEqual(actualsuratpernyataanpendirianAR, "Surat Pernyataan Pendirian");
        let actualsertifikatperubahanterakhirAR = await I.grabAttributeFrom(this.textview.sertifikatperubahanterakhirtextviewPTPerorangan, "text");
        I.assertEqual(actualsertifikatperubahanterakhirAR, "Sertifikat Perubahan Terakhir (jika ada)");
        let actualsuratpernyataanperubahakhirAR = await I.grabAttributeFrom(this.textView.suratpernyataanperubahanterakhirPTPerorangantextview, "text");
        I.assertEqual(actualsuratpernyataanperubahakhirAR, "Surat Pernyataan Perubahan Terakhir (jika ada)");        
        let actualValueCorpARPerorangan1 = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueCorpAPPerorangan1, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueCorpARPerorangan2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueCorpAPPerorangan2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueCorpARPerorangan3= await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueCorpARPerorangan3, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

      case 'CorpAPUD':
        I.wait(2);
        I.see('Mohon persiaplan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualnpwpcompanyCorpAPUD = await I.grabAttributeFrom(this.textview.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualnpwpcompanyCorpAPUD, "NPWP Bisnis");
        let actualvaluecorpAPUD = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualvaluecorpAPUD, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        let actualvaluecorpAPUD2 = await I.grabAttributeFrom(this.textview.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualvaluecorpAPUD2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        let actualvaluecorpAPUD3 = await I.grabTextFrom(this.textview.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualvaluecorpAPUD3, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

      case 'CorpARUD':        
        I.wait(2);
        I.see('Mohon persiaplan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualnpwpcompanyCorpARUD = await I.grabAttributeFrom(this.textview.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualnpwpcompanyCorpARUD, "NPWP Bisnis");
        let actualvaluecorpARUD = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualvaluecorpARUD, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        let actualvaluecorpARUD2 = await I.grabAttributeFrom(this.textview.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualvaluecorpARUD2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        let actualvaluecorpARUD3 = await I.grabTextFrom(this.textview.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualvaluecorpARUD3, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;
    
        
      case 'CorpAPIndividu':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');                  
        let actualValueCorpAPIndividu1 = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueCorpAPIndividu1, "Minimal 3 contoh bukti pembelian dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueCorpAPIndividu2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueCorpAPIndividu2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueCorpAPIndividu3 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueCorpAPIndividu3, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

      case 'CorpARIndividu':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');                   
        let actualValueARIndividu1 = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueARIndividu1, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueCorpARIndividu2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueCorpARIndividu2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueCorpARIndividu3 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewCorp, "text");
        I.assertEqual(actualValueCorpARIndvidu3, "Laporan keuangan 2 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

      
      case 'MSMEAPPT.Perusahaan':
        I.wait(2);        
        I.see('Mohon persiapkan dokumen-dokumen berikut:')
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualvalueakta = await I.grabAttributeFrom(this.textView.aktependirianBottomSheetTextView, "text");
        I.assertEqual(actualvalueakta, "Akta Pendirian");
        let actualSKKemenkumhamPendirian = await I.grabAttributeFrom(this.textView.skKemenkumhamBottomSheetTextView, "text");
        I.assertEqual(actualSKKemenkumhamPendirian, "SK Kemenkumham Pendirian");
        let actualnpwpbisnis = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualnpwpbisnis, "NPWP Bisnis");
        let actualvalueaktaterakhir = await I.grabAttributeFrom(thhis.textview.akteperubahanTextView, "text");
        I.assertEqual(actualvalueaktaterakhir, "Akta Perubahan Terakhir (jika ada)");
        let actualSKKememenkumhamterakhir = await I.grabAttributeFrom(this.textView.akteperubahanTextView, "text");
        I.assertEqual(actualSKKememenkumhamterakhir, "SK Kemenkumham Perubahan Terakhir (jika ada)");
        let actualvaluektpnpwpcom = await I.grabAttributeFrom(this.textView.ktpdanNpwnComisionertextView, "text");
        I.assertEqual(actualvaluektpnpwpcom, "KTP & NPWP Komisioner & Pemegang Saham.");
       
        let actualValueAPMSME = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPMSME, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueAPMSME2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueAPMSME2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueAPMSME3 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValueAPMSME3, "Laporan keuangan 1 tahun terakhir.");
        I.wait(2);
        I.seeElement(this.buttons.btnSelectMetodeUploadDoc);
        break;

      case 'MSMEARPT.Perusahaan':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualvalueaktaAR = await I.grabAttributeFrom(this.textView.aktependirianBottomSheetTextView, "text");
        I.assertEqual(actualvalueaktaAR, "Akta Pendirian");
        let actualSKKemenkumhamPendirianAR = await I.grabAttributeFrom(this.textView.skKemenkumhamBottomSheetTextView, "text");
        I.assertEqual(actualSKKemenkumhamPendirianAR, "SK Kemenkumham Pendirian");
        let actualnpwpbisnisAR = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualnpwpbisnisAR, "NPWP Bisnis");
        let actualvalueaktaterakhirAR = await I.grabAttributeFrom(thhis.textview.akteperubahanTextView, "text");
        I.assertEqual(actualvalueaktaterakhirAR, "Akta Perubahan Terakhir (jika ada)");
        let actualSKKememenkumhamterakhirAR = await I.grabAttributeFrom(this.textView.akteperubahanTextView, "text");
        I.assertEqual(actualSKKememenkumhamterakhirAR, "SK Kemenkumham Perubahan Terakhir (jika ada)");
        let actualvaluektpnpwpcomAR = await I.grabAttributeFrom(this.textView.ktpdanNpwnComisionertextView, "text");
        I.assertEqual(actualvaluektpnpwpcomAR, "KTP & NPWP Komisioner & Pemegang Saham.");      
        let actualValueARMSME = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueARMSME, "Minimal 3 contoh bukti pembelian dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValueARMSME2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAR, "text");
        I.assertEqual(actualValueARMSME2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueARMSME3 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValueARMSME3, "Laporan keuangan dalam 1 tahun terakhir.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

      case 'MSMEPOPT.Perusahaan':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualvalueaktaPO = await I.grabAttributeFrom(this.textView.aktependirianBottomSheetTextView, "text");
        I.assertEqual(actualvalueaktaPO, "Akta Pendirian");
        let actualSKKemenkumhamPendirianPO = await I.grabAttributeFrom(this.textView.skKemenkumhamBottomSheetTextView, "text");
        I.assertEqual(actualSKKemenkumhamPendirianPO, "SK Kemenkumham Pendirian");
        let actualnpwpbisnisPO = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualnpwpbisnisPO, "NPWP Bisnis");
        let actualvalueaktaterakhirPO = await I.grabAttributeFrom(thhis.textview.akteperubahanTextView, "text");
        I.assertEqual(actualvalueaktaterakhirPO, "Akta Perubahan Terakhir (jika ada)");
        let actualSKKememenkumhamterakhirPO = await I.grabAttributeFrom(this.textView.akteperubahanTextView, "text");
        I.assertEqual(actualSKKememenkumhamterakhirPO, "SK Kemenkumham Perubahan Terakhir (jika ada)");
        let actualvaluektpnpwpcomPO = await I.grabAttributeFrom(this.textView.ktpdanNpwnComisionertextView, "text");
        I.assertEqual(actualvaluektpnpwpcomPO, "KTP & NPWP Komisioner & Pemegang Saham.");       
        let actualValuePO = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewPO, "text");
        I.assertEqual(actualValuePO, "Surat Perintah Kerja (SPK) dari bouwheer saat ini atau bouwheer lainnya dengan produk yang sama");
        I.wait(2);
        let actualValuePO1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewPO, "text");
        I.assertEqual(actualValuePO1, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValuePO2 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValuePO2, "Laporan keuangan dalam 1 tahun terakhir.");
        I.wait(2);
        I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;


      case 'MSMEAPPT.Perorangan':
        I.wait(2);       
        I.see('Mohon persiapkan dokumen-dokumen berikut:'); 
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualsertifikatpendaftaranPTPeroranganAPMSME = await I.grabAttributeFrom(this.textView.sertifikatpendaftaranPTPerorangan, "text");
        I.assertEqual(actualsertifikatpendaftaranPTPeroranganAPMSME, "Sertifikat Pendaftaran");
        let actualvaluenpwpcompanyAPMSME = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualvaluenpwpcompanyAPMSME, "NPWP Bisnis");
        let actualsuratpernyataanpendirianAPMSME = await I.grabAttributeFrom(this.textView.suratpernyataanpendirianPTPerorangantextview, "text");
        I.assertEqual(actualsuratpernyataanpendirianAPMSME, "Surat Pernyataan Pendirian");
        let actualsertifikatperubahanterakhirAPMSME = await I.grabAttributeFrom(this.textview.sertifikatperubahanterakhirtextviewPTPerorangan, "text");
        I.assertEqual(actualsertifikatperubahanterakhirAPMSME, "Sertifikat Perubahan Terakhir (jika ada)");
        let actualsuratpernyataanperubahakhirAPMSME = await I.grabAttributeFrom(this.textView.suratpernyataanperubahanterakhirPTPerorangantextview, "text");
        I.assertEqual(actualsuratpernyataanperubahakhirAPMSME, "Surat Pernyataan Perubahan Terakhir (jika ada)");        
        let actualValueproofAPMSME1 = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueproofAPMSME1, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValuepaymentAPMSME1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValuepaymentAPMSME1, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueFinancialAPMSME1= await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValueCorpAPPeroranganAPMSME, "Laporan keuangan 1 tahun terakhir dan tahun berjalan.");
        I.wait(2);
        I.click(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

        case 'MSMEARPT.Perorangan':
          I.wait(2);       
          I.see('Mohon persiapkan dokumen-dokumen berikut:'); 
          I.seeElement(this.textView.nibBottomSheetTextView);
          let actualsertifikatpendaftaranPTPeroranganARMSME = await I.grabAttributeFrom(this.textView.sertifikatpendaftaranPTPerorangan, "text");
          I.assertEqual(actualsertifikatpendaftaranPTPeroranganARMSME, "Sertifikat Pendaftaran");
          let actualvaluenpwpcompanyARMSME = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
          I.assertEqual(actualvaluenpwpcompanyARMSME, "NPWP Bisnis");
          let actualsuratpernyataanpendirianARMSME = await I.grabAttributeFrom(this.textView.suratpernyataanpendirianPTPerorangantextview, "text");
          I.assertEqual(actualsuratpernyataanpendirianARMSME, "Surat Pernyataan Pendirian");
          let actualsertifikatperubahanterakhirARMSME = await I.grabAttributeFrom(this.textview.sertifikatperubahanterakhirtextviewPTPerorangan, "text");
          I.assertEqual(actualsertifikatperubahanterakhirARMSME, "Sertifikat Perubahan Terakhir (jika ada)");
          let actualsuratpernyataanperubahakhirARMSME = await I.grabAttributeFrom(this.textView.suratpernyataanperubahanterakhirPTPerorangantextview, "text");
          I.assertEqual(actualsuratpernyataanperubahakhirARMSME, "Surat Pernyataan Perubahan Terakhir (jika ada)");        
          let actualValueproofARMSME1 = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
          I.assertEqual(actualValueproofARMSME1, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
          I.wait(2);
          let actualValuepaymentARMSME1 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
          I.assertEqual(actualValuepaymentARMSME1, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
          I.wait(2);
          let actualValueFinancialARMSME1= await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
          I.assertEqual(actualValueCorpAPPeroranganARMSME, "Laporan keuangan 1 tahun terakhir dan tahun berjalan.");
          I.wait(2);
          I.click(this.buttons.clickBtnSelectMetodeUploadDocument);
          break;

        case 'MSMEPOPT.Perorangan':
          I.wait(2);
          I.see('Mohon persiapkan dokumen-dokumen berikut:');
          I.seeElement(this.textView.nibBottomSheetTextView);
          let actualsertifikatpendaftaranPTPeroranganPOMSME = await I.grabAttributeFrom(this.textView.sertifikatpendaftaranPTPerorangan, "text");
          I.assertEqual(actualsertifikatpendaftaranPTPeroranganPOMSME, "Sertifikat Pendaftaran");
          let actualvaluenpwpcompanyPOMSME = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
          I.assertEqual(actualvaluenpwpcompanyPOMSME, "NPWP Bisnis");
          let actualsuratpernyataanpendirianPOMSME = await I.grabAttributeFrom(this.textView.suratpernyataanpendirianPTPerorangantextview, "text");
          I.assertEqual(actualsuratpernyataanpendirianPOMSME, "Surat Pernyataan Pendirian");
          let actualsertifikatperubahanterakhirPOMSME = await I.grabAttributeFrom(this.textview.sertifikatperubahanterakhirtextviewPTPerorangan, "text");
          I.assertEqual(actualsertifikatperubahanterakhirPOMSME, "Sertifikat Perubahan Terakhir (jika ada)");
          let actualsuratpernyataanperubahakhirPOMSME = await I.grabAttributeFrom(this.textView.suratpernyataanperubahanterakhirPTPerorangantextview, "text");
          I.assertEqual(actualsuratpernyataanperubahakhirPOMSME, "Surat Pernyataan Perubahan Terakhir (jika ada)");       
          let actualValuePOPerorangan1 = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewPO, "text");
          I.assertEqual(actualValuePOPerorangan1, "Surat Perintah Kerja (SPK) dari bouwheer saat ini atau bouwheer lainnya dengan produk yang sama");
          I.wait(2);
          let actualValuePOPerorangan2 = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewPO, "text");
          I.assertEqual(actualValuePOPerorangan2, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
          I.wait(2);
          let actualValuePOPerorangan3 = await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewAP, "text");
          I.assertEqual(actualValuePOPerorangan3, "Laporan keuangan dalam 1 tahun terakhir(jika ada).");
          I.wait(2);
          I.seeElement(this.buttons.clickBtnSelectMetodeUploadDocument);
          break;     
      
      case 'MSMEAPUD':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualnpwpcompanyUD = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualnpwpcompanyUD, "NPWP Bisnis");
        let actualValueproofAPMSMEUD = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueproofAPMSMEUD, "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValuepaymentAPMSMEUD = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValuepaymentAPMSMEUD, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueFinancialAPMSMEUD= await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValueFinancialAPMSMEUD, "Laporan keuangan dalam 1 tahun terakhir. ");
        I.wait(2);
        I.click(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

      case 'MSMEARUD':
        I.wait(2);
        I.see('Mohon persiapkan dokumen-dokumen berikut:');
        I.seeElement(this.textView.nibBottomSheetTextView);
        I.seeElement(this.textView.nibBottomSheetTextView);
        let actualnpwpcompanyARUD = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
        I.assertEqual(actualnpwpcompanyARUD, "NPWP Bisnis");
        let actualValueproofARMSMEUD = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
        I.assertEqual(actualValueproofARMSMEUD, "Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.wait(2);
        let actualValuepaymentARMSMEUD = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
        I.assertEqual(actualValuepaymentARMSMEUD, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
        I.wait(2);
        let actualValueFinancialARMSMEUD= await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
        I.assertEqual(actualValueFinancialARMSMEUD, "Laporan keuangan dalam 1 tahun terakhir. ");
        I.wait(2);
        I.click(this.buttons.clickBtnSelectMetodeUploadDocument);
        break;

        case 'MSMEPOUD':
          I.wait(2);
          I.see('Mohon persiapkan dokumen-dokumen berikut:');
          I.seeElement(this.textView.nibBottomSheetTextView);
          I.seeElement(this.textView.nibBottomSheetTextView);
          let actualnpwpcompanyPOUD = await I.grabAttributeFrom(this.textView.npwpCompanyBottomSheetTextView, "text");
          I.assertEqual(actualnpwpcompanyPOUD, "NPWP Bisnis");
          let actualValueproofPOMSMEUD = await I.grabAttributeFrom(this.textView.proofOfPurchaseBottomSheetTextViewAP, "text");
          I.assertEqual(actualValueproofPOMSMEUD, "Surat Perintah Kerja (SPK) dari bouwheer saat ini atau bouwheer lainnya dengan produk yang sama.");
          I.wait(2);
          let actualValuepaymentPOMSMEUD = await I.grabAttributeFrom(this.textView.paymentMutationBottomSheetTextViewAP, "text");
          I.assertEqual(actualValuepaymentPOMSMEUD, "Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir.");
          I.wait(2);
          let actualValueFinancialPOMSMEUD= await I.grabAttributeFrom(this.textView.financialReportBottomSheetTextViewMSME, "text");
          I.assertEqual(actualValueFinancialPOMSMEUD, "Laporan keuangan dalam 1 tahun terakhir. ");
          I.wait(2);
          I.click(this.buttons.clickBtnSelectMetodeUploadDocument);
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
    I.seeElement(this.textView.infouploaddoctextview);
    I.seeElement(this.textview.infosizeuplaodtextview);
  },
  async uploadDocuments(docType) {
    I.wait(2);
    switch (docType) {
      case 'nib':
        I.see('NIB *');
        I.seeElement(this.buttons.btnUploadNib);
        I.attachFile(this.buttons.btnUploadNib, 'data/file.pdf');
      break;
      case 'aktapendirian':
        I.see('Akta Pendirian *');
        I.seeElement(this.buttons.btnUploadaktapendirian);
        I.attachFile(this.buttons.btnUploadaktapendirian, 'data/file.pdf');
      break;
      case 'skkemenkumhanpendirian':
        I.see('SK Kemenkumham Pendirian *');
        I.seeElement(this.buttons.btnUploadskkemenkumhanpendirian);
        I.attachFile(this.buttons.btnUploadskkemenkumhanpendirian, 'data/file.pdf');
      break;
      case 'npwpbisnis':
        I.see('NPWP Bisnis *');
        I.seeElement(this.buttons.btnUploadnpwpbisnis);
        I.attachFile(this.buttons.btnUploadnpwpbisnis, 'data/file.pdf');
      break;
      case 'aktaperubahanterakhir':
        I.see('Akta Perubahan Terakhir');
        I.seeElement(this.buttons.btnUploadaktaperubahanterakhir);
        I.attachFile(this.buttons.btnUploadaktaperubahanterakhir,'data/file18MB.pdf');     
        let actualValueErrorMessage1 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "displayed");
        I.assertEqual(actualValueErrorMessage1, "true"); 
      break;
      case 'skkemenkumhanperubahanakhir':
        I.see('SK Kemenkumham Perubahan Terakhir');
        I.seeElement(this.buttons.btnUploadskkemenkumhanperubahanakhir);
        I.attachFile(this.buttons.btnUploadskkemenkumhanperubahanakhir, 'data/file.pdf');
        I.wait(2);
        let actualValueErrorMessage2 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "displayed");
        I.assertEqual(actualValueErrorMessage2, "true");
      break;
      case 'ktpcomm':
        I.see('KTP Komisioner & Pemegang Saham * (digabung dalam 1 file PDF)');
        I.seeElement(this.buttons.btnUploadktpcomm)
        I.attachFile(this.buttons.btnUploadktpdannpwpcom, 'data/File.pdf');
      break;
      case 'npwpcomm':
        I.see('NPWP Komisioner & Pemegang Saham * (digabung dalam 1 file PDF)');
        I.seeElement(this.buttons.btnUploadnpwpcomm);
        I.attachFile(this.buttons.btnUploadnpwpcomm, 'data/file.pdf');

      case 'sertifikatpendaftaran':
        I.see('Sertifikat Pendaftaran *');
        I.seeElement(this.buttons.btnUploadsertifikatpendaftaran);
        I.attachFile(this.buttons.btnUploadsertifikatpendaftaran, 'data/file.pdf');
      break;
      case 'suratpernyataanpendirian':
        I.see('Surat Pernyataan Pendirian *');
        I.seeElement(this.buttons.btnUploadsuratpernyataanpendirian);
        I.attachFile(this.buttons.btnUploadsuratpernyataanpendirian, 'data/file.jgp');
      break;
      case 'sertifikatperubahanterakhir':
        I.see('Sertifikat Perubahan Terakhir');
        I.seeElement(this.buttons.btnUploadsertifikatperubahanakhir);
        I.attachFile(this.buttons.btnUploadsertifikatperubahanakhir, 'data/file.jpg');
      break;
      case 'suratpernyataanperubahanakhir':
        I.see('Surat Pernyataan Perubahan Terakhir');
        I.seeElement(this.buttons.btnUploadsuratpernyataanperubahanakhir);
        I.attachFile(this.buttons.btnUploadsuratpernyataanperubahanakhir, 'data/file.jpg');
      break;
      case '3contohInvoicewithSupplier':
        I.see('Minimal 3 contoh invoice dengan supplier terkait *');
        I.seeElement(this.buttons.btnUploadPurchase);
        I.attachFile(this.buttons.btnUploadPurchase, 'data/file.pdf');      
        I.wait(2);
        let actualValueTextBar5 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar5, "true");
      break;
      case '3contohInvoicewithBuyer':
        I.see('Minimal 3 contoh invoice dengan buyer terkait *');
        I.seeElement(this.buttons.btnUploadPurchase);
        I.attachFile(this.buttons.btnUploadPurchase, 'data/file.pdf');    
      break;
      case 'SPKdok':
        I.see('Surat Perintah Kerja (SPK) dari bouwheer saat ini atau bouwheer lainnya dengan produk yang sama');
        I.seeElement(this.buttons.btnUploadSPKPO);
        I.attachFile(this.buttons.btnUploadSPKPO, 'data/file.pdf');
      case 'paymentMutation':
        I.see('Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir *');
        I.seeElement(this.buttons.btnUploadMutation);
        I.attachFile(this.buttons.btnUploadMutation, 'data/file.pdf');
        I.wait(2);
        let actualValueTextBar6 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar6, "true");
      break;
      case '1YearfinancialReports':
        I.see('Laporan Keuangan dalam 1 tahun terakhir')
        I.seeElement(this.buttons.btnUploadFinReport);
        I.attachFile(this.buttons.btnUploadFinReport, 'data/file.jpg', 'data/file.jpeg', 'data/file.pdf', 'data/file.png');
        I.wait(2);
        let actualValueTextBar7 = await I.grabAttributeFrom(this.fields.textProgressBar, "displayed");
        I.assertEqual(actualValueTextBar7, "true");
      break;
      case '2YearfinancialReports':
        I.see('Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan')
        I.seeElement(this.buttons.btnUploadFinReport);
        I.attachFile(this.buttons.btnUploadFinReport, 'data/file.pdf');
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
      case 'aktapendirian':
        I.seeElement(this.buttons.btnUploadaktapendirian);
        I.attachFile(this.buttons.btnUploadaktapendirian, 'data/file.pdf');
      break;
      case 'skkemenkumhanpendirian':
        I.seeElement(this.buttons.btnUploadskkemenkumhanpendirian);
        I.attachFile(this.buttons.btnUploadskkemenkumhanpendirian, 'data/file.pdf');
      break;
      case 'npwpbisnis':
        I.seeElement(this.buttons.btnUploadnpwpbisnis);
        I.attachFile(this.buttons.btnUploadnpwpbisnis, 'data/file.pdf');
      break;
      case 'aktaperubahanterakhir':
        I.seeElement(this.buttons.btnUploadaktaperubahanterakhir);
        I.attachFile(this.buttons.btnUploadaktaperubahanterakhir,'data/file18MB.pdf');     
        let actualValueErrorMessage1 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "displayed");
        I.assertEqual(actualValueErrorMessage1, "true"); 
      break;
      case 'skkemenkumhanperubahanakhir':
        I.seeElement(this.buttons.btnUploadskkemenkumhanperubahanakhir);
        I.attachFile(this.buttons.btnUploadskkemenkumhanperubahanakhir, 'data/file.pdf');
        I.wait(2);
        let actualValueErrorMessage2 = await I.grabAttributeFrom(this.textView.textErrorMessageUpload, "dispalyed");
        I.assertEqual(actualValueErrorMessage2, "true");
      break;
      case 'ktpdannpwpcom':
        I.seeElement(this.buttons.btnUploadktpdannpwpcom);
        I.attachFile(this.buttons.btnUploadktpdannpwpcom, 'data/File.pdf');
      break;
      case '3contohInvoicewithSupplier':
        I.seeElement(this.buttons.btnUploadInvoices);
        I.attachFile(this.buttons.btnUploadInvoices, 'data/file18MB.jpg', 'data/file18MB.jpeg', 'data/file18MB.pdf', 'data/file18MB.png');
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
  },

  clickBtnSelectMetodeUploadDocument(){
    I.wait(2);
    I.seeElement(this.textView.btnSelectMetodeUploadDoc);
    I.click(this.buttons.btnSelectMetodeUploadDoc);
  },

  async validatebottomsheetmetodeupload(){
    I.wait(2);
    switch(metodeupload){
      case 'Langsung dari Aplikasi':
        I.wait(3);
        I.see('Langsung dari Aplikasi');
        I.see('Dokumen dapat Anda unggah sendiri menggunakan aplikasi Amar Bank Bisnis di Handphone Anda');
        break;
      case 'Dari Perangkat lain/ Delegasi':
        I.wait(2);
        I.see('Dari Perangkat Lain/ Delegasi');
        I.see('Dokumen dapat diungggah oleh Anda sendiri atau oleh orang lain yang Anda delegasikan melalui berbagai peranngkat menggunakan link yang akan diberikan.');
        break;
        
      }
  }
}