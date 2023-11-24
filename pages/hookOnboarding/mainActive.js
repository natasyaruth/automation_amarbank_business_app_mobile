const { I } = inject();

module.exports = {
    textView:{
        companyName: "~txtCompanyName",
        totalBalance: "~txtTotalBalance",
        textViewValueLimitActive: { xpath: '//android.widget.TextView[contains(@text, "1 limit aktif")]' },
        textViewValueLoanProcess: { xpath: '//android.widget.TextView[contains(@text, "1")]' },
        textViewActivityLoan: { xpath: '//android.widget.TextView[contains(@text, "Aktivitas Pinjaman")]' },
    },
    buttons: {
        btnNewLimit: "",
        btnEyes: "~btnEyes",
        btnHistory: "~btnHistory",
        btnTransfer: "~btnTransfer",
    },


    // function for call the id component
    async viewCardBalance(){
        I.wait(2);
        let actualValue = await I.grabAttributeFrom(this.textView.companyName, "text");
        I.assertEqual(actualValue, "PT. Tembaga Api");
        I.seeElement(this.textView.totalBalance);
        I.seeElement(this.buttons.btnEyes);
        I.seeElement(this.buttons.btnHistory);
        I.seeElement(this.buttons.btnTransfer);
    },
    async viewCardBalanceIndividu(){
        I.wait(2);
        let actualValue = await I.grabAttributeFrom(this.textView.companyName, "text");
        I.assertEqual(actualValue, "MARVIN MITCHELLin");
        I.seeElement(this.textView.totalBalance);
        I.seeElement(this.buttons.btnEyes);
        I.seeElement(this.buttons.btnHistory);
        I.seeElement(this.buttons.btnTransfer);
    },
    async viewCardBalanceAccoount(){
        I.wait(2);
        I.seeElement(this.textView.totalBalance);
        I.seeElement(this.buttons.btnEyes);
        I.seeElement(this.buttons.btnHistory);
        I.seeElement(this.buttons.btnTransfer);
    },
    valueLimitActive(){
        I.wait(2);
        I.seeElement(this.textView.textViewValueLimitActive);
    },
    valueLoanProcess(){
        I.wait(2);
        I.seeElement(this.textView.textViewValueLoanProcess);
    },
    shouldSeeBtnNewLimit(){
        I.wait(2);
        I.seeElement(this.buttons.btnNewLimit);
    },
    shouldSeeActivityLoan(){
        I.wait(2);
        I.seeElement(this.textView.textViewActivityLoan);
    }

}