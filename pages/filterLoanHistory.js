const { I } = inject();

module.exports = {

    menuBar: {
        menuBarPilihFasilitas: "~filterByFacility",
        menuBarPilihStatus: "~filterByStatus",
    },

    radioButtons: {
        radioButtonAll: "~radioButtonSemua",
        radioButton: "~radioButton",
        radioButtonStatusAll: "~radioButtonSemua",
        radioButtonDalamProses: "~radioButtonDalam Proses",
        radioButtonPencairanBerhasil: "~radioButtonPencairan Berhasil",
        radioButtonTidakDisetujui: "~radioButtonTidak Disetujui",
        radioButtonMoreThan1FacilityRepayment: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.widget.TextView"},
        radioButtonMoreThan1FacilityDisbursement: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.widget.TextView"},
        radioButtonOnly1FacilityDisbursement: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.widget.TextView"},

        // repayment
        radioButtonSedangBerjalan: "~radioButtonSedang Berjalan",
        radioButtonSelesai: "~radioButtonSelesai"
    },

    texts:{
        textFacility: {xpath: "//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.widget.TextView"},
    },

    cards: {
        cardListDisbursement: { xpath: '//android.view.View[@content-desc="cardOffer"][1]' },
        cardListRepayment: { xpath: '//android.view.View[@content-desc="itemBill"][1]' },
        cardFilterDisbursement: {xpath: '//android.view.View[@content-desc="cardOffer"][1]/android.view.View'},
    },
    


    // validasi menu bar pilih fasilitas dan status
    validateFilterByFacility() {
        I.wait(3);
        I.seeElement(this.menuBar.menuBarPilihFasilitas);
    },
    validateFilterByStatus() {
        I.wait(3);
        I.seeElement(this.menuBar.menuBarPilihStatus);
    },
    
    //click filter fasilitas dan status
    clickFilterByFacility(){
        I.wait(3);
        I.click(this.menuBar.menuBarPilihFasilitas);
    },
    clickFilterByStatus(){
        I.wait(3);
        I.click(this.menuBar.menuBarPilihStatus);
    },

    // click radio button pilih fasilitas
    clickRadioButtonAll() {
        I.wait(3);
        I.click(this.radioButtons.radioButtonAll);
    },
    
    async selectIndexRadioButtonByFacility() {
        I.wait(3); // Tunggu sejenak sebelum mencari elemen
        await I.waitForElement(this.texts.textFacility, 3); // Tunggu elemen textFacility
        
        // Ambil teks dari elemen
        const title = await I.grabTextFrom(this.texts.textFacility);
        
        const radioButtonSelector = this.radioButtons.radioButton + title; // Buat selector
        console.log(`Locator yang akan diklik: ${radioButtonSelector}`);
        
        await I.waitForElement(radioButtonSelector, 10); // Tunggu elemen radio button
        await I.click(radioButtonSelector); // Klik radio button
        I.wait(3); // Tunggu setelah klik
    },

    async getTitleAndSelector() {
        I.wait(3); // Tunggu sejenak sebelum mencari elemen
        await I.waitForElement(this.texts.textFacility, 3); // Tunggu elemen textFacility
        const title = await I.grabTextFrom(this.texts.textFacility); // Ambil teks dari elemen
        console.log(`Title yang diambil: ${title}`);
        
        // Buat selector berdasarkan title
        const radioButtonSelector = this.radioButtons.radioButton + title; 
        console.log(`Locator yang akan diklik: ${radioButtonSelector}`);
        I.wait (4);
        
        return radioButtonSelector; // Kembalikan selector
    },
    
    async clickRadioButtonByTitle() {
        const radioButtonSelector = await this.getTitleAndSelector(); // Ambil selector menggunakan fungsi getTitleAndSelector
        
        await I.waitForElement(radioButtonSelector, 10); // Tunggu elemen radio button
        await I.click(radioButtonSelector); // Klik radio button
        I.wait(3); // Tunggu setelah klik
    },
    

    async click1Facility() {
        await I.waitForElement(this.texts.textFacility, 10);
        console.log("Elemen textFacility ditemukan, mencoba grab text...");
    
        // Periksa apakah elemen masih terlihat
        const isVisible = await I.seeElement(this.texts.textFacility);
        if (!isVisible) {
            console.log("Elemen textFacility tidak ditemukan atau tidak terlihat!");
            return; // Keluar dari fungsi jika elemen tidak terlihat
        }
    
        const title = await grabTextFrom(this.texts.textFacility);
        console.log(`Title yang diambil: ${title}`);
        
        if (!title || title.trim() === "") {
            console.log("Gagal mengambil teks atau teks kosong!");
            return; // Keluar jika teks tidak valid
        }
    
        const selector = this.radioButtons.radioButton+title;
        console.log(`Selector yang akan diklik: ${selector}`);
        await I.waitForElement(selector, 10); // Perpanjang waktu tunggu
        console.log("Selector ditemukan, mencoba klik...");
        await I.click(selector);
        await I.wait(3);
    },
    
    
    
    

    validateCardListDisbursement: async function() {
        I.wait(3);
    
        // Ambil jumlah elemen yang terlihat sesuai dengan locator
        const elementCount = await I.grabNumberOfVisibleElements(this.cards.cardListDisbursement);
        
        if (elementCount > 0) {
            // Jika elemen ada, tampilkan card list
            I.seeElement(this.cards.cardListDisbursement);
        } else {
            // Jika elemen tidak ada, tampilkan pesan kosong
            I.see("Halaman ini Masih Kosong");
            I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
        }
    },  

    validateCardListRepayment: async function() {
        I.wait(5);
    
        // Ambil jumlah elemen yang terlihat sesuai dengan locator
        const elementCount = await I.grabNumberOfVisibleElements(this.cards.cardListRepayment);
        
        if (elementCount > 0) {
            // Jika elemen ada, tampilkan card list
            I.seeElement(this.cards.cardListRepayment);
        } else {
            // Jika elemen tidak ada, tampilkan pesan kosong
            I.see("Halaman ini Masih Kosong");
            I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
        }
    },
    validateOnly1Facility(){
        I.wait(5);
        I.see("Segera Cairkan Invoice");
    },

    // click filter by status 
    clickFilterByStatusAll(){
        I.wait(3);
        I.click(this.radioButtons.radioButtonStatusAll);
    },
    clickFilterByStatusDalamProses() {
        I.wait(3);
        I.click(this.radioButtons.radioButtonDalamProses);
    },
    clickFilterByStatusPencairanBerhasil(){
        I.wait(3);
        I.click(this.radioButtons.radioButtonDalamProses);
    },
    clickFilterByStatusTidakDisetujui(){
        I.wait(3);
        I.click(this.radioButtons.radioButtonTidakDisetujui);
    },

    // status pada repayment
    clickFilterByStatusSedangBerjalan() {
        I.wait(3);
        I.click(this.radioButtons.radioButtonSedangBerjalan);
    },
    clickFilterByStatusSelesai() {
        I.wait(3);
        I.click(this.radioButtons.radioButtonSelesai);
    },
    clickMoreThan1FacilityRepayment() {
        I.wait(3);
        I.click(this.radioButtons.radioButtonMoreThan1FacilityRepayment);
    },
    clickOnly1FacilityRepayment() {
        I.wait(3);
        I.click(this.radioButtons.radioButtonMoreThan1FacilityRepayment);
    },
    clickMoreThan1FacilityDisbursement() {
        I.wait(3);
        I.click(this.radioButtons.radioButtonMoreThan1FacilityDisbursement);
    },
    clickOnly1FacilityDisbursement(){
        I.wait(3);
        I.click(this.radioButtons.radioButtonOnly1FacilityDisbursement);
    },
    //
};

