const { I, invitationBusinessPage} = inject();

// screen invitation page
Given(/I have been on the Business Loan Dashboard to see the loan types from AP Loans/,()=>{
    invitationBusinessPage.viewInvitationPage();
});
When(/user should see text view title card \"([^\"]*)\" on field card \"([^\"]*)\"/,async(expectedValue, fieldName)=>{
    I.wait(2);
    let actualValue = await invitationBusinessPage.getTextFieldTittle(fieldName);
    I.assertEqual(actualValue, expectedValue);
});
Then(/user should see element text view card \"([^\"]*)\"/,(loanSchema)=>{
    invitationBusinessPage.validateInviteBusinessPage(loanSchema);
});
Then(/user click button lihat skema pinjaman/, () =>{
    invitationBusinessPage.clickBtnSchema();
});
Then(/user click button setujui penawaran /, () =>{
    invitationBusinessPage.clickBtnAccept();
});
Then(/user click button close/, () =>{
    invitationBusinessPage.clickBtnClose();
});
Then(/user click button next on invitation business page/, () =>{
    invitationBusinessPage.clickBtnNext();
});
Then(/user click back to invitation page/, () =>{
    invitationBusinessPage.clickBtnBack();
});
Then(/user click button send reason/, () =>{
    invitationBusinessPage.clickBtnSend();
});

// screen data confirm
Given(/I have been on the Business Loan Dashboard to see the loan types from AP Loans/,()=>{
    invitationBusinessPage.viewDataConfirmationPage();
});
Then(/user click button next/, () =>{
    invitationBusinessPage.clickBtnNext();
});
Then(/user click checkbox tnc /, () => {
    invitationBusinessPage.clickcheckBox();
});
Then(/user validate wording tnc /, () => {
    invitationBusinessPage.validateWordingTextTnC();
});

// screen switch ap ar
Then(/user switch page ap ar \"([^\"]*)\"/,()=>{
    I.wait(2);
    invitationBusinessPage.validateInviteBusinessPage();
});
When(/user should see error field \"([^\"]*)\" in the below of field \"([^\"]*)\"/,async(expectedValue, fieldName)=>{
    I.wait(2);
    let actualValue = await invitationBusinessPage.getMessageErrorField(fieldName);
    I.assertEqual(actualValue, expectedValue);
});