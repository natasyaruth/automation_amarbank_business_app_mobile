const { I } = inject();

module.exports = {
    textField: {
        textFieldAnchorPage: "~textTitlePage",
        textFieldTitleAnchorNotFound: "~textTitleErrorPlatform",
        textFieldSubTitleAnchorNotFound: "~textMessageErrorPlatform",
        textFieldAnchorCooperatingPage: {xpath: '//android.widget.TextView[contains(@text, "Dengan supplier mana Anda bekerjasama?")]'},
        textFieldAnchorCooperatingPageSupplier: {xpath: '//android.widget.TextView[contains(@text, "Dengan supplier mana Anda bekerjasama?")]'},
        textFieldAnchorCooperatingPageBuyer: {xpath: '//android.widget.TextView[contains(@text, "Dengan buyer mana Anda bekerjasama?")]'},
        textFieldHeadOfficeLocationPage: {xpath: '//android.widget.TextView[contains(@text, "Saya butuh dana untuk membayar tagihan dari supplier")]'},

    },
    fields: {
        searchField: "~textFieldSearch",
        anchorSearchResult: "~itemSupplier",
        anchorList1: {xpath: '(//android.widget.TextView[@content-desc="itemSupplier"])[1]'},
        dateField: "~textFieldStartDate",
        dateMonthPreviousField: {xpath: '(//android.widget.TextView[@content-desc="textMonth"])[1]'},
        dateMonthSelectedField: {xpath: '(//android.widget.TextView[@content-desc="textMonth"])[2]'},
        dateMonthNextField: {xpath: '(//android.widget.TextView[@content-desc="textMonth"])[3]'},
        dateYearPreviousField: {xpath: '(//android.widget.TextView[@content-desc="textYear"])[1]'},
        dateYearSelectedField: {xpath: '(//android.widget.TextView[@content-desc="textYear"])[2]'},
        dateYearNextField: {xpath: '(//android.widget.TextView[@content-desc="textYear"])[3]'},
        anchorName: "~textFieldSupplierName",
        anchorAddress: "~textFieldSupplierAddress",
        industryTypeField: "~textFieldSupplierType",
        industryTypeList1: {xpath: '(//android.widget.TextView[@content-desc="itemIndustryType"])[1]'},
        PICNameField: "~textFieldPicName",
        PICNumberField: "~textFieldPicNumber",
        PICEmailField: "~textFieldPicEmail",

    },
    buttons: {
        chooseBtn: "~buttonChoose",
        cancelBtn: "~buttonCancel",
        backBtn: {xpath: '(//android.view.View[@content-desc="buttonBack"])[1]'},
        nextBtn: "~buttonNext"
    },
    icon: {
        otherAnchor: "~buttonAdd"
    },
    messageErrorFields: {
        anchorNameField: "~textMsgNameError",
        industryTypeField: "~textMsgTypeError",
        dateField: "~textMsgStartDateError",
        PICNameField: "~textErrorPicName",
        PICNumberField: "~textErrorPicNumber"
    },
    scrollView: {
        scroll: "android.widget.ScrollView"
    },
    checkBox:{
        termsAndCondition: "~checkboxTnc",
        // rights: "~checkBoxRight",
        privy: "~checkboxTncPrivy",
        // loan: "~checkBoxLoan",
    },
    // Function for call the id component
    viewAnchorPage(){
        I.wait(2);
        I.seeElement(this.textField.textFieldAnchorPage);
    },
    async viewBuyerPage(){
        I.seeElement(this.textField.textFieldAnchorPage);
        I.wait(2);
        let actualValueTitle = await I.grabAttributeFrom(this.textField.textFieldAnchorPage, 'text');
        I.assertEqual(actualValueTitle, 'Dengan buyer mana Anda bekerjasama?');
    },
    async viewBowheerPage(){
        I.seeElement(this.textField.textFieldAnchorPage);
        I.wait(2);
        let actualValueTitle = await I.grabAttributeFrom(this.textField.textFieldAnchorPage, 'text');
        I.assertEqual(actualValueTitle, 'Dengan pemilik proyek/bowheer mana Anda bekerjasama?');
    },
    fillFieldSearch(txtValue){
        I.seeElement(this.fields.searchField);
        I.setText(this.fields.searchField, txtValue);
    },
    async validateAnchorNotFound(){
        I.wait(5);
        let actualValueTitle = await I.grabAttributeFrom(this.textField.textFieldTitleAnchorNotFound, 'text');
        I.assertEqual(actualValueTitle, 'Supplier tidak ditemukan');
        I.wait(5);
        let actualValueSubTitle = await I.grabTextFrom(this.textField.textFieldSubTitleAnchorNotFound, 'text');
        I.assertEqual(actualValueSubTitle, 'Supplier belum terdaftar atau periksa kembali nama suplier yang anda cari');
    },
    selectAnchorList(){
        I.waitForElement(this.fields.anchorSearchResult, 10);
        I.click(this.fields.anchorSearchResult);
    },
    viewAnchorCooperatingPage(){
        I.wait(2);
        I.seeElement(this.textField.textFieldAnchorCooperatingPage);
    },
    viewAnchorCooperatingPageSupplier(){
        I.wait(2);
        I.seeElement(this.textField.textFieldAnchorCooperatingPageSupplier);
    },
    viewAnchorCooperatingPageBuyer(){
        I.wait(2);
        I.seeElement(this.textField.textFieldAnchorCooperatingPageBuyer);
    },
    // selectDateCooperating(){
    //     I.waitForElement(this.fields.dateField, 10);
    //     I.click(this.fields.dateField);
    //     I.wait(2);
    //     I.performSwipe({x:394, y:1040},{x:394, y:1137});
    //     I.wait(2);
    //     I.performSwipe({x:792, y:1026},{x:792, y:1153});
    //     I.wait(2);
    //     I.click(this.buttons.chooseBtn);
    // },
    selectDateCooperating(){
        I.waitForElement(this.fields.dateField, 5);
        I.click(this.fields.dateField);
        I.wait(2);
        I.click(this.fields.dateMonthPreviousField)
        I.wait(2);
        I.click(this.fields.dateYearPreviousField);
        I.wait(2);
        I.click(this.fields.dateYearPreviousField);
        I.wait(2);
        I.click(this.buttons.chooseBtn);
    },
    clickBackButtonToListAcnhor(){
        I.wait(5);
        I.click(this.buttons.backBtn);
    },
    clickIconOtherAnchor(){
        I.wait(5);
        I.click(this.icon.otherAnchor);
    },
    clickNextBtnOnAnchorPage(){
        I.wait(5);
        I.click(this.buttons.nextBtn);
    },
    async getMessageErrorFieldOnOtherAnchor (fieldName) {
        if(Object.keys(this.messageErrorFields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.messageErrorFields[fieldName]);
        return await I.grabTextFrom(this.messageErrorFields[fieldName]);
      },

    fillFieldAnchorName(fieldName, txtValue){
        I.seeElement(this.fields[fieldName]);
        I.setText(this.fields[fieldName], txtValue);
    },

    selectIndustryType(){
        I.wait(5);
        I.seeElement(this.fields.industryTypeField);
        I.click(this.fields.industryTypeField);
        I.wait(5);
        I.click(this.fields.industryTypeList1);
    },
    scrollToViewTextError(){
        //I.swipeDown(this.messageErrorFields.PICNumberField);
        I.wait(2);
        I.performSwipe({x:575,y:1653},{x:575,y:1265});
    },

    // swipetoPICNameField() {
    //     // I.waitForElement(this.fields.PICNameField, 10);
    //     I.swipeDown(this.fields.PICNameField, 1000, 2500);
    //   },

    async termsAndCondition(){

        I.waitForElement(this.checkBox.termsAndCondition,10);
        const isChecked = await I.grabAttributeFrom(this.checkBox.termsAndCondition, "checked");
    
        if(isChecked === "false"){
          I.click(this.checkBox.termsAndCondition);
        }
      },

    async privyAggrementPage(){

        I.waitForElement(this.checkBox.privy,10);
        const isChecked = await I.grabAttributeFrom(this.checkBox.privy, "checked");
    
        if(isChecked === "false"){
          I.click(this.checkBox.privy);
        }
      },
    
}

