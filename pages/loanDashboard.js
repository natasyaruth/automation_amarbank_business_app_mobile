const { I } = inject();

module.exports = {
  buttons: {
    buttonBack: "~buttonBack",
    buttonHistory: "~buttonHistory",
    buttonAllLimits: "~buttonAllLimits",
    buttonUseLimit: "~buttonUseLimit",
    buttonNewLimit: "~buttonNewLimit",
    buttonAllBills: "~buttonAllBills",
    buttonDisbursement: "~buttonDisbursement",
    buttonAllBills: "~buttonAllBills",
    buttonDisbursement: "~buttonDisbursement",
    buttonClose: "~buttonClose",
    buttonApprove: "~buttonApprove",
    buttonPayBill: "~buttonPayBill",
    buttonNext: "~buttonNext",


  },

  cards: {
    cardOffer: "~cardOffer",
    cardActiveBill: "~cardActiveBill",
    cardLimitAP: "~cardLimitAP",
    cardLimitAPDirectLoan: "~cardLimitAPDirectLoan",
    cardLimitAR: "cardLimitAR",
    cardLimitARDirectLoan: "~cardLimitARDirectLoan",
    cardLimitPO: "~cardLimitPO",
  },

  tabs: {
    tabLimit: "~tabLimit",
    tabDisbursement: '~tabDisbursement',
    tabBill: '~tabBill',
  },

  filters: {
    filterByOnProcess: "~filterByOnProcess",
    filterByOnActive: "~filterByOnActive",
    filterbyOnDone: "~filterbyOnDone",
    filterByAll: "~filterByAll",
    filterBySendPDC: "~filterBySendPDC",
    filterByWaitingConfirmation: "~filterByWaitingConfirmation",
  },

  checkBoxs: {
    checkBoxInvoice: "~checkBoxInvoice",
  },

  text: {
    textActiveLimitsCount: "~textActiveLimitsCount",
    textRadioButtonAP: "~textRadioButtonAP",
    textRadioButtonAR: "~textRadioButtonAR",
    textRadioButtonPO: "~textRadioButtonPO",
  },

  radioButtons: {
    radioButtonAP: "~radioButtonAP",
    radioButtonAR: "~radioButtonAR",
    radioButtonPO: "~radioButtonPO",
  },
  icons: {
    iconInfo: "~iconInfo",
  },


  clickButtonBack() {
    I.wait(2);
    I.click(this.buttons.buttonBack);
  },

  //Loan Dashboard
  applyNewLimitLoan() {
    I.seeElement(this.buttons.buttonNewLimit);
    I.click(this.buttons.buttonNewLimit);
  },

  validateSchemaLoanPage() {
    I.see('Bagaimana gambaran masalah pendanaan Anda?');
    I.seeElement(this.radioButtons.radioButtonAP);
    I.seeElement(this.radioButtons.radioButtonAR);
    I.seeElement(this.radioButtons.radioButtonPO);
    I.seeElement(this.text.textRadioButtonAP);
    I.seeElement(this.textRadioButtonAP);
    I.seeElement(this.text.textRadioButtonAR);
    I.seeElement(this.text.textRadioButtonPO);
    I.seeElement(this.buttons.buttonNext);
  },

  validateLimitCardOffering() {
    I.seeElement(this.cards.cardOffer);
    I.see('Segera Setujui Penawaran Pinjaman');
    I.see('Setujui Pinjaman Sebelum:');
    I.see('Pinjaman yang ditawarkan:');
  },

  goToApprovalLimitOffering() {
    I.seeElement(this.cards.cardOffer);
    I.click(this.cards.cardOffer);
  },

  validateApprovalLimitOfferStillRunning() {
    I.see('Pengajuan limit telah disetujui sebesar');
    I.see('Detail Biaya Pinjaman');
    I.see('Bunga per Bulan 1.3%');
    I.see('Biaya Administrasi 3%', 'Dikurangkan saat pencairan limit pinjaman');
    I.see('Denda Jika Terlambat Bayar 0.1%', 'Dihitung berdasarkan jumlah hari keterlambatan');
    I.see('Setiap pembayaran tagihan akan terpotong otomatis melalui autodebet rekening Amar Bank.')
    I.seeElement(this.buttons.buttonApprove);
  },

  validateApprovalLimitOfferHasExpired() {
    I.see('Penawaran limit berakhir dalam', '0 hari : 0 jam : 0 menit');
    I.seeElement(this.buttons.buttonApprove);
    I.hasAttribute('disable');
  },

  approveLimitLoanOffering() {
    I.seeElement(this.buttons.buttonApprove);
    I.click(this.buttons.buttonApprove);
  },

  verifyApproveLimit() {
    I.see('Dalam tahap development');
  },

  closeApproveLimitLoanPage() {
    I.seeElement(this.buttons.buttonClose);
    I.click(this.buttons.buttonClose);
  },

  //Signature Card
  validateSignatureCard() {
    I.see('Segera Setujui Penawaran Pinjaman');
    I.see('Tanda Tangan Sebelum');
    I.see('Pinjaman yang ditawarkan:');

  },

  goToSignaturedPage() {
    I.wait(2);
    I.seeElement(this.cards.cardOffer);
    I.click(this.cards.cardOffer);
  },

  validateSignaturePage() {
    I.wait(2);
    I.see('Tanda Tangan');
  },

  backToSignatureCardPage() {
    I.wait(2);
    I.click(this.buttons.buttonBack);
  },

  validateSignatureCardisExpired() {
    I.see('Tanda Tangan Sebelum');
    I.see('0 hari : 0 jam : 0 menit');

  },

  validateOfferCardDisable() {
    I.wait(2);
    I.seeElement(this.cards.cardOffer);
    I.hasAttribute('disable');
  },

  //multiple entry card
  async multipleEntryPointSliderCard() {
    let locator1 = 'this.cards.cardOffer[@text = "Tanda Tangan Sebelum:"]';
    let locator2 = 'this.cards.cardOffer[@text = "Setujui Pinjaman Sebelum:"]';
    I.swipeTo(locator1, locator2, 'right', 30, 200, 800);
  },

  //History Page
  goToHistory() {
    I.seeElement(this.buttons.buttonHistory);
    I.click(this.buttons.buttonHistory);
  },

  validateHistoryPage() {
    I.seeElement(this.tabs.tabLimit);
    I.seeElement(this.tabs.tabDisbursement);
    I.seeElement(this.tabs.tabBill);
    I.see("Dalam Proses");
    I.see("Aktif");
    I.see("Selesai");
    // I.seeElement(this.filters.filterByOnActive);
    // I.seeElement(this.filters.filterByOnProcess);
    // I.seeElement(this.filters.filterbyOnDone);
  },

  goToTabLimit() {
    I.seeElement(this.tabs.tabLimit);
    I.click(this.tabs.tabLimit);
  },

  validateTabLimit() {
    I.seeElement(this.filters.filterByOnProcess);
    I.seeElement(this.filters.filterByOnActive);
    I.seeElement(this.filters.filterbyOnDone);
  },

  goToTabDisbursement() {
    I.seeElement(this.tabs.tabDisbursement);
    I.click(this.tabs.tabDisbursement);
  },

  validateTabDisbursement() {
    I.seeElement(this.filters.filterByAll);
    I.seeElement(this.filters.filterBySendPDC);
    I.seeElement(this.filters.filterByWaitingConfirmation);
  },

  goToTabBill() {
    I.seeElement(this.tabs.tabBill);
    I.click(this.tabs.tabBill);
  },

  validateTabBills() {
    I.seeElement(this.checkBoxs.checkBoxInvoice);
    I.seeElement(this.buttons.buttonPayBill);
  },

  goToStatusInProcessLimitHistory() {
    I.seeElement(this.filters.filterByOnProcess);
    I.click(this.filters.filterByOnProcess);
  },

  validateStatusInProcessLimitHistory() {
    I.seeElement(this.filters.filterByOnProcess);
  }, catch(error) {
    console.error('Data tidak ditemukan');
  },

  goToStatusActiveLimitHistory() {
    // I.seeElement(this.filters.filterByOnActive);
    //I.click(this.filters.filterByOnActive);
    I.click("Aktif");
  },

  validateStatusActiveLimitHistory() {
    I.seeElement(this.filters.filterByOnActive);
    I.see("Aktif");
  },

  async grabNumberFromText() {
    let teks = await I.grabTextFrom(this.text.textActiveLimitsCount);
    let number = teks.match(/\d+/g).join(this.text.textActiveLimitsCount);
  },

  async totalCardActive() {
    let totalElementVisible = await I.grabNumberOfVisibleElements("Limit tersedia:");
    I.see(totalElementVisible, grabNumberFromText);
  },

  goToStatusDoneLimitHistory() {
    I.seeElement(this.filters.filterbyOnDone);
    I.click(this.filters.filterbyOnDone);
  },

  validateStatusDoneLimitHistory() {
    I.seeElement(this.filters.filterbyOnDone);
  },

  goToAllStatusDisbursementHistory() {
    I.seeElement(this.filters.filterByAll);
    I.click(this.filters.filterByAll);
  },

  validateAllStatusDisbursementHistory() {
    I.seeElement(this.filters.filterByAll);
  },

  goToStatusSendPDCofDisbursementHistory() {
    I.seeElement(this.filters.filterBySendPDC);
    I.click(this.filters.filterBySendPDC);
  },

  validateStatusSendPDCofDisbursementHistory() {
    I.seeElement(this.filters.filterBySendPDC);
  },

  goToWaitingConfirmationStatusDisbursementHistory() {
    I.seeElement(this.filters.filterByWaitingConfirmation);
    I.click(this.filters.filterByWaitingConfirmation);
  },

  validateWaitingConfirmationStatusDisbursementHistory() {
    I.seeElement(this.filters.filterByWaitingConfirmation);
  },

  validateLoanTypeofLoanAP() {
    I.seeElement(this.cards.cardLimitAP);
    I.see('Invoice Menunggu Dibayar');
    I.see('Bayar Invoice');
  },

  validateLoanTypeofLoanAPDirectLoan() {
    I.seeElement(this.cards.cardLimitAPDirectLoan);
    I.see('Upload Invoice Untuk Dibayar');
    I.see('Bayar Invoice');
  },

  validateLoanTypeofLoanPO() {
    I.seeElement(this.cards.cardLimitPO);
    I.see('Upload Invoice Untuk Dibayar');
    I.see('Bayar Invoice');
  },

  validateLoanTypeofLoanARDirectLoan() {
    I.seeElement(this.cards.cardLimitARDirectLoan);
    I.see('Upload Invoice Untuk Cairkan');
    I.see('Cairkan Limit');
  },
}