const { I } = inject();

module.exports = {
    fields: {

    },
    buttons: {
        viewDocNeeded: "",
        btnClose: "",
        btnUploadDoc: "",
        btnUploadNib: "",
        btnUploadAkte: "",
        btnUploadSk: "",
        btnUploadNpwp: "",
        btnUploadPurchase: "",
        btnUploadMutation: "",
        btnUploadFinReport: "",
        btnRefreshUploadDoc: "",
        backBtn: "",
        btnAcceptLimitOffer: ""
    },
    textView: {
        titleBottomSheetDocNeeded: {xpath: '//android.widget.TextView[contains(@text, "Persiapkan Dokumen Berikut")]'},
        nibBottomSheetTextView: {xpath: '//android.widget.TextView[contains(@text, "NIB (Nomor Induk Berusaha) berbasis resiko.")]'},
        akteCompanyBottomSheetTextView: {xpath: '//android.widget.TextView[contains(@text, "Akta Perusahaan.")]'},
        skKemenkumhamBottomSheetTextView: {xpath: '//android.widget.TextView[contains(@text, "SK dari kemenkumham.")]'},
        npwpCompanyBottomSheetTextView: {xpath: '//android.widget.TextView[contains(@text, "NPWP Perusahaan.")]'},
        proofOfPurchaseBottomSheetTextViewAR: {xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan buyer saat ini atau buyer lainnya dengan produk yang sama.")]'},
        paymentMutationBottomSheetTextViewAR: {xpath: '//android.widget.TextView[contains(@text, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan buyer atau pembeli.")]'},
        financialReportBottomSheetTextView: {xpath: '//android.widget.TextView[contains(@text, "Laporan keuangan dalam 1 tahun terakhir.")]'},
        proofOfPurchaseBottomSheetTextViewAP: {xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan supplier saat ini atau supplier lainnya dengan produk yang sama.")]'},
        paymentMutationBottomSheetTextViewAP: {xpath: '//android.widget.TextView[contains(@text, "Mutasi rekening 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau pembeli.")]'},
        uploadDocTextViewPage: {xpath: '//android.widget.TextView[contains(@text, "Upload dokumen-dokumen sebagai berikut:")]'},
        nibUploadDocTextView: {xpath: '//android.widget.TextView[contains(@text, "NIB Berbasis Resiko *")]'},
        akteCompanyUploadDocTextView: {xpath: '//android.widget.TextView[contains(@text, "Akta Perusahaan *")]'},
        skKemenkumhamUploadDocTextView: {xpath: '//android.widget.TextView[contains(@text, "SK Kemenkumham *)]'},
        npwpCompanyUploadDocTextView: {xpath: '//android.widget.TextView[contains(@text, "NPWP Perusahaan *)]'},
        proofOfPurchaseUploadDocTextView: {xpath: '//android.widget.TextView[contains(@text, "Minimal 3 contoh bukti pembelian dengan buyer * (digabung dalam 1 file PDF)")]'},
        paymentMutationUploadDocTextView: {xpath: '//android.widget.TextView[contains(@text, "Contoh Mutasi Pembayaran 6 Bulan Terakhir * (digabung dalam 1 file PDF)")]'},
        financialReportUploadDocTextView: {xpath: '//android.widget.TextView[contains(@text, "Laporan Keuangan Dalam 1 Tahun Terakhir*  (digabung dalam 1 file PDF)")]'},
        alertBoxUploadDoc: {xpath: '//android.widget.TextView[contains(@text, "Dokumen terkirim. Periksa kembali jika sudah benar cek status terbaru di dashboard")]'},
        titleLimitActivationApproved: {xpath: '//android.widget.TextView[contains(@text, "Pengajuan limit telah disetujui sebesar")]'},
        valueInterest: {xpath: '//android.widget.TextView[contains(@text, "1.3%")]'},
        valueAdminFee: {xpath: '//android.widget.TextView[contains(@text, "3%")]'},
        valueLateFee: {xpath: '//android.widget.TextView[contains(@text, "0.1%")]'},
        contentDescLimitApproved: {xpath: '//android.widget.TextView[contains(@text, "Setiap pembayaran tagihan akan terpotong otomatis melalui autodebet Amar Bank.")]'},
        titleLimitActivationRejected: {xpath: '//android.widget.TextView[contains(@text, "Mohon Maaf, Permohonan limit Anda belum disetujui")]'},
        contentDescLimitRejected: {xpath: '//android.widget.TextView[contains(@text, "Kami memberitahukan bahwa hasil analisis kredit Anda belum memenuhi kriteria penilaian kami saat ini.")]'},
    },

    // Function for call the id component
    async changeStatusVPBusinessApproved() {
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
      async getStatusLimitApproved(){
        I.wait(2);
        I.seeElement(this.fields.titleLimitActivationApproved);
        let actualLimitApproved = await I.grabAttributeFrom(this.textView.titleLimitActivationApproved, "text");
        I.assertEqual(actualLimitApproved, "Pengajuan limit telah disetujui sebesar");
      },
      async validateContentApprovedPage(){
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
      async getStatusLimitRejected(){
        I.wait(2);
        I.seeElement(this.textView.titleLimitActivationApproved);
        let actualLimitRejected = await I.grabAttributeFrom(this.textView.titleLimitActivationRejected, "text");
        I.assertEqual(actualLimitRejected, "Mohon Maaf, Permohonan limit Anda belum disetujui");
      },
      async validateContentRejectedPage(){
        I.wait(2);
        let actualValue = await I.grabAttributeFrom(this.textView.contentDescLimitRejected, "text");
        I.assertEqual(actualValue, "Kami memberitahukan bahwa hasil analisis kredit Anda belum memenuhi kriteria penilaian kami saat ini.");
      }
}