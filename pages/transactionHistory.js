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
        listTransferIn: { xpath: "(//android.view.View[@content-desc='itemHistory'])[1]" },
        eStatementFieldPass:"~textFieldPassword",
        eStatementFieldErrorPass:"~textErrorPassword",
        
    },
    buttons: {
        historyBtn: "~btnHistory",
        btnFilterHistoryTrx: { xpath: "(//android.view.View[@content-desc='buttonFilter'])[1]" },
        btnClose: "~buttonClose",
        btnChoose: "~buttonChoose",
        btnCancel: "~buttonCancel",
        buttonDetail: "~buttonDetail",
        btnOk: "~buttonNextSuccessBottomSheet",
        submitFilter: "~buttonOk",
        btnCopied: "~buttonCopy",
        btnShare: "~buttonShare",
        btnTransfer: "~btnTransfer",
        btneStatementDownload: { xpath: "(//android.view.View[@content-desc='buttonEStatement'])[1]" },
        btneStatementLatest: { xpath: "(//android.view.View[@content-desc='buttonRequest0'])" },
        btnCloseeStatement: "~buttonClose",
        detailHistory: {xpath: '(//android.view.View[@content-desc="buttonDetail"])[1]'},
        detailHistorySecond: {xpath: '(//android.view.View[@content-desc="buttonDetail"])[2]'},
        buttonNexteStatement : "~buttonNext",
        buttonEyeeStatement : "~iconShowHidePassword",
        buttonTryeStatement : "~buttonTry",
        buttonUnderstandeStatement : "~buttonUnderstand",
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
        textViewFailedAlert: { xpath: '//android.view.ViewGroup[@resource-id="android:id/content"]/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[2]' },
        textViewSuccessAlert: { xpath: '//android.view.ViewGroup[@resource-id="android:id/content"]/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[2]' },
        textErrorDate: "~textErrorDate",
        nameBucketlist: "~textName",
        bankNameBucketlist: "~textBankName",
        dateBucketlist: "~textDateTime",
        accNumberBucketlist: "~textRekening",
        amountBucketlist: "~textAmount",
        nameBucketlistSecond: {xpath: '//android.widget.TextView[@content-desc="textName"][2]'},
        bankNameBucketlistSecond: {xpath: '//android.widget.TextView[@content-desc="textBankName"][2]'},
        dateBucketlistSecond: {xpath: '//android.widget.TextView[@content-desc="textDateTime"][2]'},
        accNumberBucketlistSecond: {xpath: '//android.widget.TextView[@content-desc="textRekening"][2]'},
        amountBucketlistSecond: {xpath: '//android.widget.TextView[@content-desc="textAmount"][2]'},
        senderName: "~textTransferFromName",
        senderBankName: "~textTransferFromBankName",
        senderAccNumber: "~textTransferFromRekening",
        recipientName: "~textTransferToName",
        recipientBankName: "~textTransferToBankName",
        recipientAccNumber: "~textTransferToRekening",
        amount: "~textAmount",
        createdBy: "~textCreateBy",
        approveBy: "~textApproveBy",
        referenceNumber: "~textReferenceNo",
        dateDetailHistory: "~textDate",
        month: "~textMonth",
        timeDetailHistory: "~textTime",
        category: "~textCategory",
        methodTransaction: "~textMethod",
        textNote: "~textNote",
        adminFeeTitle: "~textAdminFee",
        adminFeeAmount: "~textAdminFeeAmount",
        adminFeeTitleSecond: {xpath: '//android.widget.TextView[@content-desc="textAdminFee"][2]'},
        adminFeeAmountSecond: {xpath: '//android.widget.TextView[@content-desc="textAdminFeeAmount"][2]'},
        titleTabAll: {xpath: '//android.view.View[1]/android.view.View[1]/android.widget.TextView'},
        titleTabInbound: {xpath: '//android.view.View[1]/android.view.View[2]/android.widget.TextView'},
        titleTabOutbound: {xpath: '//android.view.View[1]/android.view.View[3]/android.widget.TextView'},
        plusMinus: {xpath: '//android.view.View/android.view.View[2]/android.view.View/android.widget.TextView'},
        choosenStartDate: {xpath: '//android.view.View/android.view.View[2]/android.view.View[2]/android.widget.EditText'},
        choosenEndDate: {xpath: '//android.view.View/android.view.View[2]/android.view.View[3]/android.widget.EditText'},
    },
    menu: {
        tabTesting: { xpath: "//android.widget.TextView[contains(@text, 'TESTING')]" },
        tabOthers: { xpath: "(//android.view.View[@content-desc='tabOthers'])[1]" },
        tabCallCenter: "~tabCallCenter",
        tabBusiness: "~tabBusiness",
        tabHome: "~tabHome"
    },
    link: {
        reset: "~buttonReset",
    },
    tabs:{
        allTransaction: "~buttonTabTransferAll",
        inTransaction: "~buttonTabTransferIn",
        outTransaction: "~buttonTabTransferOut",
    },

    messageErrorFields: {
        password: "~textErrorPassword",
      },

    viewUserName() {
        I.wait(7);
        I.seeElement(this.fields.userField);
    },
    clickBtnHistory() {
        I.waitForElement(this.buttons.historyBtn, 20);
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

    seePasswordPage(){
        I.waitForText("Silakan masukkan password Amar Bank Bisnis kamu", 10);
        I.seeElement(this.buttons.buttonNexteStatement);
        I.seeElement(this.buttons.buttonEyeeStatement);
    },

    fillPasswordeStatement(password) {
        I.waitForElement(this.fields.eStatementFieldPass, 10);
        I.click(this.fields.eStatementFieldPass);
        I.fillField(this.fields.eStatementFieldPass, password);
    },

    // fillInvalidPasswordeStatement() {
    //     I.wait(this.fields.eStatementFieldPass, 10);
    //     I.click(this.fields.eStatementFieldPass);
    //     I.fillField(this.fields.eStatementFieldPass,"Kiwi1234");
    // },

    seePasswordeStatement() {
        I.waitForText("Test1234", 10);
    },

    clickBtnNexteStatement() {
        I.waitForElement(this.buttons.buttonNexteStatement, 10);
        I.click(this.buttons.buttonNexteStatement);
    },

    clickBtnTryAgaineStatement() {
        I.waitForElement(this.buttons.buttonTryeStatement,10);
        I.click(this.buttons.buttonTryeStatement);
    },

    clickBtnEyeeStatement() {
        I.waitForElement(this.buttons.buttonEyeeStatement, 10);
        I.click(this.buttons.buttonEyeeStatement);
    },

    viewButtonDownloadEStatement() {
        I.waitForElement(10);
        I.waitForElement(this.buttons.btneStatementDownload,10);
        I.seeElement(this.buttons.btneStatementDownload);
    },

    clickBtnDownloadeStatement() {
        I.waitForElement(this.buttons.btneStatementDownload, 10);
        I.click(this.buttons.btneStatementDownload);
    },

    clickBtnLatesteStatement() {
        I.waitForElement(this.buttons.btneStatementLatest, 10);
        I.click(this.buttons.btneStatementLatest);
    },

    clickBtnNexteStatement() {
        I.waitForElement(this.buttons.buttonNexteStatement, 10);
        I.click(this.buttons.buttonNexteStatement);
    },

    clickBtnTryeStatement() {
        I.waitForElement(this.buttons.buttonTryeStatement, 10);
        I.click(this.buttons.buttonTryeStatement);
    },

    clickBtnUnderstandeStatement() {
        I.waitForElement(this.buttons.buttonUnderstandeStatement, 10);
        I.click(this.buttons.buttonUnderstandeStatement);
    },

    clickBtnEyeeStatement() {
        I.waitForElement(this.buttons.buttonEyeeStatement, 10);
        I.click(this.buttons.buttonEyeeStatement);
    },

    validationeStatementNotExist() {
        I.wait(5);
        I.see("e-Statement belum ada")
    },

    async viewSuccessAlertBar() {

        I.waitForElement(this.textFields.textViewFailedAlert, 5);
        let isAlert = await I.grabAttributeFrom(this.textFields.textViewFailedAlert, "bounds");

        if (isAlert === "[77,2055][143,2121]") {
            console.log("Sistem tidak dapat mencetak e-Statement.");
            //return true;
        }

        else {
            console.log("e-Statement sudah di download");
            //return true;
        }
    },

    async checkAlertBar() {

        I.waitForElement(this.textFields.textViewFailedAlert, 3);
        let isFailed = await I.grabAttributeFrom(this.textFields.textViewFailedAlert, "text");

        if (isFailed === "Sedang terjadi kesalahan sistem.") {
            console.log("Sistem tidak dapat mencetak e-Statement.");
            //return true;
        }

        else {
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
        I.waitForElement(this.buttons.btnClose, 10);
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
        I.waitForElement(this.textFields.textViewSelectDate, 10);
    },
    clicFieldStartDate() {
        I.waitForElement(this.fields.startDateField, 10);
        I.click(this.fields.startDateField);
    },
    clicFieldEndDate() {
        I.waitForElement(this.fields.endDateField, 10);
        I.click(this.fields.endDateField);
    },
    clickBtnChoose() {
        I.waitForElement(this.buttons.btnChoose, 10);
        I.click(this.buttons.btnChoose);
    },
    clickBtnCancel() {
        I.wait(2);
        I.click(this.buttons.btnCancel);
    },
    clickBtnOk() {
        I.waitForElement(this.buttons.submitFilter, 10);
        I.click(this.buttons.submitFilter);
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
        switch (trfType) {
            case 'out':
                I.waitForElement(this.tabs.outTransaction, 10);
                I.click(this.tabs.outTransaction);
                break;
            case 'in':
                I.waitForElement(this.tabs.inTransaction, 10);
                I.click(this.tabs.inTransaction);
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
        I.waitForElement(this.buttons.btnShare, 10);
        I.click(this.buttons.btnShare);
    },
    clickTabTesting() {
        I.waitForElement(this.menu.tabTesting, 10);
        I.click(this.menu.tabTesting);
    },
    resetFilter() {
        I.waitForElement(this.link.reset, 10);
        I.click(this.link.reset);
    },
    clearFieldStartDate(){
        I.waitForElement(this.fields.startDateField, 10);
        I.clearField(this.fields.startDateField);
    },
    clearFieldEndDate(){
        I.waitForElement(this.fields.endDateField, 10);
        I.clearField(this.fields.endDateField);
    },

    async getMessageErrorFieldeStatementPassword(fieldName) {
        if (Object.keys(this.messageErrorFields).indexOf(fieldName) === -1) {
          throw new Error('Field ${fieldName} is not found');
        }
        I.waitForElement(this.messageErrorFields[fieldName], 10);
        return await I.grabTextFrom(this.messageErrorFields[fieldName]);
      },

    async getTransactionNameBucketList(){
        I.waitForElement(this.textFields.nameBucketlist, 10);
        return await I.grabTextFrom(this.textFields.nameBucketlist);
    },
    async getListTransactionNameBucketList(){
        I.waitForElement(this.textFields.nameBucketlist, 10);
        return await I.grabTextFromAll(this.textFields.nameBucketlist);
    },
    async getTransactionNameBucketListSecond(){
        I.waitForElement(this.textFields.nameBucketlistSecond, 10);
        return await I.grabTextFrom(this.textFields.nameBucketlistSecond);
    },
    async getTransactionDateBucketList(){
        I.waitForElement(this.textFields.dateBucketlist, 10);
        return await I.grabTextFrom(this.textFields.dateBucketlist);
    },
    async getTransactionDateBucketListSecond(){
        I.waitForElement(this.textFields.dateBucketlistSecond, 10);
        return await I.grabTextFrom(this.textFields.dateBucketlistSecond);
    },
    async getTransactionBankNameBucketList(){
        I.waitForElement(this.textFields.bankNameBucketlist, 10);
        return await I.grabTextFrom(this.textFields.bankNameBucketlist);
    },
    async getListTransactionBankNameBucketList(){
        I.waitForElement(this.textFields.bankNameBucketlist, 10);
        return await I.grabTextFromAll(this.textFields.bankNameBucketlist);
    },
    async getTransactionBankNameBucketListSecond(){
        I.waitForElement(this.textFields.bankNameBucketlistSecond, 10);
        return await I.grabTextFrom(this.textFields.bankNameBucketlistSecond);
    },
    async getTransactionAccNumberBucketList(){
        I.waitForElement(this.textFields.accNumberBucketlist, 10);
        return await I.grabTextFrom(this.textFields.accNumberBucketlist);
    },
    async getListTransactionAccNumberBucketList(){
        I.waitForElement(this.textFields.accNumberBucketlist, 10);
        return await I.grabTextFromAll(this.textFields.accNumberBucketlist);
    },
    async getTransactionAccNumberBucketListSecond(){
        I.waitForElement(this.textFields.accNumberBucketlistSecond, 10);
        return await I.grabTextFrom(this.textFields.accNumberBucketlistSecond);
    },
    async getTransactionAmountBucketList(){
        I.waitForElement(this.textFields.amountBucketlist, 10);
        return await I.grabTextFrom(this.textFields.amountBucketlist);
    },
    async getListTransactionAmountBucketList(){
        I.waitForElement(this.textFields.amountBucketlist, 10);
        return await I.grabTextFromAll(this.textFields.amountBucketlist);
    },
    async getTransactionAmountBucketListSecond(){
        I.waitForElement(this.textFields.amountBucketlistSecond, 10);
        return await I.grabTextFrom(this.textFields.amountBucketlistSecond);
    },
    async getRecipientNameDetail(){
        I.waitForElement(this.textFields.recipientName, 10);
        return await I.grabTextFrom(this.textFields.recipientName);
    },
    async getRecipientBankNameDetail(){
        I.waitForElement(this.textFields.recipientBankName, 10);
        return await I.grabTextFrom(this.textFields.recipientBankName);
    },
    async getRecipientAccNumberDetail(){
        I.waitForElement(this.textFields.recipientAccNumber, 10);
        return await I.grabTextFrom(this.textFields.recipientAccNumber);
    },
    async getSenderNameDetail(){
        I.waitForElement(this.textFields.senderName, 10);
        return await I.grabTextFrom(this.textFields.senderName);
    },
    async getSenderBankNameDetail(){
        I.waitForElement(this.textFields.senderBankName, 10);
        return await I.grabTextFrom(this.textFields.senderBankName);
    },
    async getSenderAccNumberDetail(){
        I.waitForElement(this.textFields.senderAccNumber, 10);
        return await I.grabTextFrom(this.textFields.senderAccNumber);
    },
    async getAmountDetail(){
        I.waitForElement(this.textFields.amount, 10);
        return await I.grabTextFrom(this.textFields.amount);
    },
    async getCreatedByName(){
        I.waitForElement(this.textFields.createdBy, 10);
        return await I.grabTextFrom(this.textFields.createdBy);
    },
    async getApprovedByName(){
        I.waitForElement(this.textFields.approveBy, 10);
        return await I.grabTextFrom(this.textFields.approveBy);
    },
    async getCategory(){
        I.waitForElement(this.textFields.category, 10);
        return await I.grabTextFrom(this.textFields.category);
    },
    async getMethodTransaction(){
        I.waitForElement(this.textFields.methodTransaction, 10);
        return await I.grabTextFrom(this.textFields.methodTransaction);
    },
    async getNotes(){
        I.waitForElement(this.textFields.textNote, 10);
        return await I.grabTextFrom(this.textFields.textNote);
    },
    async getDate(){
        I.waitForElement(this.textFields.dateDetailHistory, 10);
        return await I.grabTextFrom(this.textFields.dateDetailHistory);
    },
    openDetailHistory(){
        I.waitForElement(this.buttons.detailHistory, 10);
        I.click(this.buttons.detailHistory);
    },
    openSecondDetailHistory(){
        I.waitForElement(this.buttons.detailHistorySecond, 10);
        I.click(this.buttons.detailHistorySecond);
    },
    async getAdminFeeAmount(){
        I.waitForElement(this.textFields.adminFeeAmount, 10);
        return await I.grabTextFrom(this.textFields.adminFeeAmount);
    },
    async getAllAdminFeeAmount(){
        I.waitForElement(this.textFields.adminFeeAmount, 10);
        return await I.grabTextFromAll(this.textFields.adminFeeAmount);
    },
    async getAdminFeeAmountSecond(){
        I.waitForElement(this.textFields.adminFeeAmountSecond, 10);
        return await I.grabTextFrom(this.textFields.adminFeeAmountSecond);
    },
    choosePastStartDate(){
        I.waitForElement(this.fields.startDateField, 10);
        I.click(this.fields.startDateField);
        I.waitForElement(this.textFields.dateDetailHistory, 10);
        I.waitForText("Pilih Tanggal", 10);
        I.swipeDown(this.textFields.dateDetailHistory, 1000, 1000);
        I.swipeDown(this.textFields.month, 1000, 1000);
    },
    chooseFutureStartDate(){
        I.waitForElement(this.fields.startDateField, 10);
        I.click(this.fields.startDateField);
        I.waitForElement(this.textFields.dateDetailHistory, 10);
        I.waitForText("Pilih Tanggal", 10);
        I.swipeUp(this.textFields.dateDetailHistory, 1000, 1000);
        I.swipeUp(this.textFields.month, 1000, 1000);
    },
    choosePastEndDate(){
        I.waitForElement(this.fields.endDateField, 10);
        I.click(this.fields.endDateField);
        I.waitForElement(this.textFields.dateDetailHistory, 10);
        I.waitForText("Pilih Tanggal", 10);
        I.swipeDown(this.textFields.dateDetailHistory, 1000, 1000);
        I.swipeDown(this.textFields.month, 1000, 1000);
    },
    chooseFutureEndDate(){
        I.waitForElement(this.fields.endDateField, 10);
        I.click(this.fields.endDateField);
        I.waitForElement(this.textFields.dateDetailHistory, 10);
        I.waitForText("Pilih Tanggal", 10);
        I.swipeUp(this.textFields.dateDetailHistory, 1000, 1000);
        I.swipeUp(this.textFields.month, 1000, 1000);
    },
    chooseDate(){
        I.waitForElement(this.buttons.btnChoose, 10);
        I.click(this.buttons.btnChoose);
    },
    backFromFormDate(){
        I.waitForElement(this.buttons.btnCancel, 10);
        I.click(this.buttons.btnCancel);
    },
    async getMessageErrorFilterHistoryTransaction(){
        I.waitForElement(this.textFields.textErrorDate, 10);
        return await I.grabTextFrom(this.textFields.textErrorDate);
    },
    async getChoosenStartDate(){
        I.waitForElement(this.textFields.choosenStartDate, 10);
        return await I.grabTextFrom(this.textFields.choosenStartDate);
    },
    async getChoosenEndDate(){
        I.waitForElement(this.textFields.choosenEndDate, 10);
        return await I.grabTextFrom(this.textFields.choosenEndDate);
    },
}