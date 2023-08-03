const Appium = require("codeceptjs/lib/helper/Appium");

class JetpackComposeHelper extends Appium {
  async setText(identifier, input) {
    if (input == "") {
      this.clearField(identifier);
    }

    await this.fillField(identifier, input);
  }

  async fillField(identifier, input) {
    await super.fillField(this._getParentLocator(identifier), input);
  }

  async clearField(identifier) {
    await super.clearField(this._getParentLocator(identifier));
  }

  async grabTextFromField(identifier) {
    return await super.grabTextFrom(this._getParentLocator(identifier));
  }

  _getParentLocator(identifier) {
    if (!identifier) {
      throw new Error("Identifier is required");
    }

    if (typeof identifier === "string") {
      if (identifier.startsWith("~")) {
        const contentDesc = identifier.slice(1);
        identifier = `//*[@content-desc="${contentDesc}"]`;
      }
    }

    return `${identifier}/..`;
  }
}

module.exports = JetpackComposeHelper;
