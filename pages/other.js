const { I } = inject();

module.exports = {

  buttons: {
    changePassword: "~btnPassword",
    changePin: "~btnPin",
    deleteAccount: "~buttonDeleteAccount",
    activatedBiometric: "~buttonActiveBiometric",
    toogleBiometric: "~toggleBiometric",
    checkBook: "~buttonCheckBook",
    email: "~btnToEmail",
    btnLogout: "~btnLogout",
  },
  textFields: {
     textFieldOthers: { xpath: '//android.widget.TextView[contains(@text, "Lainnya")]' }
  },

  clickChangePassword(){
    I.waitForElement(this.buttons.changePassword, 10);
    I.click(this.buttons.changePassword);
  },
  viewPageOthers(){
    I.waitForElement(this.textFields.textFieldOthers, 10);
  }
}
