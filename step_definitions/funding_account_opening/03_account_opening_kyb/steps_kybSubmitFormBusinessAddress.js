const {
    I,
    formBusinessAddressPage,
    resetStateDao,
    globalVariable
} = inject();

Given("I am a customer who has submitted business owner list", () => { });

When("I fill my business address as followings:", (table) => {
    I.waitForElement(formBusinessAddressPage.fields.address, 10);

    const businessAddress = table.parse().rowsHash();
    formBusinessAddressPage.fillBusinessAddress(businessAddress);
});

When("I agree with the terms and condition", async () => {
    await formBusinessAddressPage.checkTnC();
});

When("I allow company to store my data", async () => {
    await formBusinessAddressPage.checkRights();
});

When("I submit my business address", () => {
    formBusinessAddressPage.openAccount();
})

Then("I will directing to page upload require documents for business", () => {
    I.waitForText("Pembentukan Rekening Sedang Diproses Tim Kami", 10);
    I.see("Pengecekan Dokumen");
    I.see("Proses saat ini");
    I.see("Untuk mempercepat pembentukan rekening, Anda bisa upload dokumen langsung.");
    I.see("NIB Berbasis Resiko");
    I.see("Akta Perusahaan");
    I.see("SK Kemenkumham");
    I.see("NPWP Perusahaan");
    I.see("Atau upload dokumen melalui:");

    I.dontSeeElement("Upload Dokumen");
    I.see("Whatsapp Business");
    I.seeElement(formBusinessAddressPage.buttons.email);
});

Then("I will directing to page upload require documents for business individual", () => {
    I.waitForText("Pembentukan Rekening Sedang Diproses Tim Kami", 10);
    I.see("Pengecekan Dokumen");
    I.see("Proses saat ini");
    I.see("Untuk mempercepat pembentukan rekening, Anda bisa upload dokumen langsung.");
    I.see("NIB Berbasis Resiko");
    I.see("Akta Pendirian");
    I.dontSee("Akta Perusahaan");
    I.dontSee("SK Kemenkumham");
    I.dontSee("NPWP Perusahaan");
    I.dontSee("Atau upload dokumen melalui:");

    I.dontSeeElement("Upload Dokumen");
    I.see("Whatsapp Business");
    I.seeElement(formBusinessAddressPage.buttons.email);
});

Then("I can close the page so that I can back to main dashboard", async () => {
    formBusinessAddressPage.closePageUploadDoc();
    I.waitForText("Dashboard Screen", 10);

    await
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});