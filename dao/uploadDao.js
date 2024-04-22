const fs = require('fs')

const { I, resetStateDao, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    loadImageAsBase64(filePath) {
        const img = fs.readFileSync(filePath);

        return Buffer.from(img).toString('base64');
    },

    async uploadKTP(userID, password) {

        const base64Ktp = this.loadImageAsBase64('./data/eKTP.jpg');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseKtp = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/photo/ktp", secret({
            imageFormat: "jpg",
            file: base64Ktp,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseKtp.status,
            data: responseKtp.data,
        }

    },

    async uploadSelfie(userID, password) {

        const base64Selfie = this.loadImageAsBase64('./data/selfie.jpg');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseSelfie = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/photo/selfie", secret({
            imageFormat: "jpg",
            file: base64Selfie,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseSelfie.status,
            data: responseSelfie.data,
        }
    },

    async uploadDocBusiness(userID, password, enumDoc) {

        const base64File = this.loadImageAsBase64('./data/file.pdf');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseDoc = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/business/docs/" + enumDoc, secret({
            fileFormat: "pdf",
            file: base64File,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDoc.status,
            data: responseDoc.data,
        }
    },

    async allowDeviceData(userID, password) {
        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseDeviceData = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/device", secret({
            deviceId: "QWERTY78922",
            payload: {
                ImageAndVideo: true,
                Location: true,
                PhoneCall: false
            }
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDeviceData.status,
            data: responseDeviceData.data
        }
    },

    async submitDataPersonalIndividual(lastEducation, motherName, referenceName, referencePhoneNumber, purposeAccount, userID, password) {

        const base64File = this.loadImageAsBase64('./data/npwp.png');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/profile", secret({
            accountOpeningReason: purposeAccount,
            lastEducation: lastEducation,
            motherName: motherName,
            referenceName: referenceName,
            referencePhone: referencePhoneNumber,
            npwpFileFormat: "jpg",
            npwpNumber: base64File
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitDataPersonalBusiness(lastEducation, motherName, referenceName, referencePhoneNumber, userID, password) {

        const base64File = this.loadImageAsBase64('./data/npwp.png');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/profile", secret({
            lastEducation: lastEducation,
            motherName: motherName,
            referenceName: referenceName,
            referencePhone: referencePhoneNumber,
            npwpFileFormat: "jpg",
            npwpNumber: base64File
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitIdentityDetails(ktpData, userID, password) {

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://"+env+"-smb-user.otoku.io/api/v1/user/profile/ktp", secret({
            ktpnumber: ktpData["ktpnumber"],
            ktpname: ktpData["ktpname"],
            birthplace: ktpData["birthplace"],
            dateofbirth: ktpData["dateofbirth"],
            gender: ktpData["gender"],
            bloodtype: ktpData["bloodtype"],
            religion: ktpData["religion"],
            maritalstatus: ktpData["maritalstatus"],
            province: ktpData["province"],
            city: ktpData["city"],
            district: ktpData["district"],
            village: ktpData["village"],
            rt: ktpData["rt"],
            rw: ktpData["rw"],
            ktpaddress: ktpData["ktpaddress"],
            postalcode: ktpData["postalcode"],
            job: ktpData["job"],
            nationality: ktpData["nationality"],
            noWincoreProvince: ktpData["noWincoreProvince"],
            noWincoreCity: ktpData["noWincoreCity"],
            noWincoreDistrict: ktpData["noWincoreDistrict"],
            noWincoreVillage: ktpData["noWincoreVillage"],
            expiryDate: ktpData["expiryDate"],
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },
}