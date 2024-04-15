const fs = require('fs')

const { I, headerPage, onboardingAccOpeningPage} = inject();

module.exports = {

    async resetStateFlow(stateNumber, userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseState = await I.sendPostRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/account-creation/set?step=" + stateNumber));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseState.status,
            data: responseState.data,
        };
    },

    async getTokenLogin(userID, password) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://dev-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    reloadPageAfterResetState() {
        headerPage.clickButtonBack();
        I.waitForElement(onboardingAccOpeningPage.buttons.completeData, 20);
        I.wait(1);
        onboardingAccOpeningPage.continueCompleteData();
    },

    reloadPageUserInvitedAfterResetState() {
        headerPage.clickButtonBack();
        I.waitForText("Selanjutnya", 10);
        I.wait(1);
        I.click("Selanjutnya");
    },

    async getProductType(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            productType: responseProfile.data.productType,
        };

    },

    async getAccountType(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            accountType: responseProfile.data.accountCreationJourney.accountType,
        };

    },

    async getFullName(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            ktpName: responseProfile.data.profileKtp.ktpName,
        };

    },

    async getPhoneNumber(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            phoneNumber: responseProfile.data.phoneNumber,
        };

    },

    async getEmail(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            email: responseProfile.data.email,
        };

    },

    async getAccountNumber(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            accountNumber: responseBusinessDetails.data.accountNumber,
        };

    },

    async getCompanyName(userID, password){
        
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            businessName: responseBusinessDetails.data.businessName,
        };

    },
}