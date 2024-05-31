const { I,
    documentPage,
    profilePage
} = inject();

When("I click document giro", () => {
    documentPage.clickDocumentGiro();
});

When("I click tab document", () => {
    documentPage.clickTabDocument();
});

When("I click button document loan", () => {
    documentPage.clickDocumentLoan();
});

When("I click top list of my loan", () => {
    documentPage.clickItemLoan();
});

Then("I will direct to page document business", () => {
    I.waitForText("Dokumen", 20);
    I.dontSee("Dokumen Bisnis");
});

Then("I will not see button document giro", () => {
    I.dontSeeElement(documentPage.buttons.documentGiro);
});

Then("I will see button document giro", () => {
    I.waitForElement(documentPage.buttons.documentGiro, 10);
});

Then("I will see button document loan", ()=>{
    I.waitForElement(documentPage.buttons.documentLoan, 10);
});

Then("I will not see button document loan", ()=>{
    I.dontSeeElement(documentPage.buttons.documentLoan);
});

Then("I will see list of my loan", ()=>{
    I.waitForText("Pilih Nomor Pinjaman", 10)
    I.waitForElement(documentPage.buttons.itemLoan, 10);
});

Then("I will see page document loan is empty", ()=>{
    I.waitForText("Pilih Nomor Pinjaman", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
});

Then("I will see list of document loan", ()=>{
    I.waitForText("Dokumen Pinjaman", 10)
    I.waitForElement(documentPage.buttons.itemDocumentLoan, 10);
});

Then("I will see document page is empty", ()=>{
    I.waitForText("Dokumen", 10);
    I.see("Halaman Ini Masih Kosong");
    I.see("Belum ada dokumen yang tersedia untuk ditampilkan.");
    I.dontSeeElement(documentPage.buttons.documentGiro);
    I.dontSeeElement(documentPage.buttons.documentLoan);
});

Then("I will see button document giro and document loan", ()=>{
    I.waitForElement(documentPage.buttons.documentGiro, 10);
    I.waitForElement(documentPage.buttons.documentLoan, 10);
});

Then("I will see document business for type company", () => {
    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");
    I.see("NIB.pdf");

    I.seeElement(documentPage.buttons.downloadDeed);
    I.see("Akta Perusahaan");
    I.see("Akta Perusahaan.pdf");

    I.seeElement(documentPage.buttons.downloadSk);
    I.see("SK Kemenkumham");
    I.see("SK Kemenkumham.pdf");

    I.seeElement(documentPage.buttons.downloadNpwp);
    I.see("NPWP Perusahaan");
    I.see("NPWP Perusahaan.pdf");

    I.see("Dokumen Giro");
});

Then("I will see document business for type individual company", () => {
    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");
    I.see("NIB.pdf");

    I.seeElement(documentPage.buttons.downloadDeed);
    I.see("Akta Perusahaan");
    I.see("Akta Perusahaan.pdf");

    I.dontSeeElement(documentPage.buttons.downloadSk);
    I.dontSee("SK Kemenkumham");
    I.dontSee("SK Kemenkumham.pdf");

    I.dontSeeElement(documentPage.buttons.downloadNpwp);
    I.dontSee("NPWP Perusahaan");
    I.dontSee("NPWP Perusahaan.pdf");

    I.see("Dokumen Giro");
});

Then("I will see one document giro", () => {
    I.waitForElement(documentPage.buttons.downloadNib, 10);
    I.see("NIB");
    I.see("NIB.pdf");

    I.see("Dokumen Giro");
});