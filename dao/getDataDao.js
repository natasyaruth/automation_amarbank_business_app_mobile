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

    async getName(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            name: responseProfile.data.fullname,
        };
    },

    async getFullAddress(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            fullAddress: responseProfile.data.profileAddress.completeAddress
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

    async getListDocBusiness(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listDocBusiness: response.data
        }

    },

    async getListBusineePartners(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listBusinessPartners: response.data
        }

    },

    async getIndustryType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            industryType: response.data.industryType
        }
    },

    async getBusinessType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            businessType: response.data.businessType
        }
    },

    async getFoundedDate(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            foundedAt: response.data.foundedAt
        }
    },

    async getBusinessAddress(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            fullAddress: response.data.fullAddress
        }
    },

    async getActiveAmount(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            activeBalance: response.data.activeBalance
        }
    },

    async getBlockingAmount(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            blockedAmount: response.data.blockedAmount
        }
    },

    async getTotalAmount(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v2/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            totalBalance: response.data.totalBalance
        }
    },

    async getNotificationList(userID, password, category) {

        if (
            category === "all"
        ) {
            category = "";
        }

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/notifications/?category=" + category);

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listNotification: response.data
        }
    },

    async getAccountHolderName(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            accountHolderName: response.data.accountHolderName
        }
    },

    async getCountFolderRootOtherDoc(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/drive/media",
            {
                source: ""
            }
        );

        I.seeResponseCodeIsSuccessful();

        let count = 0;

        const lengthList = response.data.items.length;

        for (let i = 0; i < lengthList; i++) {
            const item = response.data.items[i];

            if (
                item.url === ""
            ) {
                count += 1;
            }
        }

        return {
            status: response.status,
            numberOfFolder: count
        }
    },

    async getCountFileRootOtherDoc(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/drive/media",
            {
                source: ""
            }
        );

        I.seeResponseCodeIsSuccessful();

        let count = 0;

        const lengthList = response.data.items.length;

        for (let i = 0; i < lengthList; i++) {
            const item = response.data.items[i];

            if (
                item.url !== ""
            ) {
                count += 1;
            }
        }

        return {
            status: response.status,
            numberOfFiles: count
        }
    },

    async getIDFolder(bearerToken, folderName) {

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/drive/media",
            {
                source: ""
            }
        );

        I.seeResponseCodeIsSuccessful();

        let idFolder = "";

        const lengthList = response.data.items.length;

        for (let i = 0; i < lengthList; i++) {
            const item = response.data.items[i];

            if (
                item.name === folderName
            ) {
                idFolder = item.path;
                break;
            }
        }

        return {
            status: response.status,
            idFolder: idFolder
        }
    },

    async getCountFolderInSpecificPath(userID, password, folderName) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const idFolder = (await this.getIDFolder(bearerToken, folderName)).idFolder;

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/drive/media",
            {
                source: idFolder
            }
        );

        I.seeResponseCodeIsSuccessful();

        let count = 0;

        const lengthList = response.data.items.length;

        for (let i = 0; i < lengthList; i++) {
            const item = response.data.items[i];

            if (
                item.url === ""
            ) {
                count += 1;
            }
        }

        return {
            status: response.status,
            numberOfFolder: count
        }
    },
}