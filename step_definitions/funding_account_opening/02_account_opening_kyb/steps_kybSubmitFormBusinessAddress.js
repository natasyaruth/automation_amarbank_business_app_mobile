const {
    I,
    formBusinessAddressPage,
    resetStateDao,
    globalVariable
} = inject();

Given("I am a customer who has submitted business owner list", ()=>{});

When ("I fill my business address as followings:", (table) =>{
    I.waitForElement(formBusinessAddressPage.fields.address, 10);
    
    const businessAddress = table.parse().rowsHash();
    formBusinessAddressPage.fillBusinessAddress(businessAddress);
});

When("I agree with the terms and condition", async ()=>{
    await formBusinessAddressPage.checkTnC();
});

When("I allow company to store my data", async ()=>{
    await formBusinessAddressPage.checkRights();
});

When("I submit my business address", ()=>{
    formBusinessAddressPage.openAccount();
})

Then ("I will directing to page upload require documents for business", async ()=>{
    I.waitForText("Pembentukan Rekening Sedang Diproses Tim Kami", 10);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});