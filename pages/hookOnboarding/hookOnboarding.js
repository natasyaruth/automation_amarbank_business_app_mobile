const { I } = inject();

module.exports = {
    textView: {
        textTitleOnboardingAccOpening: { xpath: '(//android.widget.TextView[@content-desc="textTitleLoanOnBoardingPage1"])[2]' },
        textViewLimitBoarding: { xpath: '//android.widget.TextView[contains(@text, "Dapatkan Limit Tinggi")]' },
        textViewLimitBranding: { xpath: '//android.widget.TextView[contains(@text, "Rp 5 Milyar")]' },
        textViewBodyTitle: { xpath: '//android.widget.TextView[contains(@text, "Pinjaman untuk Bisnis dari Amar Bank")]' },
        textViewBodyDesc: { xpath: '//android.widget.TextView[contains(@text, "Kredit Bisnis untuk berbagai kebutuhan usaha")]' },
        textViewCardTittleAc: { xpath: '//android.widget.TextView[contains(@text, "Dapatkan Rekening Giro")]' },
        textViewCardSubTittleAc: { xpath: '//android.widget.TextView[contains(@text, "Layanan perbankan bisnis premium untuk memantau usaha Anda.")]' },
        textViewBenefitTitle: { xpath: '//android.widget.TextView[contains(@text, "Benefit")]' },
        textViewBenefit1: { xpath: '//android.widget.TextView[contains(@text, "Gratis Biaya Admin")]' },
        textViewBenefit2: { xpath: '//android.widget.TextView[contains(@text, "Transaksi Real-Time")]' },
        textViewBenefit3: { xpath: '//android.widget.TextView[contains(@text, "Semua Proses dari Hp Anda")]' },
        textViewBenefit4: { xpath: '//android.widget.TextView[contains(@text, "Multiple User")]' },
        textViewBenefit5: { xpath: '//android.widget.TextView[contains(@text, "Debit Card")]' },
        textViewMainDashboardDefaultTitle: "~txtTitleCard",
        textViewMainDashboardDefaultDesc: "~txtDescCard",
        textViewUserName: "~txtUserName",
        textViewPersonalDataPage: { xpath: '//android.widget.TextView[contains(@text, "Data Personal")]' },
        textViewBusinessDataPage: { xpath: '//android.widget.TextView[contains(@text, "Data Bisnis")]' },
        textViewUploadDocPage: { xpath: '//android.widget.TextView[contains(@text, "Upload dokumen-dokumen sebagai berikut:")]' },
        textViewInvitedUser: { xpath: '//android.widget.TextView[contains(@text, "Proses pengajuan pinjaman atau pembentukan rekening akan dilanjutkan setelah seluruh direktur teregistrasi.")]' },
        textviewhistoryloan: { xpath: '//android.widget.TextView[contains(@text, "Aktivitas Pinjaman")]' },
    },
    textCard: {
        textCardNextOpeningAccount: { xpath: '//android.widget.TextView[contains(@text, "Lanjutkan Pembuatan Rekening Giro")]' },
        textCardNextCompletedDoc: { xpath: '//android.widget.TextView[contains(@text, "Mohon lengkapi Dokumen yang dibutuhkan")]' },
        textCardInvetedUserDireksi: "~txtTitleOpenInvited",
        textCardWaitVerifyData: { xpath: '//android.widget.TextView[contains(@text, "Menunggu verifikasi data selesai")]' },
        textCardActivityLoan: { xpath: '//android.widget.TextView[contains(@text, "Aktivitas Pinjaman")]' },
        textCardValueProcess: { xpath: '//android.widget.TextView[contains(@text, "1")]' },
        textCardProcess: { xpath: '//android.widget.TextView[contains(@text, "Proses")]' },
        textCardContinueProcessLoan: "~txtTitleDropoff",
    },
    buttons: {
        btnLoan:  { xpath: '//android.widget.TextView[contains(@text, "Ajukan Limit Kredit")]' },
        btnLoanNew:  { xpath: '//android.widget.TextView[contains(@text, "Ajukan Limit Baru")]' },
        btnBack: "~btnBack",
        btnClose: "~buttonClose",
        btnOpenAccount: "~btnOpenAccount",
        btnOpenInvited: "~btnOpenInvited",
        bTnStartLoan: "~buttonStartLoan",
        btnOpenDoc: "~btnOpenDoc",
        btnDirectToHistoryLoan: "~directToHistoryLoan",
        btnTextOpenAccount: { xpath: '//android.widget.TextView[contains(@text, "Buka Rekening Giro")]' },
        btnDropOffAccOpeningOnly: "~btnDropoff",
        btnTextDropOffAccOpeningOnlyKyc: { xpath: '//android.widget.TextView[contains(@text, "Lanjut Lengkapi Data Personal")]' },
        btnTextDropOffAccOpeningOnlyKyb: { xpath: '//android.widget.TextView[contains(@text, "Lanjut Lengkapi Data Bisnis")]' },
        btnTextDropOffAccOpeningOnlyUploadDoc: { xpath: '//android.widget.TextView[contains(@text, "Lihat Semua Dokumen")]' },
        btnTextDropOffAccOpeningOnlyInvitedUser: { xpath: '//android.widget.TextView[contains(@text, "Lihat Daftar Direksi")]' },
    },


    // function for call the id component
    viewCardOnBoardingAccOpening() {
        I.seeElement(this.textView.textTitleOnboardingAccOpening);
    },
    viewMainDashboard() {
        I.wait(2);
        I.seeElement(this.textView.textViewUserName);
    },
    viewPagePersonalData() {
        I.wait(2);
        I.seeElement(this.textView.textViewPersonalDataPage);
    },
    viewPageBusinessData() {
        I.wait(2);
        I.seeElement(this.textView.textViewBusinessDataPage);
    },
    viewPageUploadDoc() {
        I.wait(2);
        I.seeElement(this.textView.textViewUploadDocPage);
    },
    viewPageInvitedUser() {
        I.wait(2);
        I.seeElement(this.textView.textViewInvitedUser);
    },
    clickBackButton(){
        I.wait(2);
        I.click(this.buttons.btnBack);
    },
    clickDirectHistory(){
        I.wait(2);
        I.click(this.buttons.btnDirectToHistoryLoan);
    },
    clickBtnClose(){
        I.wait(2);
        I.click(this.buttons.btnClose);
    },
    clickBtnStartLoan(){
        I.wait(2);
        I.click(this.buttons.bTnStartLoan);
    },
    async validationTextViewOnboarding() {
        I.wait(2);
        switch (boardType) {
            case 'loan':
                I.wait(2);
                let bodyDescValue = await I.grabAttributeFrom(this.textView.textViewBodyDesc, "text");
                I.assertEqual(bodyDescValue, "Kredit Bisnis untuk berbagai kebutuhan usaha");
                break;
            case 'ca':
                I.wait(2);
                let tittleValue = await I.grabAttributeFrom(this.textView.textViewCardTittleAc, "text");
                I.assertEqual(tittleValue, "Dapatkan Rekening Giro");
                I.wait(2);
                let subTittleValue = await I.grabAttributeFrom(this.textView.textViewCardSubTittleAc, "text");
                I.assertEqual(subTittleValue, "Layanan perbankan bisnis premium untuk memantau usaha Anda.");
                I.wait(2);
                I.seeElement(this.textView.textViewBenefitTitle);
                I.seeElement(this.textView.textViewBenefit1);
                I.seeElement(this.textView.textViewBenefit2);
                I.seeElement(this.textView.textViewBenefit3);
                I.seeElement(this.textView.textViewBenefit4);
                I.seeElement(this.textView.textViewBenefit5);
                break;
        }
    },
    swipeToCardAccOpening() {
        I.wait(2);
        I.performSwipe({ x: 989, y: 1123 }, { x: 400, y: 1123 });
    },
    async getWordingOnButtonMainDashboardDefault(fieldName) {
        if (Object.keys(this.buttons).indexOf(fieldName) === -1) {
            throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.buttons[fieldName]);
        return await I.grabTextFrom(this.buttons[fieldName]);
    },
    async getWordingOnTextCard(fieldName) {
        if (Object.keys(this.textCard).indexOf(fieldName) === -1) {
            throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.textCard[fieldName]);
        return await I.grabTextFrom(this.textCard[fieldName]);
    },
    async viewMainDashboardDefault() {
        I.wait(2);
        let cardTitleValue = await I.grabAttributeFrom(this.textView.textViewMainDashboardDefaultTitle, "text");
        I.assertEqual(cardTitleValue, "Perbankan Bisnis Premium");
        I.wait(2);
        let cardDescValue = await I.grabAttributeFrom(this.textView.textViewMainDashboardDefaultDesc, "text");
        I.assertEqual(cardDescValue, "Dapatkan benefit seperti Gratis Biaya Admin, Transaksi Real-Time, dan keuntungan lainnya");
    },
    clickBtnDropOff(){
        I.wait(2);
        I.click(this.buttons.btnDropOffAccOpeningOnly);
    },
    clickBtnOpenDoc(){
        I.wait(2);
        I.click(this.buttons.btnOpenDoc);
    },
    clickBtnInvitedUser(){
        I.wait(2);
        I.click(this.buttons.btnOpenInvited);
    },
    viewPageHistoryLoan(){
        I.wait(2);
        I.seeElement(this.textView.viewPageHistoryLoan);
    },
}
