const {I, loanTypePage} = inject();
Before(() => {
    state = {};
  });

// Feature(/Apply Either Loan and select the loan type/)

// Scenario(/validate content on select either apply for loan/)
    Given(/user on onboarding loan/,()=>{
        loanTypePage.viewPageOnBoarding();
    });
    Given(/user should see field title onboarding/,()=>{
        I.wait(2);
        loanTypePage.validationTextTittleOnboarding();
    });
    When(/user validate benefit \"([^\"]*)\"/,(benefitText)=>{
        I.wait(2);
        loanTypePage.validationBenefitText(benefitText);
    });
    When(/user validate content loan requirement/,()=>{
        I.wait(2);
        loanTypePage.validateContentLoanRequirement();
    });
    Then(/user click button ajukan pinjaman/,()=>{
        loanTypePage.clickButtonStart();
    });

// Scenario(/user validate and select loan type AP)
    Given(/user on loan type page/,()=>{
        I.wait(2);
        loanTypePage.viewLoanTypePage();
            
    });

    Then(/user click button ajukan pinjaman/,()=>{
        loanTypePage.clickButtonStart();
    });

    Given(/user validate wording loan type \"([^\"]*)\"/,(loanType)=>{
        I.wait(2);
        loanTypePage.validateLoanTypeList(loanType);
    });

    When(/user select loan type \"([^\"]*)\"/,(selectLoanType)=>{
        I.wait(2);
        loanTypePage.selectLoanTypeList(selectLoanType);

    });
    Then(/user click button lihat skema pinjaman/,()=>{
        loanTypePage.clickNextButton();
    });
    
    Then(/user on loan schema \"([^\"]*)\"/,()=>{
        I.wait(2);
        loanTypePage.validateLoanSchemPage();
    });
    Then(/user validate content loan schema \"([^\"]*)\"/,()=>{
        I.wait(2);
        loanTypePage.validateContentField();
    });
    Then(/user click back to loan type page/,()=>{
        loanTypePage.clickBackButtonLoanTypePage();
        I.wait(2);
    });

    Then(/user click button select the schema/,()=>{
        loanTypePage.clickBackButtonLoanTypePage
    });

// Apply Loan Journey Improvement
    Then(/User click button Pelajari Tipe Skema Kredit/,()=>{
        loanTypePage.clickButtonLearnSchema();
    });   

    Then(/user will see bottom sheet of Pelajari Tipe Skema Kredit/, () =>{
        I.waitForText("Pelajari Tipe Skema Kredit", 10);
        I.waitforText("Distributor Financing", 10);
        I.waitforText("Supplier Financing", 10);
        I.waitForText("Prject Financing", 10);        
   });

    Then(/user validate content of schema type loan  \"([^\"]*)\"/,(wordingLoanType)=>{
        I.wait(2);
        loanTypePage.validateTypeLoanWording();
   }); 
   
    Then(/User select loan type \"([^\"]*)\"/,(selectLoanType)=>{
        I.wait(5);
        loanTypePage.selectLoanTypeList(selectLoanType);

    });

    Given(/user on select loan Needs Page /,()=>{
        I.wait(2);
        loanTypePage.viewLoanTypePage();
    });
   
    Then(/User click button \"([^\"]*)\"/,(selectSchemaType)=>{
        I.wait(2);
        loanTypePage.selectSchemaLoanTypeList(selectSchemaType);
    });

    Then(/System will display Schema of Distributor Financing/, () =>{
        I.waitForText("Skema Distributor Financing");
    });

    Then(/User on Loan Needs Page/, () =>{
        I.wait(5);
        loanTypePage.validateTitleTopBarLoanNeeds();
        I.wait(5);
        loanTypePage.validateLoanAmountRequested();
        I.wait(2);
        loanTypePage.validateLoanTenor();
    });

    Then(/user click dropdown option/, ()=>{
        I.waitforText("Pilih Nominal Limit Kredit", 10);
        I.waitForElement(this.buttons.chooseOptionMSME,10); 
        I.waitForElement(this.buttons.chooseOptionCorp,10);
    });

    //Upload Document
    Then(/user click button close on Metode Upload Dokumen/,()=>{
        loanTypePage.buttonCloseDoc();
    });
    Then(/user click button Langsung dari Aplikasi on Metode Upload Dokumen/,()=>{
        loanTypePage.buttonUploadMobileDoc();
    });
    Then(/user click button Dari Perangkat Lain Delegasi on Metode Upload Dokumen/,()=>{
        loanTypePage.buttonUploadWebDoc();
    });

    //Validate AP MSME Dokumen List 
    Then(/user go to page list of document for AP MSME with business legality type PT Perusahaan & CV/, async () =>{
        const actualTitle = await loanTypePage.validateTitleTopBarDocList();
        I.assertEqual(actualTitle, "Pengajuan Limit Kredit Bisnis");

        I.see("Mohon persiapkan dokumen-dokumen berikut:")
        I.see("1. KTP & NPWP Komisioner & Pemegang Saham.");
        I.see("2. Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.see("3. Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau buyer.");
        I.see("4. Laporan Keuangan dalam 1 tahun terakhir (jika ada).");

        I.waitForElement(this.buttons.buttonPilihMetodeUploadDoc,10);
    }); 

    Then(/And user validate content list of documents for AP MSME with business legality type type Individu/, async () =>{
        const actualTitle = await loanTypePage.validateTitleTopBarDocList();
        I.assertEqual(actualTitle, "Pengajuan Limit Kredit Bisnis");

        I.see("Mohon persiapkan dokumen-dokumen berikut:")
       
        I.see("1. Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.see("2. Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau buyer.");
        I.see("3. Laporan Keuangan dalam 1 tahun terakhir (jika ada).");

        I.waitForElement(this.buttons.buttonPilihMetodeUploadDoc,10);
    });
    
    
    Then(/user go to page list of document for AP MSME with business legality type PT Perorangan & UD/, async () =>{
        const actualTitle = await loanTypePage.validateTitleTopBarDocList();
        I.assertEqual(actualTitle, "Pengajuan Limit Kredit Bisnis");

        I.see("Mohon persiapkan dokumen-dokumen berikut:")
       
        I.see("1. KTP & NPWP Komisioner & Pemegang Saham.");
        I.see("2. Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.");
        I.see("3. Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau buyer.");
        I.see("4. Laporan Keuangan dalam 1 tahun terakhir (jika ada).");

        I.waitForElement(this.buttons.buttonPilihMetodeUploadDoc,10);


    });

    //Validate AR dokumen list for AR 

    Then(/And user go to page list of document for AR UD MSME/, async () =>{
        const actualTitle = await loanTypePage.validateTitleTopBarDocList();
        I.assertEqual(actualTitle, "Pengajuan Limit Kredit Bisnis");

        I.see("Mohon persiapkan dokumen-dokumen berikut:")
       
        I.see("Mohon persiapkan dokumen-dokumen berikut:")
        I.see("1. KTP & NPWP Komisioner & Pemegang Saham");
        I.see("2. Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.see("3. Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau buyer.");
        I.see("4. Laporan Keuangan dalam 1 tahun terakhir (jika ada)");
    });

    Then(/And user go to page list of document for AR Individu MSME/, async () =>{
        const actualTitle = await loanTypePage.validateTitleTopBarDocList();
        I.assertEqual(actualTitle, "Pengajuan Limit Kredit Bisnis");

        I.see("Mohon persiapkan dokumen-dokumen berikut:")
       
        I.see("1. Minimal 3 contoh invoice dengan buyer saat ini atau buyer lainnya dengan produk yang sama.");
        I.see("2. Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan supplier atau buyer.");
        I.see("3. Laporan Keuangan dalam 1 tahun terakhir (jika ada).");

        I.waitForElement(this.buttons.buttonPilihMetodeUploadDoc,10);
    });

    //validate PO dokumen list for PO

    Then(/And user validate content list of documents for PO PT.Perusahaan/, async () =>{
        const actualTitle = await loanTypePage.validateTitleTopBarDocList();
        I.assertEqual(actualTitle, "Pengajuan Limit Kredit Bisnis");

        I.see("Mohon persiapkan dokumen-dokumen berikut:")
       
        I.see("Mohon persiapkan dokumen-dokumen berikut:")
        I.see("1. KTP & NPWP Komisioner & Pemegang Saham");
        I.see("2. Surat Perintah Kerja (SPK) dari bouwheer saat ini atau bouwheer lainnya dengan produk yang sama.");
        I.see("3. Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan bouwheer.");
        I.see("4. Laporan Keuangan dalam 1 tahun terakhir (jika ada).");

        I.waitForElement(this.buttons.buttonPilihMetodeUploadDoc,10);
    });

    Then(/And user go to page list of document for AR Individu MSME/, async () =>{
        const actualTitle = await loanTypePage.validateTitleTopBarDocList();
        I.assertEqual(actualTitle, "Pengajuan Limit Kredit Bisnis");

        I.see("Mohon persiapkan dokumen-dokumen berikut:")
       
        I.see("1. Surat Perintah Kerja (SPK) dari bouwheer saat ini atau bouwheer lainnya dengan produk yang sama.");
        I.see("2. Mutasi rekening koran 6 bulan terakhir yang mencerminkan transaksi dengan bouwheer.");
        I.see("3. Laporan Keuangan dalam 1 tahun terakhir (jika ada).");

        I.waitForElement(this.buttons.buttonPilihMetodeUploadDoc,10);
    });

    When(/user will see title coacmark {string}/, async (coachmarktitle) => {
        I.waitForText(coachmarktitle, 10);    
    });
    
    When(/user will see text loan AP {string}/, async (loanAP) => {
        I.waitForText(loanAP, 10);
    });
    
    When(/user will see text loan AR {string}/, async (loanAR) => {
        I.waitForText(loanAR, 10);
    });
    
    When(/user will see text loan PO {string}/, async (loanPO) => {
        I.waitForText(loanPO, 10);
    });
    
    When(/user will see title coacmark again {string}/, async (secondcoachmark) => {
        I.waitForText(secondcoachmark, 10);
    });
    When (/user will see text after reopen {string}/, async(reopentitle) => {
        I.waitForText(reopentitle, 10);
    });


