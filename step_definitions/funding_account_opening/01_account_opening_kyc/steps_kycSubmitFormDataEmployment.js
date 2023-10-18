const {
    I,
    formEmploymentDataPage,
    globalVariable
} = inject();

Given("I am a customer who has submitted my domicile address", ()=>{});

When("I fill my employment details as followings:", async (table)=>{
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);
    
    const employmentData = table.parse().rowsHash();
    await formEmploymentDataPage.fillEmploymentData(employmentData);
});

When("I submit my employment data", ()=>{
    formEmploymentDataPage.saveEmploymentData();
    I.wait(3);
});

Then ("I will notify that I already fill my personal details data", async ()=>{
    I.waitForText("Terima kasih telah melengkapi Data Diri", 10);
    I.see("Mohon melengkapi Data Bisnis Anda untuk melanjutkan proses pembentukan rekening");
    I.see("Perbankan Bisnis Premium");
    I.see("Dengan melengkapi Data Bisnis, Anda akan mendapatkan fitur perbankan bisnis premium (rekening giro) dari Bank Amar");
    I.see("Gratis Biaya Admin");
    I.see("Transaksi Real-Time");
    I.see("Semua Proses dari Hp Anda");
    I.see("Multiple User");
    I.see("Debit Card");
    I.seeElement(formEmploymentDataPage.buttons.continueToKYB);

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});

Then ("I will notify that my personal data details needs to be verified first", async ()=>{
    I.waitForText("Terimakasih telah melengkapi semua data", 10);
    I.see("Kami akan melalukan verifikasi ulang data Anda dalam waktu kurang-lebih 2 hari kerja.");
    I.see(formEmploymentDataPage.buttons.continue);
    formEmploymentDataPage.continueToDashboard();

    await 
    resetStateDao.resetStateFlow(0, globalVariable.login.userID, globalVariable.login.password);
});