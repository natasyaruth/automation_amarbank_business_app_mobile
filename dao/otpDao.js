const { I, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

  async getTokenLogin(userID, password) {

    I.haveRequestHeaders({
        Authorization: "basic auth"
    });

    const responseLogin = await I.sendPostRequest("api login");

    I.seeResponseCodeIsSuccessful();

    return {
        bearerToken: responseLogin.data
    }
},

  async requestOTP(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic auth"
    }));

    const response = await I.sendPostRequest("api request otp");

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },

  async getOTP(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic auth"
    }));

    const response = await I.sendGetRequest("api get otp" + phoneNumber);

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      otp: response.data.otp,
    };
  },

  async getUserID(email) {

    I.haveRequestHeaders(secret({
      Authorization: "basic auth"
    }));

    const response = await I.sendGetRequest("api get user id" + email);

    I.seeResponseCodeIsSuccessful();

    return {
      userID: response.data
    }
  },

  async resetLimitRequestOtp(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic auth"
    }));

    const response = await I.sendDeleteRequest("api reset quota resend otp" + phoneNumber);

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },
}