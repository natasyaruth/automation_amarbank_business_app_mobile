const { I } = inject();

module.exports = {
    textView:{
        companyName: "~txtCompanyName",
        totalBalance: "~txtTotalBalance",
        btnEyes: "~btnEyes",
        btnHistory: "~btnHistory",
        btnTransfer: "~btnTransfer"
    },


    // function for call the id component
    async viewCardBalance(){
        I.wait(2);
        let actualValue = await I.grabAttributeFrom(this.textView.companyName, "text");
        I.assertEqual(actualValue, "PT. Tembaga Api");
        I.seeElement(this.textView.totalBalance);
        I.seeElement(this.textView.btnEyes);
        I.seeElement(this.textView.btnHistory);
        I.seeElement(this.textView.btnTransfer);
    },
    async viewCardBalanceIndividu(){
        I.wait(2);
        let actualValue = await I.grabAttributeFrom(this.textView.companyName, "text");
        I.assertEqual(actualValue, "MARVIN MITCHELLin");
        I.seeElement(this.textView.totalBalance);
        I.seeElement(this.textView.btnEyes);
        I.seeElement(this.textView.btnHistory);
        I.seeElement(this.textView.btnTransfer);
    }

}