const { I, globalVariable } = inject();
const qs = require('qs');

const env = globalVariable.returnEnvi();

module.exports = {

    async getTokenLoginCRM() {
        let envi = "";

        if (
            env = "dev"
        ) {
            envi = "Development"
        } else {
            envi = "Staging"
        }

        const formData = qs.stringify({
            grant_type: "password",
            username: globalVariable.constant.crmAuth.userApproval,
            password: globalVariable.constant.crmAuth.passApproval,
            scope: "profile"
        });

        const responseLoginCRM = await I.sendPostRequest(
            "https://dev-auth.tunaiku.com/auth/realms/" + envi + "-DigSMB-Officer/protocol/openid-connect/token",
            formData,
            {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Authorization': 'Basic ZGlnaXRhbC1zbWI6OXYxYjZFbUFEdlh1eUlPS2p5OEhmbkxJSlJqdWkzcnE=',
            }
        );

        return {
            bearerToken: responseLoginCRM.data.access_token
        }

    },

    loadFileAsBase64() {
        const filePath = './data/file_upload/CV MAJU BERSAMA.pdf';
        const file = fs.readFileSync(filePath);

        return Buffer.from(file).toString('base64');
    },

    async addNewUser(formNewUser, referenceID) {

        const bearerToken = (await this.getTokenLoginCRM()).bearerToken;
        const fileBase64 = this.loadFileAsBase64;

        I.amBearerAuthenticated(bearerToken);

        const response = await I.sendPostRequest("https://" + env + "-smbf.tunaiku.comapi/v1/user-management/business/{" + referenceID + "}/user", {
            fullname: formNewUser["fullname"],
            phoneNumber: "+62" + formNewUser["phoneNumber"],
            email: formNewUser["email"],
            department: formNewUser["department"],
            suratKuasa: fileBase64
        });

        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            data: response.data,
        }
    }
}