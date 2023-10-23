const {
    I,
    formBusinessOwnerPage,
    formBusinessAddressPage,
    resetStateDao,
    whitelistDao,
    globalVariable
} = inject();

Given("I am a customer who has submitted my business profile", () => { });

Given("I am the only one business owner", () => {
    I.waitForText("Pemilik bisnis", 10);
    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.registration.email);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.dontSee(formBusinessOwnerPage.buttons.addListDirector);
});

Given("I am the only one business director", () => {
    I.waitForText("Daftar Direktur sesuai akta", 10);
    I.see("Silahkan menambah Daftar Direktur sesuai akta");
    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.registration.email);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.see(formBusinessOwnerPage.buttons.addListDirector);
});

When("I submit business owner list", () => {
    formBusinessOwnerPage.saveBusinessOwner();
});

When("I submit business director list", () => {
    formBusinessOwnerPage.saveListDirectors();
});

When("I submit business director", () => {
    formBusinessOwnerPage.saveDirector();
});

When("I click add business director", () => {
    formBusinessOwnerPage.addListDirector();
});

When("I fill business director data as followings:", async (table) => {
    let counterDirector = globalVariable.formDirector.numberOfDirectors;
    const informationDirector = table.parse().rowsHash();
    globalVariable.formDirector.fullName = informationDirector["fullName"];
    globalVariable.formDirector.email = informationDirector["email"];
    globalVariable.formDirector.nik = informationDirector["nik"];

    await whitelistDao.whitelistEmail(
      globalVariable.formDirector.email
    );

    formBusinessOwnerPage.fillFormAddDirector(informationDirector);

    globalVariable.formDirector.numberOfDirectors = counterDirector++;
});

When("I save data director", () => {
    formBusinessOwnerPage.addDirector();
});

When("I update data director", () => {
    formBusinessOwnerPage.chooseUpdateDirector();
});

When("I delete the director", () => {
    formBusinessOwnerPage.chooseDeleteDirector();
});

When("I confirm to delete the director", () => {
    I.waitForText("Apakah Anda akan menghapus direktur?", 10);
    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.registration.email);
    I.see(globalVariable.formKtp.eKTPNumber);
    formBusinessOwnerPage.confirmDeleteDirector();
});

When("I confirm to update data director", () => {
    I.see("Simpan");
    formBusinessOwnerPage.saveUpdateDirector();
});

When("I validate my first director", async () => {
    I.waitForText("Direktur berhasil ditambah", 10);
    await formBusinessOwnerPage.swipeToButtonSaveListDirectors();

    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);
    I.see(globalVariable.formDirector.nik);
});

When("I validate all the data in the confirmation list", async () => {
    const numberOfDirectors = globalVariable.formDirector.numberOfDirectors + 1;

    I.waitForText("Konfirmasi daftar Direktur sesuai akta", 10);
    I.see("Jumlah Direktur "+numberOfDirectors+" orang.");  
});
  
When("I validate my second director", async ()=>{
    I.waitForText("Direktur berhasil ditambah", 10);
    await formBusinessOwnerPage.swipeToButtonSaveListDirectors();

    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);
    I.see(globalVariable.formDirector.nik);
});

When("I confirm my director lists", () => {
    formBusinessOwnerPage.confirmListDirectors();
});
  
Then("I will notify business owner list has successfully submitted", ()=>{
    I.waitForText("Pemilik bisnis berhasil disimpan", 10);
});
  
Then("I will notify director successfully deleted", ()=>{
    I.waitForText("Direktur berhasil dihapus", 10);
});

Then("I will notify director successfully updated", ()=>{
    I.waitForText("Direktur berhasil disimpan", 10);
});

Then("I will notify business director list has successfully submitted", ()=>{
    I.waitForText("Daftar Direktur berhasil disimpan", 10);
});
  
Then ("I will directing to page business address", async ()=>{
    I.waitForElement(formBusinessAddressPage.fields.address, 10);

    await resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then ("I will not be able to see the deleted data director", async ()=>{
    I.waitForElement(formBusinessOwnerPage.buttons.saveListDirectors);
    I.dontSee(globalVariable.formDirector.fullName);
    I.dontSee(globalVariable.formDirector.email);
    I.dontSee(globalVariable.formDirector.nik);
    await resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then ("I will see the updated director", async ()=>{
    formBusinessOwnerPage.swipeToButtonSaveListDirectors();
    I.see(globalVariable.formDirector.fullName);
    I.see(globalVariable.formDirector.email);
    I.see(globalVariable.formDirector.nik);
    await resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});