const { I, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    async getTokenLogin(userID, password) {

        I.haveRequestHeaders({
            Authorization: "basic auth"
        });

        const responseLogin = await I.sendPostRequest("api login", secret({
            userID: userID,
            password: password,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            data: responseLogin.data
        }
    },

    async getListDocBusiness(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).data;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("api get list doc");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            listDocBusiness: response.data
        }

    },
}