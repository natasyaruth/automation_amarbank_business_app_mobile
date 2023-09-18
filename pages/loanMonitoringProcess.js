const { I } = inject();

module.exports = {
    fields: {
        titleFieldSuccessCompleteData: { xpath: '//android.widget.TextView[contains(@text, "Terima kasih telah melengkapi Data Diri")]' },
        subTitleFieldSuccessCompleteData: { xpath: '//android.widget.TextView[contains(@text, "Mohon melengkapi Data Bisnis Anda untuk melanjutkan proses pengajuan pinjaman")]' },
        titlePerbankanPremiumBisnis: { xpath: '//android.widget.TextView[contains(@text, "Perbankan Bisnis Premium")]' },
        descriptionPerbankanPremiumBisnis: { xpath: '//android.widget.TextView[contains(@text, "Dengan melengkapi Data Bisnis, Anda akan mendapatkan fitur perbankan bisnis premium (rekening giro) dari Bank Amar")]' },
        freeCostAdmin: { xpath: '//android.widget.TextView[contains(@text, "Gratis Biaya Admin")]' },
        realTimeTrx: { xpath: '//android.widget.TextView[contains(@text, "Transaksi Real-Time")]' },
        processFromYourHp: { xpath: '//android.widget.TextView[contains(@text, "Semua Proses dari Hp Anda")]' },
        multipleUser: { xpath: '//android.widget.TextView[contains(@text, "Multiple User")]' },
        debitCard: { xpath: '//android.widget.TextView[contains(@text, "Debit Card")]' },
        titleBottomSheet: { xpath: '//android.widget.TextView[contains(@text, "Selamat, Pengajuan Berhasil Dikirim")]' },
        subTitleBottomSheet: { xpath: '//android.widget.TextView[contains(@text, "Pengajuanmu akan segera diproses oleh tim Amar Bank")]' },
        descriptionBottomSheet: { xpath: '//android.widget.TextView[contains(@text, "Proses verifikasi pinjaman juga mencakup pembuatan rekening giro secara otomatis.")]' },
        loanProcessPage : {xpath: '//android.widget.TextView[contains(@text, "Pengajuanmu Sedang Diproses Tim Kami")]'},
        titleDocumentField: {xpath: '//android.widget.TextView[contains(@text, "Pengecekan Dokumen")]'},
        statusCheckingDocumentField: {xpath: '//android.widget.TextView[contains(@text, "Proses saat ini")]'},
        wordingDocumentField: {xpath: '//android.widget.TextView[contains(@text, "Dokumen sudah berhasil dikirim, Tim kami akan memprosesnya.")]'},
        titleAnalystCreditField: "",
        statusAnalystCreditField: "",   
        wordingAnalystCreditField: "",
        titleLastStepField: "",
        statusLastStepField: "",
        wordingLastStepField: ""
    },
    buttons: {
        btnViewDocument: "",
        btnNext: "~buttonNext",
        btnNextBottomSheet: "~buttonNextSuccessBottomSheet",
        btnCloseBtmSheet: "~buttonCloseSuccessBottomSheet"
    },

    // Function for call the id component Completed Data Page
    viewCompletedDataPage() {
        I.seeElement(this.fields.titleFieldSuccessCompleteData);
    },

    async getTextFieldSuccessCompleteData (fieldName) {
        if(Object.keys(this.fields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFrom(this.fields[fieldName]);
    },

    validateHeaderContent(){
        I.wait(2);
        I.seeElement(this.fields.titlePerbankanPremiumBisnis);
    },

    validateHeaderContent(){
        I.wait(2);
        I.seeElement(this.fields.descriptionPerbankanPremiumBisnis);
        I.wait(2);
        I.seeElement(this.fields.freeCostAdmin);
        I.seeElement(this.fields.realTimeTrx);
        I.wait(2);
        I.seeElement(this.fields.processFromYourHp);
        I.seeElement(this.fields.multipleUser);
        I.seeElement(this.fields.debitCard);
    },

    clickBtnNextCompletedData(){
        I.wait(2);
        I.click(this.buttons.btnNext);
    },

    // Function for call the id component Loan monitoring Process
    async getTextFieldBottomSheet (fieldName) {
        if(Object.keys(this.fields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFrom(this.fields[fieldName]);
    },
    
    clickCloseBtnBottomSheet(){
        I.wait(2);
        I.click(this.buttons.btnCloseBtmSheet);
    },

    viewLoanProcessPage() {
        I.wait(2);
        I.seeElement(this.fields.loanProcessPage);
    },
    async getValueField(fieldName) {
        if (Object.keys(this.fields).indexOf(fieldName) === -1) {
            throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFromField(this.fields[fieldName]);
    },
    async getTextFieldSuccessCompleteData(fieldName) {
        if (Object.keys(this.fields).indexOf(fieldName) === -1) {
            throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabTextFrom(this.fields[fieldName]);
    },
}