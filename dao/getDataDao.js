const { I, globalVariable} = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    async getTokenLogin(userID, password) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async getLastStepJourney(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://"+env+"-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            step: responseProfile.data.accountCreationJourney.step,
        };

    },

    async isPartner(userID, password){

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            data: responseLogin.data.invited
        }
    },

    async getBusinessCode(email){

        I.haveRequestHeaders(secret({
          Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        }));
    
        const response = await I.sendGetRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/business/find-codes/"+email);
    
        I.seeResponseCodeIsSuccessful();
    
        const lastIndex = response.data.length - 1;
    
        return {
            status: response.status,
            businessCode: response.data[lastIndex]
        }
      },

}