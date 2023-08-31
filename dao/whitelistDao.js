const { I } = inject();

module.exports = {
  async whitelistPhoneNumber(phoneNumber) {
    const response = await I.sendPostRequest("/address/whitelist/v1", {
      address: phoneNumber,
    });

    if (!response) {
      throw new Error("failed to whitelist phone number");
    }

    return {
      status: response.status,
      data: response.data,
    };
  },

  async whitelistEmail(email) {

    const response = await I.sendPostRequest("/address/whitelist/v1", {
      address: email,
    });

    if (!response) {
      throw new Error("failed to whitelist email");
    }

    return {
      status: response.status,
      data: response.data,
    };
  },
};
