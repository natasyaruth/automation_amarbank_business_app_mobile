const firstFilterLeads = require("../../pages/firstFilterLeads");

const { I, loginPage, loanDashboardPage } = inject();

When('I click Ajukan Pinjaman', () => {
    firstFilterLeads.clickButtonAjukanPinjaman();
});

When('I click Ayo Mulai Sekarang', () => {
    firstFilterLeads.clickButtonAyoMulaiSekarang();
});

// And('I choose Untuk Kebutuhan bisnis atau usaha', () => {
//     firstFilterLeads.clickRadioButton();
// });
When('I choose Untuk Kebutuhan bisnis atau usaha {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});

When('I click Selanjutnya', () => {
    firstFilterLeads.clickButtonSelanjutnya();
});

When('I choose 5 juta sampai 50 juta {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});

Then('I should see message Install aplikasi Tunaiku', () => {
    I.wait(3);
    I.see("Install aplikasi Tunaiku");
});

When('I click Install aplikasi tunaiku', () => {
    firstFilterLeads.clickButtonInstallAplikasiTunaiku();
});

When('I click Hubungi Call Center', () => {
    firstFilterLeads.clickButtonkHubungiCallCenter();
});

When('I should see bottom sheet Hubungi Tim Kami', () => {
    I.wait(3);
    I.see("Hubungi Tim Kami");
});

When('I choose Pemabayaran Invoice {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});

Then('I should see Pengajuan Limit Kredit Bisnis', () => {
    I.wait(3);
    I.see("Pengajuan Limit Kredit Bisnis");
});

When('I choose Pembelian Persediaan {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});

Then('I should see message Invoice Dibutuhkan Sebagai Syarat Pencairan Pinjaman', () => {
    I.wait(3);
    I.see("Invoice Dibutuhkan Sebagai Syarat Pencairan Pinjaman");
}); 

When('I click Mengerti & Lanjutkan Pengajuan', () => {
    firstFilterLeads.clickButtonMengertiDanLanjutkanPengajuan();
});

When('I choose Investasi Bisnis, Pengembangan & Perluasan Usaha {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});

Then('I should see message Terima Kasih Telah Menjawab Pertanyaan Kami', () => {
    I.wait(3);
    I.see("Terima Kasih Telah Menjawab Pertanyaan Kami");
});

When('I click Mengerti', () =>{
    firstFilterLeads.clickButtonMengerti();
});

When('I choose Pembayaran Sewa Tempat Usaha {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});

When('I choose Lainnya {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});

When('I filling field lainnya', () => {
    firstFilterLeads.fillTextFieldLainnya();
});

When('I choose Untuk Kebutuhan Pribadi {string}', (radioNumber) => {
    firstFilterLeads.clickRadioButton(radioNumber);
});


