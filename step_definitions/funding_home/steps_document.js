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
    mainActivePage,
} = inject();

Given("don't have any other document", async () => {

    await
        resetStateDao.deleteOtherDoc(globalVariable.login.userID, globalVariable.login.password);

});

Given("never entered wrong password", async () => {
    await
        resetStateDao.resetAttemptFailedLogin(globalVariable.login.userID);
});

Given("I have more than one other folders", async () => {

    globalVariable.uploadDocuments.folderName = ["Folder Name 1", "Folder Name 2"]

    await
        uploadDao.uploadOtherFolder(globalVariable.login.userID, globalVariable.login.password, globalVariable.uploadDocuments.folderName[0]);

    I.wait(2);

    await
        uploadDao.uploadOtherFolder(globalVariable.login.userID, globalVariable.login.password, globalVariable.uploadDocuments.folderName[1]);

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

When("I click delete folder", () => {
    documentPage.clickDeleteDoc();
});

When("I click delete file", () => {
    documentPage.clickDeleteDoc();
});

When("I upload other document with type {string}", async (typeDoc) => {

    let fileName;
    globalVariable.uploadDocuments.fileType = typeDoc;

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
    documentPage.uploadFile();

    I.waitForElement(documentPage.googleElement.search, 30);
    const newFileName = await documentPage.searchGoogleDrive(fileName);

    globalVariable.uploadDocuments.fileName.unshift(newFileName);
    documentPage.clickFirstOptionSearch();
});

When("I delete other document number {string}", async (numberDoc) => {

    const rowDoc = parseInt(numberDoc);

    documentPage.deleteOtherDoc(numberDoc - 1);

});

When("I confirm delete folder", () => {
    documentPage.confirmDeleteFolder();
});

When("I cancel delete folder", () => {
    documentPage.cancelDeleteFolder();
});

When("I confirm delete file", () => {
    documentPage.confirmDeleteDoc();
});

When("I cancel delete file", () => {
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

When("I click create new folder", () => {
    documentPage.clickAddFolder();
});

When("I fill field new folder with {string}", (folderName) => {
    documentPage.fillFieldFolderName(folderName);
    globalVariable.uploadDocuments.folderName.unshift(folderName);
});

When("I save new folder", () => {
    documentPage.saveName();
});

When("I click icon clear name", () => {
    documentPage.clickIconClear();
});

When("I clear new folder name using keyboard", () => {
    documentPage.clearViaKeyboardNewFolderName();
});

When("I fill field new folder with char more than 100 character", async () => {

    const folderName = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.";
    documentPage.fillFieldFolderNameViaKeyboard(folderName);

    const actualValueFilled = await I.grabTextFrom(documentPage.statusElement.fieldNameDoc);

    globalVariable.uploadDocuments.folderName.unshift(actualValueFilled);
});

When("I fill new folder name same as before", () => {
    documentPage.fillFieldFolderName(globalVariable.uploadDocuments.folderName[0]);
});

When("I click icon three dot folder", () => {
    documentPage.clickInfoFolderBucketlist(0);
});

When("I click icon three dot folder detail", () => {
    documentPage.clickInfoFolderDetail();
});

When("I click icon three dot file", () => {
    documentPage.clickInfoFolderBucketlist(0);
});

When("I click edit folder name", () => {
    documentPage.clickChangeName();
});

When("I click edit file name", () => {
    documentPage.clickChangeName();
});

When("I edit folder name with {string}", (editName) => {
    documentPage.fillNewFolderName(editName);
    globalVariable.uploadDocuments.updateFolderName = editName;
});

When("I edit file name with {string}", (editName) => {
    documentPage.fillNewFileName(editName);
    globalVariable.uploadDocuments.updateFileName = editName;
});

When("I edit file name contain with extension file", () => {
    const editName = "Dokumen Berubah" + "." + globalVariable.uploadDocuments.fileType;
    documentPage.fillNewFileName(editName);
    globalVariable.uploadDocuments.updateFileName = editName;
});

When("I click change name", () => {
    documentPage.saveName();
});

When("I change folder name with char more than 100 character", async () => {

    const folderName = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.";
    documentPage.fillNewFolderNameViaKeyboard(folderName);

    const actualValueFilled = await I.grabTextFrom(documentPage.statusElement.fieldNameDoc);
    globalVariable.uploadDocuments.updateFolderName = actualValueFilled;
});

When("I update file name with char more than 100 character", async () => {

    const fileName = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.";
    documentPage.fillNewFileNameViaKeyboard(fileName);

    const actualValueFilled = await I.grabTextFrom(documentPage.statusElement.fieldNameDoc);

    const trimWords = fileName.substring(0, 100);
    globalVariable.uploadDocuments.updateFileName = actualValueFilled;
});

When("I edit folder name same with other folder", () => {
    documentPage.fillNewFolderName(globalVariable.uploadDocuments.folderName[0]);
});

When("I clear change folder name using keyboard", () => {
    documentPage.clearViaKeyboardChangeFolderName();
});

When("I clear change file name using keyboard", () => {
    documentPage.clearViaKeyboardChangeFileName();
});

When("I open other folder", () => {
    documentPage.clickItemOtherDoc();
});

When("I open detail other folder", () => {
    documentPage.clickFolderInDetail(0);
});

When("I edit file name same with file name as before", () => {
    const regex = new RegExp(globalVariable.uploadDocuments.fileType, "g");
    const newFileName = globalVariable.uploadDocuments.fileName[0].replace(/\./g, "").replace(regex, "");

    documentPage.fillNewFileName(newFileName);
});

Then("I will see pop up confirm delete folder", () => {
    I.waitForText("Hapus Folder ini?", 10);
    I.waitForText("Apakah Anda yakin " + "\n" +
        "ingin menghapus folder “" + globalVariable.uploadDocuments.folderName + "” ?", 10);
    I.see("Batalkan");
    I.waitForElement(documentPage.buttons.cancelDelete, 10);

    I.see("Ya, Hapus");
    I.waitForElement(documentPage.buttons.confirmDelete, 10);
});

Then("I will see pop up confirm delete file", () => {
    I.waitForText("Hapus Dokumen ini?", 10);
    I.waitForText("Apakah Anda yakin "+"\n"+
    "ingin menghapus dokumen “"+globalVariable.uploadDocuments.fileName[0]+"” ? ", 10);

    I.see("Batalkan");
    I.waitForElement(documentPage.buttons.cancelDelete, 10);

    I.see("Ya, Hapus");
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
    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSeeDoc, 'enabled');

    I.assertEqual(isEnabled, "true");
});

Then("I will see button see document is disabled", async () => {

    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSeeDoc, 'enabled');

    I.assertEqual(isEnabled, "false");

});

Then("I will not see menu document giro", () => {
    I.wait(1);
    I.dontSee("Giro");
    I.dontSeeElement(documentPage.buttons.documentGiro);
});

Then("I will not see menu document loan and giro", () => {
    I.wait(1);
    I.dontSee("Dokumen Utama");
    I.dontSee("Giro");
    I.dontSeeElement(documentPage.buttons.documentGiro);

    I.dontSee("Pinjaman");
    I.dontSeeElement(documentPage.buttons.documentLoan);
});

Then("I will see menu other document", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);

    I.see("Lainnya");
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will see menu other document and loan", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);

    I.waitForText("Pinjaman", 20);
    I.waitForText("Dokumen Utama", 20);
    I.waitForElement(documentPage.buttons.documentLoan, 10);

    I.see("Lainnya");
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
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

    I.waitForText("Dokumen Giro", 10);

    I.waitForElement(documentPage.buttons.downloadDoc + "0", 10);
    I.see("NIB");

    I.waitForElement(documentPage.buttons.downloadDoc + "1", 10);
    I.see("Akta Pendirian");

    I.waitForElement(documentPage.buttons.downloadDoc + "2", 10);
    I.see("SK Kemenkumham Pendirian");

    I.waitForElement(documentPage.buttons.downloadDoc + "3", 10);
    I.see("NPWP Bisnis");

    I.waitForElement(documentPage.buttons.downloadDoc + "4", 10);
    I.see("Akta Perubahan Terakhir");

    I.waitForElement(documentPage.buttons.downloadDoc + "5", 10);
    I.see("SK Kemenkumham Perubahan Terakhir");

    I.see("Dokumen Giro");
});

Then("I will see document business required for type company", () => {

    I.waitForElement(documentPage.buttons.downloadDoc + "0", 10);
    I.see("NIB");

    I.waitForElement(documentPage.buttons.downloadDoc + "1", 10);
    I.see("Akta Pendirian");

    I.waitForElement(documentPage.buttons.downloadDoc + "2", 10);
    I.see("SK Kemenkumham Pendirian");

    I.waitForElement(documentPage.buttons.downloadDoc + "3", 10);
    I.see("NPWP Bisnis");

    I.dontSeeElement(documentPage.buttons.downloadDoc + "4");
    I.dontSee("Akta Perubahan Terakhir");

    I.dontSeeElement(documentPage.buttons.downloadDoc + "5");
    I.dontSee("SK Kemenkumham Perubahan Terakhir");

    I.see("Dokumen Giro");
});

Then("I will see document business for type individual company", async () => {

    const legalityType = (await getDataDao.getLegalityType(globalVariable.login.userID, globalVariable.login.password)).legalityType;

    if (
        legalityType === "UD"
    ) {

        I.waitForElement(documentPage.buttons.downloadDoc + "0", 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadDoc + "1", 10);
        I.see("NPWP Bisnis");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "2");
        I.dontSee("Sertifikat Pendaftaran");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "3");
        I.dontSee("Surat Pernyataan Pendirian");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "4");
        I.dontSee("Sertifikat Perubahan Terakhir");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "5");
        I.dontSee("Surat Pernyataan Perubahan Terakhir");

    } else if (
        legalityType === "PT Perorangan"
    ) {

        I.waitForElement(documentPage.buttons.downloadDoc + "0", 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadDoc + "1", 10);
        I.see("NPWP Bisnis");

        I.waitForElement(documentPage.buttons.downloadDoc + "2", 10);
        I.see("Sertifikat Pendaftaran");

        I.waitForElement(documentPage.buttons.downloadDoc + "3", 10);
        I.see("Surat Pernyataan Pendirian");

        I.waitForElement(documentPage.buttons.downloadDoc + "4", 10);
        I.see("Sertifikat Perubahan Terakhir");

        I.waitForElement(documentPage.buttons.downloadDoc + "5", 10);
        I.see("Surat Pernyataan Perubahan Terakhir");

    } else {

        throw new Error("Please check legality type of user. Only works if user id is from UD or PT Perorangan");
    }

    I.see("Dokumen Giro");
});

Then("I will see document business required for type individual company", async () => {

    const legalityType = (await getDataDao.getLegalityType(globalVariable.login.userID, globalVariable.login.password)).legalityType;

    if (
        legalityType === "UD"
    ) {

        I.waitForElement(documentPage.buttons.downloadDoc + "0", 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadDoc + "1", 10);
        I.see("NPWP Bisnis");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "2");
        I.dontSee("Sertifikat Pendaftaran");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "3");
        I.dontSee("Surat Pernyataan Pendirian");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "4");
        I.dontSee("Sertifikat Perubahan Terakhir");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "5");
        I.dontSee("Surat Pernyataan Perubahan Terakhir");

    } else if (
        legalityType === "PT Perorangan"
    ) {

        I.waitForElement(documentPage.buttons.downloadDoc + "0", 10);
        I.see("NIB");

        I.waitForElement(documentPage.buttons.downloadDoc + "1", 10);
        I.see("NPWP Bisnis");

        I.waitForElement(documentPage.buttons.downloadDoc + "2");
        I.see("Sertifikat Pendaftaran");

        I.waitForElement(documentPage.buttons.downloadDoc + "3");
        I.see("Surat Pernyataan Pendirian");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "4");
        I.dontSee("Sertifikat Perubahan Terakhir");

        I.dontSeeElement(documentPage.buttons.downloadDoc + "5");
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

    const hasPin = (await getDataDao.hasCreatePin(globalVariable.login.userID, globalVariable.login.password)).hasPin;

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

    // I.see("Aktifkan Biometrik");
    // I.waitForElement(otherPage.buttons.activatedBiometric, 10);
    // I.waitForElement(otherPage.buttons.toogleBiometric, 10);

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

Then("I will see menu document giro and other", () => {
    I.waitForText("Brankas Dokumen", 10);
    I.dontSeeElement(headerPage.buttons.back);
    I.dontSeeElement(headerPage.buttons.closePage);

    I.waitForText("Dokumen Utama", 20);
    I.see("Giro");
    I.waitForElement(documentPage.buttons.documentGiro, 10);

    I.dontSee("Pinjaman");
    I.dontSeeElement(documentPage.buttons.documentLoan, 10);

    I.see("Lainnya");
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will see button upload other document", () => {
    I.dontSee("Upload Dokumen Lainnya");
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

    I.waitForText("Halaman Ini Masih Kosong", 10);
    I.see("Saat ini, belum ada dokumen yang" + "\n" +
        "tersedia untuk ditampilkan.");
});

Then("I will see bottom sheet upload other document and create folder", () => {
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);

    I.see("Upload Dokumen");
    I.waitForElement(documentPage.buttons.addDoc, 10);

    I.see("Buat Folder Baru");
    I.waitForElement(documentPage.buttons.addFolder, 10);
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
    I.waitForElement(documentPage.buttons.closeBottomSheet, 50);

    I.see("Format file: PDF / JPG / JPEG / PNG" + "\n" +
        "Maximal ukuran per file: 15MB");

    I.see("Dokumen Lainnya");
    I.waitForText("Berhasil Upload 1/1", 20);

    I.see("Upload Dokumen");
    I.waitForElement(documentPage.texts.fileSize, 30);
    I.dontSeeElement(documentPage.buttons.upload);
    I.waitForElement(documentPage.icons.completeUpload, 20);

    I.waitForText("Simpan Dokumen", 40);
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
    I.waitForText("Brankas Dokumen", 30);

    const actFileName = await documentPage.getFileNameInListOtherDoc(1);
    I.assertEqual(actFileName, globalVariable.uploadDocuments.fileName[0]);

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I see list document is ordered alphabetical", async () => {

    const listFileName = globalVariable.uploadDocuments.fileName.sort();

    I.wait(5);

    for (let i = 0; i < listFileName.length; i++) {
        const x = 1 + i;
        const titleLatest = await documentPage.getFileNameInListOtherDoc(x);
        I.assertEqual(titleLatest, listFileName[i]);
        I.waitForElement(documentPage.buttons.infoDoc + i, 10);
    }
});

Then("I will see other document more than one", async () => {

    I.waitForElement(documentPage.texts.fileName + "0", 10);
    I.waitForElement(documentPage.texts.fileName + "1", 10);
});

Then("I will see bottom sheet new folder", async () => {
    I.waitForText("Folder Baru", 10);
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);

    I.see("Nama Folder");
    const placeholderNewFolder = await I.grabTextFrom(documentPage.statusElement.fieldNameDoc);
    I.assertEqual(placeholderNewFolder, "Folder Baru");

    I.waitForElement(documentPage.icons.resetName, 10);

    I.see("Buat Folder Baru");
    I.waitForElement(documentPage.buttons.saveName, 10);
});

Then("I see snackbar success create new folder", () => {
    I.waitForText("Folder baru berhasil dibuat", 10);
});

Then("I will see snackbar folder deleted successfully", () => {
    I.waitForText("Folder berhasil dihapus", 10);
    I.wait(3);
});

Then("I will see snackbar file deleted successfully", () => {
    I.waitForText("Dokumen berhasil dihapus", 10);
    I.wait(3);
});

Then("I will direct to page document brankas with folder that has been created in section other document", async () => {
    I.waitForText("Brankas Dokumen", 30);

    const folderName = await documentPage.getFolderNameInListOtherDoc(1);
    I.assertEqual(folderName, globalVariable.uploadDocuments.folderName[0]);

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I see list folder is ordered alphabetical", async () => {

    const listFolderName = globalVariable.uploadDocuments.folderName.sort();

    I.wait(5);

    for (let i = 0; i < listFolderName.length; i++) {
        const number = 1 + i;
        const titleLatest = await documentPage.getFolderNameInListOtherDoc(number);
        I.assertEqual(titleLatest, listFolderName[i]);
        I.waitForElement(documentPage.buttons.infoDoc + i, 10);
    }
});

Then("I see list other document is ordering by folder and follow with file with alphabetical order", async () => {

    const listFolderName = globalVariable.uploadDocuments.folderName.sort();
    const listFileName = globalVariable.uploadDocuments.fileName.sort();
    const combineLength = listFolderName.length + listFileName.length;

    console.log(listFolderName);
    console.log(listFileName);
    let flag = false;

    I.wait(6);

    for (let i = 0; i < combineLength; i++) {

        if (
            flag === false
        ) {
            for (let j = 0; j < listFolderName.length; j++) {
                const number = 1 + j;
                const titleFolder = await documentPage.getFolderNameInListOtherDoc(number);
                I.assertEqual(titleFolder, listFolderName[j]);
                I.waitForElement(documentPage.buttons.infoDoc + i, 10);
            }

            flag = true;
        } else {

            for (let k = 0; k < listFileName.length; k++) {
                const number = 1 + k;
                const titleFile = await documentPage.getFileNameInListOtherDoc(number);
                I.assertEqual(titleFile, listFileName[k]);
                I.waitForElement(documentPage.buttons.infoDoc + i, 10);
            }
        }
    }
});

Then("I will see button create new folder is disabled", async () => {
    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSaveOtherDoc, 'enabled');
    I.assertEqual(isEnabled, "false");
});

Then("I will see button create new folder is enabled", async () => {
    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSaveOtherDoc, 'enabled');
    I.assertEqual(isEnabled, "true");
});

Then("I see field new folder is filled with only 100 character, the rest is auto trimmed", () => {
    I.waitForText(globalVariable.uploadDocuments.folderName[0], 10);
    const actLength = globalVariable.uploadDocuments.folderName[0].length;
    I.assertEqual(actLength, 100);
});

Then("I will direct to page document brankas with new folder using name Folder Baru", async () => {
    I.waitForText("Brankas Dokumen", 30);

    const folderName = await documentPage.getFolderNameInListOtherDoc(1);
    I.assertEqual(folderName, "Folder Baru");

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will see field new folder is filled with Folder Baru 1", () => {
    I.waitForText("Folder Baru (1)", 10);
});

Then("I see message error folder name is exist", () => {
    I.waitForText("Nama folder sudah ada & tidak boleh sama. Silakan ganti dengan nama lain.", 10);
});

Then("I see message error file name is exist", () => {
    I.waitForText("Nama dokumen sudah ada & tidak boleh sama. Silakan ganti dengan nama lain.", 10);
});

Then("I will see bottom sheet detail info folder", () => {
    I.waitForText(globalVariable.uploadDocuments.folderName[0], 10);
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);

    I.see("Ubah Nama");
    I.waitForElement(documentPage.buttons.changeName, 10);

    I.see("Hapus");
    I.waitForElement(documentPage.buttons.deleteDoc, 10);
});

Then("I will see bottom sheet detail info file", () => {
    I.waitForText(globalVariable.uploadDocuments.fileName[0], 10);
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);

    I.see("Download");
    I.waitForElement(documentPage.buttons.downloadOtherDoc, 10);

    I.see("Ubah Nama");
    I.waitForElement(documentPage.buttons.changeName, 10);

    I.see("Hapus");
    I.waitForElement(documentPage.buttons.deleteDoc, 10);
});

Then("I will see snackbar success change folder name", () => {
    I.waitForText("Nama folder berhasil diubah", 10);
});

Then("I will see snackbar success change file name", () => {
    I.waitForText("Nama dokumen berhasil diubah", 10);
});

Then("I will direct to page document brankas with folder name has been change", async () => {
    I.waitForText("Brankas Dokumen", 30);

    I.wait(2);

    const fileName = await documentPage.getFolderNameInListOtherDoc(1);
    I.assertEqual(fileName, globalVariable.uploadDocuments.updateFolderName);

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will direct to page document brankas with file name has been change", async () => {
    I.waitForText("Brankas Dokumen", 30);

    I.waitForElement(documentPage.buttons.documentGiro, 20);

    I.wait(4);

    const fileName = await documentPage.getFileNameInListOtherDoc(1);
    I.assertEqual(fileName, globalVariable.uploadDocuments.updateFileName + "." + globalVariable.uploadDocuments.fileType);

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I see update folder name is filled with only 100 character, the rest is auto trimmed", () => {
    I.waitForText(globalVariable.uploadDocuments.updateFolderName, 10);
    const actLength = globalVariable.uploadDocuments.updateFolderName.length;
    I.assertEqual(actLength, 100);
});

Then("I see field file name is filled with only 100 character, the rest is auto trimmed", () => {
    I.waitForText(globalVariable.uploadDocuments.updateFileName, 10);
    const actLength = globalVariable.uploadDocuments.updateFileName.length;
    I.assertEqual(actLength, 100);
});

Then("I see button change name is enabled", async () => {
    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSaveOtherDoc, 'enabled');

    I.assertEqual(isEnabled, 'true');
});

Then("I see button change name is disabled", async () => {
    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSaveOtherDoc, 'enabled');

    I.assertEqual(isEnabled, 'false');
});

Then("I will see folder contents still empty", async () => {
    I.waitForText("Halaman Ini Masih Kosong", 10);
    I.see("Saat ini, belum ada dokumen yang" + "\n" +
        "tersedia untuk ditampilkan.");

    I.waitForElement(documentPage.buttons.infoDocDetail, 10);
    I.waitForText(globalVariable.uploadDocuments.folderName[0], 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);

    I.dontSeeElement(onboardingAccOpeningPage.tabs.business);
    I.dontSeeElement(onboardingAccOpeningPage.tabs.home);
    I.dontSeeElement(onboardingAccOpeningPage.tabs.document);
    I.dontSeeElement(onboardingAccOpeningPage.tabs.others);
});

Then("I see the new folder is created", async () => {

    const actFolderName = await documentPage.getFolderNameInListDetailOtherDoc(1);
    I.assertEqual(actFolderName, globalVariable.uploadDocuments.folderName[0])

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I see the new file is created", async () => {

    const actFileName = await documentPage.getFileNameInListDetailOtherDoc(1);
    I.assertEqual(actFileName, globalVariable.uploadDocuments.fileName[0])

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will see file name has been change", async () => {

    I.waitForText(globalVariable.uploadDocuments.updateFileName, 10);

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will see folder name has been change", async () => {

    I.waitForText(globalVariable.uploadDocuments.updateFolderName, 10);

    I.waitForElement(documentPage.buttons.infoDoc + "0", 10);
    I.waitForElement(documentPage.buttons.uploadOtherDoc, 10);
});

Then("I will not see the deleted folder", async () => {

    I.dontSee(globalVariable.uploadDocuments.folderName[0]);
});

Then("I will not see the deleted file", async () => {

    I.dontSee(globalVariable.uploadDocuments.fileName[0]);
});

Then("I will see bottom sheet change folder name", async () => {

    I.waitForText("Ubah Nama Folder", 10);
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);

    I.waitForText("Nama Folder", 10);
    const actValueField = await I.grabTextFrom(documentPage.statusElement.fieldNameDoc);
    I.assertEqual(actValueField, globalVariable.uploadDocuments.folderName[0]);

    I.waitForElement(documentPage.icons.resetName, 10);
    I.waitForElement(documentPage.buttons.saveName, 10);
    I.see("Ubah");

    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSaveOtherDoc, 'enabled');
    I.assertEqual(isEnabled, "true");

});

Then("I will see bottom sheet change file name", async () => {

    I.waitForText("Ubah Nama Dokumen", 10);
    I.waitForElement(documentPage.buttons.closeBottomSheet, 10);

    I.waitForText("Nama File", 10);
    const actValueField = await I.grabTextFrom(documentPage.statusElement.fieldNameDoc);
    const regex = new RegExp(globalVariable.uploadDocuments.fileType, "g");
    const expValueField = globalVariable.uploadDocuments.fileName[0].replace(/\./g, "").replace(regex, "");
    I.assertEqual(actValueField, expValueField);

    I.waitForElement(documentPage.icons.resetName, 10);
    I.waitForElement(documentPage.buttons.saveName, 10);
    I.see("Ubah");

    const isEnabled = await I.grabAttributeFrom(documentPage.statusElement.buttonSaveOtherDoc, 'enabled');
    I.assertEqual(isEnabled, "true");

});

Then("I will see title folder name is change", async () => {
    I.wait(2);

    const actTitle = await documentPage.getTitleFolderDetail();
    I.assertEqual(actTitle, globalVariable.uploadDocuments.updateFolderName);
});