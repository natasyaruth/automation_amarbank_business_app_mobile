const {
    I,
    formBusinessOwnerPage,
    formBusinessAddressPage,
    resetStateDao,
    globalVariable
} = inject();

Given("I am a customer who has submitted my business profile", ()=>{});

Given("I am the only one business owner", ()=>{
    I.waitForText("Pemilik bisnis", 10);
    I.see(globalVariable.formKtp.fullName);
    I.see(globalVariable.registration.email);
    I.see(globalVariable.formKtp.eKTPNumber);
    I.dontSee(formBusinessOwnerPage.buttons.addListDirector);
});

When("I submit business owner list", ()=>{
    formBusinessOwnerPage.saveListDirectors();
});

Then("I will notify business owner list has successfully submitted", ()=>{
    I.waitForText("Pemilik bisnis berhasil disimpan", 10);
});

Then ("I will directing to page business address", async ()=>{
    I.waitForElement(formBusinessAddressPage.fields.address, 10);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});