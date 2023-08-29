const { I } = inject();

module.exports = {
    icon:{
        callCenter: "~buttonCallCenter"
    },
    buttons:{
        back: "~buttonBack",
        close: "~buttonCloseCallCenter"
    },
    cards:{
        whatsApp: "~cardWhatsApp",
        email: "~cardEmail",
    },

    clickButtonBack(){
        I.click(this.buttons.back);
    },
    goToCallCenter(){
        I.click(this.icon.callCenter);
    },
    openCardWhatsApp(){
        I.click(this.cards.whatsApp);
    },
    openCardEmail(){
        I.click(this.cards.email);
    },
}
