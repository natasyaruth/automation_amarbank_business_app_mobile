const {I} = inject();

module.exports = {
    fields: {
        userField: "~txtUserName"
    },
    buttons: {
        historyBtn: "~btnHistory"
    },
    textFields: {
        textViewHistoryTrxPage: { xpath: '//android.widget.TextView[contains(@text, "Riwayat Transaksi")]' }
    },

    viewUserName(){
        I.wait(2);
        I.seeElement(this.fields.userField);
    },
    clickBtnHistory(){
        I.wait(2);
        I.click(this.buttons.historyBtn);
    },
    async viewPageHistoryTransaction(){
        I.wait(2);
        let actualValue = await I.grabAttributeFrom(this.textFields.textViewHistoryTrxPage, "text");
        I.assertEqual(actualValue, "Riwayat Transaksi")
    },
    seeBtnHistory(){
        I.wait(2);
        I.seeElement(this.buttons.historyBtn);
    }
}