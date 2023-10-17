
const {
    I,
    transferPage,
    friendListPage,
    createPINPage,
    globalVariable,
} = inject();

When("I choose category {string}", (category) => {
    I.wait(2)
    transferPage.chooseCategory(category);
});

When("I close bottom sheet category", () => {
    I.wait(2);
    transferPage.closesheetcategory();
});

When("I input amount higher than active balance", async (amount) => {
    const activeBalance = await I.getBalance();
    const amount = activeBalance + 10.000
    transferPage.inputAmountTransfer(amount);
});

Then("I can see message {string}", async (messageError) => {
    let actualMessageError = await transferPage.getMessageErrorAmount
    I.assertEqual(actualMessageError, messageError);
});

When("I input amount {string}", (amount) => {
    globalVariable.transfer.amount = amount;

});

When("I input notes with {string}", (notes) => {
    transferPage.fillNotes(notes);
});

Then("I see message {string}", async(errorMessageNotes) =>{
    let actualMessageErrorNotes = await transferPage.getMessageErrorNotes();
    I.assertEqual(actualMessageErrorNotes,errorMessageNotes);
});

When("I click choose bank transfer service", () => {
    transferPage.chooseMethodTransfer();
});

Then("I can see BI Fast and RTOL", () => { 
    I.waitForElement(transferPage.radioButtons.methodRtol);
    I.waitForElement(transferPage.radioButtons.methodBifast);
});

Then("I choose transfer service RTOL", () => {
    transferPage.chooseRtol();
});

Then("I choose transfer service BIFAST", () => {
    transferPage.chooseBifast();
});

When("I click transfer", () => {
    transferPage.processTransfer();
});

Then("I will directly go to page confirmation transfer", async () => {
    I.waitForElement(transferPage.texts.amount,10);
    const actualAmount = await transferPage.getAmountConfirmation();
    I.assertEqual(actualAmount, "Rp. "+globalVariable.transfer.amount);

    I.waitForElement(transferPage.texts.service,10);
    const actualService = await transferPage.getServiceMethod();
    I.assertEqual(actualService,globalVariable.transfer.service);

    I.see(transferPage.texts.total);

    I.waitForElement(transferPage.texts.category,10);
    const actualCategory = await transferPage.getCategory();
    I.assertEqual(actualCategory,globalVariable.transfer.category);
    
    I.waitForElement(transferPage.texts.note,10);
    const actualnotes = await transferPage.getNotes();
    I.assertEqual(actualnotes,globalVariable.transfer.notes);
});

When("I input wrong PIN", () => {
    transferPage.inputPin("923879");
});

Then("I will be able to see message error {string}", async (expectedMessageErrorPIN) => {
    let actualerrorPINmessage = await transferPage.getMessageErrorPIN();
    I.assertEqual(actualerrorPINmessage,expectedMessageErrorPIN);
});

When("I input PIN", (Pin) => {
    transferPage.inputPin(PIN);
}),

When("I click transfer now", () => {
    transferPage.confirmTransfer();
});

Then("I successfully transferred without notes", () => {
    I.see(transferPage.texts.status);
    I.see('Transfer Keluar');
    I.see("Rp. "+globalVariable.transfer.amount);
    I.waitForElement(transferPage.buttons.copy,10);   
    I.dontSee(globalVariable.transfer.notes);
    I.see(transferPage.buttons.share); 
    I.waitForElement(transferPage.buttons.close);
    
});

Then("Then I successfully transferred", () => {
    I.see(transferPage.texts.status);
    I.see('Transfer Keluar');
    I.see("Rp. "+globalVariable.transfer.amount);
    I.waitForElement(transferPage.buttons.copy,10);   
    I.see(global_variable.transfer.notes);
    I.see(transferPage.buttons.share);    
    I.waitForElement(transferPage.buttons.close);
});

When("I will directly go to page confirmation transfer between Amar Bank", async () => {
    I.waitForElement(transferPage.texts.amount,10);
    const actualAmount = await transferPage.getAmountConfirmation();
    I.assertEqual(actualAmount, "Rp. "+globalVariable.transfer.amount);   

    I.see(transferPage.texts.total);

    I.waitForElement(transferPage.texts.category,10);
    const actualCategory = await transferPage.getCategory();
    I.assertEqual(actualCategory,globalVariable.transfer.category);
    
    I.waitForElement(transferPage.texts.note,10);
    const actualnotes = await transferPage.getNotes();
    I.assertEqual(actualnotes,globalVariable.transfer.notes);
});

Then("Then I successfully transferred between Amar Bank", () => {
    I.see(transferPage.texts.status);
    I.see('Transfer Keluar');
    I.see("Rp. "+globalVariable.transfer.amount);
    I.waitForElement(transferPage.buttons.copy,10);   
    I.see(global_variable.transfer.notes);
    I.see(transferPage.buttons.share);    
    I.waitForElement(transferPage.buttons.close);
});














