const {
    I,
    formKtpPage,
    resetStateDao,
    globalVariable } = inject();

Given ("I am a customer who has uploaded my eKTP photo", () =>{});    

When("I fill all information identity details as followings:", 
    async (table) => { 
    const ktpData = table.parse().rowsHash();
    I.waitForElement(formKtpPage.fields.eKtpNumber, 10);
    formKtpPage.fillInformation(ktpData);
    globalVariable.formKtp.eKTPNumber = ktpData["eKtpNumber"];
    globalVariable.formKtp.fullName = ktpData["fullName"];
  }
);

When("I submit my information identity details", () =>{
    formKtpPage.saveKtpData();
});

Then("I will notify my information identity details has successfully submitted", () => {
    I.waitForText("Data eKTP berhasil disimpan", 10);
});

Then("I will direct to page capture selfie", async () => {
    I.waitForText("Ambil Foto Diri Anda", 10);
    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});
