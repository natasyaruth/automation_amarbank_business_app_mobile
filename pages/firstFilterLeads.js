const { I } = inject();

module.exports = {

    buttons: {
        buttonAjukanPinjaman: "~buttonStartLoan",
        buttonNantiSaja: "~buttonBackLoan",
        buttonAjukanLimitKredit: "~btnToLoan",
        buttonAyoMulaiSekarang: "~buttonStart",
        buttonBack: "~buttonBack",
        buttonNext: "~buttonNext",
        buttonInstallAplikasiTunaiku: "~buttonInstall",
        buttonHubungiCallCenter: "~buttonCallCenter",
        buttonClose: "~buttonClose",
        buttonLanjutkanPengajuan: "~buttonContinue",
        buttonMengerti: "~buttonOk",
        buttonKirim: "~buttonSend",
    },
    radioButtons: {
        radioButton1: "~radioButton1",
        radioButton2: "~radioButton2",
        radioButton3: "~radioButton3",
        radioButton4: "~radioButton4",
        radioButton5: "~radioButton5",
    },

    Fields: {
        textFieldLainnya: "~textFieldOther",
        messageTooltip: "~messageTooltip",
        textFieldNomorNIB: "~textFieldNIB",
        textFieldNamaSesuaiNIB: "~textFieldName",
    },


    // page onboarding
    clickAjukanPinjaman() {
        I.wait(3);
        I.waitForElement(this.buttons.buttonAjukanPinjaman, 15);
        I.click(this.buttons.buttonAjukanPinjaman);
    },

    clickButtonNantiSaja() {
        I.waitForElement(this.buttons.buttonNantiSaja, 10);
        I.click(this.buttons.buttonNantiSaja);
    },

    // page main dashboard (after user click button nanti saja)
    clickButtonAjukanLimitKredit() {
        I.wait(3);
        I.click(this.buttons.buttonAjukanLimitKredit);
    },

    // page start
    clickButtonAyoMulaiSekarang() {
        I.wait(3);
        I.click(this.buttons.buttonAyoMulaiSekarang);
    },
    clickButtonBack() {
        I.wait(3);
        I.click(this.buttons.buttonBack);
    },

    // page menentukan tujuan mengajukan pinjaman
    // radioButton
    clickRadioButton(radioNumber) {
        I.wait(3);
        I.say(`Radio button ${radioNumber} was clicked`);
        I.click(this.radioButtons[`radioButton${radioNumber}`]);
        
    },
    clickButtonSelanjutnya() {
        I.wait(5);
        I.click(this.buttons.buttonNext);
    },

    // page mengarahkan user ke intsall tunaiku
    clickButtonInstallAplikasiTunaiku() {
        I.wait(3);
        I.click(this.buttons.buttonInstallAplikasiTunaiku);
    },
    clickButtonkHubungiCallCenter() {
        I.wait(3);
        I.click(this.buttons.buttonHubungiCallCenter);
    },
    clickButtonClose() {
        I.wait(3);
        I.click(this.buttons.buttonClose);
    },
    validateTextAfterCallCenter() {
        I.wait(3);
        I.see("Hubungi Tim Kami");
    },

    // page invoice dibutuhkan sebagai syarat pencairan pinjaman
    clickButtonMengertiDanLanjutkanPengajuan() {
        I.wait(3);
        I.click(this.buttons.buttonLanjutkanPengajuan);
    },

    // page selesai investasi bisnis
    clickButtonMengerti() {
        I.wait(3);
        I.click(this.buttons.buttonMengerti);
    },

    // page lainnya

    fillTextFieldLainnya() {
        I.wait(3);
        I.fillField(this.Fields.textFieldLainnya, 'Buat renovasi');
    },

    //enhance blok to cs
    fillTextNomorNIB() {
        I.wait(3);
        I.fillField(this.Fields.textFieldNomorNIB, '9129106701234');
    },

    fillTextNamaSesuaiNIB() {
        I.wait(3);
        I.fillField(this.Fields.textFieldNamaSesuaiNIB, 'Ricky Hodiyanto');
    },

    clickButtonKirim() {
        I.wait(3);
        I.click(this.buttons.buttonKirim);
    },
}