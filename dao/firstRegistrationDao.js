const { I,
    globalVariable} = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    async firstRegistration(dataRegistration) {

        I.haveRequestHeaders(secret({
            Authorization: "basic auth"
        }));

        const response = await I.sendPostRequest("<api registration>");
        
        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            userID: response.data.userID
        }
    },
}