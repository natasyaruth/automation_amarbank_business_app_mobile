const Appium = require("codeceptjs/lib/helper/Appium");

class JetpackComposeHelper extends Appium {
  async setText(identifier, input) {
    await this.fillField(identifier, input);
  }

  async fillField(identifier, input) {
    if (input == "") {
      await super.fillField(this._getParentLocator(identifier), "\b");
      await this.clearField(identifier);
      return;
    }

    await super.fillField(this._getParentLocator(identifier), input);
  }

  async clearField(identifier) {
    await super.clearField(this._getParentLocator(identifier));
  }

  async grabTextFromField(identifier) {
    return await super.grabTextFrom(this._getParentLocator(identifier));
  }

  async CheckIsElementVisible(identifier, timeout = 0) {
    try {
      const element = await super.waitForElement(
        this._getParentLocator(identifier),
        timeout
      );
      if (!element) {
        return Promise.resolve(false);
      }
      return Promise.resolve(true);
    } catch (error) {
      return Promise.resolve(false);
    }
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
