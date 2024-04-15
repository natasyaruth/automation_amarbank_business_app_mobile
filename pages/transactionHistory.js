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
        btnOk: "~buttonNextSuccessBottomSheet",
        btnCopied: "~buttonCopy",
        btnShare: "~buttonShare",
        btnTransfer: "~btnTransfer",
        btneStatementDownload: { xpath: "(//android.view.View[@content-desc='buttonEStatement'])[1]" },
        btneStatementLatest: { xpath: "(//android.view.View[@content-desc='buttonRequest0'])" },
        btnCloseeStatement: "~buttonClose",
    },
    textFields: {
        textViewHistoryTrxPage: { xpath: '//android.widget.TextView[contains(@text, "Riwayat Transaksi")]' },
        // textViewBtmSheetFilterHistory: { xpath: '//android.widget.TextView[contains(@text, "Filter Riwayat")]' },
        textViewBtmSheetFilterHistory: { xpath: '//android.widget.TextView[contains(@text, "Riwayat")]' },
        textViewSelectDate: { xpath: '//android.widget.TextView[contains(@text, "Pilih Tanggal")]' },
        textViewTrfOut: { xpath: '//android.widget.TextView[contains(@text, "Transfer Keluar")]' },
        textViewTrfIn: { xpath: '//android.widget.TextView[contains(@text, "Transfer Masuk")]' },
        textViewRefNumberOut: { xpath: '//android.widget.TextView[contains(@text, "1234567890")]' },
        textViewRefNumberIn: { xpath: '//android.widget.TextView[contains(@text, "1234567890")]' },
        textViewDateOut: { xpath: '//android.widget.TextView[contains(@text, "29 Februari 2024")]' },
        textViewDateIn: { xpath: '//android.widget.TextView[contains(@text, "29 Februari 2024")]' },
        textViewTimeOut: { xpath: '//android.widget.TextView[contains(@text, "1:26 AM")]' },
        textViewTimeIn: { xpath: '//android.widget.TextView[contains(@text, "1:26 AM")]' },
        textViewNoteOut: { xpath: '//android.widget.TextView[contains(@text, "Test RTOL")]' },
        textViewNoteIn: { xpath: '//android.widget.TextView[contains(@text, "test transfer")]' },
        textViewCatOut: { xpath: '//android.widget.TextView[contains(@text, "PAJAK BUNGA")]' },
        textViewCatIn: { xpath: '//android.widget.TextView[contains(@text, "BUNGA JASA GIRO/TABUNGAN")]' },
        textNote: "~textNote",
        textViewFailedAlert: { xpath: '//android.view.ViewGroup[@resource-id="android:id/content"]/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[2]' },
        textViewSuccessAlert: { xpath: '//android.view.ViewGroup[@resource-id="android:id/content"]/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[2]' },
    },
    menu: {
        tabTesting: { xpath: "//android.widget.TextView[contains(@text, 'TESTING')]" },
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
        I.wait(5);
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

    viewButtonDownloadEStatement(){
        I.wait(2);
        I.seeElement(this.buttons.btneStatementDownload);
    },

    clickBtnDownloadeStatement() {
        I.wait(2);
        I.click(this.buttons.btneStatementDownload);
    },

    clickBtnLatesteStatement() {
        I.wait(2);
        I.click(this.buttons.btneStatementLatest);
    },

    validationeStatementNotExist(){
        I.wait(5);
        I.see("e-Statement belum ada")
    },

    async viewSuccessAlertBar(){

        I.waitForElement(this.textFields.textViewFailedAlert,5);
        let isAlert = await I.grabAttributeFrom(this.textFields.textViewFailedAlert, "bounds");
    
        if(isAlert === "[77,2055][143,2121]"){
          console.log("Sistem tidak dapat mencetak e-Statement.");
          //return true;
        }
    
        else{
          console.log("e-Statement sudah di download");
          //return true;
        }
      },

    async checkAlertBar(){

        I.waitForElement(this.textFields.textViewFailedAlert,3);
        let isFailed = await I.grabAttributeFrom(this.textFields.textViewFailedAlert, "text");
    
        if(isFailed === "Sedang terjadi kesalahan sistem."){
          console.log("Sistem tidak dapat mencetak e-Statement.");
          //return true;
        }
    
        else{
          console.log("e-Statement sudah di download");
          //return true;
        }
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
        I.wait(5);
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
    async shouldSeeTextViewNoted(trfType) {
        I.wait(2);
        switch (trfType) {
            case 'out':
                I.wait(2);
                I.seeElement(this.textFields.textNote);
                break;
            case 'in':
                I.wait(2);
                I.seeElement(this.textFields.textNote);
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
        I.waitForElement(this.menu.tabTesting, 10);
        I.click(this.menu.tabTesting);
    }

}