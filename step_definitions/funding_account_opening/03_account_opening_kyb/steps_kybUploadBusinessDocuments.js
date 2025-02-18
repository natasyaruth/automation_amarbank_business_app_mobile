const {
    I,
    globalVariable,
    uploadBusinessDocPage,
    getDataDao,
    headerPage,
} = inject();

When("I choose method upload document", () => {
    uploadBusinessDocPage.clickChooseMethodUpload();
});

When("I choose direct upload via app", () => {
    uploadBusinessDocPage.chooseDirectUpload();
});

When("I click link go to main dashboard", () => {
    uploadBusinessDocPage.clickLinkToMainDashboard();
});

When("I click button request account opening", () => {
    uploadBusinessDocPage.clickRequestAccOpening();
});

When("I see files that need to be uploaded for type company", () => {

    I.waitForText("Progres Upload Dokumen", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.see("Pengajuan Pembukaan Rekening");
    I.see("Format file: PDF / JPG / JPEG / PNG" + "\n" +
        "Maximal ukuran per file: 15MB");

    I.see("NIB");
    I.see("Akta Pendirian");
    I.see("SK Kemenkumham Pendirian");

    I.performSwipe({ x: 1000, y: 1000 }, { x: 500, y: 500 });

    I.see("NPWP Bisnis");

    I.performSwipe({ x: 1000, y: 1000 }, { x: 500, y: 500 });

    I.see("Akta Perubahan Terakhir");
    I.see("SK Kemenkumham Perubahan Terakhir");
    
    I.see("Perbarui Progres");
    I.waitForElement(uploadBusinessDocPage.buttons.refresh, 10);

    I.see("Upload Dari Perangkat Lain / Delegasi");
    I.waitForElement(uploadBusinessDocPage.link.viaOtherDevice, 10);
});

When("I see files that need to be uploaded for type individual company", async () => {

    I.waitForText("Progres Upload Dokumen", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.see("Pengajuan Pembukaan Rekening");
    I.see("Format file: PDF / JPG / JPEG / PNG" + "\n" +
        "Maximal ukuran per file: 15MB");

    const legalityType = (await getDataDao.getLegalityType(globalVariable.login.userID, globalVariable.login.password)).legalityType;

    if (

        legalityType === "UD"

    ) {

        I.see("NIB");
        I.see("NPWP Bisnis");
        I.dontSee("Sertifikat Pendaftaran");
        I.dontSee("Surat Pernyataan Pendirian");
        I.dontSee("Sertifikat Perubahan Terakhir");
        I.dontSee("Surat Pernyataan Perubahan Terakhir");

    } else if (

        legalityType === "PT Perorangan"

    ) {

        I.see("NIB");
        I.see("NPWP Bisnis");
        I.see("Sertifikat Pendaftaran");
        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

        I.see("Surat Pernyataan Pendirian");
        I.see("Sertifikat Perubahan Terakhir");
        I.see("Surat Pernyataan Perubahan Terakhir");
        
    } else {

        throw new Error("Please check legality type of user. Only works if user id is from UD or PT Perorangan");
    }

    I.see("Perbarui Progres");
    I.waitForElement(uploadBusinessDocPage.buttons.refresh, 10);

    I.see("Upload Dari Perangkat Lain / Delegasi");
    I.waitForElement(uploadBusinessDocPage.link.viaOtherDevice, 10);
});

When("I upload all document business for type company", async () => {
    await
        uploadBusinessDocPage.uploadAllDocumentCompany(globalVariable.login.userID, globalVariable.login.password);
});

When("I upload all document business for type individual company", async () => {

    const legalityType = (await getDataDao.getLegalityType(globalVariable.login.userID, globalVariable.login.password)).legalityType;

    await
        uploadBusinessDocPage.uploadAllDocumentIndividualCompany(globalVariable.login.userID, globalVariable.login.password, legalityType);
});

When("I click button progress upload document", () => {
    uploadBusinessDocPage.clickUpdateProgress();
});

Then("I will see all document company has been uploaded", () => {

    I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteAktaBusiness, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentAktaBusiness, 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 500, y: 500 });

    I.waitForElement(uploadBusinessDocPage.buttons.deleteSKBusiness, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentSKBusiness, 10);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteNPWPBusiness, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNPWPBusiness, 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 500, y: 500 });

    I.waitForElement(uploadBusinessDocPage.buttons.deleteLastCertificateBusiness, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentLastCertificateBusiness, 10);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteLastSkBusiness, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentLastSkBusiness, 10);

});

Then("I will see all document business individual company has been uploaded", async () => {

    const legalityType = (await getDataDao.getLegalityType(globalVariable.login.userID, globalVariable.login.password)).legalityType;

    if (

        legalityType === "UD"

    ) {

        I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);

        I.waitForElement(uploadBusinessDocPage.buttons.deleteNPWPBusiness, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNPWPBusiness, 10);

    } else if (

        legalityType === "PT Perorangan"

    ) {

        I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);

        I.waitForElement(uploadBusinessDocPage.buttons.deleteNPWPBusiness, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNPWPBusiness, 10);

        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

        I.waitForElement(uploadBusinessDocPage.buttons.deleteAkta, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentAkta, 10);

        I.waitForElement(uploadBusinessDocPage.buttons.deleteSK, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentSK, 10);

        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

        I.waitForElement(uploadBusinessDocPage.buttons.deleteLastCertificate, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentLastCertificate, 10);

        I.waitForElement(uploadBusinessDocPage.buttons.deleteLastSk, 10);
        I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentLastSk, 10);

    } else {

        throw new Error("Please check legality type of user. Only works if user id is from UD or PT Perorangan");
    }

});