const { text } = require("../registration");

const { I } = inject();

module.exports = {
    textField: {
        textTitleOnboardingLoan: {xpath: '(//android.widget.TextView[@content-desc="textTitleLoanOnBoardingPage1"])[1]'},
        textBenefit1: {xpath: '//android.widget.TextView[contains(@text, "Bunga Kompetitif")]'},
        textBenefit2: {xpath: '//android.widget.TextView[contains(@text, "Proses Cepat dan Mudah")]'},
        textBenefit3: {xpath: '//android.widget.TextView[contains(@text, "Perbankan Bisnis Premium")]'},
        textFieldLoanTypePage: "~textTitle",
        textFieldLoanAP: "~textFieldLoanAP",
        textFieldLoanAR: "~textFieldLoanAR",
        textFieldLoanPO: "~textFieldLoanPO",
        textLoanSchemaAP: "~textTitle",
        textLoanSchemaAR: "~textTitle",
        textLoanSchemaPO: "~textTitle",
        textLoan: "~textFieldLoan",             
        textRequirement: "~textRequirement",
        textTitle: {xpath: '//android.widget.TextView[contains(@text, "Link Berhasil Dibuat")]'},
        textSubtitle: {xpath: '//android.widget.TextView[contains(@text, "Link berlaku selama 1x24 jam.")]'},
        textDescription: {xpath: '//android.widget.TextView[contains(@text, "Berikut adalah link yang dapat Anda bagikan untuk upload dokumen via handphone, laptop, PC atau perangkat lainnya.")]'},
        textLink: {xpath: '//android.widget.TextView[contains(@text, "https://www.bisnis.amarbank.co.id/upload.doc/123")]'},
        textLoanProgressSla: {xpath: '//android.widget.TextView[contains(@text, "Kami akan melakukan verifikasi data dan analisa pengajuan kredit Anda dalam waktu kurang-lebih 7 hari kerja setelah dokumen lengkap & benar.")]'},
        textProgress: {xpath: '//android.widget.TextView[contains(@text, "Proses selesai")]'},
        textDescription: {xpath: '//android.widget.TextView[contains(@text, "Tim Amar Bank sedang verifikasi data & dokumen yang sudah Anda upload")]'},
        textJointAccount: {xpath: '//android.widget.TextView[contains(@text, "Dengan ini anda mengizinkan Amar Bank untuk joint account dengan rekening bang yang Anda gunakan dalam berinteraksi dengan bouwheer.")]'},
        textTenor: {xpath: '//android.widget.TextView[contains(@text, "Berapa hari tenor limit kredit yang Anda butuhkan")]'},
        texttitletopbarLoanNeeds:  {xpath: '//android.widget.TextView[contains(@text, "Pengajuan Limit Kredit Bisnis")]'},
        textnominalKredit: {xpath: '//android.widget.TextView[contains(@text, "Berapa kisaran nominal kebutuhan limit kredit yang Anda butuhkan? *")]'},
        textTenorhari: {xpath: '//android.widget.TextView[contains(@text, "Hari")]'},
        textwordAP: {xpath: '//android.widget.TextView[contains(@text, "Distributor Financing")]'},
        textwordAR: {xpath: '//android.widget.TextView[contains(@text, "Supplier Financing")]'},
        textwordPO: {xpath: '//android.widget.TextView[contains(@text, "Project Financing")]'},
        textTitleTopBarListDoc: {xpath: '//android.widget.TextView[contains(@text, "Pengajuan Limit Kredit Bisnis")]'},


        //Data Pekerjaan
        individuEmployeDataMSME: {xpath: '//android.widget.TextView[contains(@text, "Jenis Pekerjaan *")]'},
        individuEmployeDataCORP: {xpath: '//android.widget.TextView[contains(@text, "Jenis Pekerjaan *")]'},
        //Address Bussiness Field
        adressBussinessPTPeroranganMSME: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        adressBussinessPTPerusahaanMSME: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        adressBussinessCVMSME: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        adressBussinessUDMSME: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        adressBussinessPTPeroranganCORP: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        adressBussinessPTPerusahaanCORP: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        adressBussinessCVCORP: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        adressBussinessUDCORP: {xpath: '//android.widget.TextView[contains(@text, "Alamat Bisnis *")]'},
        //Select Anchor or Supplier Name
        selectAPAnchorMSME: {xpath: '//android.widget.TextView[contains(@text, "Supplier Tujuan Anda")]'},
        selectARAnchorMSME: {xpath: '//android.widget.TextView[contains(@text, "Buyer Tujuan Anda")]'},
        selectAPDirectMSME: {xpath: '//android.widget.TextView[contains(@text, "Supplier Tujuan Anda")]'},
        selectARDirectrMSME: {xpath: '//android.widget.TextView[contains(@text, "Buyer Tujuan Anda")]'},
        selectPODirectMSME: {xpath: '//android.widget.TextView[contains(@text, "Nama Pemilik Proyek/Bowheer Anda")]'},
        selectAPAnchorCORP: {xpath: '//android.widget.TextView[contains(@text, "Supplier Tujuan Anda")]'},
        selectARAnchorCORP: {xpath: '//android.widget.TextView[contains(@text, "Buyer Tujuan Anda")]'},
        selectAPDirectCORP: {xpath: '//android.widget.TextView[contains(@text, "Supplier Tujuan Anda")]'},
        selectARDirectrCORP: {xpath: '//android.widget.TextView[contains(@text, "Buyer Tujuan Anda")]'},
        selectPODirectCORP: {xpath: '//android.widget.TextView[contains(@text, "Nama Pemilik Proyek/Bowheer Anda")]'},

    },
    buttons: {
        startButton: {xpath: '(//android.view.View[@content-desc="buttonStartLoan"])[1]'},
        backButtonLoanTypePage: {xpath: '(//android.view.View[@content-desc="buttonBack"])[1]'},
        schemacreditButton: "~buttonSchema", 
        loanAPButton: "~cardAP",
        loanARButton: "~cardAR",
        loanPOButton: "~cardPO",
        cardTitle: "~cardTitle",
        schemaAPButton: "~buttonSchemaAP",
        schemaARButton: "~buttonSchemaAR",
        schemaPOButton: "~buttonSchemaPO",
        buttonClose: "~buttonClose",
        buttonNext: "~buttonNext",
        buttonBack: "~buttonBack",
        buttonSave: "~buttonSave",
        buttonClear: "~clearText",
        buttonNominalMSME: "~optionUpTo5Billion",
        buttonNominalCorp: "~optionMoreThan5Billion",
        buttonCloseDoc: "~buttonCloseBottomSheet",
        buttonUploadMobileDoc: "~buttonUploadMobile",
        buttonUploadWebDoc: "~buttonUploadWeb",
        buttonCloseBottomSheet: "~buttonCloseBottomSheet",
        buttonUploadMobile: "~buttonUploadMobile",
        buttonUploadWeb: "~buttonUploadWeb",
        buttonHelp: "~buttonHelp",
        buttonRefresh: "~buttonRefresh",
        buttonUploadWeb: "~buttonUploadWeb",
        buttonAction: "~buttonAction",
        buttonSubmit: "~buttonSubmit",
        buttonCopy: "~buttonCopy",
        buttonUploadProgress: "~buttonUploadProgress",
        buttonUpload: "~buttonUpload",
    },

    radioButtons: {
        radioBtnAP: "~radioButtonAP",
        radioBtnAR: "~radioButtonAR",
        radioBtnPO: "~radioButtonPO",
    },
    contentFields: {
        viewPageAP: "~imageSchemaAP",
        viewPageAR: "~imageSchemaAR",
        viewPagePO: "~imageSchemaPO",
        loanRequirement: {xpath: '(//android.widget.ImageView[@content-desc="Loan requirement"])[1]'},
        nominalMSME: "~optionUpTo5Billion",
        nominalCORP: "~optionMoreThan5Billion",
    },
    field:{
        inputTenor: "~textFieldTenor",
        inputCustomNominal: "~textFieldCustomAmount", 
        //IDTracking
        completedStep: "~completedStep",
        activeStep: "~activeStep",
        step: "~step",  
        //AppNavigation
        activeStepDetailCredit: "~activeStepDetailCredit",
        stepDataSupplier: "~stepDataSupplier",
        completedStepDetailCredit: "~completedStepDetailCredit",
        activeStepDataSupplier: "~activeStepDataSupplier",        
        //FirstLoanID
        stepDetailCredit: "~stepDetailCredit",
        stepDataSupplier: "~stepDataSupplier",
        stepBusinessLocation: "~stepBusinessLocation",
        stepUploadDocument: "~stepUploadDocument",
        //SecondLoanID
        stepDetailCredit: "~stepDetailCredit",
        stepDataSupplier: "~stepDataSupplier",
        stepUploadDocument: "~stepUploadDocument",
    },

    //Apply Loan Journey Improvement
    clickButtonLearnSchema(){
        I.click(this.buttons.schemacreditButton);
    },
    clickButtonClose(){
        I.click(this.buttons.buttonClose);
    },
    clickButtonNext(){
        I.click(this.buttons.buttonNext);
    },
    clickButtonBack(){
        I.click(this.buttons.buttonBack);
    },
    clickButtonSave(){
        I.click(this.buttons.buttonSave);
    },
    clickButtonClearNominal(){
        I.click(this.buttons.buttonClear);
    },
    fillTenor(){
        I.setText(this.field.inputTenor);       
    },

    //Upload Document
    clickButtonCloseDoc(){
        I.click(this.buttons.buttonCloseDoc);
    },
    clickButtonUploadMobileDoc(){
        I.click(this.buttons.buttonUploadMobileDoc);
    },
    clickButtonUploadWebDoc(){
        I.click(this.buttons.buttonUploadWebDoc);
    },

    async verifyTextHari(Hari){
        let actual = await I.grabAttributeFrom(this.textField.textTenorhari, 'text');
        I.assertEqual(actual, 'Hari');

    },

    async validateTypeLoanWording(wordingLoanType){
        switch (wordingLoanType){
            case 'AP':
                let hint = await I.grabAttributeFrom(this.textField.textwordAP, 'text');
                I.assertEqual(hint, 'Distributor Financing');
            break;
            case 'AR':
                let actualValue = await I.grabAttributeFrom(this.textField.textwordAR, 'text');
                I.assertEqual(actualValue, 'Supplier Financing');
            break;
            case 'PO':
                let actual = await I.grabAttributeFrom(this.textField.textwordPO, 'text');
                I.assertEqual(actual, 'Project Financing');
            break;
        }        

    },

   chooseOptionMSME(){  
        I.waitForElement(this.buttons.chooseOptionMSME,10);    
        I.click(this.buttons.chooseOptionMSME);
   },

   chooseOptionCorp(){
        I.waitForElement(this.buttons.chooseOptionCorp,10);
        I.click(this.buttons.chooseOptionCorp);
   },

   inputTenor(){
        I.setText(this.field.inputTenor);
   },

    

    

    fillCustomNonimal(){
        I.setText(this.field.inputCustomNominal);
    },

    selectLoanTypeList(selectLoanType){
        switch (selectLoanType){
            case 'AP':
                I.click(this.buttons.loanAPButton);
            break;
            case 'AR':
                I.click(this.buttons.loanARButton);
            break;
            case "PO":
                I.click(this.buttons.loanPOButton);
                break;
        }
    },

    selectNominal(selectNominal){
        switch (selectNominal){
            case 'MSME':
                I.click(this.buttons.buttonNominalMSME);
            break;
            case 'Corp':
                I.click(this.buttons.buttonNominalCorp);
            break;
        }
    },

    async validateTitleTopBarLoanNeeds(titleLoanNeeds){
        let actual = await I.grabAttributeFrom(this.textField.texttitletopbarLoanNeeds, 'text');
        I.assertEqual(actual, 'Pengajuan Limit Kredit Bisnis');
    },

    async validateLoanAmountRequested(titleNominal){
        let actual = await I.grabAttributeFrom(this.textField.textnominalKredit, 'text');
        I.assertEqual(actual, 'Berapa kisaran nominal kebutuhan limit kredit yang Anda butuhkan? *');
    },

    async validateLoanTenor(titleTenor){
        let actual = await I.grabAttributeFrom(this.textField.textTenor, 'text');
        I.assertEqual(actual, 'Berapa hari tenor limit kredit yang Anda butuhkan');

    },
    async validateTitleTopBarDocList(titleDocList){
        let actual = await I.grabAttributeFrom(this.textField.textTitleTopBarListDoc, 'text');
        I.assertEqual(actual, 'Pengajuan Limit Kredit Bisnis');
    },

// Function for call the id component
    validationTextTittleOnboarding(){
        I.seeElement(this.textField.textTitleOnboarding);
    },
    viewPageOnBoarding(){
        I.seeElement(this.textField.textTitleOnboardingLoan);
    },

    validateContentLoanRequirement(){
        I.seeElement(this.contentFields.loanRequirement);
    },
    clickButtonStart(){
        I.click(this.buttons.startButton);
    },
    clickNextButton(){
        I.click(this.buttons.nextButton);
    },
    viewLoanTypePage(){
        I.seeElement(this.textField.textFieldLoanTypePage);
    },
    async validationBenefitText(benefitText){
        switch (benefitText){
            case 'first':
                let hint = await I.grabAttributeFrom(this.textField.textBenefit1, 'text');
                I.assertEqual(hint, 'Bunga Kompetitif');
            break;
            case 'two':
                let actualValue = await I.grabAttributeFrom(this.textField.textBenefit2, 'text');
                I.assertEqual(actualValue, 'Proses Cepat dan Mudah');
            break;
            case 'three':
                let actual = await I.grabAttributeFrom(this.textField.textBenefit3, 'text');
                I.assertEqual(actual, 'Perbankan Bisnis Premium');
            break;
        }

    },

        

    selectSchemaLoanTypeList(selectSchemaType){
        switch (selectSchemaType){
            case 'Distributor Financing':
                I.click(this.buttons.schemaAPButton);
            break;
            case 'Suppplier Financing':
                I.click(this.buttons.schemaARButton);
            break;
            case 'Distributor Financing':
                I.click(this.buttons.schemaPOButton);
                break;
        }
    },

    validateLoanSchemPage(loanSchema){
        switch (loanSchema){
            case 'AP':
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaAP);
                I.assertEqual(actualValue, 'Skema Distributor Financing');
            break;
            case 'AR':
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaAR);
                I.assertEqual(actualValue, 'Skema Supplier Financing');
            break;
            case 'PO':
                actualValue = I.grabTextFromField(this.textField.textLoanSchemaPO);
                I.assertEqual(actualValue, 'Skema Project Financing');
            break;
        }
    },
    validateContentField(contentFieldText){
        switch (contentFieldText){
            case 'AP':
                I.seeElement(this.contentFields.imageSchemaAP);
            break;
            case 'AR':
                I.seeElement(this.contentFields.imageSchemaAR);
            break;
            case 'PO':
                I.seeElement(this.contentFields.imageSchemaPO);
            break;
        }
    },

    clickBacktoAjukanPinjaman(){
        I.click(this.buttons.backButton);
    },

    clickBackSelectSchmea(){
        I.click(this.buttons.buttonClose);
    },

    clickBackButtonLoanTypePage(){
        I.click(this.buttons.backButtonLoanTypePage);
    },

    clickButtonAterSeeSchema(){
        I.click(this.buttons.backButton);
    },

    clickButtonPilihMetodeUploadDoc(){
        I.click(this.buttons.buttonPilihMetodeUploadDoc);
    },
}