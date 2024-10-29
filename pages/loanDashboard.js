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
    buttonNavigation: "#iconNavigation",
    buttonLater: "~buttonLater",
    buttonSign: "~buttonSign",
    btnLoanDetail: "~buttonLoanDetail",
  },

  cards: {
    cardActiveBill: "~cardActiveBill",
    cardLimitAP: "~cardLimitAP",
    cardLimitAPDirectLoan: "~cardLimitAPDirectLoan",
    cardLimitAR: "~cardLimitAR",
    cardLimitPO: "~cardLimitPO",
    // cardOffer: { xpath: "//android.view.View[@content-desc='cardOffer']/android.view.View[1]" },
    cardOffer: "~cardOffer",
  },

  tabs: {
    tabLimit: "~tabLimit",
    tabDisbursement: "~tabDisbursement",
    tabBill: "~tabBill",
  },

  filters: {
    filterByOnProcess: "~filterByOnProcess",
    filterByOnActive: "~filterByOnActive",
    filterbyOnDone: "~filterByOnDone",
    filterByAll: "~filterByAll",
    filterBySendPDC: "~filterBySendPDC",
    filterByWaitingConfirmation: "~filterByWaitingConfirmation",
  },

  checkBoxs: {
    checkBoxInvoice: "~checkBoxInvoice",
  },

  text: {
    textDashboardScreen: "Dashboard Screen",
    textLoanDashboard: "Loan Dashboard",
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

  //Dashboard Screen
  goToLoanDashboard() {
    I.wait(3);
    I.see(this.text.textDashboardScreen);
    I.click(this.text.textLoanDashboard);
    I.see("Pinjaman Bisnis");
  },

  // lihat detail pinjaman
  goToLoanDetail () {
    I.wait(10);
    I.click(this.buttons.btnLoanDetail);
  },

  //Loan Dashboard
  clickButtonBack() {
    I.wait(2);
    I.click(this.buttons.buttonBack);
  },

  clickCardOffer() {
    // I.wait(2);
    I.click(this.cards.cardOffer);
  },

  clickBtnLater() {
    I.wait(2);
    I.click(this.buttons.buttonLater);
  },

  clickBtnSign() {
    I.wait(2);
    I.click(this.buttons.buttonSign);
  },

  clickBtnApprove() {
    I.wait(2);
    I.click(this.buttons.buttonApprove);
  },

  applyNewLimitLoan() {
    I.wait(2);
    I.seeElement(this.buttons.buttonNewLimit);
    I.click(this.buttons.buttonNewLimit);
  },

  validateSchemaLoanPage() {
    I.see("Bagaimana gambaran masalah pendanaan Anda?");
    I.seeElement(this.radioButtons.radioButtonAP);
    I.seeElement(this.radioButtons.radioButtonAR);
    I.seeElement(this.radioButtons.radioButtonPO);
    I.seeElement(this.text.textRadioButtonAP);
    I.seeElement(this.text.textRadioButtonAP);
    I.seeElement(this.text.textRadioButtonAR);
    I.seeElement(this.text.textRadioButtonPO);
    I.seeElement(this.buttons.buttonNext);
  },

  async validateLimitCardOffering() {
    try {
      await I.seeElement(this.cards.cardOffer);
      console.log("Element exists");
      I.see("Segera Setujui Penawaran Pinjaman");
      I.see("Setujui Pinjaman Sebelum:");
      I.see("Pinjaman yang ditawarkan:");
    } catch (error) {
      console.log("Element does not exist");
    }
  },

  goToApprovalLimitOffering() {
    I.seeElement(this.cards.cardOffer);
    I.click(this.cards.cardOffer);
  },

  validateApprovalLimitOfferStillRunningMSME() {
    I.see("Pengajuan limit telah disetujui sebesar");
    I.see("Detail Biaya Pinjaman");
    I.see("Tenor 180 hari");
    I.see("Bunga per Tahun 1.3%");
    I.see("Biaya Administrasi 3%", "Dikurangkan saat pencairan limit pinjaman");
    I.see(
      "Denda Jika Terlambat Bayar 0.1%",
      "Dihitung berdasarkan jumlah hari keterlambatan"
    );
    I.see(
      "Setiap pembayaran tagihan akan terpotong otomatis melalui autodebet rekening Amar Bank."
    );
    I.seeElement(this.buttons.buttonApprove);
  },

  validateApprovalLimitOfferStillRunningCORP() {
    I.see("Pengajuan limit telah disetujui sebesar");
    I.see("Detail Biaya Pinjaman");
    I.see("Tenor 180 hari");
    I.see("Bunga per Tahun 1.3%");
    I.see("Biaya Administrasi 3%", "Dikurangkan saat pencairan limit pinjaman");
    I.see("Biaya Provisi");
    I.see(
      "Denda Jika Terlambat Bayar 0.1%",
      "Dihitung berdasarkan jumlah hari keterlambatan"
    );
    I.see(
      "Setiap pembayaran tagihan akan terpotong otomatis melalui autodebet rekening Amar Bank."
    );
    I.seeElement(this.buttons.buttonApprove);
  },

  validateApprovalLimitOfferHasExpired() {
    I.see("Penawaran limit berakhir dalam");
    I.seeElement(this.buttons.buttonApprove);
  },

  approveLimitLoanOffering() {
    I.seeElement(this.buttons.buttonApprove);
    I.click(this.buttons.buttonApprove);
  },

  verifyApproveLimit() {
    I.seeElement(this.buttons.buttonApprove);
  },

  closeApproveLimitLoanPage() {
    I.seeElement(this.buttons.buttonClose);
    I.click(this.buttons.buttonClose);
  },

  validateButtonCloseInvisible() {
    I.waitForInvisible(this.buttons.buttonClose);
  },

  //Signature Card
  validateSignatureCard() {
    I.see("Segera Setujui Penawaran Pinjaman");
    I.see("Tanda Tangan Sebelum");
    I.see("Pinjaman yang ditawarkan:");
  },

  goToSignaturedPage() {
    I.wait(2);
    I.seeElement(this.cards.cardOffer);
    I.click(this.cards.cardOffer);
  },

  validateSignaturePage() {
    I.wait(2);
    I.see("Tanda Tangan");
  },

  backToSignatureCardPage() {
    I.wait(2);
    I.click(this.buttons.buttonBack);
  },

  validateSignatureCardisExpired() {
    I.see("Tanda Tangan Sebelum");
    I.see("0 hari : 0 jam : 0 menit");
  },

  validateOfferCardDisable() {
    I.wait(2);
    I.seeElement(this.cards.cardOffer);
    I.hasAttribute("disable");
  },

  //multiple entry card
  async multipleEntryPointSliderCard() {
    let locator1 = 'this.cards.cardOffer[@text = "Tanda Tangan Sebelum:"]';
    let locator2 = 'this.cards.cardOffer[@text = "Setujui Pinjaman Sebelum:"]';
    I.swipeTo(locator1, locator2, "right", 30, 200, 800);
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
    I.seeElement(this.filters.filterByOnActive);
    I.seeElement(this.filters.filterByOnProcess);
    I.seeElement(this.filters.filterbyOnDone);
    I.wait(30);
  },

  validateStatusOnProces() {
    I.wait(5);
    I.seeElement(this.filters.filterByOnProcess);
  },

  validateStatusActive() {
    I.wait(5);
    I.seeElement(this.filters.filterByOnActive);
  },

  validateStatusDone() {
    I.wait(5);
    I.seeElement(this.filters.filterbyOnDone);
  },
  goToTabLimit() {
    I.seeElement(this.tabs.tabLimit);
    I.click(this.tabs.tabLimit);
  },

  goToStatusOnProces() {
    I.click(this.filters.filterByOnProcess);
  },

  validateTabLimit() {
    I.wait(10);
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

  goToTabBills() {
    I.seeElement(this.tabs.tabBill);
    I.click(this.tabs.tabBill);
  },

  goToStatusDoneinTabBills() {
    I.seeElement(this.filters.filterbyOnDone);
    I.click(this.filters.filterbyOnDone);
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
  },
  catch(error) {
    console.error("Data tidak ditemukan");
  },

  goToStatusActiveLimitHistory() {
    I.seeElement(this.filters.filterByOnActive);
    I.click(this.filters.filterByOnActive);
    I.click("Aktif");
    I.wait(5);
  },

  validateStatusActiveLimitHistory() {
    I.seeElement(this.filters.filterByOnActive);
    I.see("Aktif");
  },

  verifyMultipleActiveLimit() {
    I.wait(2);
    I.seeElement(this.text.textActiveLimitsCount);
  },

  // async grabNumberFromText() {
  //   let teks = await I.grabTextFrom(this.text.textActiveLimitsCount);
  //   let number = teks.match(/\d+/g).join(this.text.textActiveLimitsCount);
  // },

  // async totalCardActive() {
  //   let totalElementVisible = await I.grabNumberOfVisibleElements("Limit tersedia:");
  //   I.see(totalElementVisible, grabNumberFromText);
  // },

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

  async validateLoanTypeofLoanAP() {
    I.wait(5);
    try {
      await I.seeElement(this.cards.cardLimitAP);
      console.log("Element exists");
      I.seeElement(this.cards.cardLimitAP);
      I.see("Invoice Menunggu Dibayar");
      I.seeElement(this.buttons.buttonUseLimit);
    } catch (error) {
      console.log("Element does not exist");
    }
  },

  async validateLoanTypeofLoanAPDirectLoan() {
    try {
      await I.seeElement(this.cards.cardLimitAPDirectLoan);
      console.log("Element exists");
      I.seeElement(this.cards.cardLimitAPDirectLoan);
      I.see("Upload Invoice Untuk Dibayar");
      I.see("Bayar Invoice");
    } catch (error) {
      console.log("Element does not exist");
    }
  },

  async validateLoanTypeofLoanPO() {
    try {
      await I.seeElement(this.cards.cardLimitPO);
      console.log("Element exists");
      I.seeElement(this.cards.cardLimitPO);
      // I.see('Upload Invoice Untuk Dibayar');
      // I.see('Bayar Invoice');
    } catch (error) {
      console.log("Element does not exist");
    }
  },

  async validateLoanTypeofLoanARDirectLoan() {
    try {
      await I.seeElement(this.cards.cardLimitAR);
      console.log("Element exists");
      I.seeElement(this.cards.cardLimitAR);
      I.see("Upload Invoice Untuk Cairkan");
      I.see("Gunakan Limit");
      I.seeElement(this.buttons.buttonUseLimit);
    } catch (error) {
      console.log("Element does not exist");
    }
  },
};
