const { I, loginPage, loanDashboardPage, loanDisbursementPage } = inject();

const globalVar = {
 password: "",
 userID: "",
};

// Scenario: Validate request loan disbursement for type Loan AP when customer have any past due date
Given('I have been on Loan Dashboard to checking if customer have any past due date in type AP', () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});
When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

When('I have any past due date in type AP', () => {
 I.wait(3);
});

Then('I direct to pay the bill limit section in type AP', async () => {
 await loanDisbursementPage.validateSectionHavePastDueDate();
});

//Scenario: Validate request loan disbursement for type Loan AP when customer don't have any past due date
Given('I have been on Loan Dashboard to checking if customer do not have any past due date in type AP', () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDashboardPage.validateLoanTypeofLoanAP();
});

When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

Then('I do not have any past due date in type AP', () => {
 I.wait(3);
});

Then('I direct to page for checking Loan Tenor in type AP', async () => {
 await loanDisbursementPage.validateSectionHaveNotPastDueDate();
});

// // Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor More Than Facility Due Date
// Given('I have been on Loan Dashboard to checking if loan tenor more than Facility due date', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
// });
// When('I click button "Gunakan Limit" in card type Loan AP', () => {
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });

// When('system check that loan tenor more than facility due date', () => {
//  I.wait(3);
// });

// Then('I direct to "Pengajuan Anda Melebihi Batas Aktif Fasilitas" section', async () => {
//  await loanDisbursementPage.validateLoanIsTenorMoreThanPastDueDate();
// });

// // Scenario: Validate request loan disbursement for type Loan AP when Loan Tenor Less Than or Equal With Facility Due Date
// Given('I have been on Loan Dashboard to checking if loan tenor less than or equal with Facility due date', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
// });

// When('I click button "Gunakan Limit" in card type Loan AP', () => {
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });

// When('system check that loan tenor less than or equal with facility due date', () => {
//  I.wait(3);
// });

// Then('I direct to anchor detail page', async () => {
//  await loanDisbursementPage.validateLoanTenorLessThanPastDueDate;
// });

// Scenario: Validate request loan disbursement for type Loan AP when Anchor Have Not Uploaded Invoice Yet
Given('I have been on Loan Dashboard to checking if anchor have not uploaded invoice yet', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 await loanDashboardPage.validateLoanTypeofLoanAP();
});

When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

When('system check that anchor have not uploaded invoice yet', () => {
 I.wait(3);
});

Then('I should be see anchor has card is empty in anchor detail page', async () => {
 await loanDisbursementPage.validateNotUploadInvoiceYetAP();
});

// Scenario: Validate request loan disbursement for type Loan AP when Anchor Already Upload Invoice
Given('I have been on Loan Dashboard to checking if anchor already upload invoice', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 await loanDashboardPage.validateLoanTypeofLoanAP();
});

When('I click button "Gunakan Limit" in card type Loan AP', () => {
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

When('system check that anchor already upload invoice', () => {
 I.wait(3);
});

Then('I should be see anchor has card in anchor detail page', async () => {
 await loanDisbursementPage.validateAlreadyUploadInvoiceAP();
});

// Scenario: Validate page Loan Program Information for type AP
Given('I have been in anchor detail page to validate loan program information for type AP', () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

When('I click button "Info Selanjutnya" for type AP', () => {
 loanDisbursementPage.goToProgramLoanInformation();
});

Then('I should be see Program Loan Information for type AP', () => {
 loanDisbursementPage.validateProgramLoanInformation();
});

//Scenario: Close Section Loan Program Information for type AP 
Given('I have been in anchor detail page to close the loan program information section for type AP', () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});
When('I click button "Info Selanjutnya" for type AP', () => {
 loanDisbursementPage.goToProgramLoanInformation();
});

When('I click Close button for type AP', () => {
 loanDisbursementPage.validateProgramLoanInformation();
 loanDisbursementPage.closeProgramLoanInformation();
});
Then('Loan Program Information should be dissapear for type AP', () => {
 I.wait(3);
});

Then('Back to the Anchor detail page for type AP', () => {
});

//Scenario: Access Invoice Card Confirmation Detail for type AP
Given('I have been in anchor detail page for type AP', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 await loanDashboardPage.validateLoanTypeofLoanAP();
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

When('I click button detail invoice for the first row for type AP', async () => {
 await loanDisbursementPage.goToCheckInvoiceDetail();
});

Then('I should be see Invoice Confirmation page for type AP', () => {
 // await loanDisbursementPage.InvoiceDetailConfirmation();

});

Then('I should be see detail invoice for type AP', () => {
 loanDisbursementPage.validateInvoiceConfirmationDetail();
});

// Scenario: Open Document Invoice Transaction Page
Given('I have been in detail invoice to open invoice transaction detail', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 await loanDashboardPage.validateLoanTypeofLoanAP();
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});
When('I open invoice document card', async () => {
 await loanDisbursementPage.goToCheckInvoiceDetail();
 loanDisbursementPage.validateInvoiceConfirmationDetail();
});

Then('the document will appears', () => {
 loanDisbursementPage.openDocumentPreview();

});

// Scenario: Open Link "Klik disini" to Send Note if There are Any Problems
Given('I have been in detail invoice to send limit disbursement', async () => {
 loanDisbursementPage.openLoanDashboard();
 loanDashboardPage.goToHistory();
 loanDashboardPage.goToStatusActiveLimitHistory();
 await loanDashboardPage.validateLoanTypeofLoanAP();
 loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
});

When('I have any issue', () => {
 loanDisbursementPage.hasAnInvoiceIssue();
});

Then('show section "Invoice Tidak Sesuai"', () => {
 loanDisbursementPage.validateInvoiceIssuePage();
});

Then('back to the confirmation invoice detail after close section', () => {
 loanDisbursementPage.closeInvoiceIssuePage();
});

Then('user should see field "invoice percentage disbursement"', () => {
 loanDisbursementPage.ValidateDisbursementDetails();
});

Then('user field LTV can be various static 80%', () => {
 loanDisbursementPage.ValidateDisbursementDetails();
});

Then('user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue100();
});
   
Then('user should see field "Total Bunga" in the below of field "textInterestFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue100();
});
   
Then('user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue100();
});
   
Then('user should see field "Nominal Pinjaman" in the below of field "textInvoiceAmount"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue80();
});
      
Then('user should see field "Total Bunga" in the below of field "textInterestFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue80();
});
      
Then('user should see field "Biaya Administrasi 3%" in the below of field "textAdminFee"', () => {
 loanDisbursementPage.ValidateDisbursementCalculationsWhenInvoiceValue80();
});

// // Scenario: Send notes "Invoice Tidak Sesuai"
// Given('I have been been in detail invoice to report my invoice issue', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });

// When('I input invoice issue', () => {
//  loanDisbursementPage.hasAnInvoiceIssue();
//  loanDisbursementPage.validateInvoiceIssuePage();
//  loanDisbursementPage.inputInvoiceIssue();
// });

// Then('show toastbar "Kendala invoice sudah dilaporkan"', () => {
//  loanDisbursementPage.validateToastBarIssueHasBeenReported();
// });

// Then('button Continue Disbursement Calculations is dissapear', () => {
//  I.dontSeeElement(this.buttons.buttonDisburse);
// });

// // Scenario: Send Disbursement Calculations When Limit is Insufficient
// Given('I have been in detail invoice to send disbursement calculation when limit is Insufficient', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });

// When('I click button "lanjut perhitungan pencairan"', () => {
//  I.click(this.buttons.buttonDisburse);
// });
// Then('show section limit is insufficient', () => {
//  loanDisbursementPage.validateLimitInsufficient()
// });

// Then('back to the confirmation invoice detail after I close the section', () => {
//  I.click(this.buttons.buttonClose);
// });

// //Scenario: Send Disbursement Calculations When Disbursement Amount More Than 2 Billion
// Given('I have been in detail invoice to send disbursement calculation when disbursement amount more than 2 Billion', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });

// When('I click button "lanjut perhitungan pencairan"', () => {
//  I.click(this.buttons.buttonDisburse);
// });
// Then('show disbursement calculation page if amount more than 2 billion', async () => {
//  await loanDisbursementPage.validateDisburseAmountPageMoreThan2Billion();
// });

// // Scenario: Send Disbursement Calculations When Disbursement Amount Less or Equal than 2 Billion
// Given('I have been in detail invoice to send disbursement calculation when disbursement amount less or equal than 2 Billion', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });

// When('I click button "lanjut perhitungan pencairan"', () => {
//  I.click(this.buttons.buttonDisburse);

// });

// Then('show disbursement calculation page if amount more than 2 billion', async () => {
//  await loanDisbursementPage.validateDisburseAmountPageLessOrEqualThan2Billion();
// });

// // Scenario: Continue Disburse The Loan When The PIN Has Not Been Created
// Given('I haven been in calculation page of amount', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });

// When('I click button continue disburse loan with PIN has not been Created', () => {
//  I.click(this.buttons.buttonDisburse);
//  I.waitForText('Lanjut Cairkan Pinjaman');
//  I.click(this.buttons.buttonDisburse);

// });
// Then('direct to the created PIN', () => {
//  //direct to the created PIN 
// });

// //Scenario: Continue Disburse The Loan When Input True Pin
// Given('I haven been in calculation page of amount', () => {
//  loanDashboardPage.goToHistory();
//  loanDashboardPage.goToStatusActiveLimitHistory();
//  loanDashboardPage.validateLoanTypeofLoanAP();
//  loanDisbursementPage.usingLimitLoanDisbursementTypeAP();
// });
// When('I click button continue disburse loan with input true PIN', () => {
//  I.click(this.buttons.buttonDisburse);
//  I.waitForText('Lanjut Cairkan Pinjaman');
//  I.click(this.buttons.buttonDisburse);
//  //direct to the input PIN
// });

// Then('I should be see the page of delivery PDC', () => {
//  loanDisbursementPage.validateSendPDCPage();
// });

// Then('The address should be copied after I click button copy', () => {
//  loanDisbursementPage.copyDeliveryAddress();
// });
// Then('back to the main dashboard after I close the section', () => {
//  loanDisbursementPage.closeDeliveryAddress();
// });