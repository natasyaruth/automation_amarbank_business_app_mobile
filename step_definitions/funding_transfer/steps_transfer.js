const { radioButton } = require("../../pages/loanApplication/selectLoanAmountTenor");

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
    globalVariable.transfer.category = category;
});

When("I close bottom sheet category", (category) => {
    I.wait(2);    
    I.assertEqual(actualService,globalVariable.transfer.category);
});

When("I input amount higher than active balance", async () => {
    const activeBalance = await transferPage.getBalance();
    const amount = activeBalance + 10.000
    transferPage.inputAmountTransfer(amount);
});

Then("I can see message {string}", async (messageError) => {
    let actualMessageError = await transferPage.getMessageErrorAmount();
    I.assertEqual(actualMessageError, messageError);
});

When("I input amount {string}", (amount) => {
    transferPage.inputAmountTransfer(amount);
    globalVariable.transfer.amount = amount;

});

When("I input notes with {string}", (notes) => {
    transferPage.fillNotes(notes); 
    globalVariable.transfer.note = notes;
});

Then("I see message {string}", async(errorMessageNotes) =>{
    let actualMessageErrorNotes = await transferPage.getMessageErrorNotes();
    I.assertEqual(actualMessageErrorNotes,errorMessageNotes);
});

When("I click choose bank transfer service", () => {
    transferPage.chooseMethodTransfer();
});

Then("I can see BI Fast and RTOL", () => { 
    I.waitForElement(transferPage.radioButtons.methodRtol,5);
    I.waitForElement(transferPage.radioButtons.methodBifast,5);
});

Then("I can see BI Fast, SKN and RTGS", () => {
    I.waitForElement(transferPage.radioButtons.methodBifast,5);
    I.waitForElement(transferPage.radioButtons.methodRtol,5);
    I.waitForElement(transferPage.radioButtons.methodSkn,5);
    
});
Then("I choose transfer service RTOL", () => {
    transferPage.chooseRtol();
});

Then("I choose transfer service BIFAST", () => {
    transferPage.chooseBifast();
});

Then("I choose transfer service SKN", () => {});

When("I click transfer", () => {
    transferPage.processTransfer();
});

Then("I will directly go to page confirmation transfer", async () => {
    I.waitForElement(transferPage.texts.amount,10);
    const actualAmount = await transferPage.getAmountConfirmation();
    I.assertEqual(actualAmount, "Rp. "+globalVariable.transfer.amount);

    I.waitForElement(transferPage.texts.service,10);
    const actualService = await transferPage.getServiceMethod();
  
    I.see(transferPage.texts.total);

    I.waitForElement(transferPage.texts.category,10);
    const actualCategory = await transferPage.getCategory();
    I.assertEqual(actualCategory,globalVariable.transfer.category);
    
    I.waitForElement(transferPage.texts.note,10);
    const actualnotes = await transferPage.getNotes();
    I.assertEqual(actualnotes,globalVariable.transfer.note);
});

When("I input wrong PIN", () => {
    transferPage.inputPin("923879");
});

Then("I will be able to see message error {string}", async (expectedMessageErrorPIN) => {
    let actualerrorPINmessage = await transferPage.getMessageErrorPIN();
    I.assertEqual(actualerrorPINmessage,expectedMessageErrorPIN);
});

When("I input PIN {string}", (Pin) => {
    I.waitForText("Masukkan PIN Transaksi",5);
    transferPage.inputPin(Pin);    
}),

When("I click transfer now", () => {
    transferPage.confirmTransfer();
});

Then("I successfully transferred without notes", () => {
    I.see(transferPage.texts.status);
    I.see('Transfer Keluar');
    I.see("Rp. "+globalVariable.transfer.amount);
    I.waitForElement(transferPage.buttons.copy,10);   
    I.dontSee(globalVariable.transfer.note);
    I.see(transferPage.buttons.share); 
    I.waitForElement(transferPage.buttons.close);    
});

Then("Then I successfully transferred", () => {
    I.see(transferPage.texts.status);
    I.see('Transfer Keluar');
    I.see("Rp. "+globalVariable.transfer.amount);
    I.waitForElement(transferPage.buttons.copy,10);   
    I.see(globalVariable.transfer.note);
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
    I.assertEqual(actualnotes,globalVariable.transfer.note);

    I.dontSee(globalVariable.transfer.service);
});

Then("Then I successfully transferred between Amar Bank", () => {
    I.see(transferPage.texts.status);
    I.see('Transfer Keluar');
    I.see("Rp. "+globalVariable.transfer.amountt);
    I.waitForElement(transferPage.buttons.copy,10);   
    I.see(globalVariable.transfer.note);
    I.see(transferPage.buttons.share);    
    I.waitForElement(transferPage.buttons.close);
});














