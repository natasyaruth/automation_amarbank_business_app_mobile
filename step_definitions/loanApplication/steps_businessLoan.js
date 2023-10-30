const { I, businessLoanPage} = inject();


// screen business loan
Then(/user click button Gunakan Limit/, () =>{
    businessLoanPage.clickBtnCloseOnBoarding();
});