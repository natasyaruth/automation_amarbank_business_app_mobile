const {
    I,
    formKtpPage,
    resetStateDao,
    globalVariable } = inject();

When("I fill all information identity details as followings:", 
    async (table) => { 
    const ktpData = table.parse().rowsHash();
    I.waitForElement(formKtpPage.fields.eKtpNumber, 10);
    formKtpPage.fillInformation(ktpData);
  }
);

When("I submit my information identity details", () =>{
    formKtpPage.saveKtpData();
});

Then("I will notify my information identity details has successfully submitted", () => {
    I.waitForText("Data eKTP berhasil disimpan", 10);
});

Then("I will direct to page capture selfie", async () => {
    I.see("Ambil Foto Diri Anda");
    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
    resetStateDao.reloadPageAfterResetState();
});
