const { I } = inject();

module.exports = {

  buttons: {
    oneStar: "~buttonStarOne",
    twoStar: "~buttonStarTwo",
    threeStar: "~buttonStarThree",
    fourStar: "~buttonStarFour",
    fiveStar: "~buttonStarFive",
    send: "~buttonSend",
    playStore: "~buttonOpenPlayStore"
  },
  fields: {
    feedback: "~textFieldRate"
  },
  texts: {
    counter: "~textFieldCounter",
    editText: {xpath: "//android.view.View[3]/android.widget.EditText"}
  },

  clickRating(index) {

    switch (index) {

      case "1":
        I.waitForElement(this.buttons.oneStar, 10);
        I.click(this.buttons.oneStar);
        break;
      case "2":
        I.waitForElement(this.buttons.twoStar, 10);
        I.click(this.buttons.twoStar);
        break;
      case "3":
        I.waitForElement(this.buttons.threeStar, 10);
        I.click(this.buttons.threeStar);
        break;
      case "4":
        I.waitForElement(this.buttons.fourStar, 10);
        I.click(this.buttons.fourStar);
        break;
      case "5":
        I.waitForElement(this.buttons.fiveStar, 10);
        I.click(this.buttons.fiveStar);
        break;
      default:
        throw new Error("Please choose rating with range 1-5 stars");
    }
  },

  async getCountWord(){
    I.waitForElement(this.texts.counter, 10);
    return await I.grabTextFrom(this.texts.counter);
  },

  fillFeedback(text) {
    I.waitForElement(this.fields.feedback, 10);
    I.click(this.fields.feedback);
    I.type(text, 100);
    I.hideDeviceKeyboard();
  },

  async getValueFieldFeedback(){
    I.waitForElement(this.texts.editText, 10);
    return await I.grabTextFrom(this.texts.editText);
  },

  sentFeedBack() {
    I.waitForElement(this.buttons.send, 10);
    I.click(this.buttons.send);
  },
}
