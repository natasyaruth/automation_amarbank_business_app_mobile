const { I, firstFilterLeadsPage} = inject();

When('I click button Ajukan Pinjaman Limit', () => {
    firstFilterLeadsPage.clickAjukanPinjaman();
});

When('I click Ayo Mulai Sekarang', () => {
    firstFilterLeadsPage.clickButtonAyoMulaiSekarang();
});

// And('I choose Untuk Kebutuhan bisnis atau usaha', () => {
//     firsFilterLeadsPage.clickRadioButton();
// });
When('I choose Untuk Kebutuhan bisnis atau usaha {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

When('I click Selanjutnya', () => {
    firstFilterLeadsPage.clickButtonSelanjutnya();
});

When('I choose 5 juta sampai 50 juta {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

Then('I should see message Install aplikasi Tunaiku', () => {
    I.wait(3);
    I.see("Install aplikasi Tunaiku");
});

When('I click Install aplikasi tunaiku', () => {
    firstFilterLeadsPage.clickButtonInstallAplikasiTunaiku();
});

When('I click Hubungi Call Center', () => {
    firstFilterLeadsPage.clickButtonkHubungiCallCenter();
});

When('I should see bottom sheet Hubungi Tim Kami', () => {
    I.wait(3);
    I.see("Hubungi Tim Kami");
});

When('I choose Pemabayaran Invoice {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

Then('I should see Pengajuan Limit Kredit Bisnis', () => {
    I.wait(3);
    I.see("Pengajuan Limit Kredit Bisnis");
});

When('I choose Pembelian Persediaan {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

Then('I should see message Invoice Dibutuhkan Sebagai Syarat Pencairan Pinjaman', () => {
    I.wait(3);
    I.see("Invoice Dibutuhkan Sebagai Syarat Pencairan Pinjaman");
}); 

When('I click Mengerti & Lanjutkan Pengajuan', () => {
    firstFilterLeadsPage.clickButtonMengertiDanLanjutkanPengajuan();
});

When('I choose Investasi Bisnis, Pengembangan & Perluasan Usaha {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

Then('I should see message Terima Kasih Telah Menjawab Pertanyaan Kami', () => {
    I.wait(3);
    I.see("Terima Kasih Telah Menjawab Pertanyaan Kami");
});

When('I click Mengerti', () =>{
    firsFilterLeadsPage.clickButtonMengerti();
});

When('I choose Pembayaran Sewa Tempat Usaha {string}', (radioNumber) => {
    firsFilterLeadsPage.clickRadioButton(radioNumber);
});

When('I choose Lainnya {string}', (radioNumber) => {
    firsFilterLeadsPage.clickRadioButton(radioNumber);
});

When('I filling field lainnya', () => {
    firsFilterLeadsPage.fillTextFieldLainnya();
});

When('I choose Untuk Kebutuhan Pribadi {string}', (radioNumber) => {
    firsFilterLeadsPage.clickRadioButton(radioNumber);
});


