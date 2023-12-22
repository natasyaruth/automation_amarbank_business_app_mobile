const { I, documentManagementPage} = inject();

//
Given(/I have been on the Business Loan Dashboard to see the loan types from AP Loan/,()=>{
    documentManagementPage.viewDocumentPage();
});
Then(/user select download surat kuasa/, () =>{
    documentManagementPage.clickBtnDownloadSuratKuasa();
});
Then(/user select dokumen bisnis/, () =>{
    documentManagementPage.clickBtnDokumenBisnis();
});
Then(/user click button dokumen giro/, () =>{
    documentManagementPage.clickBtnGiro();
});
Then(/user click button dokumen pinjaman/, () =>{
    documentManagementPage.clickBtnLoan();
});
Then(/user select pinjaman/, () =>{
    documentManagementPage.clickBtnSelectLoan();
});
Then(/user click button download/, () =>{
    documentManagementPage.clickBtnDownload();
});
