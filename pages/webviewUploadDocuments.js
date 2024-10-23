const { label } = require("./registration");

const { I } = inject();

module.exports = {
  labels: {
    LbAnchorName: '//*[@id="LbAnchorName"]',
    LbLoanNumber: '//*[@id="LbLoanNumber]',
  },

  loanType: {
    textSupplier: 'Supplier',
    textBuyer: 'Buyer',
    textBouwheer: 'Bouwheer',
    textloanNumber: 'No.Pinjaman',
    textFormatiFileInformation: 'Format file: PDF / JPG / JPEG / PNG',
    textMaxFileInformation: 'Maximal ukuran per file: 15MB',
  },

  sectionUploadDocuments: {
    button: {
      buttonAction0: '//*[@id="buttonAction0"]',
      buttonAction1: '//*[@id="buttonAction1"]',
      buttonAction2: '//*[@id="buttonAction2"]',
      buttonAction3: '//*[@id="buttonAction3"]',
      buttonAction4: '//*[@id="buttonAction4"]',
      buttonAction5: '//*[@id="buttonAction5"]',
      buttonAction6: '//*[@id="buttonAction6"]',
      buttonAction7: '//*[@id="buttonAction7"]',
      buttonAction8: '//*[@id="buttonAction8"]',
      buttonUpdateProgress: '//*[@id="buttonRefresh"]',
      buttoncancelupload: "~",
      buttoncardinvoiceupload: "~upload-card-invoice",
      bTnSaveInvoice: "~btn-save-invoice",
      bTnaddnewsupplier: "~btn-add-supplier",
      buttoncheckaccount: "~btn-check-bank-account",
      buttonnextdataperwakilan: "~btn-next-representation",
      buttonsavedatasupplier: "~btn-save-representation",
     
    },
    textFieldName: {
      fieldNIB: 'NIB',
      fieldAktaPerusahaan: 'Akta Pendirian',
      fieldSKKemenkumham: 'SK Kemenkumham',
      fieldNPWPPerusahaan: 'NPWP Perusahaan',
      fieldKTPKomisionerdanPemegangSaham: 'KTP Komisioner & Pemegang Saham',
      fieldNPWPKomisionerdanPemegangSaham: 'NPWP Komisioner & Pemegang',
      fiedMinimal3ContohInvoiceDenganSupplier: 'Minimal 3 contoh invoice dengan supplier terkait',
      fiedMinimal3ContohInvoiceDenganBuyer: 'Minimal 3 contoh invoice dengan buyer terkait',
      fieldSPKdariBouwheer: 'Surat Perintah Kerja (SPK) dari bouwheer',
      fieldRekeningKoranatauMutasiRekening6Bulan: 'Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir',
      fieldLaporanKeuangan1tahunterakhir: 'Laporan Keuangan dalam 1 tahun terakhir',
      fieldLaporanKeuangan2tahunterakhir: 'Laporan Keuangan 2 tahun terakhir dan tahun berjalan',
    },
    fields: {
      inputnominalinvoice: "~txt-nominal-invoice",
      inputinvoicenumber: "~txt-invoice-no",
      searchbankname: "~txt-search-bank-name",
    },
    dropdown: {
      listsupplier: "~card-supplier",
      firstItem: { xpath: "//android.view.View[2]/android.view.View/android.view.View" },
    },
  },

  validateLoanTypeAP() {
    I.wait(2);
    I.see(this.loanType.textSupplier);
    I.seeElement(this.labels.LbAnchorName);
    I.see(this.loanType.textloanNumber);
    I.seeElement(this.labels.LbLoanNumber);
  },

  validateLoanTypeAR() {
    I.wait(2);
    I.see(this.loanType.textBuyer);
    I.seeElement(this.labels.LbAnchorName);
    I.see(this.loanType.textloanNumber);
    I.seeElement(this.labels.LbLoanNumber);
  },

  validateLoanTypePO() {
    I.wait(2);
    I.see(this.loanType.textBouwheer);
    I.seeElement(this.labels.LbAnchorName);
    I.see(this.loanType.textloanNumber);
    I.seeElement(this.labels.LbLoanNumber);
  },
  clickButtonUpdateProgress() {
    I.wait(2);
    I.seeElement(this.sectionUploadDocuments.button.buttonUpdateProgress);
    I.click(this.sectionUploadDocuments.button.buttonUpdateProgress);
  },

  clickButtonCancelUploading() {
    I.wait(2);
    I.seeElement(this.sectionUploadDocuments.buttoncancelupload);
  },

  async uploadDocumentAPCorp(docTypeLoan) {
    I.wait(2);
    switch (docTypeLoan) {
      case 'nib':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNIB);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction0);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction0, 'data/file.pdf');
        break;
      case 'Akta Pendirian':
        I.see(this.sectionUploadDocuments.textFieldName.fieldAktaPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction1);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction1, 'data/file.pdf');
        break;
      case 'SK Kemenkumham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldSKKemenkumham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction2);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction2, 'data/file.pdf');
        break;
      case 'NPWP Perusahaan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction3);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction3, 'data/file.pdf');
        break;
      case 'KTP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldKTPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction4);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction4, 'data/file.pdf');
        break;
      case 'NPWP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction5);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction5, 'data/file.pdf');
        break;
      case 'Minimal 3 contoh invoice dengan supplier terkait':
        I.see(this.sectionUploadDocuments.textFieldName.fiedMinimal3ContohInvoiceDenganSupplier);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction6);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction6, 'data/file.pdf');
        break;
      case 'Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir':
        I.see(this.sectionUploadDocuments.textFieldName.fieldRekeningKoranatauMutasiRekening6Bulan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction7);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction7, 'data/file.pdf');
        break;
      case 'Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldLaporanKeuangan2tahunterakhir);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction8);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction8, 'data/file.pdf');
        break;
    }

  },

  async uploadDocumentAPMSME(docTypeLoan) {
    I.wait(2);
    switch (docTypeLoan) {
      case 'nib':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNIB);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction0);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction0, 'data/file.pdf');
        break;
      case 'Akta Pendirian':
        I.see(this.sectionUploadDocuments.textFieldName.fieldAktaPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction1);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction1, 'data/file.pdf');
        break;
      case 'SK Kemenkumham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldSKKemenkumham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction2);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction2, 'data/file.pdf');
        break;
      case 'NPWP Perusahaan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction3);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction3, 'data/file.pdf');
        break;
      case 'KTP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldKTPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction4);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction4, 'data/file.pdf');
        break;
      case 'NPWP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction5);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction5, 'data/file.pdf');
        break;
      case 'Minimal 3 contoh invoice dengan supplier terkait':
        I.see(this.sectionUploadDocuments.textFieldName.fiedMinimal3ContohInvoiceDenganSupplier);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction6);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction6, 'data/file.pdf');
        break;
      case 'Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir':
        I.see(this.sectionUploadDocuments.textFieldName.fieldRekeningKoranatauMutasiRekening6Bulan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction7);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction7, 'data/file.pdf');
        break;
      case 'Laporan Keuangan dalam 1 tahun terakhir':
        I.see(this.sectionUploadDocuments.textFieldName.fieldLaporanKeuangan1tahunterakhir);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction8);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction8, 'data/file.pdf');
        break;
    }
  },

  async uploadDocumentARCORP(docTypeLoan) {
    I.wait(2);
    switch (docTypeLoan) {
      case 'nib':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNIB);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction0);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction0, 'data/file.pdf');
        break;
      case 'Akta Pendirian':
        I.see(this.sectionUploadDocuments.textFieldName.fieldAktaPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction1);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction1, 'data/file.pdf');
        break;
      case 'SK Kemenkumham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldSKKemenkumham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction2);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction2, 'data/file.pdf');
        break;
      case 'NPWP Perusahaan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction3);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction3, 'data/file.pdf');
        break;
      case 'KTP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldKTPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction4);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction4, 'data/file.pdf');
        break;
      case 'NPWP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction5);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction5, 'data/file.pdf');
        break;
      case 'Minimal 3 contoh invoice dengan buyer terkait':
        I.see(this.sectionUploadDocuments.textFieldName.fiedMinimal3ContohInvoiceDenganSupplier);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction6);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction6, 'data/file.pdf');
        break;
      case 'Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir':
        I.see(this.sectionUploadDocuments.textFieldName.fieldRekeningKoranatauMutasiRekening6Bulan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction7);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction7, 'data/file.pdf');
        break;
      case 'Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldLaporanKeuangan1tahunterakhir);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction8);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction8, 'data/file.pdf');
        break;
    }
  },

  async uploadDocumentARCORP(docTypeLoan) {
    I.wait(2);
    switch (docTypeLoan) {
      case 'nib':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNIB);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction0);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction0, 'data/file.pdf');
        break;
      case 'Akta Pendirian':
        I.see(this.sectionUploadDocuments.textFieldName.fieldAktaPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction1);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction1, 'data/file.pdf');
        break;
      case 'SK Kemenkumham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldSKKemenkumham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction2);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction2, 'data/file.pdf');
        break;
      case 'NPWP Perusahaan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction3);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction3, 'data/file.pdf');
        break;
      case 'KTP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldKTPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction4);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction4, 'data/file.pdf');
        break;
      case 'NPWP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction5);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction5, 'data/file.pdf');
        break;
      case 'Minimal 3 contoh invoice dengan buyer terkait':
        I.see(this.sectionUploadDocuments.textFieldName.fiedMinimal3ContohInvoiceDenganSupplier);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction6);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction6, 'data/file.pdf');
        break;
      case 'Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir':
        I.see(this.sectionUploadDocuments.textFieldName.fieldRekeningKoranatauMutasiRekening6Bulan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction7);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction7, 'data/file.pdf');
        break;
      case 'Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldLaporanKeuangan2tahunterakhir);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction8);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction8, 'data/file.pdf');
        break;
    }
  },

  async uploadDocumentARMSME(docTypeLoan) {
    I.wait(2);
    switch (docTypeLoan) {
      case 'nib':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNIB);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction0);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction0, 'data/file.pdf');
        break;
      case 'Akta Pendirian':
        I.see(this.sectionUploadDocuments.textFieldName.fieldAktaPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction1);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction1, 'data/file.pdf');
        break;
      case 'SK Kemenkumham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldSKKemenkumham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction2);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction2, 'data/file.pdf');
        break;
      case 'NPWP Perusahaan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction3);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction3, 'data/file.pdf');
        break;
      case 'KTP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldKTPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction4);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction4, 'data/file.pdf');
        break;
      case 'NPWP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction5);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction5, 'data/file.pdf');
        break;
      case 'Minimal 3 contoh invoice dengan buyer terkait':
        I.see(this.sectionUploadDocuments.textFieldName.fiedMinimal3ContohInvoiceDenganSupplier);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction6);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction6, 'data/file.pdf');
        break;
      case 'Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir':
        I.see(this.sectionUploadDocuments.textFieldName.fieldRekeningKoranatauMutasiRekening6Bulan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction7);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction7, 'data/file.pdf');
        break;
      case 'Laporan Keuangan dalam 1 tahun terakhir dan tahun berjalan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldLaporanKeuangan1tahunterakhir);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction8);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction8, 'data/file.pdf');
        break;
    }
  },

  async uploadDocumentPOMSME(docTypeLoan) {
    I.wait(2);
    switch (docTypeLoan) {
      case 'nib':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNIB);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction0);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction0, 'data/file.pdf');
        break;
      case 'Akta Pendirian':
        I.see(this.sectionUploadDocuments.textFieldName.fieldAktaPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction1);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction1, 'data/file.pdf');
        break;
      case 'SK Kemenkumham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldSKKemenkumham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction2);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction2, 'data/file.pdf');
        break;
      case 'NPWP Perusahaan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPPerusahaan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction3);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction3, 'data/file.pdf');
        break;
      case 'KTP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldKTPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction4);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction4, 'data/file.pdf');
        break;
      case 'NPWP Komisioner & Pemegang Saham':
        I.see(this.sectionUploadDocuments.textFieldName.fieldNPWPKomisionerdanPemegangSaham);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction5);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction5, 'data/file.pdf');
        break;
      case 'Surat Perintah Kerja (SPK) darir bouwheer':
        I.see(this.sectionUploadDocuments.textFieldName.fieldSPKdariBouwheer);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction6);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction6, 'data/file.pdf');
        break;
      case 'Rekening Koran/Mutasi Rekening operasional 6 bulan terakhir':
        I.see(this.sectionUploadDocuments.textFieldName.fieldRekeningKoranatauMutasiRekening6Bulan);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction7);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction7, 'data/file.pdf');
        break;
      case 'Laporan Keuangan dalam 1 tahun terakhir dan tahun berjalan':
        I.see(this.sectionUploadDocuments.textFieldName.fieldLaporanKeuangan1tahunterakhir);
        I.seeElement(this.sectionUploadDocuments.button.buttonAction8);
        I.attachFile(this.sectionUploadDocuments.button.buttonAction8, 'data/file.pdf');
        break;
    }
  },
  chooselistSupplier() {
    I.waitForElement(this.dropdown.listsupplier, 10);
    I.click(this.dropdown.listsupplier);
  },

  choosesuppliername(){
    I.waitForElement(this.dropdown.firstItem, 10);
    I.click(this.dropdown.firstItem);
  },

  inputinvoiceamount(){
    I.waitForElement(this.field.inputnominalinvoice, 10);
    I.setText(this.fields.inputnominalinvoice);
  },

  inputinvoicenumber(){
    I.waitForElement(this.field.inputinvoicenumeber, 10);
    I.setText(this.field.inputinvoicenumber);
  },

  clickSaveInvoice(){
    I.waitForElement(this.button.bTnSaveInvoice, 10);
    I.click(this.button.bTnSaveInvoice);
  },

  AddnewSupplier() {
    I.waitForElement(this.button.bTnaddnewsupplier, 10);
    I.click(this.button.bTnaddnewsupplier);
  },
  

}
