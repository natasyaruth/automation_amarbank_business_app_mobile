const { fillNotes } = require("../../pages/transfer");

const {
    I,
    transferPage,
    friendListPage,
    createPINPage,
} = inject();

When("I choose category {string}", (category) => {
    I.wait(2)
    transferPage.chooseCategory(category);
});

When("I close bottom sheet category", () => {
    I.wait(2);
    transferPage.closesheetcategory();
});

Then("I see bottom sheet category is dissapear", () => {
    I.waitForInvisible(transferPage.dropdownLists.category);
});

When("I input amount higher than active balance", async (amount) => {
    const activeBalance = await I.getBalance();
    const amount = activeBalance + 10.000
});

Then("I can see message {string}", async (messageError) => {
    let actualMessageError = await transferPage.messageErrorAmount();
    I.assertEqual(actualMessageError, messageError);    
});

When("I input amount {string}", (amount) => {
    transferPage.inputAmountTransfer(amount);
});

When("I input notes with {string}", (errornotes) => {
    transferPage.fillNotes(errornotes);
});

When("I click choose bank transfer service", () => {
    transferPage.chooseMethodTransfer();
});

Then("I can see BI Fast and RTOL", () => { 
I.see(transferPage.radioButtons.methodBifast);
I.see(transferPage.radioButtons.methodRtol);
});


Then("I choose transfer service {string}", (rtolService) => {
    transferPage.chooseRtol(rtolService);
});

Then("I choose transfer service {string}", (bifastservice) => {
    transferPage.chooseBifast(bifastservice);
})

When("I click transfer", () => {
    transferPage.processTransfer();
});

Then("I will directly go to page confirmation transfer", () => {
    I.see(transferPage.texts.amount);
    I.see(transferPage.texts.service);
    I.see(transferPage.texts.total);
    I.see(transferPage.texts.category);
    I.see(transferPage.texts.note);
});

When("I input wrong PIN", () => {
    createPINPage.inputPIN(dummyPIN);
});

Then("I will be able to see message error {string}", async (expectederrorPINmessage) => {
    let actualerrorPINmessage = await transferPage.getMessageErrorPIN();
    I.assertEqual(actualerrorPINmessage, expectederrorPINmessage);
    createPINPage.tryAgain();
});

When("I click transfer now", () => {
    transferPage.confirmTransfer();
});

Then("I successfully transferred without notes", () => {
    I.see(transferPage.buttons.copy);
    I.see(transferPage.buttons.share);
    I.dontSee(transferPage.texts.note);
});

Then("i see message {string}", async (errornotes) => {
    let actualerrornotes = await transferPage.getMessageErrorNotes();
    I.assertEqual(actualerrornotes,errornotes);    
});

When("I input PIN", (Pin) => {
    createPINPage.inputPIN(PIN);
});

Then("Then I successfully transferred", () => {
    I.see(transferPage.buttons.copy);
    I.see(transferPage.buttons.share);
    I.see(transferPage.texts.note);
});














