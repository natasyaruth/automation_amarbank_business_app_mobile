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

    async getTitleFacility() {
        I.waitForElement(this.texts.textFacility, 3);
        return await I.grabTextFrom(this.texts.textFacility);
    },
    
    async selectIndexRadioButtonByFacility() {
        I.wait(3);
        const title = await this.getTitleFacility();
        const selector = this.radioButtons.radioButton + title;
        console.log(`Selector yang akan diklik: ${selector}`);
        await this.clickElement(selector);
    },
    
    async clickElement(selector) {
        try {
            I.waitForElement(selector, 10); // Perpanjang waktu tunggu
            I.seeElement(selector);
            I.click(selector);
        } catch (error) {
            console.error(`Error saat klik elemen ${selector}: ${error.message}`);
        }
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
            I.sae("Halaman ini Masih Kosong");
            I.see("Saat ini, belum ada aktivitas pinjaman yang tersedia untuk ditampilkan.");
        }
    },
    
    
    
      

    validateCardListRepayment() {
        I.wait(3);
        I.seeElement(this.cards.cardListRepayment);
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

};