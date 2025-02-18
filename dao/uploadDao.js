const FormData = require('form-data');
const fs = require('fs');
const path = require('path');

const { I, resetStateDao, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    loadImageAsBase64(filePath) {
        const img = fs.readFileSync(filePath);

        return Buffer.from(img).toString('base64');
    },

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

    async uploadDocBusiness(userID, password, enumDoc, fileType) {

        let base64File;

        switch (fileType) {
            case "pdf":
                base64File = this.loadImageAsBase64('path pdf');
                break;
            case "jpg":
                base64File = this.loadImageAsBase64('path jpg');
                break;
            case "jpeg":
                base64File = this.loadImageAsBase64('path jpeg');
                break;
            case "png":
                base64File = this.loadImageAsBase64('path png');
                break;
            default:
                throw new Error("File type is not recognize");
        }

        const bearerToken = (await this.getTokenLogin(userID, password)).data;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseDoc = await I.sendPostRequest("api upload doc" + enumDoc);

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDoc.status,
            data: responseDoc.data,
        }
    },
}