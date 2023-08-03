const { I } = inject();

module.exports = {
  buttons:{
    login: "~buttonLogin",
    registration: "~buttonRegister",
  },

  clickButtonLogin(){
    I.click(this.buttons.login);
  },

  clickButtonRegister(){
    I.click(this.buttons.registration);
  },
};
