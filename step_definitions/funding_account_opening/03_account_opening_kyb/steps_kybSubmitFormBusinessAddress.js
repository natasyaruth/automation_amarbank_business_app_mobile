const {
    I,
    formBusinessAddressPage,
    uploadBusinessDocPage,
    headerPage,
    globalVariable
} = inject();

When("I fill my business address as followings:", (table) => {
    I.waitForElement(formBusinessAddressPage.fields.address, 10);

    const businessAddress = table.parse().rowsHash();
    formBusinessAddressPage.fillBusinessAddress(businessAddress);
});

When("I agree with the terms and condition", async () => {
    await formBusinessAddressPage.checkTnC();
});

When("I agree to carry out the Rights and Obligations", async () => {
    await formBusinessAddressPage.checkRights();
});

When("I will directing to page Rights and Obligations", async () => {
    I.wait(3);
    I.waitForText("Hak dan Kewajiban", 10);
    I.waitForElement(headerPage.buttons.back);

    formBusinessAddressPage.clickScrollToEndOfPage();

    I.waitForElement(formBusinessAddressPage.buttons.acceptWebView, 10);
    I.see("Setujui Hak dan Kewajiban");
});

When("I click button agree with Rights and Obligations", () => {
    formBusinessAddressPage.agreeWithRightsAndObligations();
});

When("I will see checkbox Rights and Obligations is checked", async () => {
    I.waitForElement(formBusinessAddressPage.checkBox.rights,10);
    const isChecked = await I.grabAttributeFrom(formBusinessAddressPage.checkBox.rights, "checked");

    I.assertEqual(isChecked, "true");
});

When("I submit my business address", () => {
    formBusinessAddressPage.openAccount();
});

Then("I will directing to page upload require documents for business", () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.waitForText("Pengajuan Pembukaan Rekening", 10);

    I.see("Mohon persiapkan dokumen-dokumen berikut:");
    I.see("NIB");
    I.see("Akta Pendirian");
    I.see("SK Kemenkumham Pendirian");
    I.see("NPWP Bisnis");
    I.see("Akta Perubahan Terakhir (jika ada)");
    I.see("SK Kemenkumham Perubahan Terakhir (jika ada)");

    I.waitForElement(uploadBusinessDocPage.buttons.chooseMethodUpload, 10);
    I.see("Pilih Metode Upload Dokumen");
});

Then("I will directing to page upload require documents for business individual", async () => {
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.waitForText("Pengajuan Pembukaan Rekening", 10);

    I.see("Mohon persiapkan dokumen-dokumen berikut:");

    const legalityType = (await getDataDao.getLegalityType(globalVariable.login.userID, globalVariable.login.password)).legalityType;

    if(
        legalityType === "UD"
    ){

        I.see("NIB");
        I.see("NPWP Bisnis");
        I.dontSee("Sertifikat Pendaftaran");
        I.dontSee("Surat Pernyataan Pendirian");
        I.dontSee("Sertifikat Perubahan Terakhir (jika ada)");
        I.dontSee("Surat Pernyataan Perubahan Terakhir (jika ada)");

    } else if (
        legalityType === "PT Perorangan"
    ) {

        I.see("NIB");
        I.see("NPWP Bisnis");
        I.see("Sertifikat Pendaftaran");
        I.see("Surat Pernyataan Pendirian");
        I.see("Sertifikat Perubahan Terakhir (jika ada)");
        I.see("Surat Pernyataan Perubahan Terakhir (jika ada)");

    } else {

        throw new Error("Please check legality type of user. Only works if user id is from UD or PT Perorangan");
    }

    I.waitForElement(uploadBusinessDocPage.buttons.chooseMethodUpload, 10);
    I.see("Pilih Metode Upload Dokumen");

});