const { I } = inject();

module.exports = {

  async requestOTP(phoneNumber) {
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
    const response = await I.sendGetRequest("https://dev-smb-user.otoku.io/api/v1/user/find/"+email);

    I.seeResponseCodeIsSuccessful();

    return response.data[0];
  },
}
