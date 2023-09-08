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

  },

  cards: {
    cardOffer: "~cardOffer",
    cardActiveBill: "~cardActiveBill",
  },

  tabs: {
    tabLimit: "~tabLimit",

  },

  filters: {
    filterByOnProcess: "~filterByOnProcess",
    filterByOnActive: "~filterByOnActive",
    filterbyOnDone: "~filterbyOnDone",
  },

  clickButtonBack() {
    I.wait(2);
    I.click(this.buttons.back);
  },

  //Loan Dashboard
  applyNewLimitLoan() {
    I.seeElement(this.buttons.buttonNewLimit);
    I.click(this.buttons.buttonNewLimit);
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
    I.seeElement(this.filters.filterByOnActive);
    I.seeElement(this.filters.filterByOnProcess);
    I.seeElement(this.filters.filterbyOnDone);
  },

  goToStatusInProcessLimitHistory() {
    I.seeElement(this.filters.filterByOnProcess);
    I.click(this.filters.filterByOnProcess);
  },

  goToStatusActiveLimitHistory() {
    I.seeElement(this.filters.filterByOnActive);
    I.click(this.filters.filterByOnActive);
  },

  goToStatusDoneLimitHistory() {
    I.seeElement(this.filters.filterByOnActive);
    I.click(this.filters.filterbyOnDone);
  },
}