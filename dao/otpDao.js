const { I, resetStateDao, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

  async getTokenLogin(userID, password) {

    I.haveRequestHeaders({
        Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    });

    const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
        userID: userID,
        password: password,
    }));

    I.seeResponseCodeIsSuccessful();

    return {
        bearerToken: responseLogin.data.jwt.access_token
    }
},

  async requestOTP(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/request/sms", {
      phone: phoneNumber,
    });

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },

  async requestOTPUsingToken(userID, password) {

    const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

    I.amBearerAuthenticated(secret(bearerToken));

    const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/user/request/sms");

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },

  async getOTPUsingToken(userID, password) {

    const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

    I.amBearerAuthenticated(secret(bearerToken));

    const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/user/find/sms");

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      otp: response.data.otp,
    };
  },

  async getOTPWithoutToken() {

    const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/user/find/sms");

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      otp: response.data.otp,
    };
  },

  async getOTP(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/find/sms?phone=" + phoneNumber);

    I.seeResponseCodeIsSuccessful();
    I.seeResponseContainsKeys(['phone', 'otp', 'otpExpired', 'verifyAttemptsLeft',
      'resendAttemptsLeft', 'resendableAfter']);

    return {
      status: response.status,
      otp: response.data.otp,
    };
  },

  async getOTPCreatePIN(userID, password) {

    const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

    I.amBearerAuthenticated(secret(bearerToken));

    const response = await I.sendGetRequest("https://" + env + "-smb-trx.otoku.io/api/v1/authorization/otp?username=" + globalVariable.login.userID);

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      otp: response.data.otp,
    };
  },

  async getUserID(email) {

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/find/" + email);

    I.seeResponseCodeIsSuccessful();

    const lastIndex = response.data.length - 1;

    return {
      userID: response.data[lastIndex]
    }
  },

  async resetLimitRequestOtpUsingToken(userID, password) {

    const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

    I.amBearerAuthenticated(secret(bearerToken));

    const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/user/reset");

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },

  async resetLimitRequestOtp(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/reset?phone=" + phoneNumber);

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },
}