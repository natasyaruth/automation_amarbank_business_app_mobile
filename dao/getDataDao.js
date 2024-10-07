const { I, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    async getTokenLogin() {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: globalVariable.login.userID,
            password: globalVariable.login.password,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async getLastStepJourney() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            step: responseProfile.data.accountCreationJourney.step,
        };

    },

    async isPartner() {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: globalVariable.login.userID,
            password: globalVariable.login.password,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            data: responseLogin.data.invited
        }
    },

    async hasCreatePin() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            hasPin: responseProfile.data.hasPin,
        };
    },

    async getSourceType() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            sourceType: responseProfile.data.source,
        };
    },

    async getLegalityType() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            legalityType: responseProfile.data.legalityType,
        };
    },

    async getName() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            name: responseProfile.data.fullname,
        };
    },

    async getFullAddress() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        const province = responseProfile.data.profileKtp.province;
        const city = responseProfile.data.profileKtp.city;
        const district = responseProfile.data.profileKtp.district;
        const village = responseProfile.data.profileKtp.village;

        return {
            status: responseProfile.status,
            address: responseProfile.data.profileKtp.ktpAddress,
            fullAddress: village + ", " + district + ", " + city + ", " + province
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

    async getBusinessId() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            id: response.data.businessId
        }
    },

    async getListDocBusiness() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listDocBusiness: response.data
        }

    },

    async getListBusineePartners() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listBusinessPartners: response.data
        }

    },

    async getIndustryType() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            industryType: response.data.industryType
        }
    },

    async getBusinessType() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            businessType: response.data.businessType
        }
    },

    async getFoundedDate() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            foundedAt: response.data.foundedAt
        }
    },

    async getBusinessAddress() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            fullAddress: response.data.fullAddress
        }
    },

    async getActiveAmount() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            activeBalance: response.data.activeBalance
        }
    },

    async getBlockingAmount() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            blockedAmount: response.data.blockedAmount
        }
    },

    async getTotalAmount() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            totalBalance: response.data.totalBalance
        }
    },

    async getNotificationList(category) {

        if(
            category === "all"
        ){
            category = "";
        }

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/notifications/?category="+category);

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listNotification: response.data
        }
    },
}