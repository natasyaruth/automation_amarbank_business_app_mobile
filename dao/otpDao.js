const { I } = inject();

module.exports = {

  async requestOTP(phoneNumber) {

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendPostRequest("https://dev-smb-user.otoku.io/api/v1/otp/request/sms", {
      phone: phoneNumber,
    });

    I.seeResponseCodeIsSuccessful();
    
    return {
      status: response.status,
      data: response.data,
    };
  },
 
  async getOTP(phoneNumber){

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendGetRequest("https://dev-smb-user.otoku.io/api/v1/otp/find/sms?phone="+phoneNumber);

    I.seeResponseCodeIsSuccessful();
    I.seeResponseContainsKeys(['phone', 'otp', 'otpExpired', 'verifyAttemptsLeft', 
    'resendAttemptsLeft', 'resendableAfter']);

    return {
      status: response.status,
      otp: response.data.otp,
    };
  },

  async getUserID(email){

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendGetRequest("https://dev-smb-user.otoku.io/api/v1/user/find/"+email);

    I.seeResponseCodeIsSuccessful();

    const lastIndex = response.data.length - 1;

    return response.data[lastIndex];
  },

  async getBusinessCode(email){

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));

    const response = await I.sendGetRequest("https://dev-smb-user.otoku.io/api/v1/user/business/find-codes/"+email);

    I.seeResponseCodeIsSuccessful();

    const lastIndex = response.data.length - 1;

    return response.data[lastIndex];
  },

  async resetLimitRequestOtp(phoneNumber){

    I.haveRequestHeaders(secret({
      Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
    }));
    
    const response = await I.sendDeleteRequest("https://dev-smb-user.otoku.io/api/v1/otp/reset?phone="+phoneNumber);

    I.seeResponseCodeIsSuccessful();

    return {
      status: response.status,
      data: response.data,
    };
  },
}
