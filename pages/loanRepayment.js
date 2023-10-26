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
  },

  texts: {
    nominalBill: "~nominalBill",
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

  async accessDetailForDueDate3() {
    I.see('3 hari lagi');
    let nominalBill = await I.grabTextFrom(this.texts.nominalBill);
    I.click(this.buttons.buttonSeeAllBills);
    I.waitForElement(this.buttons.itemBill);
    let nominalBillDetails = await I.grabTextFrom(this.texts.nominalBillDetails);
    if (nominalBillDetails === nominalBillDetails) {
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
    I.seeElement(this.buttons.buttonDetail);

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

  // Status Success


}
