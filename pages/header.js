const { I } = inject();

module.exports = {
    icon:{
        callCenter: "~buttonCallCenter",
        help: "~buttonHelp",
    },
    buttons:{
        back: "~buttonBack",
        close: "~buttonCloseCallCenter",
        closeWebView: "~",
        closePage: "~buttonClose",
        closePageChangePass: { xpath: "(//android.view.View[@content-desc='buttonClose'])[1]"},
    },
    cards:{
        whatsApp: "~cardWhatsApp",
        email: "~cardEmail",
    },

    clickButtonBack(){
        I.waitForElement(this.buttons.back, 10);
        I.click(this.buttons.back);
    },
    goToCallCenter(){
        I.waitForElement(this.icon.callCenter, 10);
        I.click(this.icon.callCenter);
    },
    openHelpCenter(){
        I.waitForElement(this.icon.help, 10);
        I.click(this.icon.help);
    },
    openCardWhatsApp(){
        I.click(this.cards.whatsApp);
    },
    openCardEmail(){
        I.click(this.cards.email);
    },
    closeCallCenter(){
        I.click(this.buttons.close);
        I.waitForInvisible(this.buttons.close, 5);
    },
    closeWebView(){
        I.waitForElement(this.buttons.closeWebView, 10);
        I.click(this.buttons.closeWebView);
    },
    closePage(){
        I.waitForElement(this.buttons.closePage, 10);
        I.click(this.buttons.closePage);
    },

    closePageChangePass(){
        I.waitForElement(this.buttons.closePageChangePass, 10);
        I.click(this.buttons.closePageChangePass);
    }
}
