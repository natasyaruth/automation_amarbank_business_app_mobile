const { card } = require("./businessType");

const { I } = inject();

module.exports = {
    icon:{
        icnCallCenter: "~iconCallCenter"
    },
    buttons:{
        btnBack: "~buttonBack",
        btnClose: "~buttonCloseCallCenter"
    },
    cards:{
        cardWA: "~cardWhatsApp",
        cardEmail: "~cardEmail",
    },

    clickButtonBack(){
        I.click(this.buttons.btnBack);
    },
    goToCallCenter(){
        I.click(this.icon.icnCallCenter);
    },
    openCardWhatsApp(){
        I.click(this.cards.cardWA);
    },
    openCardEmail(){
        I.click(this.cards.cardEmail);
    },
}
