const { I,
    documentPage,
    profilePage,
    otherPage,
    globalVariable,
    getDataDao,
    resetStateDao,
    uploadDao,
    documentSafePage,
    headerPage,
    onboardingAccOpeningPage,
} = inject();

Given("has more than one other document", async () => {
    const fileType = 'pdf';

    await
        uploadDao.uploadOtherDoc(fileType);

    await
        uploadDao.uploadOtherDoc(fileType);
});

Given("don't have any other document", async () => {

    await
        resetStateDao.deleteAllOtherDoc();

});

Given("never entered wrong password", async () => {
    await
        resetStateDao.resetAttemptFailedLogin();
});

When("I click document giro", () => {
    documentPage.clickDocumentGiro();
});

When("I click menu other document", () => {
    documentPage.clickMenuOtherDocument();
});

When("I click button upload other document", () => {
    documentPage.clickUploadOtherDocument();
});

When("I click save document", () => {
    documentPage.saveDocument();
});

When("I close bottom sheet upload", () => {
    documentPage.closeBottomSheet();
});

When("I click confirm cancel upload other document", () => {
    documentPage.cancelUpload();
});

When("I click back to upload other document", () => {
    documentPage.backToUpload();
});

When("I click delete other document in section upload", () => {
    documentPage.clickDeleteDoc();
});

When("I upload other document with type {string}", async (typeDoc) => {

    let fileName;

    switch (typeDoc) {
        case "pdf":
            fileName = "CV MAJU BERSAMA";
            break;
        case "jpg":
            fileName = "PT ABC XYZ";
            break;
        case "jpeg":
            fileName = "USAHA BISNIS KU";
            break;
        case "png":
            fileName = "UD ABANG MEDAN";
            break;
        default:
            throw new Error("File type is not recognize");
    }

    documentPage.clickUploadDoc();

    I.waitForElement(documentPage.googleElement.search, 30);
    const newFileName = await documentPage.searchGoogleDrive(fileName);

    globalVariable.uploadDocuments.fileName.unshift(newFileName);
    documentPage.clickFirstOptionSearch();
});

When("I delete other document number {string}", async (numberDoc) => {

    const rowDoc = parseInt(numberDoc);

    documentPage.deleteOtherDoc(numberDoc - 1);

});

When("I confirm delete other document", () => {
    documentPage.confirmDeleteDoc();
});

When("I cancel delete other document", () => {
    documentPage.cancelDeleteDoc();
});

When("I click tab brankas", () => {
    documentPage.clickTabDocument();
});

When("I click tab Home", () => {
    I.wait(3);
    onboardingAccOpeningPage.goToTabHome();
});

When("I click button document loan", () => {
    documentPage.clickDocumentLoan();
});

When("I click top list of my loan", () => {
    documentPage.clickItemLoan();
});

When("I click direct to input password document", () => {
    documentPage.clickLinkUsePassword();
});

When("I input password document", () => {
    documentPage.inputPassword(globalVariable.login.password);
});

When("I input wrong password document", () => {
    documentPage.inputPassword("qwer490754395");
});

When("I clear my password", () => {
    documentPage.clearPassword();
});

When("I click see my document", () => {
    documentPage.clickSeeDocument();
});

When("I will see pop up biometric is inactive", () => {
    I.waitForElement(documentPage.buttons.closePopUp, 10);
    I.see("Untuk membuka brankas dokumen, Anda bisa mengaktifkan fitur Biometrik melalui Menu Lainnya");

    I.see("Aktifkan Sekarang");
    I.waitForElement(documentPage.buttons.activatedNow, 10);

    I.see("Atau Gunakan Password");
    I.waitForElement(documentPage.links.usePassword, 10);
});

When("I close activated my biometric via document", () => {
    documentPage.closePopUpBiometricInactive();
});

When("I click activated my biometric via document", () => {
    documentPage.clickActivatedBiometric();
});

When("I close bottom sheet password", () => {
    documentPage.closeBottomSheetPassword();
});

When("I unmask my password document", () => {
    documentPage.clickIconEyePassword();
});

When("I mask my password document", () => {
    documentPage.clickIconEyePassword();
});

When("I choose done enough", () => {
    documentSafePage.clickRadioButtonDoneEnough();
});

When("I choose not enough", () => {
    documentSafePage.clickRadionButtonNotEnough();
});

When("I checklist reason {string}", (type) => {
    documentSafePage.chooseFeedback(type);
});

When("I uncheck reason {string}", (type) => {
    documentSafePage.chooseFeedback(type);
});

When("I fill feedback with {string}", (feedback) => {
    documentSafePage.fillFeedback(feedback);
    globalVariable.survey.feedBack = feedback;

    const lengthFeedback = (globalVariable.survey.feedBack).length;
    I.waitForText(lengthFeedback + "/60", 10);
    globalVariable.survey.lengthFeedback = lengthFeedback + "/60";
});

When("I clear field feedback", () => {
    documentSafePage.clearFeedback();
});

When("I sent the feedback", () => {
    documentSafePage.sentFeedback();
});

When("I delete all other document", async () => {

    const numberDoc = await I.grabNumberOfVisibleElements('//android.widget.TextView[@content-desc[starts-with(., ' + documentPage.texts.fileName.slice(1) + ')]]');

    console.log(numberDoc);

    for (let i = 0; i < numberDoc; i++) {
        documentPage.deleteOtherDoc(0);
        documentPage.confirmDeleteDoc();
        I.waitForText("Dokumen Lainnya", 10);
        I.wait(2);
    };
});

Then("I will see pop up delete other document", () => {
    I.waitForText("Hapus Dokumen", 10);
    I.waitForText("Apakah Anda yakin akan menghapus dokumen ini?", 10);

    I.see("Kembali");
    I.waitForElement(documentPage.buttons.cancelDelete, 10);

    I.see("Hapus");
    I.waitForElement(documentPage.buttons.confirmDelete, 10);
});

Then("I will direct to page document brankas", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.dontSee("Dokumen Bisnis");
});

Then("I will see message error password incorrect", async () => {
    const actualMsgError = await documentPage.getMessageErrorPassword();

    I.assertEqual(actualMsgError, "Password yang dimasukkan salah");
});

Then("I will see bottom sheet input password document", () => {
    I.waitForText("Untuk membuka brankas dokumen masukkan password Anda", 10);
    I.waitForElement(documentPage.fields.password, 10);
    I.waitForElement(documentPage.buttons.closePopUp, 10);

    I.see("Password");
    I.see("Masukkan password");
    I.waitForElement(documentPage.buttons.eyePassword, 10);

    I.see("Lihat Dokumen");
    I.waitForElement(documentPage.buttons.seeDocument, 10);
});

Then("I will see button see document is enabled", async () => {
    const isEnabled = await I.grabAttributeFrom(documentPage.buttons.seeDocument, 'disabled');

    I.assertEqual(isEnabled, 'false');
});

Then("I will see button see document is disabled", async () => {

    const isEnabled = await I.grabAttributeFrom(documentPage.buttons.seeDocument, 'disabled');

    I.assertEqual(isEnabled, 'true');

});

Then("I will not see menu document giro", () => {
    I.wait(1);
    I.dontSee("Dokumen Giro");
    I.dontSeeElement(documentPage.buttons.documentGiro);
});

Then("I will not see menu document loan and giro", () => {
    I.wait(1);
    I.dontSee("Dokumen Giro");
    I.dontSeeElement(documentPage.buttons.documentGiro);

    I.dontSee("Dokumen Pinjaman");
    I.dontSeeElement(documentPage.buttons.documentLoan);
});

Then("I will see menu other document", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);

    I.see("Dokumen Lainnya");
    I.waitForElement(documentPage.buttons.documentOther, 10);
});

Then("I will see menu other document and loan", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);

    I.see("Dokumen Pinjaman");
    I.waitForElement(documentPage.buttons.documentLoan, 10);

    I.see("Dokumen Lainnya");
    I.waitForElement(documentPage.buttons.documentOther, 10);
});

Then("I will see list of my loan", () => {
    I.waitForText("Pilih Nomor Pinjaman", 10)
    I.waitForElement(documentPage.buttons.itemLoan, 10);
});

Then("I will see page document loan is empty", () => {
    I.waitForText("Pilih Nomor Pinjaman", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
});

Then("I will see list of document loan", () => {
    I.waitForText("Dokumen Pinjaman", 10)
    I.waitForElement(documentPage.buttons.itemDocumentLoan, 10);
});

Then("I will see document page is empty", () => {
    I.waitForText("Dokumen", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Belum ada dokumen yang tersedia untuk ditampilkan.");
    I.dontSeeElement(documentPage.buttons.documentGiro);
    I.dontSeeElement(documentPage.buttons.documentLoan);
});

Then("I will see document loan is empty", () => {
    I.waitForText("Pilih Nomor Pinjaman", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
});

Then("I will see document business for type company", () => {

    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");

    I.waitForElement(documentPage.buttons.downloadDeed, 10);
    I.see("Akta Pendirian");

    I.waitForElement(documentPage.buttons.downloadSk, 10);
    I.see("SK Kemenkumham Pendirian");

    I.waitForElement(documentPage.buttons.downloadNpwp, 10);
    I.see("NPWP Bisnis");

    I.waitForElement(documentPage.buttons.downloadLastCertificate, 10);
    I.see("Akta Perubahan Terakhir");

    I.waitForElement(documentPage.buttons.downloadLastSk, 10);
    I.see("SK Kemenkumham Perubahan Terakhir");

    I.see("Dokumen Giro");
});

Then("I will see document business required for type company", () => {

    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");

    I.waitForElement(documentPage.buttons.downloadDeed, 10);
    I.see("Akta Pendirian");

    I.waitForElement(documentPage.buttons.downloadSk, 10);
    I.see("SK Kemenkumham Pendirian");

    I.waitForElement(documentPage.buttons.downloadNpwp, 10);
    I.see("NPWP Bisnis");

    I.dontSeeElement(documentPage.buttons.downloadLastCertificate);
    I.dontSee("Akta Perubahan Terakhir");

    I.dontSeeElement(documentPage.buttons.downloadLastSk);
    I.dontSee("SK Kemenkumham Perubahan Terakhir");

    I.see("Dokumen Giro");
});

Then("I will see document business for type individual company", async () => {

    const legalityType = (await getDataDao.getLegalityType()).legalityType;

    if (
        legalityType === "UD"
    ) {

        I.waitForElement(documentPage.buttons.downloadNib, 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadNpwp, 10);
        I.see("NPWP Bisnis");

        I.dontSeeElement(documentPage.buttons.downloadDeed);
        I.dontSee("Sertifikat Pendaftaran");

        I.dontSeeElement(documentPage.buttons.downloadLetter);
        I.dontSee("Surat Pernyataan Pendirian");

        I.dontSeeElement(documentPage.buttons.downloadLastCertificate);
        I.dontSee("Sertifikat Perubahan Terakhir");

        I.dontSeeElement(documentPage.buttons.downloadLastLetter);
        I.dontSee("Surat Pernyataan Perubahan Terakhir");

    } else if (
        legalityType === "PT Perorangan"
    ) {

        I.waitForElement(documentPage.buttons.downloadNib, 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadNpwp, 10);
        I.see("NPWP Bisnis");

        I.waitForElement(documentPage.buttons.downloadSk, 10);
        I.see("Sertifikat Pendaftaran");

        I.waitForElement(documentPage.buttons.downloadLetter, 10);
        I.see("Surat Pernyataan Pendirian");

        I.waitForElement(documentPage.buttons.downloadLastSk, 10);
        I.see("Sertifikat Perubahan Terakhir");

        I.waitForElement(documentPage.buttons.downloadLastLetter, 10);
        I.see("Surat Pernyataan Perubahan Terakhir");

    } else {

        throw new Error("Please check legality type of user. Only works if user id is from UD or PT Perorangan");
    }

    I.see("Dokumen Giro");
});

Then("I will see document business required for type individual company", async () => {

    const legalityType = (await getDataDao.getLegalityType()).legalityType;

    if (
        legalityType === "UD"
    ) {

        I.waitForElement(documentPage.buttons.downloadNib, 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadNpwp, 10);
        I.see("NPWP Bisnis");

        I.dontSeeElement(documentPage.buttons.downloadSk);
        I.dontSee("Sertifikat Pendaftaran");

        I.dontSeeElement(documentPage.buttons.downloadLetter);
        I.dontSee("Surat Pernyataan Pendirian");

        I.dontSeeElement(documentPage.buttons.downloadLastSk);
        I.dontSee("Sertifikat Perubahan Terakhir");

        I.dontSeeElement(documentPage.buttons.downloadLastLetter);
        I.dontSee("Surat Pernyataan Perubahan Terakhir");

    } else if (
        legalityType === "PT Perorangan"
    ) {

        I.waitForElement(documentPage.buttons.downloadNib, 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadNpwp, 10);
        I.see("NPWP Bisnis");

        I.waitForElement(documentPage.buttons.downloadSk);
        I.see("Sertifikat Pendaftaran");

        I.waitForElement(documentPage.buttons.downloadLetter);
        I.see("Surat Pernyataan Pendirian");

        I.dontSeeElement(documentPage.buttons.downloadLastSk);
        I.dontSee("Sertifikat Perubahan Terakhir");

        I.dontSeeElement(documentPage.buttons.downloadLastLetter);
        I.dontSee("Surat Pernyataan Perubahan Terakhir");

    } else {

        throw new Error("Please check legality type of user. Only works if user id is from UD or PT Perorangan");
    }

    I.see("Dokumen Giro");
});

Then("I will see toogle biometric is off", () => {
    I.waitForElement(otherPage.buttons.toogleBiometric, 10);
});

Then("I will direct to Tab Other", async () => {

    const hasPin = (await getDataDao.hasCreatePin()).hasPin;

    I.waitForText("Keamanan", 10);
    I.see("Ubah Password");
    I.waitForElement(otherPage.buttons.changePassword, 10);
    I.see("Lainnya");

    if (
        hasPin === true
    ) {
        I.see("Ubah PIN");
        I.waitForElement(otherPage.buttons.changePin, 10);

    } else {

        I.see("Buat PIN");
        I.waitForElement(otherPage.buttons.changePin, 10);
    }

    I.see("Hapus Akun");
    I.waitForElement(otherPage.buttons.deleteAccount, 10);

    I.see("Aktifkan Biometrik");
    I.waitForElement(otherPage.buttons.activatedBiometric, 10);
    I.waitForElement(otherPage.buttons.toogleBiometric, 10);

    I.see("Permintaan");
    I.see("Buku Cek / Bilyet Giro");

    I.see("Bantuan");
    I.see("Kami akan membantu Anda dalam pembentukan rekening ataupun pinjaman");
    I.waitForElement(otherPage.buttons.email, 10);
    I.see("support.bisnis@amarbank.co.id");

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForText("Keluar", 20);
    I.waitForElement(otherPage.buttons.btnLogout, 10);
});

Then("I will see pop up fill survey", async () => {
    I.waitForText("Beri masukan Anda agar kami dapat melayani Anda lebih baik.", 10);
    I.see("Dari 3 hal yang kami sediakan untuk brankas dokumen seperti Aman, Kapasitas Besar, dan Akses Kapan Saja, apakah bagi Anda sudah cukup? ");

    I.see("Sudah Cukup");
    I.waitForElement(documentSafePage.radioButtons.enough, 10);
    // add to check radio button still not selected

    I.see("Belum Cukup");
    I.waitForElement(documentSafePage.radioButtons.notEnough, 10);
    // add to check radio button still not selected

    I.see("Kirim Masukan");
    I.waitForElement(documentSafePage.buttons.sentFeedBack, 10);

    const isSentEnabled = await I.grabAttributeFrom(documentSafePage.statusElement.buttonSentFeedBack, 'enabled');
    I.assertEqual(isSentEnabled, "false");

});

Then("I will see section to choose reason", async () => {
    I.waitForText("Silakan pilih fitur yang mungkin Anda butuhkan untuk brankas dokumen:", 10);

    I.see("Upload dokumen");
    I.waitForElement(documentSafePage.checkBox.uploadDoc, 10);

    const isUploadDocChecked = await I.grabAttributeFrom(documentSafePage.checkBox.uploadDoc, 'checked');
    I.assertEqual(isUploadDocChecked, "false");

    I.see("Kategorisasi dokumen");
    I.waitForElement(documentSafePage.checkBox.categoryDoc, 10);

    const isCategoryChecked = await I.grabAttributeFrom(documentSafePage.checkBox.categoryDoc, 'checked');
    I.assertEqual(isCategoryChecked, "false");

    I.see("Cari dokumen dari nama/kategori");
    I.waitForElement(documentSafePage.checkBox.searchDoc, 10);

    const isSearchDocChecked = await I.grabAttributeFrom(documentSafePage.checkBox.searchDoc, 'checked');
    I.assertEqual(isSearchDocChecked, "false");

    I.see("Lainnya");
    I.waitForElement(documentSafePage.checkBox.other, 10);

    const isOtherChecked = await I.grabAttributeFrom(documentSafePage.checkBox.other, 'checked');
    I.assertEqual(isOtherChecked, "false");

    I.see("Kirim Masukan");
    I.waitForElement(documentSafePage.buttons.sentFeedBack, 10);

    const isSentEnabled = await I.grabAttributeFrom(documentSafePage.checkBox.other, 'enabled');
    I.assertEqual(isOtherChecked, "false");
});

Then("I will see field reason", () => {
    I.waitForText("Tulis fitur yang Anda butuhkan", 10);
    I.waitForElement(documentSafePage.fields.other, 10);

    I.see("0/60");

    I.see("Kirim Masukan");
    I.waitForElement(documentSafePage.buttons.sentFeedBack, 10);
    // add to check button sent is disabled
});

Then("I will see button sent feedback enabled", () => {
    // add to check button sent is enabled
});

Then("I see counting word back to default", () => {
    I.wait(1);
    I.dontSee(globalVariable.survey.lengthFeedback);

    I.waitForText("0/60", 10);
});

Then("I will see button sent feedback disabled", () => {
    // add to check button sent is disabled
});

Then("I will not see the feedback anymore", () => {
    I.dontSee(globalVariable.survey.feedBack);
});

Then("I will see snackbar success send feedback", () => {
    I.waitForText("Terima kasih. Masukan Anda sudah terkirim.", 10);
});

Then("I will see menu document giro, loan and other", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);

    I.see("Dokumen Giro");
    I.waitForElement(documentPage.buttons.documentGiro, 10);

    I.see("Dokumen Pinjaman");
    I.waitForElement(documentPage.buttons.documentLoan, 10);

    I.see("Dokumen Lainnya");
    I.waitForElement(documentPage.buttons.documentOther, 10);
});

Then("I will see button upload other document", () => {
    I.waitForText("Upload Dokumen Lainnya", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will direct to detail menu other document", () => {
    I.waitForText("Dokumen Lainnya", 30);
    I.waitForElement(headerPage.buttons.back, 10);

    I.waitForElement(documentPage.buttons.deleteDetail, 10);
    I.waitForElement(documentPage.buttons.downloadOtherDoc, 10);

    I.see("Upload Dokumen Lainnya");
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will see empty detail menu other document", () => {
    I.waitForText("Dokumen Lainnya", 30);
    I.waitForElement(headerPage.buttons.back, 10);

    I.see("Halaman Ini Masih Kosong");
    I.see("Saat ini, belum ada dokumen yang tersedia untuk ditampilkan.");

    I.dontSeeElement(documentPage.buttons.deleteDetail);
    I.dontSeeElement(documentPage.buttons.downloadOtherDoc);

    I.see("Upload Dokumen Lainnya");
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will see bottom sheet upload other document", () => {
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);
    I.see("Upload Dokumen");

    I.see("Format file: PDF / JPG / JPEG / PNG" + "\n" +
        "Maximal ukuran per file: 15MB");

    I.see("Dokumen Lainnya");

    I.see("Upload Dokumen");
    I.waitForElement(documentPage.buttons.upload, 10);

    I.dontSeeElement(documentPage.buttons.deleteDoc);
    I.dontSeeElement(documentPage.buttons.saveDocument);
    I.dontSeeElement(documentPage.texts.fileName);
    I.dontSeeElement(documentPage.texts.fileSize);
});

Then("I will see pop up confirm cancel upload other document", () => {
    I.waitForText("Keluar Dari Proses Upload", 10);
    I.see("Apakah Anda yakin akan keluar dari proses upload dokumen lainnya?");

    I.see("Ya, Keluar");
    I.waitForElement(documentPage.buttons.confirmCancel, 10);

    I.see("Batalkan");
    I.waitForElement(documentPage.buttons.backToUpload, 10);
});

Then("I will see other document has been uploaded", async () => {

    I.waitForText("Upload Dokumen", 30);
    I.dontSeeElement(documentPage.buttons.closeBottomSheet);

    I.see("Format file: PDF / JPG / JPEG / PNG" + "\n" +
        "Maximal ukuran per file: 15MB");

    I.see("Dokumen Lainnya");

    I.see("Upload Dokumen");
    I.dontSeeElement(documentPage.buttons.upload);
    I.waitForElement(documentPage.buttons.deleteDoc, 30);
    I.waitForElement(documentPage.icons.completeUpload, 20);
    I.waitForElement(documentPage.texts.fileSize, 20);
    I.dontSeeElement(documentPage.buttons.upload);

    I.see("Simpan Dokumen")
    I.waitForElement(documentPage.buttons.saveDocument, 10);

    const actualFileName = await documentPage.getFileName();
    I.assertEqual(actualFileName, globalVariable.uploadDocuments.fileName[0]);
});

Then("I will see other document is deleted", () => {
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);
    I.see("Upload Dokumen");

    I.see("Format file: PDF / JPG / JPEG / PNG" + "\n" +
        "Maximal ukuran per file: 15MB");

    I.see("Dokumen Lainnya");

    I.see("Upload Dokumen");
    I.waitForElement(documentPage.buttons.upload, 10);

    I.dontSeeElement(documentPage.buttons.deleteDoc);
    I.dontSeeElement(documentPage.buttons.saveDocument);

    I.dontSee(globalVariable.uploadDocuments.fileName[0]);
    I.dontSeeElement(documentPage.texts.fileName);

    I.dontSeeElement(documentPage.texts.fileSize);
});

Then("I will see snackbar success upload success", () => {
    I.waitForText("Dokumen berhasil disimpan", 10);
});

Then("I will direct to page other document with document that has been uploaded is in there", async () => {
    I.waitForText("Dokumen Lainnya", 30);
    I.waitForElement(headerPage.buttons.back, 10);

    const actualFileName = await documentPage.getFileNameInListOtherDoc(0);
    I.assertEqual(actualFileName, globalVariable.uploadDocuments.fileName[0]);

    I.waitForElement(documentPage.buttons.deleteDetail + "0", 10);
    I.waitForElement(documentPage.buttons.downloadOtherDoc + "0", 10);

    I.see("Upload Dokumen Lainnya");
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I see list document is ordering by the latest to oldest", async () => {

    const listFileName = globalVariable.uploadDocuments.fileName;

    for (let i = 0; i < listFileName.length; i++) {
        const titleLatest = await documentPage.getFileNameInListOtherDoc(i);
        I.assertEqual(titleLatest, listFileName[i]);
    }
});

Then("I will see other document more than one", async () => {

    I.waitForElement(documentPage.texts.fileName + "0", 10);
    I.waitForElement(documentPage.texts.fileName + "1", 10);
});