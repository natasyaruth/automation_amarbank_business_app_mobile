const { I } = inject();

module.exports = {
    textField:{
        textFieldLoanAmountPage: {xpath: '//android.widget.TextView[contains(@text, "Berapa kebutuhan pinjaman yang Anda butuhkan?")]'},
        textFieldLegalityBussPage: {xpath: '//android.widget.TextView[contains(@text, "Beri tahu kami jenis Legalitas Bisnis Anda")]'},
        textFieldHeadOfficeLocationPage: {xpath: '//android.widget.TextView[contains(@text, "Dimana lokasi kantor pusat bisnis Anda berjalan?")]'},
        textFieldSuccesApplyLoan: {xpath: '//android.widget.TextView[contains(@text, "Selamat, Anda memenuhi syarat untuk melakukan pengajuan pinjaman")]'},
        textFieldTitleHeadOfficeNotFound: {xpath: '//android.widget.TextView[contains(@text, "Maaf, Untuk saat ini kami belum melayani pinjaman di Medan.")]'},
        textFieldDescriptionHeadOfficeNotFound: {xpath: '//android.widget.TextView[contains(@text, "Tidak perlu khawatir, kami akan mempertimbangkan untuk memperluas wilayah pelayanan pinjaman dikota/kabupaten Anda.")]'},
        textFieldSuccesCompleteData: {xpath: '//android.widget.TextView[contains(@text, "Terima kasih telah melengkapi Data Diri")]'},
        textFieldTnc: "~textTnc"
    },
    fields: {
        amountLoanField: "~textFieldLoan",
        tenorLoanField: "~textFieldTenor",
        bussLocationField: "~textFieldLocation",
        companyFoundingDateField: "~textFieldCompanyFoundingDate",
        titleSuccesApplyLoanField: {xpath: '//android.widget.TextView[contains(@text, "Selamat, Anda memenuhi syarat untuk melakukan pengajuan pinjaman")]'},
        subTitleSuccesApplyLoanField: {xpath: '//android.widget.TextView[contains(@text, "Untuk mempercepat proses pengajuan pinjaman, mohon melengkapi data")]'},
        informationBussNeedDoneField: {xpath: '//android.widget.TextView[contains(@text, "Kebutuhan untuk mendanai tagihan dari supplier UD Dagangan")]'},
        informationLoanNeedDoneField: {xpath: '//android.widget.TextView[contains(@text, "Jumlah pinjaman dibutuhkan Rp200.000.000, Tenor 1 Bulan")]'},
        completeDataSection: {xpath: '//android.widget.TextView[contains(@text, "Siapkan dokumen berikut: KTP & NPWP pribadi, Data perusahaan")]'},
        tenorLoan0: {xpath: '//android.widget.TextView[contains(@text, "Kurang dari 1 Bulan")]'},
        tenorLoan1: {xpath: '(//android.widget.TextView[contains(@text, "1 Bulan")][2])'},
        tenorLoan2: {xpath: '//android.widget.TextView[contains(@text, "2 Bulan")]'},
        tenorLoan3: {xpath: '//android.widget.TextView[contains(@text, "3 Bulan")]'},
        tenorLoan4: {xpath: '//android.widget.TextView[contains(@text, "4 Bulan")]'},
        tenorLoan5: {xpath: '//android.widget.TextView[contains(@text, "5 Bulan")]'},
        tenorLoan6: {xpath: '//android.widget.TextView[contains(@text, "6 Bulan")]'},
        tenorLoan7: {xpath: '//android.widget.TextView[contains(@text, "Lebih dari 6 Bulan")]'},
        dayDateEstablish1: {xpath: '(//android.widget.TextView[@content-desc="textDate"])[1]'},
        dayDateEstablish2: {xpath: '(//android.widget.TextView[@content-desc="textDate"])[2]'},
        dayDateEstablish3: {xpath: '(//android.widget.TextView[@content-desc="textDate"])[3]'},
        monthDateEstablish1: {xpath: '(//android.widget.TextView[@content-desc="textMonth"])[1]'},
        monthDateEstablish2: {xpath: '(//android.widget.TextView[@content-desc="textMonth"])[2]'},
        monthDateEstablish3: {xpath: '(//android.widget.TextView[@content-desc="textMonth"])[3]'},
        yearDateEstablish1: {xpath: '(//android.widget.TextView[@content-desc="textYear"])[1]'},
        yearDateEstablish2: {xpath: '(//android.widget.TextView[@content-desc="textYear"])[2]'},
        yearDateEstablish3: {xpath: '(//android.widget.TextView[@content-desc="textYear"])[3]'}
    },
    buttons: {
        nextBtn: "~buttonNext",
        closeBtn: {xpath: '//android.view.View[@content-desc="Button Close"]'},
        chooseBtn: "~buttonChoose",
        cancelBtn: "~buttonCancel",
        closeBtn: "~buttonClose",
    },
    checkBox: {
        checkboxtnc: "~checkboxTnc",
    },
    messageErrorFields: {
        errorAmountLoanField: "~textMsgErrorLoan",
        errorTenorLoanField: "~textMsgErrorTenor",
        errorBussTypeField: "~textMsgErrorCompanyLegality",
        errorDateEstablishField: "~textMsgErrorCompanySince",
        errorBussLocationField: "~textMsgErrorCompanyLocation",
        agreetnc: "~TextErrorTnc"
    },
    radioButton: {
        otherLocationRadioBtn: {xpath: '(//android.widget.RadioButton[@content-desc="radioLocation"])[3]'},
        jabodetabekLocationRadioBtn: {xpath: '(//android.widget.RadioButton[@content-desc="radioLocation"])[1]'},
        legalityBussTypePTCompany: {xpath: '(//android.view.View[@content-desc="radioCompanyType"])[1]'},
        legalityBussTypePTPersonal: {xpath: '(//android.view.View[@content-desc="radioCompanyType"])[5]'},
        legalityBussTypeCV: {xpath: '(//android.view.View[@content-desc="radioCompanyType"])[2]'},
        legalityBussTypeUD: {xpath: '(//android.view.View[@content-desc="radioCompanyType"])[3]'},
        legalityBussTypePersonal: {xpath: '(//android.view.View[@content-desc="radioCompanyType"])[4]'}
    },
    icons: {
        iconInfoNeedBuss: "",
        iconInfoNeedLoan: "",
        iconCompletedData: ""
    },

    // Function for call the id component
    viewLoanAmountPage(){
        I.wait(3);
        I.seeElement(this.textField.textFieldLoanAmountPage);
    },
    viewSuccessCompleteDataPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldSuccesCompleteData);
    },
    viewLegalityBussPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldLegalityBussPage);
    },
    viewHeadOfficeLocationPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldHeadOfficeLocationPage);
    },
    clickBtnNextOnLoanAmountPage(){
        I.wait(3);
        I.click(this.buttons.nextBtn);
    },
    chooseTheDate(){
        I.wait(3);
        I.click(this.buttons.chooseBtn);
    },
    async getMessageErrorFieldOnLoanAmount (fieldName) {
        if(Object.keys(this.messageErrorFields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.messageErrorFields[fieldName]);
        return await I.grabTextFrom(this.messageErrorFields[fieldName]);
    },
    fillFieldLoanAmount(fieldName, txtValue){
        I.seeElement(this.fields[fieldName]);
        if (
            this.fields[fieldName] === "" ||
            this.fields[fieldName] === null ||
            this.fields[fieldName] === "-"
        ){
            I.clearField(this.fields[fieldName]);
            return;
        }
        I.setText(this.fields[fieldName], txtValue);
    },
    selectTenorLoan(tenorLength){
        I.wait(2);
        switch (tenorLength){
            case '0Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan0);
            break;
            case '1Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan1);
            break;
            case '2Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan2);
            break;
            case '3Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan3);
            break;
            case '4Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan4);
            break;
            case '5Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan5);
            break;
            case '6Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan6);
            break;
            case '7Month':
                I.click(this.fields.tenorLoanField);
                I.wait(2);
                I.click(this.fields.tenorLoan7);
            break;
        }
    },
    selectLegalityBussType(){
        I.wait(2);
        I.click(this.radioButton.legalityBussTypePTPersonal);
        I.wait(2);
        I.click(this.radioButton.legalityBussTypePersonal);
        I.wait(2);
        I.click(this.radioButton.legalityBussTypeUD);
        I.wait(2);
        I.click(this.radioButton.legalityBussTypeCV);
        I.wait(5);
        I.click(this.radioButton.legalityBussTypePTCompany);
    },
    selectCompanyFoundingDate(){
        I.wait(5);
        I.click(this.fields.companyFoundingDateField);
    },
    selectDayDate(dayDate){
        I.wait(3);
        switch (dayDate){
            case 'Previous':
                I.wait(2);
                I.click(this.fields.dayDateEstablish1);
            break;
            case 'Selected':
                I.wait(2);
                I.click(this.fields.dayDateEstablish2);
            break;
            case 'Next':
                I.wait(2);
                I.click(this.fields.dayDateEstablish3);
            break;
        }
    },
    selectMonthDate(monthDate){
        switch (monthDate){
            case 'Previous':
                I.wait(2);
                I.click(this.fields.monthDateEstablish1);
            break;
            case 'Selected':
                I.wait(2);
                I.click(this.fields.monthDateEstablish2);
            break;
            case 'Next':
                I.wait(2);
                I.click(this.fields.monthDateEstablish3);
            break;
        }
    },
    selectYearDate(yearDate){
        switch (yearDate){
            case 'Previous':
                I.wait(2);
                I.click(this.fields.yearDateEstablish1);
            break;
            case 'Selected':
                I.wait(2);
                I.click(this.fields.yearDateEstablish2);
            break;
            case 'Next':
                I.wait(2);
                I.click(this.fields.yearDateEstablish3);
            break;
        }
    },
    clickCloseBtn(){
        I.wait(5);
        I.click(this.buttons.closeBtn);
    },
    selectJabodetabekLocation(){
        I.wait(5);
        I.click(this.radioButton.jabodetabekLocationRadioBtn);
    },
    viewSuccessApplyLoanPage(){
        I.wait(5);
        I.seeElement(this.textField.textFieldSuccesApplyLoan);
    },
    async validateBussNeedDoneSection(){
        I.wait(5);
        let actualValue = await I.grabAttributeFrom(this.fields.informationBussNeedDoneField, 'text');
        I.assertEqual(actualValue, 'Kebutuhan untuk mendanai tagihan dari supplier UD Dagangan');
    },
    async validateLoanNeedDoneSection(){
        I.wait(5);
        let actualValue = await I.grabAttributeFrom(this.fields.informationLoanNeedDoneField, 'text');
        I.assertEqual(actualValue, 'Jumlah pinjaman dibutuhkan Rp200.000.000, Tenor 1 Bulan');
    },
    async validateCompletedDataSection(){
        I.wait(5);
        let actualValue = await I.grabAttributeFrom(this.fields.completeDataSection, 'text');
        I.assertEqual(actualValue, 'Siapkan dokumen berikut: KTP & NPWP pribadi, Data perusahaan');
    },
    selectLocationOthers(){
        I.wait(5);
        I.seeElement(this.radioButton.otherLocationRadioBtn);
        I.click(this.radioButton.otherLocationRadioBtn);
    },
    async getTextFieldSuccessApplyLoan (fieldName) {
        if(Object.keys(this.fields).indexOf(fieldName) === -1){
          throw new Error('Field ${fieldName} is not found');
        }
        I.seeElement(this.fields[fieldName]);
        return await I.grabAttributeFrom(this.fields[fieldName],'text');
    },
    async validateHeadOfficeLocationNotFound(){
        I.wait(3);
        let actualValueTitle = await I.grabAttributeFrom(this.textField.textFieldTitleHeadOfficeNotFound, 'text');
        I.assertEqual(actualValueTitle, 'Maaf, Untuk saat ini kami belum melayani pinjaman di Medan.');
        I.wait(3);
        // let actualValueSubTitle = await I.grabAttributeFrom(this.textField.textFieldDescriptionHeadOfficeNotFound, 'text');
        // I.assertEqual(actualValueSubTitle, 'Tidak perlu khawatir, kami akan mempertimbangkan untuk memperluas wilayah pelayanan pinjaman dikota/kabupaten Anda.');
        I.seeElement(this.textField.textFieldDescriptionHeadOfficeNotFound);
    },
    clickcheckBox(){
        I.click(this.checkBox.checkboxtnc);
    },
    async validateWordingTnc(){
        I.wait(3);
        let actualValue = await I.grabAttributeFrom(this.textField.textFieldTnc, 'text');
        I.assertEqual(actualValue, 'Saya menyetujui Syarat & Ketentuan dari PT. Bank Amar Indonesia Tbk.');
    },
    clickWordingCheckBox(){
        I.click(this.textField.textFieldTnc);
        I.wait(2);
        I.click(this.buttons.closeBtn);
    },
}