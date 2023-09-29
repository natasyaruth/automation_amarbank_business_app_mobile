const { I, headerPage, onboardingAccOpeningPage } = inject();

module.exports = {

    async resetStateFlow(stateNumber, userID, password) {
        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });
        const responseLogin = await I.sendPostRequest("https://dev-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password,
        }));

        const bearerToken = responseLogin.data.jwt.access_token;

        I.seeResponseCodeIsSuccessful();
        I.amBearerAuthenticated(secret(bearerToken))

        const responseState = await I.sendPostRequest(secret("https://dev-smb-user.otoku.io/api/v1/user/account-creation/set?step=" + stateNumber));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseState.status,
            data: responseState.data,
        };
    },

    reloadPageAfterResetState() {
        headerPage.clickButtonBack();
        I.waitForText("Dashboard Screen", 10)
        I.click("Go To KYC");

        onboardingAccOpeningPage.continueToKYC();
    },
}