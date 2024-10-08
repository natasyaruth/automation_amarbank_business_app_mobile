const { I, resetStateDao, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

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

  async requestOTPUsingToken() {

    const bearerToken = (await resetStateDao.getTokenLogin()).bearerToken;

    I.amBearerAuthenticated(secret(bearerToken));

    const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/otp/user/request/sms");

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },

  async getOTPUsingToken() {

    const bearerToken = (await resetStateDao.getTokenLogin()).bearerToken;

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

  async getOTPCreatePIN() {

    const bearerToken = (await resetStateDao.getTokenLogin()).bearerToken;

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

    return response.data[lastIndex];
  },

  async resetLimitRequestOtpUsingToken() {

    const bearerToken = (await resetStateDao.getTokenLogin()).bearerToken;

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