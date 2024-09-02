const {
    I,
    resetStateDao,
    globalVariable,
    uploadBusinessDocPage,
    uploadDao,
    headerPage,
} = inject();

Given("I am a customer who has submitted business address", () => { });

Given("has submitted business address", () => { });

When("I choose method upload document", () => {
    uploadBusinessDocPage.clickChooseMethodUpload();
});

When("I will see bottom sheet option upload document", () => {
    I.waitForElement(uploadBusinessDocPage.buttons.close, 10);
    I.see("Metode Upload Dokumen");

    I.waitForElement(uploadBusinessDocPage.buttons.methodViaApp, 10);
    I.see("Langsung dari Aplikasi");
    I.see("Dokumen dapat Anda unggah sendiri menggunakan aplikasi Amar Bank Bisnis di Handphone Anda");

    I.waitForElement(uploadBusinessDocPage.buttons.methodViaOtherDevice, 10);
    I.see("Dari Perangkat Lain / Delegasi");
    I.see("Dokumen dapat diunggah oleh Anda sendiri atau oleh orang lain yang Anda delegasikan melalui berbagai perangkat menggunakan link yang akan diberikan.");
});

When("I choose direct upload via app", () => {
    uploadBusinessDocPage.chooseDirectUpload();
});

When("I choose upload via link", () => {
    uploadBusinessDocPage.chooseUploadFromOtherDevice();
});

When("I click link direct upload from other device", () => {
    uploadBusinessDocPage.clickLinkUploadViaOtherDevice();
});

When("I click link go to main dashboard", () => {
    uploadBusinessDocPage.clickLinkToMainDashboard();
});

When("I close bottom sheet option upload document", () => {
    uploadBusinessDocPage.closeBottomSheet();
});

When("I close page progress upload document", () => {
    headerPage.closePage();
});

When("I close page detail progress account opening", () => {
    headerPage.closePage();
});

When("I close page upload document via link", () => {
    headerPage.closePage();
});

When("I click call center in page detail progress account opening", () => {
    uploadBusinessDocPage.clickCallCenterProgressAccOpening();
});

When("I click button request account opening", () => {
    uploadBusinessDocPage.clickRequestAccOpening();
});

When("I click button save document", () => {
    I.waitForText("Simpan Dokumen");
    uploadBusinessDocPage.clickRequestAccOpening();
});

When("I see files that need to be uploaded for type company", () => {

    I.waitForText("Progres Upload Dokumen", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.see("Pengajuan Pembukaan Rekening");
    I.see("Format file: PDF / JPG / JPEG / PNG"+"\n"+
        "Maximal ukuran per file: 15MB");

    I.see("NIB");
    I.waitForElement(uploadBusinessDocPage.upload.nib, 10);

    I.see("Akta Perusahaan");
    I.waitForElement(uploadBusinessDocPage.upload.certificate, 10);

    I.see("SK Kemenkumham");
    I.waitForElement(uploadBusinessDocPage.upload.sk, 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("NPWP Perusahaan");
    I.waitForElement(uploadBusinessDocPage.upload.npwp, 10);

    I.see("Perbarui Progres");
    I.waitForElement(uploadBusinessDocPage.buttons.refresh, 10);

    I.see("Upload Dari Perangkat Lain / Delegasi");
    I.waitForElement(uploadBusinessDocPage.link.viaOtherDevice, 10);
});

When("I see files that need to be uploaded for type individual company", () => {

    I.waitForText("Progres Upload Dokumen", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.see("Pengajuan Pembukaan Rekening");
    I.see("Format file: PDF / JPG / JPEG / PNG Maximal ukuran per file: 15MB");

    I.see("NIB");
    I.waitForElement(uploadBusinessDocPage.upload.nib, 10);

    I.see("Akta Pendirian");
    I.dontSee("Akta Perusahaan");
    I.waitForElement(uploadBusinessDocPage.upload.certificate, 10);

    I.dontSee("SK Kemenkumham");
    I.dontSee(uploadBusinessDocPage.upload.sk);

    I.dontSee("NPWP Perusahaan");
    I.dontSee(uploadBusinessDocPage.upload.npwp);

    I.see("Perbarui Progres");
    I.waitForElement(uploadBusinessDocPage.buttons.refresh, 10);

    I.see("Upload Dari Perangkat Lain / Delegasi");
    I.waitForElement(uploadBusinessDocPage.link.viaOtherDevice, 10);
});

When("I upload document business {string} with type {string}", async (typeDoc, fileType) => {
    globalVariable.uploadDocuments.fileType = fileType;

    await
        uploadBusinessDocPage.uploadOneDocument(globalVariable.login.userID, globalVariable.login.password, typeDoc, fileType);
});

When("I upload all document business for type company", async () => {
    await
        uploadBusinessDocPage.uploadAllDocumentCompany(globalVariable.login.userID, globalVariable.login.password);
});

When("I upload all document business for type individual company", async () => {
    await
        uploadBusinessDocPage.uploadAllDocumentIndividualCompany(globalVariable.login.userID, globalVariable.login.password);
});

When("I delete document {string}", (typeDoc) => {
    switch (typeDoc) {
        case "NIB":
            uploadBusinessDocPage.deleteDocumentNIB();
            break;
        case "Akta Perusahaan":
            uploadBusinessDocPage.deleteDocumentAktaPerusahaan();
            break;
        case "SK Kemenkumham":
            uploadBusinessDocPage.deleteDocumentSK();
            break;
        case "NPWP Perusahaan":
            uploadBusinessDocPage.deleteDocumentNPWPPerusahaan();
            break;
        default:
            throw new Error("Document name is not recognize");
    }
});

When("I delete all document company", () => {
    uploadBusinessDocPage.deleteDocumentNIB();
    uploadBusinessDocPage.confirmDelete();

    uploadBusinessDocPage.deleteDocumentAktaPerusahaan();
    uploadBusinessDocPage.confirmDelete();

    uploadBusinessDocPage.deleteDocumentSK();
    uploadBusinessDocPage.confirmDelete();

    uploadBusinessDocPage.deleteDocumentNPWPPerusahaan();
    uploadBusinessDocPage.confirmDelete();

});

When("I click button progress upload document", () => {
    uploadBusinessDocPage.clickUpdateProgress();
});

When("I click progress account opening", () => {
    uploadBusinessDocPage.clickDirectToProgressAccOpening();
});

When("I click button direct to page progress upload document", () => {
    uploadBusinessDocPage.clickDirectToProgressUploadDoc();
});

When("I copy link upload document", () => {
    uploadBusinessDocPage.copyLink();
});

When("I re-upload my document", () => {
    uploadBusinessDocPage.reUploadDocument();
});

When("I cancel delete document", () => {
    uploadBusinessDocPage.cancelDelete();
});

When("I click confirm delete document", () => {

    uploadBusinessDocPage.confirmDelete();

});

Then("I will see bottom sheet with email contact", () => {
    I.waitForText("Hubungi Tim Kami", 10);
    I.see("Kami bantu meng-upload dokumen melalui:");
    I.see("support.bisnis@amarbank.co.id");
});

Then("I will direct to page to re-upload document company", () => {
    I.waitForText("Pengajuan Pembukaan Rekening", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);
    I.dontSee(uploadBusinessDocPage.upload.nib);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteAkta, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentAkta, 10);
    I.dontSee(uploadBusinessDocPage.upload.certificate);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.waitForElement(uploadBusinessDocPage.buttons.deleteSK, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentSK, 10);
    I.dontSee(uploadBusinessDocPage.upload.sk);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteNPWP, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNPWP, 10);
    I.dontSee(uploadBusinessDocPage.upload.npwp);

    I.see("Simpan Dokumen");
    I.waitForElement(uploadBusinessDocPage.buttons.sendRequestAccOpening);
    I.dontSee("Ajukan Pembukaan Rekening");

    I.see("Perbarui Progres");
    I.waitForElement(uploadBusinessDocPage.buttons.refresh, 10);

    I.see("Upload Dari Perangkat Lain / Delegasi");
    I.waitForElement(uploadBusinessDocPage.link.viaOtherDevice, 10);
});

Then("I will direct to page detail progress account opening", () => {
    I.waitForText("Pengajuanmu Sedang Diproses Tim Kami", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.see("Kami akan melakukan verifikasi data Anda dalam waktu kurang-lebih 2 hari kerja setelah dokumen lengkap & benar.");

    I.see("Pembukaan Rekening & Upload Dokumen");
    I.see("Proses selesai");
    I.dontSee("Upload Ulang Dokumen");
    I.dontSee(uploadBusinessDocPage.buttons.reUpload);

    I.see("Verifikasi Data");
    I.see("Proses saat ini");
    I.see("Tim Amar Bank sedang verifikasi dokumen yang sudah Anda upload & daftar Direktur");

    I.see("Untuk informasi lebih lanjut terkait proses pengajuan, silakan");
    I.waitForElement(uploadBusinessDocPage.link.callCenter, 10);
});

Then("I will direct to page thank you and need verification of my data", () => {
    I.waitForElement("Terimakasih telah melengkapi semua data", 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.dontSee(headerPage.buttons.closePage);
    I.dontSee(headerPage.buttons.back);
    I.see("Kami akan melakukan verifikasi data Anda dalam waktu kurang-lebih 2 hari kerja.");

    I.see("Progres Pembukaan Rekening");
    I.waitForElement(uploadBusinessDocPage.buttons.directToProgressAccOpening, 10);

    I.see("Menuju Dashboard");
    I.waitForElement(uploadBusinessDocPage.link.directToDashboard, 10);
});

Then("I will see pop up confirmation delete document", () => {
    I.waitForText("Hapus Dokumen", 10);
    I.waitForText("Apakah Anda yakin akan menghapus dokumen ini?", 10);

    I.see("Kembali");
    I.waitForElement(uploadBusinessDocPage.buttons.cancelDelete, 10);

    I.see("Hapus");
    I.waitForElement(uploadBusinessDocPage.buttons.confirmDelete, 10);
});

Then("I will see snackbar success link is copied", () => {
    I.waitForText("Berhasil disalin", 10);
});

Then("will dissapear after 3-5 seconds", () => {
    I.wait(5);
    I.dontSee("Berhasil disalin");
});

Then("I will direct to page upload document via link", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.dontSee("Pengajuan Pembukaan Rekening");

    I.see("Link Berhasil Dibuat");
    I.see("Link berlaku selama 1x24 jam.");
    I.see("Berikut adalah link yang dapat Anda bagikan untuk upload dokumen via handphone, laptop, PC atau perangkat lainnya.");

    I.waitForElement(uploadBusinessDocPage.buttons.copy, 10);

    I.see("Lihat Progres Upload Dokumen");
    I.waitForElement(uploadBusinessDocPage.buttons.directToUploadProgress, 10);
});

Then("I will see message error {string} in the below of section upload document", async (expMessageError) => {
    const actualMessageError = await uploadBusinessDocPage.getMessageError();
    I.assertEqual(actualMessageError, expMessageError);
});

Then("I will not see button continue", () => {
    I.dontSee(uploadBusinessDocPage.buttons.continueToDashboard);
});

Then("I will not see additional information in the top of section", () => {
    I.dontSee("Dokumen terkirim. Periksa kembali jika sudah benar cek status terbaru di dashboard");
});

Then("I will see document {string} still exists", (typeDoc) => {
    I.waitForText(typeDoc + ".pdf", 10);
});

Then("I will not see button request account opening", () => {
    I.dontSee(uploadBusinessDocPage.buttons.sendRequestAccOpening);
    I.dontSee("Ajukan Pembukaan Rekening");
});

Then("I will not see button save document", () => {
    I.wait(5);
    I.dontSee(uploadBusinessDocPage.buttons.sendRequestAccOpening);
    I.dontSee("Simpan Dokumen");
});

Then("I will see button save document", () => {
    I.waitForElement(uploadBusinessDocPage.buttons.sendRequestAccOpening, 10);
    I.see("Simpan Dokumen");
});

Then("I will see button request account opening is shown", () => {
    I.waitForElement(uploadBusinessDocPage.buttons.sendRequestAccOpening, 10);
    I.see("Ajukan Pembukaan Rekening");
});

Then("I will see document {string} is uploaded", (typeDoc) => {

    switch (typeDoc) {
        case "NIB":
            I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);
            break;
        case "Akta Perusahaan":
            I.waitForElement(uploadBusinessDocPage.buttons.deleteAkta, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentAkta, 10);
            break;
        case "SK Kemenkumham":
            I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
            I.waitForElement(uploadBusinessDocPage.buttons.deleteSK, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentSK, 10);
            break;
        case "NPWP Perusahaan":
            I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
            I.waitForElement(uploadBusinessDocPage.buttons.deleteNPWP, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNPWP, 10);
            break;
        default:
            throw new Error("Document name is not recognize");
    }

});

Then("I will see all document company has been uploaded", () => {

    I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteAkta, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentAkta, 10);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.waitForElement(uploadBusinessDocPage.buttons.deleteSK, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentSK, 10);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteNPWP, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNPWP, 10);

});

Then("I will see all document business individual company has been uploaded", () => {

    I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);

    I.waitForElement(uploadBusinessDocPage.buttons.deleteAkta, 10);
    I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentAkta, 10);

});

Then("I will not see all document company", () => {

    I.wait(1);
    I.swipeDown(uploadBusinessDocPage.upload.certificate, 500, 1000);
    I.waitForElement(uploadBusinessDocPage.upload.nib, 10);
    I.dontSee(uploadBusinessDocPage.buttons.deleteNIB);
    I.dontSee(uploadBusinessDocPage.texts.sizeDocumentNIB);
    I.assertEqual(globalVariable.uploadDocuments.nib, false);

    I.waitForElement(uploadBusinessDocPage.upload.certificate, 10);
    I.dontSee(uploadBusinessDocPage.buttons.deleteAkta);
    I.dontSee(uploadBusinessDocPage.texts.sizeDocumentAkta);
    I.assertEqual(globalVariable.uploadDocuments.akta, false);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
    I.waitForElement(uploadBusinessDocPage.upload.sk, 10);
    I.dontSee(uploadBusinessDocPage.buttons.deleteSK);
    I.dontSee(uploadBusinessDocPage.texts.sizeDocumentSK);
    I.assertEqual(globalVariable.uploadDocuments.sk, false);

    I.waitForElement(uploadBusinessDocPage.upload.npwp, 10);
    I.dontSee(uploadBusinessDocPage.buttons.deleteNPWP);
    I.dontSee(uploadBusinessDocPage.texts.sizeDocumentNPWP);
    I.assertEqual(globalVariable.uploadDocuments.npwp, false);

});

Then("I will see {string} is empty", (typeDoc) => {

    I.wait(1);

    switch (typeDoc) {
        case "NIB":
            I.dontSee(uploadBusinessDocPage.buttons.deleteNIB);
            I.dontSee(uploadBusinessDocPage.texts.sizeDocumentNIB);
            I.dontSee(uploadBusinessDocPage.icons.uploadedNib);
            break;
        case "Akta Perusahaan":
            I.dontSee(uploadBusinessDocPage.buttons.deleteAkta);
            I.dontSee(uploadBusinessDocPage.texts.sizeDocumentAkta);
            I.dontSee(uploadBusinessDocPage.icons.uploadedAkta);
            break;
        case "SK Kemenkumham":
            I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
            I.wait(1);
            I.dontSee(uploadBusinessDocPage.buttons.deleteSK);
            I.dontSee(uploadBusinessDocPage.texts.sizeDocumentSK);
            I.dontSee(uploadBusinessDocPage.icons.uploadedSK);
            break;
        case "NPWP Perusahaan":
            I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
            I.wait(1);
            I.dontSee(uploadBusinessDocPage.buttons.deleteNPWP);
            I.dontSee(uploadBusinessDocPage.texts.sizeDocumentNPWP);
            I.dontSee(uploadBusinessDocPage.icons.uploadedNpwp);
            break;
        default:
            throw new Error("Document name is not recognize");
    }

});

Then("I will see {string} still exists", (typeDoc) => {

    switch (typeDoc) {
        case "NIB":
            I.waitForElement(uploadBusinessDocPage.buttons.deleteNIB, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNIB, 10);
            I.dontSee(uploadBusinessDocPage.upload.nib);
        case "Akta Perusahaan":
            I.waitForElement(uploadBusinessDocPage.buttons.deleteAkta, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentAkta, 10);
            I.dontSee(uploadBusinessDocPage.upload.certificate);
        case "SK Kemenkumham":
            I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
            I.waitForElement(uploadBusinessDocPage.buttons.deleteSK, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentSK, 10);
            I.dontSee(uploadBusinessDocPage.upload.sk);
        case "NPWP Perusahaan":
            I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
            I.waitForElement(uploadBusinessDocPage.buttons.deleteNPWP, 10);
            I.waitForElement(uploadBusinessDocPage.texts.sizeDocumentNPWP, 10);
            I.dontSee(uploadBusinessDocPage.upload.npwp);
        default:
            throw new Error("Document name is not recognize");
    }

});

Then("I reset state upload document", async () => {    
    await
        resetStateDao.deleteAllDocuments(globalVariable.login.userID, globalVariable.login.password);

    await
        resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);    
});