// const firsFilterLeadsPage = require("../../pages/firstFilterLeads");
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

When('I choose 50 juta sampai 100 juta {string}', (radioNumber) => {
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
    I.see("Untuk Pinjaman Pribadi, Kami Akan Mengarahkan Anda ke Tunaiku");
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
    I.see("Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti.");
});

When('I choose Pembelian Persediaan {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

Then('I should see message Invoice Dibutuhkan Sebagai Syarat Pencairan Pinjaman', () => {
    I.wait(3);
    I.see("Invoice Dibutuhkan sebagai Syarat Pencairan Pinjaman");
}); 

When('I click Mengerti & Lanjutkan Pengajuan', () => {
    firstFilterLeadsPage.clickButtonMengertiDanLanjutkanPengajuan();
});

When('I choose Investasi Bisnis, Pengembangan & Perluasan Usaha {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

Then('I should see message Terima Kasih Telah Menjawab Pertanyaan Kami', () => {
    I.wait(3);
    I.see("Terima Kasih Telah Menjawab Pertanyaan Kami.");
});

When('I click Mengerti', () =>{
    firstFilterLeadsPage.clickButtonMengerti();
});

When('I choose Pembayaran Sewa Tempat Usaha {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

When('I choose Lainnya {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

When('I filling field lainnya', () => {
    firstFilterLeadsPage.fillTextFieldLainnya();
});

When('I choose Untuk Kebutuhan Pribadi {string}', (radioNumber) => {
    firstFilterLeadsPage.clickRadioButton(radioNumber);
});

// enhancement
When('I should see form input data business', () => {
    I.wait(3);
    I.see("Isi data bisnis Anda dibawah ini!");
});

When('I input field Nomor NIB', () => {
    firstFilterLeadsPage.fillTextNomorNIB();
});

When('I input field Nama Sesuai NIB', () => {
    firstFilterLeadsPage.fillTextNamaSesuaiNIB();
});

When('I click button kirim', () => {
    firstFilterLeadsPage.clickButtonKirim();
});


