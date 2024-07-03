const{
    I,
    globalVariable,
    friendListPage,
    headerPage,
    onboardingAccOpeningPage,
} = inject();

Given("I am a customer who wants to Transfer and has no friend list",()=>{});

Given("I am a customer who wants to Transfer and has friend list", ()=>{});

When("I click Transfer to Receiver Name", ()=>{ 
     friendListPage.addNewFriendList();   
});

When("I choose the friendlist", async () => {
    I.waitForElement(friendListPage.cards.friendList, 10);
    globalVariable.friendList.friendListName = await friendListPage.getFriendListName();
    globalVariable.friendList.bankName = await friendListPage.getFriendListBankName();
    globalVariable.friendList.friendListAccNumber = await friendListPage.getFriendListAccNumber();
    friendListPage.clickTopFriendList();
});

When("I can choose Bank name", ()=>{
    friendListPage.chooseListBank();
});

When("I search {string} in search box bank name", (bankName) =>{    
    friendListPage.searchBankName(bankName);
    globalVariable.friendList.bankName = bankName;          
});

Then("I will direct to Friend list Page", ()=> {    
    I.waitForText("Daftar Penerima", 10);
});

Then("I can see message on friend list page {string}", (messageInfo)=>{
    I.see(messageInfo);
    I.waitForElement(friendListPage.buttons.newFriendlist, 10);
});

When("I input name {string} from the search box", (friendListName)=>{
    friendListPage.fillSearchFriendlist(friendListName);
});

Then("I find name {string} from the list", (friendListName)=>{
    I.see(friendListName);
});

Then("I can't find the name {string} from the list", (friendListName)=>{
    I.dontSee(friendListPage.fields.searchFriendName, friendListName);    
});

When("I tap on bank name", ()=>{
    friendListPage.chooseBank();
});

When("I input account number {string}", (accountNumber)=>{
    friendListPage.fillAccountNumber(accountNumber);
});

When("I click on check", ()=>{
    I.wait(5);
    friendListPage.checkingAccountNumber();
});

Then("I will see error message {string}", async(expectedMessage) => {
    I.waitForText(expectedMessage, 10);

});

When("I close bottom sheet list bank name", ()=>{
    friendListPage.closeBankList();
});

Then("I will not see bottom sheet list bank name", ()=>{
    I.see("Transfer ke Penerima");
});

When("I choose bank name again", ()=>{
    I.waitForElement(friendListPage.buttons.next, 10);
    friendListPage.chooseListBank();
});

Then("I will see bank name is change", async(bankName)=>{
    const actualBankName = await friendListPage.getBankName();
    I.assertEqual(actualBankName, globalVariable.friendList.bankName);
});

Then("field account number is blank", async ()=>{
    const actualAccNumber = friendListPage.getValueAccNumber();
    I.assertEqual(actualAccNumber, "");
    
});

When("I uncheck on the checkbox save as friend list", async ()=>{
    I.wait(5);
    
   await friendListPage.unSavedFriendlist();
});

When("I check on the checkbox save as friend list", async ()=>{
    await friendListPage.saveFriendlist();
});

When("I process to transfer detail", async ()=>{
    globalVariable.friendList.receiverName = await friendListPage.getReceiverName(); 
    friendListPage.processToTransfer();
});

Then("I can't see toastbar {string}", (expectedMessageError)=>{
    I.wait(5);
    I.waitForText("Saldo aktif", 10);
    I.dontSee(expectedMessageError);
});

Then("I can see toastbar {string}", (messageInfo)=>{    
    I.see(messageInfo);
});

Then ("I can see list of friends", async ()=>{
    
    const isExist = await I.grabNumberOfVisibleElements(friendListPage.cards.friendList);

    I.assertNotEqual(isExist, "0");
});

Then("name of receiver should not be added in friendlist", ()=>{
    headerPage.clickButtonBack();
    headerPage.clickButtonBack();
    I.waitForElement(friendListPage.buttons.newFriendlist, 10);
});

Then("name of receiver should be added in friendlist", ()=>{
    headerPage.clickButtonBack();
    headerPage.clickButtonBack();
    friendListPage.fillSearchFriendlist(globalVariable.friendList.receiverName);
    I.wait(1);
    I.seeElement(friendListPage.cards.friendList);
});

When("I will go to Friend list page", ()=>{
    I.waitForText("Daftar Penerima", 10)
});
