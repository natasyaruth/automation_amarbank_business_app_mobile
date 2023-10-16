const { I, headerPage, onboardingAccOpeningPage, globalVariable } = inject();

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

    async uploadKTP(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseKtp = await I.sendPostRequest("https://dev-smb-user.otoku.io/api/v1/user/photo/ktp", secret({
            imageFormat: "jpg",
            file: globalVariable.image.eKTP,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseKtp.status,
            data: responseKtp.data,
        }

    },

    async uploadSelfie(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseKtp = await I.sendPostRequest("https://dev-smb-user.otoku.io/api/v1/user/photo/selfie", secret({
            imageFormat: "jpg",
            file: globalVariable.image.selfie,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseKtp.status,
            data: responseKtp.data,
        }
    },

    async allowDeviceData(userID, password) {
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(bearerToken);

        const responseDeviceData = await I.sendPostRequest("https://dev-smb-user.otoku.io/api/v1/device", secret({
            deviceId: "QWERTY78922",
            payload: {
                ImageAndVideo: true,
                Location: true,
                PhoneCall: false
            }
        }));

        I.seeResponseCodeIsSuccessful();

        return{
            status: responseDeviceData.status,
            data: responseDeviceData.data
        }
    },

    reloadPageAfterResetState() {
        headerPage.clickButtonBack();
        I.waitForText("Dashboard Screen", 10)
        I.click("Go To KYC");
    },
}