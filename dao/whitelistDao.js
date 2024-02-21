const { I } = inject();

module.exports = {
  async whitelistPhoneNumber(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendPostRequest("https://staging-api-sms.otoku.io/address/whitelist/v1", {
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

    I.haveRequestHeaders(secret({
      Authorization: "Basic dHVuYWlrdW1vYmlsZToxOTNJN1Y1RVFU"
    }));

    const response = await I.sendPostRequest("https://staging-api-notification.tunaiku.com/notification/whitelist", {
      contact_address: email,
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
