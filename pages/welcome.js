const { I } = inject();

module.exports = {
  buttons:{
    login: "~buttonLogin",
    registration: "~buttonRegister",
  },

  clickButtonLogin(){
    I.waitForElement(this.buttons.login, 10);
    I.click(this.buttons.login);
  },

  clickButtonRegister(){
    I.waitForElement(this.buttons.registration, 5);
    I.click(this.buttons.registration);
  },
};
