const { I, headerPage, onboardingAccOpeningPage, globalVariable, getDataDao } = inject();
const env = globalVariable.returnEnvi();

module.exports = {

    async getTokenLogin(userID, password) {
        I.haveRequestHeaders({
            Authorization: "basic auth"
        });
        const responseLogin = await I.sendPostRequest("api login");

        I.seeResponseCodeIsSuccessful();

        return {
            data: responseLogin.data
        }
    },

    async resetAttemptFailedLogin(userID) {
        I.haveRequestHeaders({
            Authorization: "basic auth"
        });

        const responseReset = await I.sendPostRequest("api reset attempt failed login");

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseReset.status
        }
    },

    reloadPageAfterResetState() {
        headerPage.closePage();
        onboardingAccOpeningPage.clickRbProcessLater();
        onboardingAccOpeningPage.sendExitSurvey();
        onboardingAccOpeningPage.continueCompleteData();
    },

    async submitPDP(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).data;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendPostRequest("api submit pdp");

        return {
            status: response.status,
            data: response.data
        }

    },

    async resetEmailFromRegisterInvitee(email) {

        I.haveRequestHeaders({
            Authorization: "basic auth"
        });

        const response = await I.sendDeleteRequest("api reset email invitee"+email);

        return {
            status: response.status,
            data: response.data
        }

    },
}