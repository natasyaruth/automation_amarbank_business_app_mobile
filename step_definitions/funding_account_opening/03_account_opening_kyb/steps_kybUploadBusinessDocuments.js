const {
    I,
    resetStateDao,
    globalVariable,
    uploadBusinessDocPage,
} = inject();

Given("I am a customer who has submitted business address", () => { });

Given("has submitted business address", () => { });

When("I click button upload document", () => {
    uploadBusinessDocPage.clickUploadDocument()
});

When("I continue to main dashboard", () => {
    uploadBusinessDocPage.goToMainDashboard();
});

When("I see files that need to be uploaded for type company", () => {

    I.waitForText("Upload dokumen-dokumen sebagai berikut:", 10);

    I.see("NIB Berbasis Resiko *");
    I.see("Akta Perusahaan *");
    I.see("SK Kemenkumham *");
    I.see("NPWP Perusahaan *");
    I.see("Format file PDF maximal 10MB");
});

When("I see files that need to be uploaded for type individual company", () => {

    I.waitForText("Upload dokumen-dokumen sebagai berikut:", 10);

    I.see("NIB Berbasis Resiko *");
    I.see("Akta Perusahaan *");
    I.dontSee("SK Kemenkumham *");
    I.dontSee("NPWP Perusahaan *");
    I.see("Format file PDF maximal 10MB");
});

When("I upload document {string}", (typeDoc) => {
    const path = '.data/businessDoc.pdf';

    uploadBusinessDocPage.uploadOneDocument(typeDoc, path);
    I.waitForText("Dokumen berhasil dikirim", 10);
    I.wait(3);
});

When("I upload all document business for type company", () => {
    uploadBusinessDocPage.uploadAllDocumentCompany();
});

When("I upload all document business for type individual company", () => {
    uploadBusinessDocPage.uploadAllDocumentIndividualCompany();
});

When("I upload document with size more than 10MB", () => {
    const path = '.data/businessDocMoreThan10MB.pdf';
    uploadBusinessDocPage.uploadOneDocument(typeDoc, path);
});

When("I upload document with file other than PDF", () => {
    const path = '.data/selfie.jpg';
    uploadBusinessDocPage.uploadOneDocument(typeDoc, path);
});

When("I click link call center in page upload document", () => {
    I.waitForText("Upload dokumen-dokumen sebagai berikut:", 10);
    I.see("Butuh bantuan meng-upload dokumen?");
    I.see("Hubungi Tim Kami");
    uploadBusinessDocPage.clickCallCenter();
});

Then("I will see bottom sheet with email contact", () => {
    I.waitForText("Hubungi Tim Kami", 10);
    I.see("Kami bantu meng-upload dokumen melalui:");
    I.see("support.bisnis@amarbank.co.id");
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
    I.waitForText(typeDoc+".pdf", 10);
});