const { isOpen } = require("./otpConfirmation");

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
    I.waitForText("Selamat akun berhasil dibuat. Silakan masuk akun", 10);
    I.see("Masuk Akun");
    I.see("Gunakan User ID yang telah kami kirim ke e-mail:");
    I.see(email);

    I.fillField(loginPage.fields.userID, userID);
    I.fillField(loginPage.fields.password, password);
    I.click(loginPage.buttons.login);
  },

  async getEmailValue(){
    let email = await I.grabTextFrom(this.label.email);
    return email
  },

  clickResendEmailLink(){
    I.waitForElement(this.link.resendEmail, 40);
    I.click(this.link.resendEmail);
  },

  isOpen(){
    I.waitForElement(this.button.login, 15);
    I.see("Verifikasi Email")
  },
}
