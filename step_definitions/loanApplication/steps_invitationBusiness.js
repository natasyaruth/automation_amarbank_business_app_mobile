const { I, invitationBusinessPage} = inject();

// screen invitation page
Given(/I have been on the Business Loan Dashboard to see the loan types from AP Loans/,()=>{
    invitationBusinessPage.viewInvitationPage();
});
When(/user should see text view title card \"([^\"]*)\" on field card \"([^\"]*)\"/,()=>{
    invitationBusinessPage.viewInvitationPage();
});
Then(/user should see text body card \"([^\"]*)\" in field \"([^\"]*)\"/,(loanSchema)=>{
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

// screen data confirm
Given(/user on select loan amount page/,()=>{
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