const { I, loginPage } = inject();

module.exports = {

  label:{
    email: "~textEmail"
  },
  link: {
    resendEmail: "~linkResendEmail",
  },
  button:{
    login: "~buttonLogin",
  },

  loginWithUserId(userID, password, email){
    I.click(this.button.login);
    I.waitForText("Masuk Akun", 10);
    I.see("Selamat akun berhasil dibuat. Silakan masuk akun");
    I.see("Gunakan User ID yang telah kami kirim ke e-mail:");
    I.see(email);

    // I.fillField(loginPage.fields.userID, userID);
    // I.fillField(loginPage.fields.password, password);
    // I.click(loginPage.buttons.login);
  },

  async getEmailValue(){
    let email = await I.grabTextFrom(this.label.email);
    return email
  },

  clickResendEmailLink(){
    I.click(this.link.resendEmail);
  }
}
