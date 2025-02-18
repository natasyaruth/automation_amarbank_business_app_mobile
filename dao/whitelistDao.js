const { I, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {
  async whitelistPhoneNumber(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic auth"
    }));

    const response = await I.sendPostRequest("api whitelist phonenumber");

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
      Authorization: "Basic auth"
    }));

    const response = await I.sendPostRequest("api whitelist email");

    return {
      status: response.status,
      data: response.data,
    };
  },
};
