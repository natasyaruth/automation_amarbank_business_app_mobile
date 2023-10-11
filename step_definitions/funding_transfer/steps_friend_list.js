const{
    I,
    globalVariable,
    friendListPage,
    headerPage
} = inject();

Given("I am a customer who wants to Transfer and has no friend list",()=>{});

Given("I am a customer who wants to Transfer and has friend list", ()=>{});

Then("I will direct to Friend list Page", ()=> {
    I.waitForText("Daftar Penerima", 10)
});

Then("I can see message {string}", (messageInfo)=>{
    I.see(messageInfo);
    I.waitForElement(friendListPage.buttons.newFriendlist, 10);
});

When("I input name {string} from the search box", (friendListName)=>{
    friendListPage.fillSearchFriendlist(friendListName);
});

Then("I find name {string} from the list", (friendListName)=>{
    I.see(friendListName);
});

Then("II can't find the name {string} from the list", (friendListName)=>{
    I.dontSee(friendListName);
});

When("I click Transfer ke Penerima Baru", ()=>{
    friendListPage.addNewFriendList()
});

When("I can choose Bank name", ()=>{
    friendListPage.chooseListBank();
});

When("I search {string} in search box bank name", (bankName)=>{
    friendListPage.searchBankName(bankName);
    globalVariable.friendList.bankName = bankName;
});

When("I tap on bank name", ()=>{
    friendListPage.chooseBank();
});

When("I input account number {string}", (accountNumber)=>{
    friendListPage.fillAccountNumber(accountNumber);
});

When("I click on check", ()=>{
    friendListPage.checkingAccountNumber();
});

Then("I will see error message {string}", async(expectedMessageError)=>{
    let actualMessageError = await friendListPage.getMessageErrorAccoutNotFound();
    I.assertEqual(actualMessageError, expectedMessageError);
});

When("I close bottom sheet list bank name", ()=>{
    friendListPage.closeBankList();
});

Then("I will not see bottom sheet list bank name ", ()=>{
    I.dontSee(friendListPage.fields.searchBankName);
});

When("I choose bank name again", ()=>{
    I.waitForElement(friendListPage.buttons.next, 10);
    friendListPage.chooseListBank();
});

Then("I will see bank name is change", async()=>{
    const actualBankName = await friendListPage.getBankName();
    I.assertEqual(actualBankName, globalVariable.friendList.bankName);
});

Then("field account number is blank", ()=>{
    const actualAccNumber = friendListPage.getValueAccNumber();
    I.assertEqual(actualAccNumber, "");
});

When("I uncheck on the checkbox save as friend list", ()=>{
    friendListPage.unSavedFriendlist();
});

When("I check on the checkbox save as friend list", ()=>{
    friendListPage.saveFriendlist();
});

When("I process to transfer detail", async ()=>{
    globalVariable.friendList.receiverName = await friendListPage.getReceiverName(); 
    friendListPage.processToTransfer();
});

Then("I can't see toastbar {string}", (expectedMessageError)=>{
    I.waitForText("Saldo aktif", 10);
    I.dontSee(expectedMessageError);
});

Then("I can see toastbar {string}", (messageInfo)=>{
    I.waitForText("Saldo aktif", 10);
    I.see(messageInfo);
});

Then ("I can see list of friends", async ()=>{

    const isExist = await I.grabNumberOfVisibleElements(friendListPage.cards.friendList);

    I.assertNotEqual(isExist, "0");
});

Then("name of receiver should not be added in friendlist", ()=>{
    headerPage.clickButtonBack();
    I.waitForElement(friendListPage.buttons.newFriendlist, 10);

});

Then("name of receiver should be added in friendlist", ()=>{
    headerPage.clickButtonBack();

    friendListPage.fillSearchFriendlist(globalVariable.friendList.receiverName);
    I.wait(1);
    I.seeElement(friendListPage.cards.friendList);
});