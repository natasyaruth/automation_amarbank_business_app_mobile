//const { default: AndroidUiautomator2Driver } = require("appium-uiautomator2-driver");
//const WebDriver = require("codeceptjs/lib/helper/WebDriver");
//const { click } = require("wd/lib/commands");

const { I } = inject();

module.exports = {
    fields: {
        userField: "~txtUserName",
        startDateField: "~textFieldStartDate",
        endDateField: "~textFieldEndDate",
        dayPrev: { xpath: "(//android.widget.TextView[@content-desc='textDate'])[1]" },
        daySelected: { xpath: "(//android.widget.TextView[@content-desc='textDate'])[2]" },
        dayNext: { xpath: "(//android.widget.TextView[@content-desc='textDate'])[3]" },
        monthPrev: { xpath: "(//android.widget.TextView[@content-desc='textMonth'])[1]" },
        monthSelected: { xpath: "(//android.widget.TextView[@content-desc='textMonth'])[2]" },
        monthNext: { xpath: "(//android.widget.TextView[@content-desc='textMonth'])[3]" },
        yearPrev: { xpath: "(//android.widget.TextView[@content-desc='textYear'])[1]" },
        yearSelected: { xpath: "(//android.widget.TextView[@content-desc='textYear'])[2]" },
        yearNext: { xpath: "(//android.widget.TextView[@content-desc='textYear'])[3]" },
        listTransferOut: { xpath: "(//android.view.View[@content-desc='itemHistory'])[2]" },
        listTransferIn: { xpath: "(//android.view.View[@content-desc='itemHistory'])[1]" }
    },
    buttons: {
        historyBtn: "~btnHistory",
        btnFilterHistoryTrx: { xpath: "(//android.view.View[@content-desc='buttonFilter'])[1]" },
        btnClose: "~buttonClose",
        btnChoose: "~buttonChoose",
        btnCancel: "~buttonCancel",
        btnOk: "~buttonOk",
        btnCopied: "~buttonCopy",
        btnShare: "~buttonShare"
    },
    textFields: {
        textViewHistoryTrxPage: { xpath: '//android.widget.TextView[contains(@text, "Riwayat Transaksi")]' },
        textViewBtmSheetFilterHistory: { xpath: '//android.widget.TextView[contains(@text, "Filter Riwayat")]' },
        textViewSelectDate: { xpath: '//android.widget.TextView[contains(@text, "Pilih Tanggal")]' },
        textViewTrfOut: { xpath: '//android.widget.TextView[contains(@text, "Transfer Keluar")]' },
        textViewTrfIn: { xpath: '//android.widget.TextView[contains(@text, "Transfer Masuk")]' },
        textViewRefNumberOut: { xpath: '//android.widget.TextView[contains(@text, "1234567890")]' },
        textViewRefNumberIn: { xpath: '//android.widget.TextView[contains(@text, "1234567890")]' },
        textViewDateOut: { xpath: '//android.widget.TextView[contains(@text, "01 November 2023")]' },
        textViewDateIn: { xpath: '//android.widget.TextView[contains(@text, "01 November 2023")]' },
        textViewTimeOut: { xpath: '//android.widget.TextView[contains(@text, "1:40 PM")]' },
        textViewTimeIn: { xpath: '//android.widget.TextView[contains(@text, "1:43 PM")]' },
        textViewNoteOut: { xpath: '//android.widget.TextView[contains(@text, "Test RTOL")]' },
        textViewNoteIn: { xpath: '//android.widget.TextView[contains(@text, "test transfer")]' },
        textViewCatOut: { xpath: '//android.widget.TextView[contains(@text, "Pemindahan Dana")]' },
        textViewCatIn: { xpath: '//android.widget.TextView[contains(@text, "Tagihan")]' }
    },
    menu: {
        tabTesting: { xpath: "(//android.view.View[@content-desc='tabOthers'])[2]" },
        tabOthers: { xpath: "(//android.view.View[@content-desc='tabOthers'])[1]" },
        tabCallCenter: "~tabCallCenter",
        tabBusiness: "~tabBusiness",
        tabHome: "~tabHome"
    },

    viewUserName() {
        I.wait(7);
        I.seeElement(this.fields.userField);
    },
    clickBtnHistory() {
        I.wait(3);
        I.click(this.buttons.historyBtn);
    },
    async viewPageHistoryTransaction() {
        I.wait(3);
        let actualValue = await I.grabAttributeFrom(this.textFields.textViewHistoryTrxPage, "text");
        I.assertEqual(actualValue, "Riwayat Transaksi")
    },
    seeBtnHistory() {
        I.wait(2);
        I.seeElement(this.buttons.historyBtn);
    },
    clicBtnFilter() {
        I.wait(2);
        I.click(this.buttons.btnFilterHistoryTrx);
    },
    viewBtmSheetFilterHistory() {
        I.wait(2);
        I.seeElement(this.textFields.textViewBtmSheetFilterHistory);
    },
    clicBtnClose() {
        I.click(this.buttons.btnClose);
    },
    selectDayDate(Date, Qty) {
        for (let click = 1; click <= Qty; click++) {
            I.wait(2);
            switch (Date) {
                case 'Previous':
                    I.click(this.fields.dayPrev);
            break;
                case 'Selected':
                    I.click(this.fields.daySelected);
            break;
                case 'Next':
                    I.click(this.fields.dayNext);
            break;
            }
        }
    },
    selectMonthDate(Date) {
        I.wait(3);
        switch (Date) {
            case 'Previous':
                I.wait(1);
                I.click(this.fields.monthPrev);
            break;
            case 'Selected':
                I.wait(1);
                I.click(this.fields.monthSelected);
            break;
            case 'Next':
                I.wait(1);
                I.click(this.fields.monthNext);
            break;
        }
    },
    selectYearDate(Date) {
        I.wait(3);
        switch (Date) {
            case 'Previous':
                I.wait(2);
                I.click(this.fields.yearPrev);
            break;
            case 'Selected':
                I.wait(2);
                I.click(this.fields.yearSelected);
            break;
            case 'Next':
                I.wait(2);
                I.click(this.fields.yearNext);
            break;
        }
    },
    viewFormDate() {
        I.wait(2);
        I.seeElement(this.textFields.textViewSelectDate);
    },
    clicFieldStartDate() {
        I.click(this.fields.startDateField);
    },
    clicFieldEndDate() {
        I.click(this.fields.endDateField);
    },
    clickBtnChoose() {
        I.wait(2);
        I.click(this.buttons.btnChoose);
    },
    clickBtnCancel() {
        I.wait(2);
        I.click(this.buttons.btnCancel);
    },
    clickBtnOk() {
        I.wait(2);
        I.click(this.buttons.btnOk);
    },
    async validateTextViewTransfer(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.seeElement(this.textFields.textViewTrfOut);
                let textValueOut = await I.grabAttributeFrom(this.textFields.textViewTrfOut, "text");
                I.assertEqual(textValueOut, "Transfer Keluar");
            break;
            case 'in':
                I.wait(2);
                I.seeElement(this.textFields.textViewTrfIn);
                let textValueIn = await I.grabAttributeFrom(this.textFields.textViewTrfIn, "text");
                I.assertEqual(textValueIn, "Transfer Masuk");
            break;
        }
    },
    async clickListTransfer(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.click(this.fields.listTransferOut);
            break;
            case 'in':
                I.wait(2);
                I.click(this.fields.listTransferIn);
            break;
        }
    },
    async shouldSeeTextViewRefNumber(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.seeElement(this.textFields.textViewRefNumberOut);
            break;
            case 'in':
                I.wait(2);
                I.seeElement(this.textFields.textViewRefNumberIn);
            break;
        }
    },
    clickBtnCopied() {
        I.wait(2);
        I.click(this.buttons.btnCopied);
    },
    async shouldSeeTextViewDate(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.seeElement(this.textFields.textViewDateOut);
            break;
            case 'in':
                I.wait(2);
                I.seeElement(this.textFields.textViewDateIn);
            break;
        }
    },
    async shouldSeeTextViewTime(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.seeElement(this.textFields.textViewTimeOut);
            break;
            case 'in':
                I.wait(2);
                I.seeElement(this.textFields.textViewTimeIn);
            break;
        }
    },
    async shouldSeeTextViewNoted(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.seeElement(this.textFields.textViewNoteOut);
            break;
            case 'in':
                I.wait(2);
                I.seeElement(this.textFields.textViewNoteIn);
            break;
        }
    },
    async shouldSeeTextViewCategory(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.seeElement(this.textFields.textViewCatOut);
            break;
            case 'in':
                I.wait(2);
                I.seeElement(this.textFields.textViewCatIn);
            break;
        }
    },
    clickBtnShare() {
        I.wait(2);
        I.click(this.buttons.btnShare);
        I.wait(3);
        I.sendDeviceKeyEvent(4);
    },
    clickTabTesting() {
        I.wait(2);
        I.click(this.menu.tabTesting);
    }

}