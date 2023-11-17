const { I } = inject();

module.exports = {
    textView: {
        textTitleOnboardingAccOpening: {xpath: '(//android.widget.TextView[@content-desc="textTitleLoanOnBoardingPage1"])[2]'},
        textViewLimitBoarding: {xpath: '//android.widget.TextView[contains(@text, "Dapatkan Limit hingga")]'},
        textViewLimitBranding: {xpath: '//android.widget.TextView[contains(@text, "Rp 5 Milyar")]'},
        textViewBodyTitle: {xpath: '//android.widget.TextView[contains(@text, "Pinjaman untuk Bisnis dari Amar Bank")]'},
        textViewBodyDesc: {xpath: '//android.widget.TextView[contains(@text, "Dapatkan pinjaman untuk pembiayaan transaksi bisnis Anda.")]'},
        textViewCardTittleAc: {xpath: '//android.widget.TextView[contains(@text, "Dapatkan Rekening Giro")]'},
        textViewCardSubTittleAc: {xpath: '//android.widget.TextView[contains(@text, "Layanan perbankan bisnis premium untuk memantau usaha Anda.")]'},
        textViewBenefitTitle: {xpath: '//android.widget.TextView[contains(@text, "Benefit")]'},
        textViewBenefit1: {xpath: '//android.widget.TextView[contains(@text, "Gratis Biaya Admin")]'},
        textViewBenefit2: {xpath: '//android.widget.TextView[contains(@text, "Transaksi Real-Time")]'},
        textViewBenefit3: {xpath: '//android.widget.TextView[contains(@text, "Semua Proses dari Hp Anda")]'},
        textViewBenefit4: {xpath: '//android.widget.TextView[contains(@text, "Multiple User")]'},
        textViewBenefit5: {xpath: '//android.widget.TextView[contains(@text, "Debit Card")]'},
        textViewMainDashboardDefaultTitle: "~txtTitleCard",
        textViewMainDashboardDefaultDesc: "~txtDescCard",
    },
    buttons: {
        btnLoan: "~btnLoan",
        btnOpenAccount: "~btnOpenAccount"
    },


    // function for call the id component
    viewCardOnBoardingAccOpening(){
        I.seeElement(this.textView.textTitleOnboardingAccOpening);
    },
    async validationTextViewOnboarding(){
        I.wait(2);
        switch (boardType){
            case 'loan':
                I.wait(2);
                let limitBoardValue = await I.grabAttributeFrom(this.textView.textViewLimitBoarding, "text");
                I.assertEqual(limitBoardValue, "Dapatkan Limit hingga");
                I.wait(2);
                let limitBrandValue = await I.grabAttributeFrom(this.textView.textViewLimitBranding, "text");
                I.assertEqual(limitBrandValue, "Rp 5 Milyar");
                I.wait(2);
                let bodyTitleValue = await I.grabAttributeFrom(this.textView.textViewBodyTitle, "text");
                I.assertEqual(bodyTitleValue, "Pinjaman untuk Bisnis dari Amar Bank");
                I.wait(2);
                let bodyDescValue = await I.grabAttributeFrom(this.textView.textViewBodyDesc, "text");
                I.assertEqual(bodyDescValue, "Dapatkan pinjaman untuk pembiayaan transaksi bisnis Anda.");
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
    swipeToCardAccOpening(){
        I.wait(2);
        I.performSwipe({x:989, y:1123},{x:400, y:1123});
    },
    async getWordingOnButtonMainDashboardDefault (fieldName) {
        if(Object.keys(this.buttons).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.buttons[fieldName]);
        return await I.grabTextFrom(this.buttons[fieldName]);
      },
    async viewMainDashboardDefault(){
        I.wait(2);
        let cardTitleValue = await I.grabAttributeFrom(this.textView.textViewMainDashboardDefaultTitle, "text");
        I.assertEqual(cardTitleValue, "Perbankan Bisnis Premium");
        I.wait(2);
        let cardDescValue = await I.grabAttributeFrom(this.textView.textViewMainDashboardDefaultDesc, "text");
        I.assertEqual(cardDescValue, "Dapatkan benefit seperti Gratis Biaya Admin, Transaksi Real-Time, dan keuntungan lainnya");
    }
}
