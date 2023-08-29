const { I, loginPage } = inject();

module.exports = {

  label:{
    email: "~textEmail"
  },
  link: {
    resendEmail: "~linkResendEmail",
  },
  button:{
    login: "~ButtonLogin",
  },

  loginWithUserId(userID, password){
    I.click(this.button.login);
    I.waitForText("Masuk Akun", 10);
    I.fillField(loginPage.fields.userID, userID);
    I.fillField(loginPage.fields.password, password);
    I.click(loginPage.buttons.login);
  },

  async getEmailValue(){
    let email = await I.grabTextFrom(this.label.email);
    return email
  },

  clickResendEmailLink(){
    I.click(this.link.resendEmail);
  }
}
