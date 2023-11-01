const { error } = require("codeceptjs-testrail/lib/output");
const { I } = inject();

module.exports = {
  buttons: {
    buttonClose: "~buttonClose",
    buttonSeeAllBills: "~buttonSeeAllBills",
    filterOngoing: "~filterOngoing",
    filterDone: "~filterDone",
    itemBill: "~itemBill",
    buttonCopy: "~buttonCopy",
    buttonDetail: "~buttonDetail",
    buttonComplaint: "~buttonComplaint",
  },

  texts: {
    textNominalBill: "~textNominalBill",
    textCountDownBill: "~textCountDownBill",
    textCountDownBillDetail: "~textCountDownBillDetail",
    textNominalBillDetail: "~textNominalBillDetail",
    textInvoiceNumber: "~textInvoiceNumber",
  },

  // Status Normal
  async validateCardStatusNormalRepayment() {
    try {
      await I.waitForText('Tagihan Terdekat');
      console.log('Card Repayment Status Normal is exists');
      I.seeInTitle("Pinjaman Bisnis");
      I.see("Tagihan Aktif");
      I.see("Tagihan Terdekat");
      I.seeElement(this.buttons.buttonSeeAllBills);
      I.see("Akan di autodebet secara otomatis");
    } catch (error) {
      console.log('Card Repayment Status Normal does not exist');
    }
  },

  async validateColorStatusNormal() {
    let color = await I.executeScript(function () {
      return window.getComputedStyle(document.querySelector('my_css_selector')).backgroundColor;
    });
  },

  async validateAlertAfterLoanWasSuccessful() {
    try {
      await I.waitForElement(this.buttons.buttonSeeAllBills);
      console.log('Alert Successfull is exist');
      I.see("Pinjaman Berhasil Dicairkan");
      I.see("Tagihan pinjaman dapat Anda lihat disini.");
      I.seeElement(this.buttons.buttonClose);
    } catch (error) {

      console.log('Information Text "Pinjaman Berhasil Dicairkan" does not exist');
    }
  },

  closeInformationTextLoanHasBeenSuccessedDisbursed() {
    I.seeElement(this.buttons.buttonClose);
    I.click(this.buttons.buttonClose);
  },

  async goToHistoryBill() {
    try {
      await I.waitForElement(this.buttons.buttonSeeAllBills);
      console.log('Button See All Bills is exist');
      I.click(this.buttons.buttonSeeAllBills);
      I.seeElement(this.buttons.filterOngoing);
    } catch (error) {
      console.log('Button See All Bills is not exist');
    }
  },

  async validateIfMoreThan1Repayment() {
    I.seeElement(this.buttons.itemBill);
    let count = await I.grabNumberOfVisibleElements(this.buttons.itemBill);
    if (count > 1) {
      console.log('Bill card more than one item');
    } else {
      console.log('Bill card only one item');
    }
  },

  // Status Due Date
  async validateCardStatusDueDateRepayment() {
    try {
      await I.waitForText('Tagihan Terdekat');
      console.log('Card Repayment Status Due Date is exists');
      I.seeInTitle("Pinjaman Bisnis");
      I.see("Tagihan Aktif");
      I.see("Tagihan Terdekat");
      I.seeElement(this.buttons.buttonSeeAllBills);
      I.see("Akan di autodebet secara otomatis");

    } catch (error) {
      console.log('Card Repayment Status Due Date does not exist');
    }
  },

  async validateColorStatusDueDate() {
    let color = await I.executeScript(function () {
      return window.getComputedStyle(document.querySelector('my_css_selector')).backgroundColor;
    });
  },

  countDownDueDate() {
    let caseDueDate = 4;
    switch (caseDueDate) {
      //Due Date : D-3
      case 1:
        I.waitForText('3 hari lagi');
        I.see('3 hari lagi');
        I.seeElement(this.buttons.buttonSeeAllBills);
        break;
      //Due Date : D-2
      case 2:
        I.waitForText('2 hari lagi');
        I.see('2 hari lagi');
        I.seeElement(this.buttons.buttonSeeAllBills);
        break;
      //Due Date : D-1
      case 3:
        I.waitForText('1 hari lagi');
        I.see('1 hari lagi');
        I.seeElement(this.buttons.buttonSeeAllBills);
        break;
      //Due Date : D-0
      case 4:
        I.waitForText('0 hari lagi');
        I.see('0 hari lagi');
        I.seeElement(this.buttons.buttonSeeAllBills);
        break;
      default:
        console.error(error);
    }
  },

  async accessCardDetailForDueDate3() {
    let nominalBill = await I.grabTextFrom(this.texts.textNominalBill);
    I.click(this.buttons.buttonSeeAllBills);
    I.waitForElement(this.buttons.itemBill);
    I.assertEqual(this.texts.textCountDownBill, '3 hari lagi');
    let nominalBillDetail = await I.grabTextFrom(this.texts.textNominalBillDetail);
    if (nominalBill === nominalBillDetail) {
      console.log('Nominal bill is equal');
      I.click(this.buttons.itemBill);

    } else {
      console.log('Nominal bill is not equal');
    }
  },

  validateBillDateDueDate3() {
    I.see('Detail Tagihan');
    I.see('Tagihan Akan Di Autodebet Dalam');
    I.see('3 hari lagi');
    I.see('Mohon pastikan saldo rekening berikut ini mencukupi sebelum pukul 17.00 WIB saat jatuh tempo');
    I.seeElement(this.buttons.buttonCopy);
    I.seeElement(this.buttons.buttonDetail);
    I.seeElement(this.buttons.buttonComplaint);

  },
  goTolinkComplaint() {
    I.click(this.buttons.buttonComplaint);

  },
  goToBillInformation() {
    I.click(this.buttons.buttonBillInformation);
    I.see('Info Pembayaran');
  },

  closeBillInformation() {
    I.seeElement(this.buttons.buttonBillInformation.buttonClose);
    I.click(this.buttons.buttonClose);
  },

  validateBillRepayment() {
    let loanType = 3;
    switch (loanType) {
      // Loan Type AP
      case 1:
        I.waitForText('Supplier');
        I.see('Supplier');
        I.seeElement(this.buttons.buttonCopy);
        break;
      // Loan Type AR
      case 2:
        I.waitForText('Buyer');
        I.see('Buyer');
        I.seeElement(this.buttons.buttonCopy);
        break;
      // Loan Type PO
      case 3:
        I.waitForText('Pemilik Proyek');
        I.see('Pemilik Proyek');
        I.seeElement(this.buttons.buttonCopy);
        break;
      default:
        console.error(error);
    }
  },


  async goToDetailRepaymentInfoLoanAP() {
    try {
      await I.waitForText('Supplier');
      console.log('Bill Repayment for Loan Type AP');
      I.see('Info Pembayaran');
      I.dontSee('Buyer');
      I.dontSee('Pemilik Proyek');
    } catch (error) {
      console.log('Bill Repayment not for Loan Type AP');
    }
  },

  async goToDetailRepaymentInfoLoanDirectAP() {
    try {
      await I.waitForText('Supplier');
      console.log('Bill Repayment for Loan Type Direct AP');
      I.see('Info Pembayaran');
      I.dontSee('Buyer');
      I.dontSee('Pemilik Proyek');
    } catch (error) {
      console.log('Bill Repayment not for Loan Type Direct AP');
    }
  },

  async goToDetailRepaymentInfoLoanPO() {
    try {
      await I.waitForText('Pemilik Proyek');
      console.log('Bill Repayment for Loan Type PO');
      I.see('Info Pembayaran');
      I.dontSee('Buyer');
      I.dontSee('Supplier');
    } catch (error) {
      console.log('Bill Repayment not for Loan Type PO');
    }
  },

  async goToDetailRepaymentInfoLoanAR() {
    try {
      await I.waitForText('Buyer');
      console.log('Bill Repayment for Loan Type AR');
      I.see('Info Pembayaran');
      I.dontSee('Supplier');
      I.dontSee('Pemilik Proyek');
    } catch (error) {
      console.log('Bill Repayment not for Loan Type AR');
    }
  },

  //Status The Day Due Date
  async validateCardStatusTheDayDueDateRepayment() {
    try {
      await I.waitForText('Tagihan Terdekat');
      console.log('Card Repayment Status Due Date is exists');
      I.seeInTitle("Pinjaman Bisnis");
      I.see("Tagihan Aktif");
      I.see("Tagihan Terdekat");
      I.seeElement(this.buttons.buttonSeeAllBills);
      I.see("Akan di autodebet secara otomatis");
    } catch (error) {
      console.log('Card Repayment Status Due Date does not exist');
    }
  },

  async accessCardDetailForDueDate1() {
    let nominalBill = await I.grabTextFrom(this.texts.textNominalBill);
    I.click(this.buttons.buttonSeeAllBills);
    I.waitForElement(this.buttons.itemBill);
    I.assertEqual(this.texts.textCountDownBill, '1 hari lagi');
    let nominalBillDetail = await I.grabTextFrom(this.texts.textNominalBillDetail);
    if (nominalBill === nominalBillDetail) {
      console.log('Nominal bill is equal');
      I.click(this.buttons.itemBill);

    } else {
      console.log('Nominal bill is not equal');
    }
  },

  validateBillDateDueDate1inMorning() {
    I.see('Detail Tagihan');
    I.see('Tagihan Akan Di Autodebet Dalam');
    I.see('1 hari lagi');
    I.see('Mohon pastikan saldo rekening berikut ini mencukupi sebelum pukul 17.00 WIB saat jatuh tempo');
    I.seeElement(this.buttons.buttonCopy);
    I.seeElement(this.buttons.buttonDetail);
    I.seeElement(this.buttons.buttonComplaint);
  },


  //Status Failed
  async validateCardStatusFailed() {
    try {
      await I.waitForText('Tagihan Terdekat');
      console.log('Card Repayment status Failed is exists');
      I.seeInTitle("Pinjaman Bisnis");
      I.see("Tagihan Aktif");
      I.see("Tagihan Terdekat");
      I.seeElement(this.buttons.buttonSeeAllBills);
      I.see('Lewat');
      I.seeElement(this.texts.textCountDownBill);
      I.seeElement(this.texts.textNominalBill);
      I.see("Autodebet gagal, pastikan saldo mencukupi.");
    } catch (error) {
      console.log('Card Repayment Status Failed does not exist');
    }
  },

  async validateColorStatusNormal() {
    let color = await I.executeScript(function () {
      return window.getComputedStyle(document.querySelector('my_css_selector')).backgroundColor;
    });
  },

  async accessCardDetailForStatusFailed() {
    let nominalBill = await I.grabTextFrom(this.texts.textNominalBill);
    I.click(this.buttons.buttonSeeAllBills);
    I.waitForElement(this.buttons.itemBill);
    I.click(this.buttons.filterOngoing);
    I.assertEqual(this.texts.textCountDownBill, 'lewat 1 hari');
    let nominalBillDetail = await I.grabTextFrom(this.texts.textNominalBillDetail);
    if (nominalBill === nominalBillDetail) {
      console.log('Nominal bill is equal');
      I.click(this.buttons.itemBill);
    } else {
      console.log('Nominal bill is not equal');
    }
  },

  // Status Success
  async accessCardDetailForStatusSuccess() {
    let nominalBill = await I.grabTextFrom(this.texts.textNominalBill);
    I.click(this.buttons.buttonSeeAllBills);
    I.waitForElement(this.buttons.itemBill);
    I.click(this.buttons.filterOngoing);
    I.dontSeeElement(this.texts.textCountDownBill);
    I.see('Tagihan berhasil dibayar');
    let nominalBillDetail = await I.grabTextFrom(this.texts.textNominalBillDetail);
    if (nominalBill === nominalBillDetail) {
      console.log('Nominal bill is equal');
      I.click(this.buttons.itemBill);
    } else {
      console.log('Nominal bill is not equal');
    }
  },

}
