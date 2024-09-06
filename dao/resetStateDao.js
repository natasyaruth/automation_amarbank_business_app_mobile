const { I, headerPage, onboardingAccOpeningPage, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    async resetStateFlow(stateNumber, userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseState = await I.sendPostRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/account-creation/set?step=" + stateNumber));
        I.wait(2);

        return {
            status: responseState.status,
            data: responseState.data,
        };
    },

    async updateFlagOnboardingDocumentSafeAndSurvey(userID, status) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseUpdate = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/flags/bulk-update", secret({
            username: userID,
            flags: {
                brankasOnboarding: status,
                brankasSurvey: status
            }
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseUpdate.status,
            data: responseUpdate.data
        }

    },

    async getIdOtherDoc(userID, password, numberDoc) {

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/document/other");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            idDoc: response.data.id[numberDoc]
        }

    },

    async deleteOtherDoc(userID, password, numberDoc) {

        const idDoc = await this.getIdOtherDoc(userID, password, numberDoc);

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/document/" + idDoc);

        return {
            status: response.status,
            data: response.data
        }
    },

    async deleteAllDocuments(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const enumDoc = [1, 2, 5, 7];
        let responseDelete;

        for (let i = 0; i < 4; i++) {
            responseDelete = await I.sendDeleteRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/" + enumDoc[i]));
            I.wait(3);
        }

    },

    async deletePartner(businessId) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseDelete = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners/all/" + businessId);

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDelete.status,
            data: responseDelete.data
        }

    },

    async deleteDeviceId(deviceId) {

        const responseDelete = await I.sendDeleteRequest(secret("https://" + env + "-smb-device.otoku.io/api/v1/device/smb-users/" + deviceId));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDelete.status,
            data: responseDelete.data,
        };
    },

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

    async resetDeviceId(userID, password, deviceID) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password,
            deviceID: deviceID
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async resetAttemptFailedLogin(userID) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseReset = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login/reset-attempts", secret({
            userID: userID,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseReset.status
        }
    },

    async resetAttemptFailedFaceMatch(userID) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseReset = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/verify/selfie/" + userID);

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseReset.status
        }
    },

    reloadPageAfterResetState() {

        const lastPage = globalVariable.dashboard.lastPage;

        if (

            lastPage === "Upload eKTP" ||
            lastPage === "Data KTP" ||
            lastPage === "Upload Selfie" ||
            lastPage === "Upload Selfie with KTP" ||
            lastPage === "Data Personal" ||
            lastPage === "Data Business Profile"

        ) {

            headerPage.closePage();
            onboardingAccOpeningPage.clickCancelProcess();

        } else if (

            lastPage === "Data Domicile Address" ||
            lastPage === "Data Employment" ||
            lastPage === "Data Business Owner" ||
            lastPage === "Data Director List" ||
            lastPage === "Data Business Address"
        ) {

            headerPage.clickButtonBack();

        } else if (

            lastPage === "Upload Document Business" ||
            lastPage === "Detail Progress Account Opening"

        ) {

            headerPage.closePage();

        } else {
            console.log(lastPage);
            throw new Error("Page name is not recognize");
        }

        I.waitForElement(onboardingAccOpeningPage.buttons.completeData, 20);
        I.wait(1);
        onboardingAccOpeningPage.continueCompleteData();
    },

    reloadPageAfterResetStateInvitee() {
        headerPage.closePage();
        onboardingAccOpeningPage.clickCancelProcess();
        I.waitForElement(onboardingAccOpeningPage.buttons.next, 20);
        I.wait(1);
        onboardingAccOpeningPage.continueToKYC();
    },

    reloadPageUserInvitedAfterResetState() {
        headerPage.clickButtonBack();
        I.waitForText("Selanjutnya", 10);
        I.wait(1);
        I.click("Selanjutnya");
    },

    async getProductType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            productType: responseProfile.data.productType,
        };

    },

    async getAccountType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            accountType: responseProfile.data.accountCreationJourney.accountType,
        };

    },

    async getFullName(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            ktpName: responseProfile.data.profileKtp.ktpName,
        };

    },

    async getKTPNumber(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            ktpNumber: responseProfile.data.profileKtp.ktpNumber,
        };

    },

    async getPhoneNumber(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            phoneNumber: responseProfile.data.phoneNumber,
        };

    },

    async getEmail(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            email: responseProfile.data.email,
        };

    },

    async getAccountNumber(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            accountNumber: responseBusinessDetails.data.accountNumber,
        };

    },

    async getCompanyName(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            businessName: responseBusinessDetails.data.businessName,
        };

    },

    async getBusinessPartnerUserID(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessPartnerList = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessPartnerList.status,
            userIdPartner: responseBusinessPartnerList.data[0].userId,
        };

    },

    async isPendingTaskExist(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            hasPendingTransaction: responseBusinessDetails.data.hasPendingTransaction,
        };

    },

}