const { I,
    globalVariable} = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    async firstRegistration(dataRegistration) {

        I.haveRequestHeaders(secret({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        }));

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user", {
            email: dataRegistration["email"],
            phoneNumber: "+62"+dataRegistration["phoneNumber"],
            fullName: dataRegistration["fullName"],
            password: dataRegistration["password"],
            confirmPassword: dataRegistration["password"],
            otp: dataRegistration["otp"],
            pdpConsent: true,
            receivedInfoProduct: false,
        });
        
        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            userID: response.data.userID
        }
    },

    async firstRegistrationPartner(dataRegistration) {

        I.haveRequestHeaders(secret({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        }));

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user", {
            email: dataRegistration["email"],
            phoneNumber: "+62"+dataRegistration["phoneNumber"],
            fullName: dataRegistration["fullName"],
            password: dataRegistration["password"],
            confirmPassword: dataRegistration["password"],
            otp: dataRegistration["otp"],
            pdpConsent: true,
            receivedInfoProduct: false,
            businessCode: dataRegistration["businessCode"],
        });
        
        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            userID: response.data.userID
        }
    },
}