const { I, globalVariable } = inject();

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

    async getLastStepJourney(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            step: responseProfile.data.accountCreationJourney.step,
        };

    },

    async isPartner(userID, password) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            data: responseLogin.data.invited
        }
    },

    async hasCreatePin(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            hasPin: responseProfile.data.hasPin,
        };
    },

    async getSourceType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            sourceType: responseProfile.data.source,
        };
    },

    async getLegalityType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            legalityType: responseProfile.data.legalityType,
        };
    },

    async getBusinessCode(email) {

        I.haveRequestHeaders(secret({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        }));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/find-codes/" + email);

        I.seeResponseCodeIsSuccessful();

        const lastIndex = response.data.length - 1;

        return {
            status: response.status,
            businessCode: response.data[lastIndex]
        }
    },

    async getBusinessId(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            id: response.data.businessId
        }
    },

    async getListDocBusiness(userID, password){

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listDocBusiness: response.data
        }

    },

    async getListBusineePartners(userID, password){

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listBusinessPartners: response.data
        }

    },

}