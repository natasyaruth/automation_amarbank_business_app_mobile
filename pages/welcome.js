const { I } = inject();

module.exports = {
  buttons:{
    login: "~buttonLogin",
    registration: "~buttonRegister",
  },
  image:{
    onboarding: {xpath: "//android.view.View/android.view.View[1]/android.widget.ImageView"}
  },

  clickButtonLogin(){
    I.waitForElement(this.buttons.login, 30);
    I.click(this.buttons.login);
  },

  clickButtonRegister(){
    I.waitForElement(this.buttons.registration, 30);
    I.click(this.buttons.registration);
  },
};
